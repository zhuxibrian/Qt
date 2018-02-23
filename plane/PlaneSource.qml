import QtQuick 2.2 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

Entity {
    id: sceneRoot

    property real rollAngle: 0
    property real pitchAngle: 0
    property real angle: 0

    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        aspectRatio: 16/9
        nearPlane : 0.1
        farPlane : 1000.0
        position: Qt.vector3d( 0.0, 0.0, -40.0 )
        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
    }

    OrbitCameraController {
        camera: camera
    }

    components: [
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                clearColor: Qt.rgba(0, 0.5, 1, 1)
                camera: camera
            }
        },
        // Event Source will be set by the Qt3DQuickWindow
        InputSettings { }
    ]

    Mesh {
        id: toyplaneMesh
        source: "files/toyplane.obj"
    }

    PhongMaterial {
        id: material
    }

    QQ2.Behavior on angle { QQ2.SpringAnimation {spring: 2; damping: 0.5}}
    QQ2.Behavior on pitchAngle { QQ2.SpringAnimation {spring: 2; damping: 0.5}}
    QQ2.Behavior on rollAngle { QQ2.SpringAnimation {spring: 2; damping: 0.5}}


    Transform {
        id: toyplaneTransform
        matrix: {
            var m = Qt.matrix4x4();
            m.rotate(sceneRoot.angle, Qt.vector3d(0, 1, 0));
            m.rotate(sceneRoot.pitchAngle, Qt.vector3d(0, 0, 1));
            m.rotate(sceneRoot.rollAngle, Qt.vector3d(1, 0, 0));
            m.scale(0.5);
            return m;
        }
    }

//    QQ2.NumberAnimation {
//        target: toyplaneTransform

//        running: true
//        loops: QQ2.Animation.Infinite

//        property: "angle"
//        duration: 10000

//        to: angle
//    }

    Entity {
        id: torusEntity
        components: [ toyplaneMesh, material, toyplaneTransform ]
    }
}
