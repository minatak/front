// test6.js
'use strict';

class Member {
  // 필드명은 생략가능
  // name;
  // age;

  // 생성자
  constructor(name, age, job) {
    this.name = name;
    this.age = age;
    this.job = job;
  }

  // 필드값의 읽기(getter)/쓰기(setter)
  get name() {
    return this._name;
  }

  get age() {
    // return this._age;
    return this._age - 1;
  }

  get job() {
    return this._job;
  }
  
  set name(name) {
    this._name = name;
  }

  set age(age) {
    // this._age = age;
    if(age < 1) age = 1;
    this._age = age;
  }

  set job(job) {
    if(job == '초등학생' || job == '중학생' || job == '고등학생' || job == '대학생') job = '학생';
    this._job = job;
  }
}

let member = new Member('홍길동', 25, '고등학생');
console.log("member : " , member);
console.log("name:", member.name, ", age:", member.age, ", job:", member.job);
