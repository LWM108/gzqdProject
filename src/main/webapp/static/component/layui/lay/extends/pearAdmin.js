layui.define(['table', 'jquery', 'element', 'form', 'pearTab', 'pearMenu', 'pearFrame'], function(exports) {
	"use strict";

	var $ = layui.jquery,
		form = layui.form,
		element = layui.element,
		pearTab = layui.pearTab,
		pearMenu = layui.pearMenu,
		pearFrame = layui.pearFrame;

	var bodyFrame;
	var sideMenu;
	var bodyTab;

	var pearAdmin = new function() {

		this.render = function(option) {

			this.menuRender(option);

			this.bodyRender(option);

			this.keepLoad(option);

			this.themeRender(option);

		}

		this.menuRender = function(option) {

			/** �� �� �� �� �� �� �� ʼ �� */
			sideMenu = pearMenu.render({
				elem: 'sideMenu', //��������
				async: true, //������ʽ
				theme: option.theme,
				height: '100%',
				control: option.control ? 'control' : false, // control 
				defaultMenu: 1,
				defaultOpen: 0, //Ĭ�ϴ򿪲˵�
				accordion: true,
				url: option.data, //���ݵ�ַ
				parseData: false, //������Ƿ�������ݽ��� ����
				change: option.change
			})


		}

		this.bodyRender = function(option) {

			if (option.muiltTab) {

				bodyTab = pearTab.render({
					elem: 'content',
					roll: true,
					tool: true,
					width: '100%',
					height: '100%',
					index: 0,
					tabMax: 20,
					data: [{
						id: '11',
						url: option.index,
						title: '��ҳ',
						close: false
					}] //��ʼ������
				});

				// ѡ �� �� �� �� API �� ��
				bodyTab.click(function(id) {

					// ѡ �� �� �� λ
					bodyTab.positionTab();

					sideMenu.selectItem(id);
				})


				$("body").on("click", ".refresh", function() {

					bodyTab.refresh(500);
				})

				sideMenu.click(function(dom, data) {
					 
					

					bodyTab.addTabOnly({
						id: data.menuId,
						title: data.menuTitle,
						url: data.menuUrl,
						icon: data.menuIcon,
						close: true
					}, 300);

					compatible();
				})

			} else {

				// ѡ �� �� �� ʼ API �� ��
				bodyFrame = pearFrame.render({
					elem: 'content',
					title: '�����ռ� / ��ҳ',
					url: option.index,
					width: '100%',
					height: '100%'
				});

				$("body").on("click", ".refresh", function() {
					bodyFrame.refresh(500);
				})

				sideMenu.click(function(dom, data) {

					compatible();
					bodyFrame.changePage(data.menuUrl, data.menuPath, true);

				})
			}

		}

		this.keepLoad = function(option) {
			// �� �� �� �� ��
			compatible();

			setTimeout(function() {

				$(".preloader").fadeOut(option.done);

				// �� �� �� �� ʱ ��
			}, option.keepLoad)
		}



		this.colorSet = function(color) {

			var style = '';

			// �� �� �� �� �� �� ɫ
			style +=
				'.light-theme .pear-nav-tree .layui-this a:hover,.light-theme .pear-nav-tree .layui-this,.light-theme .pear-nav-tree .layui-this a,.pear-nav-tree .layui-this a,.pear-nav-tree .layui-this{background-color: ' +
				color + '!important;}';

			// �Զ��� Logo ������ʾ
			style +=
				'.pear-admin .layui-logo .title{color:' +
				color + '!important;}';

			// �� �� �� �� ǩ �� ɫ
			style += '.pear-frame-title .dot,.pear-tab .layui-this .pear-tab-active{background-color: ' + color +
				'!important;}';

			// �� �� �� �� �� �� ��
			style += '.bottom-nav li a:hover{background-color:' +
				color + '!important;}';

			// �� �� �� �� �� �� ɫ
			style += '.pear-admin .layui-header .layui-nav .layui-nav-bar{background-color: ' + color + '!important;}'

			// �� �� �� �� �� �� ɫ
			style += '.ball-loader>span,.signal-loader>span {background-color: ' + color + '!important;}';

			// �� �� �� �� �� �� ɫ
			style += '.layui-header .layui-nav-child .layui-this a{background-color:' + color +
				'!important;color:white!important;}';

			// �� �� �� �� �� �� ɫ
			style += '#preloader{background-color:' + color + '!important;}';

			// �� �� �� �� �� �� �� ʽ

			localStorage.setItem("theme-color", color);

			if ($("iframe").contents().find("#customTheme").length > 0) {

				$("iframe").contents().find("#customTheme").remove();

			}


			var theme = "<style>";

			theme += '</style>';


			$("iframe").contents().find("head").append(theme);

			$("#pearone-bg-color").html(style);
		}


		this.themeRender = function(option) {

			var color = localStorage.getItem("theme-color");

			var menu = localStorage.getItem("theme-menu");

			this.colorSet(color);

			this.menuSkin(menu);
		}


		this.menuSkin = function(theme) {

			$(".pear-admin").removeClass("light-theme");
			$(".pear-admin").removeClass("dark-theme");
			$(".pear-admin").addClass(theme);

		}
	};


	$("body").on("click", ".collaspe,.pear-cover", function() {
		sideMenu.collaspe();
		if ($(".pear-admin").is(".pear-mini")) {
			$(".pear-admin").removeClass("pear-mini");
		} else {
			$(".pear-admin").addClass("pear-mini");
		}
	})


	/**
	 * ȫ��/�˳�ȫ��
	 */
	$("body").on("click", ".fullScreen", function() {
		if ($(this).hasClass("layui-icon-screen-restore")) {

			screenFun(2).then(function() {
				$(".fullScreen").eq(0).removeClass("layui-icon-screen-restore");
			});

		} else {

			screenFun(1).then(function() {
				$(".fullScreen").eq(0).addClass("layui-icon-screen-restore");
			});

		}

	});


	function compatible() {
		if ($(window).width() <= 768) {
			sideMenu.collaspe();
			if ($(".pear-admin").is(".pear-mini")) {
				$(".pear-admin").removeClass("pear-mini");
			} else {
				$(".pear-admin").addClass("pear-mini");
			}
		}
	}

	/**
	 * ȫ�����˳�ȫ���ķ���
	 * @param num 1����ȫ�� 2�����˳�ȫ��
	 * @returns {Promise}
	 */
	function screenFun(num) {
		num = num || 1;
		num = num * 1;
		var docElm = document.documentElement;

		switch (num) {
			case 1:
				if (docElm.requestFullscreen) {
					docElm.requestFullscreen();
				} else if (docElm.mozRequestFullScreen) {
					docElm.mozRequestFullScreen();
				} else if (docElm.webkitRequestFullScreen) {
					docElm.webkitRequestFullScreen();
				} else if (docElm.msRequestFullscreen) {
					docElm.msRequestFullscreen();
				}
				break;
			case 2:
				if (document.exitFullscreen) {
					document.exitFullscreen();
				} else if (document.mozCancelFullScreen) {
					document.mozCancelFullScreen();
				} else if (document.webkitCancelFullScreen) {
					document.webkitCancelFullScreen();
				} else if (document.msExitFullscreen) {
					document.msExitFullscreen();
				}
				break;
		}

		return new Promise(function(res, rej) {
			res("����ֵ");
		});
	}


	//��������ɫѡ��
	$('body').on('click', '[data-select-bgcolor]', function() {
		var theme = $(this).attr('data-select-bgcolor');

		$('[data-select-bgcolor]').removeClass("layui-this");

		$(this).addClass("layui-this");

		localStorage.setItem("theme-menu", theme);

		pearAdmin.menuSkin(theme);
	});

	$('body').on('click', '.select-color-item', function() {

		$(".select-color-item").removeClass("layui-icon")
			.removeClass("layui-icon-ok");

		$(this).addClass("layui-icon").addClass("layui-icon-ok");

		var color = $(".select-color-item.layui-icon-ok").css("background-color");


		pearAdmin.colorSet(color);
	});


	$("body").on("click", ".setting", function() {

		var bgColorHtml =
			'<li class="layui-this" data-select-bgcolor="dark-theme">' +
			'<a href="javascript:;" data-skin="skin-blue" style="" class="clearfix full-opacity-hover">' +
			'<div><span style="display:block; width: 20%; float: left; height: 12px; background: #28333E;"></span><span style="display:block; width: 80%; float: left; height: 12px; background: white;"></span></div>' +
			'<div><span style="display:block; width: 20%; float: left; height: 40px; background: #28333E;"></span><span style="display:block; width: 80%; float: left; height: 40px; background: #f4f5f7;"></span></div>' +
			'</a>' +
			'</li>';


		bgColorHtml +=
			'<li  data-select-bgcolor="light-theme">' +
			'<a href="javascript:;" data-skin="skin-blue" style="" class="clearfix full-opacity-hover">' +
			'<div><span style="display:block; width: 20%; float: left; height: 12px; background: white;"></span><span style="display:block; width: 80%; float: left; height: 12px; background: white;"></span></div>' +
			'<div><span style="display:block; width: 20%; float: left; height: 40px; background: white;"></span><span style="display:block; width: 80%; float: left; height: 40px; background: #f4f5f7;"></span></div>' +
			'</a>' +
			'</li>';

		var html =
			'<div class="pearone-color">\n' +
			'<div class="color-title">������</div>\n' +
			'<div class="color-content">\n' +
			'<ul>\n' + bgColorHtml + '</ul>\n' +
			'</div>\n' +
			'</div>';


		html +=
			"<div class='select-color'><div class='select-color-title'>����ɫ</div><div class='select-color-content'><span class='select-color-item layui-icon layui-icon-ok' style='background-color:#FF5722;'></span><span class='select-color-item' style='background-color:#5FB878;'></span><span class='select-color-item'  style='background-color:#1E9FFF;'></span><span class='select-color-item' style='background-color:#FFB800;'></span><span class='select-color-item' style='background-color:darkgray;'></span></div></div>"

		html += '<div class="more-menu-list">' +
			'<a class="more-menu-item" href="http://www.pearadmin.cn/doc/" target="_blank">' +
			'<i class="layui-icon layui-icon-read" style="font-size: 19px;"></i> �����ĵ�' +
			'</a>' +
			'<a class="more-menu-item" href="https://gitee.com/Jmysy/Pear-Admin-Layui" target="_blank">' +
			'<i class="layui-icon layui-icon-tabs" style="font-size: 16px;"></i> ��Դ��ַ' +
			'</a>' +
			'<a class="more-menu-item" href="http://www.pearadmin.cn/" target="_blank">' +
			'<i class="layui-icon layui-icon-theme"></i> �ٷ���վ' +
			'</a>' +
			'<a class="more-menu-item" href="http://qm.qq.com/cgi-bin/qm/qr?k=wguN0SYYFVTX9K-5Muf36E_J77bCzdDD&authKey=Ye5voDJGOphYUvypWJHOEyHoYBcgzk1l7djAS4fWcmls1jybLnYjwLrzwsS6Jdo3&group_code=682110771" target="_blank">' +
			'<i class="layui-icon layui-icon-survey"></i> ��������' +
			'</a>' +
			'</div>';


		openRight(html);

	})

	function openRight(html) {
		layer.open({
			type: 1,
			offset: 'r',
			area: ['340px', '100%'],
			title: false,
			shade: 0.1,
			closeBtn: 0,
			shadeClose: false,
			anim: -1,
			skin: 'layer-anim-right',
			move: false,
			content: html,
			success: function(layero, index) {
				$('#layui-layer-shade' + index).click(function() {
					var $layero = $('#layui-layer' + index);
					$layero.animate({
						left: $layero.offset().left + $layero.width()
					}, 200, function() {
						layer.close(index);
					});
				})
			}
		});
	}




	exports('pearAdmin', pearAdmin);
})
