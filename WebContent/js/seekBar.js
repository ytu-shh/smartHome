/**
 * 拖动条
 * @param openInput 显示进度数值input的id
 * @param openOld 拖动按钮id
 * @param openNew 拖动后的进度条id
 * @param openProgress 未拖动的进度条id
 */
var seekBar = function(openInput, openOld, openNew, openProgress) {
	this.openInput = document.getElementById(openInput); // input显示进度数值
	this.openOld = document.getElementById(openOld); // 拖动按钮
	this.openNew = document.getElementById(openNew); // 拖动后的进度条
	this.openProgress = document.getElementById(openProgress); // 未拖动的进度条
	this.initX();
}

seekBar.prototype = {
	initX : function() {
		var xIsfalse = false, xf = this, xm = Math, xb = document.body, minOpen = 0, maxOpen = 100;
		// 当进度条上鼠标按下时
		xf.openOld.onmousedown = function(e) {
			xIsfalse = true;
			var X = e.clientX; // 获取当前元素相对于窗口的X左边
			var xoffleft = this.offsetLeft; // 当前元素相对于父元素的左边距
			var xmax = xf.openProgress.offsetWidth - this.offsetWidth;
			// 当鼠标移动时
			xb.onmousemove = function(e) {
				if (xIsfalse == false) {
					return;
				}
				var changeX = e.clientX; // 在移动的时候获取X坐标
				var moveX = xm.min(xmax, xm.max(-2, xoffleft + (changeX - X))); // 超过进度条宽度的取进度条最大宽，未超过按当前移动宽度
				xf.openInput.value = xm.round(xm.max(0, moveX / xmax) * 100);
				xf.openOld.style.marginLeft = xm.max(0, moveX) + "px";
				xf.openNew.style.width = xm.max(0, moveX) + 10 + "px";
			}
		}
		// 当鼠标抬起时
		xf.openOld.onmouseup = function() {
			xIsfalse = false;
		}
		// 当鼠标抬起时
		xb.onmouseup = function() {
			xIsfalse = false;
		}
/*		xf.openProgress.onclick = function(e) {
			var offsetX = e.offsetX;
			var xm = Math;
			offsetX = offsetX - 15 > xf.openProgress.offsetWidth ? xf.openProgress.offsetWidth : offsetX;
			xf.openOld.style.marginLeft = offsetX - 7.5 + "px";
			xf.openNew.style.width = offsetX + "px";
			xf.openInput.value = xm.round(xm.max(0, offsetX / xf.openProgress.offsetWidth) * 100);
		}*/
		
		// input可输入数值，控制进度条
		xf.openInput.onblur = function() {
			var theV = this.value * 1;
			if (!(theV + '') || theV > maxOpen || theV < minOpen) {
				alert("输入的数值不正确");
				xf.openInput.value = "";
				xf.openOld.style.marginLeft = "0px";
				xf.openNew.style.width = "0px";
				return;
			}
			var xxx = theV / 100 * (xf.openProgress.offsetWidth -15);
			xf.openOld.style.marginLeft = xxx + "px";
			xf.openNew.style.width = xxx + 10 + "px";
		}
	}
}
