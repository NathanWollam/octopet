// Octopet Legs // editor.p5js.org

const pi = 3.14;

let canvasHeight = 400;
let canvasWidth = 400;

let circleDiameter = 150;
let circleRadius = circleDiameter * 0.5;

let secondCircleDiameter = circleDiameter * 0.25;
let secondCircleRadius = secondCircleDiameter * 0.5;

let combinedRadius = circleRadius + secondCircleRadius;

let circleXPos = canvasWidth * 0.5;
let circleYPos = canvasHeight * 0.5;

let secondCircleXPos = circleXPos + combinedRadius;
let secondCircleYPos = circleYPos;

let tentacleManager;

// initial angle and velocity
let angle = pi / 3;
let angularVelocity = 0.01;

function setup() {
    createCanvas(canvasWidth, canvasHeight);

    tentacleManager = new TentacleManager(6);

    for (var i = 0; i < tentacleManager.numberOfTentacles; i++) {
        tentacleManager.newTentacle(60, 3, 0.002, pi / 6);
    }
}

function draw() {
    background(32);
    background(220);
    fill(255, 150, 50);

    // first circle
    circle(circleXPos, circleYPos, circleDiameter);

    tentacleManager.showTentacles();
}

class TentacleManager {
    constructor(numberOfTentacles) {
        this.tentacles = [];
        this.numberOfTentacles = numberOfTentacles;
    }

    newTentacle(baseSize, suckerCount, angularVelocity, bounceLimitAngle) {
        let distanceBetweenAngles = 360 / this.numberOfTentacles;
        let angle = distanceBetweenAngles * (this.tentacles.length + 1);
        let angleInRads = (angle * pi) / 180;

        print(
            "# of tentacles: " +
            this.numberOfTentacles +
            " distance: " +
            distanceBetweenAngles +
            " angle: " +
            angle +
            " rads " +
            angleInRads
        );

        let t = new Tentacle(
            angleInRads,
            baseSize,
            suckerCount,
            angularVelocity,
            bounceLimitAngle
        );
        this.tentacles.push(t);
    }

    showTentacles() {
        for (var i = 0; i < this.tentacles.length; i++) {
            this.tentacles[i].showTentacle();
        }
    }
}

class Tentacle {
    constructor(angle, baseSize, suckerCount, angularVelocity, bounceLimitAngle) {
        this.angle = angle;
        // diameter
        this.baseSize = baseSize;
        this.suckerCount = suckerCount;
        this.sequentialSuckerRatio = 0.6;
        this.angularVelocity = angularVelocity;
        this.negativeAngularVelocity = -1*angularVelocity;
        this.currentVelocity = angularVelocity;
        this.bounceLimitAngle = bounceLimitAngle;
        this.startingAngle = angle;
    }

    showTentacle() {
        let combinedRadius = circleRadius;
        let nextRadius = this.baseSize;

        for (var i = 1; i <= this.suckerCount; i++) {
            let maxAngle = this.startingAngle + this.bounceLimitAngle;
            let minAngle = this.startingAngle;

            if (this.angle < minAngle) {
                print("increase")
                this.currentVelocity = this.angularVelocity;
            } else if (this.angle > maxAngle) {
                print("decrease")
                this.currentVelocity = this.negativeAngularVelocity;
            }

            this.angle += this.currentVelocity

            combinedRadius += nextRadius / 2;
            // print("D: " + nextRadius + " R: " + nextRadius/2 + " CR: " + combinedRadius)

            let suckerXPos = sin(this.angle) * combinedRadius + circleXPos;
            let suckerYPos = cos(this.angle) * combinedRadius + circleYPos;

            circle(suckerXPos, suckerYPos, nextRadius);

            // print("AngularVelocity: " + this.angularVelocity + " SA: " + this.startingAngle + " A: " + this.angle + " minAngle: " + minAngle, " maxAngle: " + maxAngle)

            combinedRadius += nextRadius / 2;
            nextRadius = nextRadius * this.sequentialSuckerRatio;
        }
    }
}
