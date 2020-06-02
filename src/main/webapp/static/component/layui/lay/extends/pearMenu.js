layui.define(['table', 'jquery', 'element'], function(exports) {
	"use strict";

	var MOD_NAME = 'pearMenu',
		$ = layui.jquery,
		element = layui.element;

	var pearMenu = function(opt) {
		this.option = opt;
	};

	pearMenu.prototype.render = function(opt) {
		//Ĭ������ֵ
		var option = {
			elem: opt.elem,
			async: opt.async ? opt.async : false,
			parseData: opt.parseData,
			url: opt.url,
			defaultOpen: opt.defaultOpen,
			control: opt.control,
			defaultMenu: opt.defaultMenu,
			accordion: opt.accordion,
			height: opt.height,
			theme: opt.theme,
			data: opt.data ? opt.data : [],
			change: opt.change ? opt.change : function() {
				console.log("�л�")
			},
			done: opt.done ? opt.done : function() {
				console.log("�˵���Ⱦ�ɹ�");
			}
		}


		// �� �� �� �� �� ʽ �� ȡ �� ��
		if (option.async) {
			option.data = getData(option.url);
			if (option.parseData != false) {
				option.parseData(option.data);
			}
		}

		if (option.control != false) {

			createMenuAndControl(option);

		} else {
			createMenu(option);
		}


		// �� Ⱦ �� �� �� �� �� �� ��
		element.init();

		downShow(option);



		option.done();
		return new pearMenu(option);
	}


	/** �����¼���ֵ */
	pearMenu.prototype.click = function(clickEvent) {

		var _this = this;
		$("#" + _this.option.elem + " .site-demo-active").parent().click(function() {
			var dom = $(this).children(".site-demo-active");
			var data = {
				menuId: dom.attr("menu-id"),
				menuTitle: dom.attr("menu-title"),
				menuPath: dom.attr("menu-title"),
				menuIcon: dom.attr("menu-icon"),
				menuUrl: dom.attr("menu-url")
			};

			var doms = hash(dom);

			if (doms.text() != '') {
				data['menuPath'] = doms.find("span").text() + " / " + data['menuPath'];

			}
			var domss = hash(doms);

			if (domss.text() != '') {

				data['menuPath'] = domss.find("span").text() + " / " + data['menuPath'];

			}

			var domsss = hash(domss);

			if (domsss.text() != '') {

				data['menuPath'] = domsss.find("span").text() + " / " + data['menuPath'];

			}

			clickEvent(dom, data);
		});

	}

	function hash(dom) {

		return dom.parent().parent().prev();
	}


	pearMenu.prototype.skin = function(skin) {

		var menu = $(".pear-nav-tree[lay-filter='" + this.option.elem + "']").parent();

		menu.removeClass("dark-theme");
		menu.removeClass("light-theme");

		menu.addClass(skin);
	}


	pearMenu.prototype.selectItem = function(pearId) {

		if (this.option.control != false) {

			$("#" + this.option.elem + " a[menu-id='" + pearId + "']").parents(".layui-side-scroll ").find("ul").css({
				display: "none"
			});

			$("#" + this.option.elem + " a[menu-id='" + pearId + "']").parents(".layui-side-scroll ").find(".layui-this").removeClass(
				"layui-this");

			$("#" + this.option.elem + " a[menu-id='" + pearId + "']").parents("ul").css({
				display: "block"
			});

			var controlId = $("#" + this.option.elem + " a[menu-id='" + pearId + "']").parents("ul").attr("pear-id");

			$("#" + this.option.control).find(".layui-this").removeClass("layui-this");

			$("#" + this.option.control).find("[pear-id='" + controlId + "']").addClass("layui-this");
		}


		// �� �� �� �� Id ѡ �� �� �� �� Ŀ


		$("#" + this.option.elem + " a[menu-id='" + pearId + "']").parents(".pear-nav-tree").find(".layui-nav-itemed").removeClass(
			"layui-nav-itemed");

		$("#" + this.option.elem + " a[menu-id='" + pearId + "']").parents(".pear-nav-tree").find(".layui-this").removeClass(
			"layui-this");

		// ͨ �� �� �� �� �� �� ǰ �� �� �� layui-nav-child

		if (!$("#" + this.option.elem).is(".pear-nav-mini")) {

			$("#" + this.option.elem + " a[menu-id='" + pearId + "']").parents(".layui-nav-item").addClass("layui-nav-itemed");

			$("#" + this.option.elem + " a[menu-id='" + pearId + "']").parents("dd").addClass("layui-nav-itemed");

		}

		$("#" + this.option.elem + " a[menu-id='" + pearId + "']").parent().addClass("layui-this");


	}


	var activeMenus;

	pearMenu.prototype.collaspe = function(time) {

		var elem = this.option.elem;

		var config = this.option;

		if ($("#" + this.option.elem).is(".pear-nav-mini")) {

			$.each(activeMenus, function(i, item) {
				$("#" + elem + " a[menu-id='" + $(this).attr("menu-id") + "']").parent().addClass("layui-nav-itemed");
			})

			$("#" + this.option.elem).removeClass("pear-nav-mini");

			$("#" + this.option.elem).animate({
				width: "220px"
			}, 150);

			isHoverMenu(false, config);

		} else {

			activeMenus = $("#" + this.option.elem).find(".layui-nav-itemed>a");
			$("#" + this.option.elem).find(".layui-nav-itemed").removeClass("layui-nav-itemed");

			$("#" + this.option.elem).addClass("pear-nav-mini");

			$("#" + this.option.elem).animate({
				width: "60px"
			}, 400);
			isHoverMenu(true, config);

		}
	}

	/** ͬ �� �� �� �� ȡ �� �� */
	function getData(url) {

		$.ajaxSettings.async = false;
		var data = null;

		$.get(url, function(result) {
			data = result;
		});

		$.ajaxSettings.async = true;
		return data;
	}


	function createMenu(option) {
		// �� �� ͷ ��
		var menuHtml = '<ul lay-filter="' + option.elem +
			'" class="layui-nav arrow   pear-menu layui-nav-tree pear-nav-tree">'
		// �� �� ͬ �� �� ��
		$.each(option.data, function(i, item) {
			// �� �� ÿ һ �� �� �� ��


			var content = '<li class="layui-nav-item" >';

			if (i == option.defaultOpen && option.defaultOpen != false) {
				content = '<li class="layui-nav-item layui-nav-itemed" >';
			}

			var href = "javascript:;";
			var target = "";
			var calss = "site-demo-active"

			if (item.openType == "_blank" && item.type == 1) {
				href = item.href;
				target = "target='_blank'";
				calss = "";
			}

			// �� �� �� �� �� �� 0 �� ������ת��Ŀ¼ 1 �� �� �� �� �� ת �� �� ��
			if (item.type == 0) {
				// �� �� Ŀ ¼ �� ��
				content += '<a  href="javascript:;" menu-type="' + item.type + '" menu-id="' + item.id + '" href="' + href +
					'" ' + target + '><i class="' + item.icon + '"></i><span>' + item.title +
					'</span></a>';
			} else if (item.type == 1) {
				// �� �� �� �� �� ��
				content += '<a class="' + calss + '" menu-type="' + item.type + '" menu-url="' + item.href + '" menu-id="' +
					item.id +
					'" menu-title="' + item.title + '"  href="' + href + '"  ' + target + '><i class="' + item.icon +
					'"></i><span>' + item.title + '</span></a>';
			}
			// �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� 
			content += loadchild(item);
			// �� �� һ �� �� �� �� ��
			content += '</li>';
			menuHtml += content;

		});
		// �� �� �� �� �� �� �� �� ʼ ��
		menuHtml += "</ul>";
		// �� �� �� ƴ �� �� �� ʼ �� �� �� ��

		$("#" + option.elem).html(menuHtml);

	}


	function createMenuAndControl(option) {

		var control = '<ul class="layui-nav pear-nav-control">';
		// �� �� ͷ ��
		var menu = '<div class="layui-side-scroll ' + option.theme + '">'
		// �� �� ͬ �� �� ��

		var index = 0;

		$.each(option.data, function(i, item) {

			var menuItem = '';

			var controlItem = '';


			if (index === option.defaultMenu) {

				controlItem = '<li pear-href="' + item.href + '" pear-title="' + item.title + '" pear-id="' + item.id +
					'" class="layui-this layui-nav-item"><a href="#">' + item.title + '</a></li>';

				menuItem = '<ul  pear-id="' + item.id + '" lay-filter="' + option.elem +
					'" class="layui-nav arrow layui-nav-tree pear-nav-tree">';

			} else {


				controlItem = '<li  pear-href="' + item.href + '" pear-title="' + item.title + '" pear-id="' + item.id +
					'" class="layui-nav-item"><a href="#">' + item.title + '</a></li>';

				menuItem = '<ul style="display:none" pear-id="' + item.id + '" lay-filter="' + option.elem +
					'" class="layui-nav arrow layui-nav-tree pear-nav-tree">';

			}

			index++;

			$.each(item.children, function(i, note) {

				// �� �� ÿ һ �� �� �� ��
				var content = '<li class="layui-nav-item" >';

				var href = "javascript:;";

				var target = "";

				var calss = "site-demo-active";

				if (note.openType == "_blank" && note.type == 1) {

					href = note.href;
					target = "target='_blank'";
					calss = "";
				}


				// �� �� �� �� �� �� 0 �� ������ת��Ŀ¼ 1 �� �� �� �� �� ת �� �� ��
				if (note.type == 0) {
					// �� �� Ŀ ¼ �� ��
					content += '<a  href="' + href + '" ' + target + ' menu-type="' + note.type + '" menu-id="' + note.id +
						'" ><i class="' + note.icon + '"></i><span>' + note.title +
						'</span></a>';
				} else if (note.type == 1) {
					// �� �� �� �� �� ��
					content += '<a ' + target + ' class="' + calss + '" menu-type="' + note.type + '" menu-url="' + note.href +
						'" menu-id="' + note.id +
						'" menu-title="' + note.title + '" href="' + href + '"><i class="' + note.icon +
						'"></i><span>' + note.title + '</span></a>';
				}
				// �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� 
				content += loadchild(note);
				// �� �� һ �� �� �� �� ��
				content += '</li>';

				menuItem += content;

			})


			menu += menuItem + '</ul>';

			control += controlItem;

		})


		$("#" + option.control).html(control);

		$("#" + option.elem).html(menu);

		$("#" + option.control + " .pear-nav-control").on("click", "li", function() {

			$("#" + option.elem).find(".pear-nav-tree").css({
				display: 'none'
			});

			$("#" + option.elem).find(".pear-nav-tree[pear-id='" + $(this).attr("pear-id") + "']").css({
				display: 'block'
			});

			option.change($(this).attr("pear-id"), $(this).attr("pear-title"), $(this).attr("pear-href"))
		})

	}

	/** �����Ӳ˵� (�ݹ�)*/
	function loadchild(obj) {

		// �� �� �� �� �� �� ���� �� �� �� �� �� ֱ �� �� ��
		if (obj.type == 1) {
			return "";
		}

		// �� �� �� �� �� �� ��
		var content = '<dl class="layui-nav-child">';

		// �� �� Ƕ �� �� �� �� �� 
		if (obj.children != null && obj.children.length > 0) {
			// �� �� �� �� Ŀ
			$.each(obj.children, function(i, note) {
				// �� �� �� �� �� ��
				content += '<dd>';

				var href = "javascript:;";

				var target = "";

				var calss = "site-demo-active";

				if (note.openType == "_blank" && note.type == 1) {
					href = note.href;
					target = "target='_blank'";
					calss = "";
				}

				// �� �� �� �� �� ��
				if (note.type == 0) {
					// �� �� Ŀ ¼ �� ��
					content += '<a ' + target + '  href="' + href + '" menu-type="' + note.type + '" menu-id="' + note.id +
						'"><i class="' + note.icon + '"></i><span>' + note.title + '</span></a>';
				} else if (note.type == 1) {
					// �� �� �� �� �� ��
					content += '<a ' + target + ' class="' + calss + '" menu-type="' + note.type + '" menu-url="' + note.href +
						'" menu-id="' + note.id + '" menu-title="' + note.title + '" menu-icon="' + note.icon + '" href="' + href +
						'" ><i class="' + note.icon + '"></i><span>' + note.title + '</span></a>';
				}
				// �� �� �� �� Ŀ ¼
				content += loadchild(note);
				// �� �� �� ǰ �� �� ��
				content += '</dd>';
			});
			// �� װ

		} else {
			content += '<div class="toast"> �� �� �� </div>';

			/* �� �� �� ��&nbsp;&nbsp;&nbsp;&nbsp; */
		}

		content += '</dl>';
		return content;
	}



	function downShow(option) {

		$("body #" + option.elem).on("click", "a[menu-type='0']", function() {

			if (!$("#" + option.elem).is(".pear-nav-mini")) {

				var superEle = $(this).parent();
				var ele = $(this).next('.layui-nav-child');
				var height = ele.height();
				if ($(this).parent().is(".layui-nav-itemed")) {


					if (option.accordion) {
						// �� �� �� ʵ ��
						$(this).parent().parent().find(".layui-nav-itemed").removeClass("layui-nav-itemed");
						$(this).parent().addClass("layui-nav-itemed");

					}

					ele.height(0);

					ele.animate({
						height: height + "px"
					}, 200, function() {
						ele.css({
							height: "auto"
						});
					});

				} else {

					$(this).parent().addClass("layui-nav-itemed");

					ele.animate({
						height: "0px"
					}, 200, function() {
						ele.css({
							height: "auto"
						});
						$(this).parent().removeClass("layui-nav-itemed");
					});

				}
			}
		})


	}

	/** �� �� �� �� �� ��*/
	function isHoverMenu(b, option) {
		if (b) {
			$("#" + option.elem + ".pear-nav-mini .layui-nav-item,#" + option.elem + ".pear-nav-mini dd").hover(function() {

				$(this).children(".layui-nav-child").addClass("layui-nav-hover");

				var top = $(this).offset().top + 5;


				if (!$(this).is(".layui-nav-item")) {

					var left = $(this).offset().left + 132;

					$(this).children(".layui-nav-child").offset({
						left: left
					});

				} else {
					var left = $(this).offset().left + 62;

					$(this).children(".layui-nav-child").offset({
						left: left
					});

				}
				$(this).children(".layui-nav-child").offset({
					top: top
				});



			}, function() {

				$(this).children(".layui-nav-child").removeClass("layui-nav-hover");

				//�жϵ�ǰ��dd,���� layui-nav-item

				$(this).children(".layui-nav-child").css({
					left: '0px'
				});

				$(this).children(".layui-nav-child").css({
					top: '0px'
				});
			})
		} else {
			$("#" + option.elem + " .layui-nav-item").off('mouseenter').unbind('mouseleave');
			$("#" + option.elem + " dd").off('mouseenter').unbind('mouseleave');
		}
	}

	exports(MOD_NAME, new pearMenu());
})
