import QtQuick 2.0

import DrawObject 1.0


Item{
    id: root

    property int tool: 0
    property color fill: "white"
    property color border: "black"
    property int lineWidth: 5

    onToolChanged: console.log("Current tool type is " + tool)
    onFillChanged: console.log("Current fill color is " + fill)
    onBorderChanged: console.log("Current border color is " + border)

    Canvas {
        id: canvas

        anchors.fill: parent

        function drawRectangle(ctx, fillColor, borderColor, data){
            console.log("Draw rectangle======================");
            console.log("fill color is " + fillColor);
            console.log("border color is " + borderColor);
            console.log("x coordinate is " + data.x);
            console.log("y coordinate is " + data.y);
            console.log("width is " + data.width);
            console.log("height is " + data.height);

            ctx.fillStyle = fillColor;
            ctx.strokeStyle = borderColor;

            var x = data.x;
            var y = data.y;
            var height = data.height;
            var width = data.width;

            ctx.fillRect(x, y, width, height);
            ctx.strokeRect(x, y, width, height);
        }

        function drawCircle(ctx, fillColor, borderColor, data){
            console.log("Draw circle=========================");
            console.log("fill color is " + fillColor);
            console.log("border color is " + borderColor);
            console.log("x coordinate is " + data.x);
            console.log("y coordinate is " + data.y);
            console.log("radius is " + data.radius);

            var x = data.x;
            var y = data.y;
            var radius = data.radius;


            ctx.beginPath();
            ctx.arc(x,y,radius,0,Math.PI*2,false);
            ctx.closePath();
            ctx.fill();
            ctx.stroke();
        }

        function drawText(ctx, fillColor, borderColor, data){
            console.log("Draw text===========================");
            console.log("fill color is " + fillColor);
            console.log("border color is " + borderColor);
            console.log("x coordinate is " + data.x);
            console.log("y coordinate is " + data.y);
            console.log("Text is \"" + data.text + "\"");

            var x = data.x;
            var y = data.y;
            var text = data.text;

            ctx.font = "48px serif";

            ctx.fillText(text, x, y);
            ctx.strokeText(text, x, y);
        }

        function drawShape(cotx, fillColor, borderColor, data){
            var ctx = canvas.getContext("2d");
            console.log("Draw shape==========================");
            console.log("fill color is " + fillColor);
            console.log("border color is " + borderColor);
            console.log("points is");

            var x = data.points[0].x;
            var y = data.points[0].y;

            console.log("(" + data.points[0].x + " , " + data.points[0].y + ")");


            ctx.moveTo(x, y);

            var length = data.points.length;

            ctx.beginPath();

            for(var i = 1; i < length; i++){
                x = data.points[i].x;
                y = data.points[i].y;
                console.log("(" + data.points[i].x + " , " + data.points[i].y + ")");
                ctx.lineTo(x, y);
            }

            x = data.points[0].x;
            y = data.points[0].y;

            ctx.lineTo(x, y);

            ctx.closePath();
            ctx.fill();
            ctx.stroke();
        }

        onPaint: {
            var ctx = canvas.getContext("2d");

            var length = drawObjectModel.count();

            console.log(length);

            ctx.lineWidth = 5;

            for(var i = 0; i < length; i++){
                var drawObject = drawObjectModel.get(i);

                //console.log(drawObject.type);

                var fillColor = drawObject.fillColor;
                var borderColor = drawObject.borderColor;
                var shapeData = drawObject.shapeData;

                ctx.fillStyle = fillColor;
                ctx.strokeStyle = borderColor;

                switch(drawObject.type){
                case DrawObject.Rectangle:{
                    drawRectangle(ctx, fillColor, borderColor, shapeData);
                    break;
                }
                case DrawObject.Circle:{
                    drawCircle(ctx, fillColor, borderColor, shapeData);
                    break;
                }
                case DrawObject.Text:{
                    drawText(ctx, fillColor, borderColor, shapeData);
                    break;
                }
                case DrawObject.Shape:{
                    drawShape(ctx, fillColor, borderColor, shapeData);
                    break;
                }
                }
            }
        }

        Component.onCompleted: {
            drawObjectModel.rowsInserted.connect(function(){
                canvas.requestPaint();
            });
        }

        MouseArea{
            id: mouseArea

            anchors.fill: parent

            hoverEnabled: true

            function rectangleClick(mouse){
                if(currentCanvas.isPainting){
                    currentCanvas.isPainting = false;
                    currentCanvas.requestPaint();

                    var rectX = currentCanvas.startPoint.x;
                    var rectY = currentCanvas.startPoint.y;
                    var rectWidth = mouse.x - rectX;
                    var rectHeight = mouse.y - rectY;
                    drawObjectModel.addRectangle(rectX, rectY, rectWidth, rectHeight, root.fill, root.border);
                }else{
                    currentCanvas.isPainting = true;
                    currentCanvas.startPoint = Qt.point(mouse.x, mouse.y);
                }
            }

            onClicked: {
                console.log("Mouse Area clicked");

                switch(root.tool){
                case DrawObject.Rectangle:{
                    rectangleClick(mouse);
                    break;
                }
                default:{
                    console.log("Mouse Area Tool matching: Type " + root.tool + " without behavior");
                }
                }
            }

            onPositionChanged: {
                currentCanvas.currentPoint = Qt.point(mouse.x, mouseY);
                currentCanvas.requestPaint();
            }
        }
    }


    Canvas{
        id: currentCanvas

        property bool isPainting: false
        property point startPoint: Qt.point(0, 0)
        property point currentPoint: Qt.point(0, 0)

        //onStartPointChanged: console.log("Start point is (" + startPoint.x + "," + startPoint.y + ")");
        //onCurrentPointChanged: console.log("Current point is (" + currentPoint.x + "," + currentPoint.y + ")");

        anchors.fill: parent
        z: 1

        function drawRectangle(ctx){
            ctx.fillStyle = root.fill;
            ctx.strokeStyle = root.border;
            ctx.lineWidth = root.lineWidth;

            var rectX = startPoint.x;
            var rectY = startPoint.y;
            var rectWidth = currentPoint.x - startPoint.x;
            var rectHeight = currentPoint.y - startPoint.y;

            ctx.fillRect(rectX, rectY, rectWidth, rectHeight);
            ctx.strokeRect(rectX, rectY, rectWidth, rectHeight);
        }

        onPaint: {
            var ctx = currentCanvas.getContext("2d");
            ctx.clearRect(0, 0, width, height);

            if(isPainting){
                switch(root.tool){
                case DrawObject.Rectangle:{
                    drawRectangle(ctx);
                    break;
                }
                default:{
                    console.log("Current canvas Tool matching: Type " + root.tool + " without behavior");
                }
                }
            }
        }
    }

}
