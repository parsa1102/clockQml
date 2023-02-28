import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property var locale: Qt.locale()
    property date currentTime: new Date()
    property real currentHour: currentTime.getHours()%12 +(currentTime.getMinutes()/60) + (currentTime.getSeconds()/60/60)
    property real currentMinute: currentTime.getMinutes() + (currentTime.getSeconds()/60)
    property real currentSecond: currentTime.getSeconds()
    property double secondAngle: currentSecond/60*360
    property double minuteAngle: currentMinute/60*360
    property double hourAngle: currentHour/12*360

    Rectangle{
        id: clock
        color: "cyan"
        anchors.centerIn: parent
        width: 400
        height: width
        radius: width
        border.color: "gray"
        border.width: 5
        Rectangle{
            id: middle
            anchors.centerIn: parent
            width: 4
            height: width
            radius: width
            color: "black"
        }
        Item {
            id: hourTexts
            anchors.fill: parent
            Text {
                id: hour12
                text: "12"
                font.bold: true
                font.pixelSize: 15
                x: parent.width/2 - width/2
                y: 10
            }
            Text {
                id: hour1
                text: "1"
                font.bold: true
                font.pixelSize: 15
                x: hour12.x + 0.25*parent.width - 5
                y: hour12.y + 0.04*parent.height + 5
            }
            Text {
                id: hour2
                text: "2"
                font.bold: true
                font.pixelSize: 15
                x: hour3.x - 0.04*parent.width - 8
                y: hour3.y - 0.25*parent.height + 7
            }
            Text {
                id: hour3
                text: "3"
                font.bold: true
                font.pixelSize: 15
                x: parent.width - width - 10
                y: parent.height/2 - height/2
            }
            Text {
                id: hour4
                text: "4"
                font.bold: true
                font.pixelSize: 15
                x: hour3.x - parent.width*0.04 - 8
                y: hour3.y + parent.height*0.25 - 7
            }
            Text {
                id: hour5
                text: "5"
                font.bold: true
                font.pixelSize: 15
                x: hour6.x + parent.width*0.25 - 6
                y: hour6.y - parent.height*0.04 - 6
            }
            Text {
                id: hour6
                text: "6"
                font.bold: true
                font.pixelSize: 15
                x: parent.width/2 - width/2
                y: parent.height - height - 10
            }
            Text {
                id: hour7
                text: "7"
                font.bold: true
                font.pixelSize: 15
                x: hour6.x - parent.width*0.25 + 7
                y: hour6.y - parent.height*0.04 - 6
            }
            Text {
                id: hour8
                text: "8"
                font.bold: true
                font.pixelSize: 15
                x: hour9.x + parent.width*0.04 + 8
                y: hour9.y + parent.height*0.25 - 7
            }
            Text {
                id: hour9
                text: "9"
                font.bold: true
                font.pixelSize: 15
                x: 10
                y: parent.height/2 - height/2
            }
            Text {
                id: hour10
                text: "10"
                font.bold: true
                font.pixelSize: 15
                x: hour9.x + parent.width*0.04 + 7
                y: hour9.y - parent.height*0.25  + 7
            }
            Text {
                id: hour11
                text: "11"
                font.bold: true
                font.pixelSize: 15
                x: hour12.x - parent.width*0.25 + 7
                y: hour12.y + parent.height*0.04 + 7
            }
        }
        Item{
            id: secondItem
            width: 400
            height: 400
            rotation: secondAngle
            Rectangle{
                id: second
                color: "black"
                height: 170
                width: 2

                anchors.top: parent.top
                anchors.topMargin: 25
                x: parent.width/2 - width/2
                antialiasing: true
            }
            RotationAnimation{
                id: secondAnime
                target: secondItem
                from: secondAngle
                to:secondAngle-0.00001
                direction: RotationAnimation.Clockwise
                loops: Animation.Infinite
                duration: 60000
                running: true
            }
        }
        Item{
            id: minuteItem
            width: 400
            height: 400
            rotation: minuteAngle
            Rectangle{
                id: minute
                color: "black"
                height: 140
                width: 4
                anchors.top: parent.top
                anchors.topMargin: 55
                x: parent.width/2 - width/2
                antialiasing: true
            }
            RotationAnimation{
                id: minuteAnime
                target: minuteItem
                from: minuteAngle
                to:minuteAngle - 0.000001
                direction: RotationAnimation.Clockwise
                loops: Animation.Infinite
                duration: 60000*60
                running: true
            }
        }
        Item{
            id: hourItem
            width: 400
            height: 400
            rotation: hourAngle
            Rectangle{
                id: hour
                color: "black"
                height: 110
                width: 6
                anchors.top: parent.top
                anchors.topMargin: 85
                x: parent.width/2 - width/2
                antialiasing: true
            }
            RotationAnimation{
                id: hourAnime
                target: hourItem
                from: hourAngle
                to: hourAngle - 0.000001
                direction: RotationAnimation.Clockwise
                loops: Animation.Infinite
                duration: 60000*60*24
                running: true
            }
        }

    }

}
