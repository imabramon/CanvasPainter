import QtQuick 2.0

import DrawObject 1.0

Canvas {
    id: root

    ListModel{
        id: drawObjectModelhardcode

        ListElement{
            type: DrawObject.Rectangle
            fillColor: "green"
            borderColor: "black"
            shapeData: ListElement{
                x: 50
                y: 40
                width: 100
                height: 80
            }
        }

        ListElement{
            type: DrawObject.Circle
            fillColor: "red"
            borderColor: "yellow"
            shapeData: ListElement{
                x: 100
                y: 250
                radius: 50
            }
        }

        ListElement{
            type: DrawObject.Text
            fillColor: "white"
            borderColor: "black"
            shapeData: ListElement{
                x: 100
                y: 250
                text: "Some Text"
            }
        }

        ListElement{
            type: DrawObject.Shape
            fillColor: "orange"
            borderColor: "green"
            shapeData: ListElement{
                points: [
                    ListElement {
                        x: 300;
                        y:300
                    },
                    ListElement {
                        x:300
                        y: 600
                    },
                    ListElement{
                        x: 450
                        y: 450
                    }
                ]
            }
        }
    }

    function drawRectangle(ctx, fillColor, borderColor, data){
        console.log("Draw rectangle======================");
        console.log("fill color is " + fillColor);
        console.log("border color is " + borderColor);
        console.log("x coordinate is " + data.x);
        console.log("y coordinate is " + data.y);
        console.log("width is " + data.width);
        console.log("height is " + data.height);

        ctx.fillStyle = fillColor;
        ctx.borderStyle = borderColor;

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

        ctx.fillStyle = fillColor;
        ctx.borderStyle = borderColor;

        ctx.beginPath();
        ctx.arc(x,y,radius,0,Math.PI*2,false);
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

        ctx.fillStyle = fillColor;
        ctx.borderStyle = borderColor;

        var x = data.x;
        var y = data.y;
        var text = data.text;

        ctx.font = "48px serif";

        ctx.fillText(text, x, y);
        ctx.strokeText(text, x, y);
    }

    function drawShape(ctx, fillColor, borderColor, data){
        console.log("Draw shape==========================");
        console.log("fill color is " + fillColor);
        console.log("border color is " + borderColor);
        console.log("points is");

        ctx.fillStyle = fillColor;
        ctx.borderStyle = borderColor;

        var x = data.points[0].x;
        var y = data.points[0].y;

        console.log("(" + data.points[0].x + " , " + data.points[0].y + ")");

        ctx.moveTo(x, y);

        var length = data.points.length;

        for(var i = 1; i < length; i++){
            x = data.points[i].x;
            y = data.points[i].y;
            console.log("(" + data.points[i].x + " , " + data.points[i].y + ")");
            ctx.lineTo(x, y);
        }

        x = data.points[0].x;
        y = data.points[0].y;

        ctx.lineTo(x, y);

        ctx.fill();
        ctx.stroke();
    }

    onPaint: {
        var ctx = canvas.getContext("2d");

        var length = drawObjectModel.count();

        console.log(length);

        for(var i = 0; i < length; i++){
            var drawObject = drawObjectModel.get(i);

            //console.log(drawObject.type);

            var fillColor = drawObject.fillColor;
            var borderColor = drawObject.borderColor;
            var shapeData = drawObject.shapeData;

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
}
