let numBalls = 12;
let spring = 0.05;
let gravity = 0.03;
let balls;
function setup(){
    balls = new Array(numBalls);
    createCanvas(displayWidth, displayHeight);
    noStroke();
    smooth();
    for(let i = 0;i < numBalls;i++) {
        balls[0]=new Ball(random(width), random(height), random(displayWidth / 20, displayWidth / 6), i, balls);
    }
}

function draw(){
    background(0);
    for(let i = 0;i < numBalls;i++) {
        balls[i].collide();
        balls[i].move();
        balls[i].display();
    }
}

class Ball{
    constructor(xin, yin, din, idin, oin){
        this.vx = 0;
        this.vy = 0;
        this.x=xin;
        this.y=yin;
        this.diameter=din;
        this.id=idin;
        this.others=oin;
    }

    collide(){
        for(let i = this.id + 1;i < numBalls;i++) {
            let dx = this.others[i].x - this.x;
            let dy = this.others[i].y - this.y;
            let distance = sqrt(dx * dx + dy * dy);
            let minDist = this.others[i].diameter / 2 + this.diameter / 2;
            if(distance < minDist) {
                let angle = atan2(dy, dx);
                let targetX = this.x + cos(angle) * minDist;
                let targetY = this.y + sin(angle) * minDist;
                let ax = (targetX - this.others[i].x) * spring;
                let ay = (targetY - this.others[i].y) * spring;
                this.vx-=ax;
                this.vy-=ay;
                this.others[i].vx+=ax;
                this.others[i].vy+=ay;
            }
        }
    }

    move(){
        this.vy+=gravity;
        this.x+=this.vx;
        this.y+=this.vy;
        if(this.x + this.diameter / 2 > width) {
            this.x=width - this.diameter / 2;
            this.vx+=-0.9;
        }
    else if(this.x - this.diameter / 2 < 0) {
            this.x=this.diameter / 2;
            this.vx*=-0.9;
        }
        if(this.y + this.diameter / 2 > height) {
            this.y=height - this.diameter / 2;
            this.vy*=-0.9;
        }
    else if(this.y - this.diameter / 2 < 0) {
            this.y=this.diameter / 2;
            this.vy*=-0.9;
        }
    }

    display(){
        fill(255, 204, 200);
        ellipse(this.x, this.y, this.diameter, this.diameter);
    }

}

