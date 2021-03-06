# Skills Matrix
[![CircleCI](https://circleci.com/gh/luiz1361/SkillsMatrix.svg?style=svg)](https://circleci.com/gh/luiz1361/SkillsMatrix) [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![codebeat badge](https://codebeat.co/badges/af8254f0-55dd-4bbd-8397-626c83554cd0)](https://codebeat.co/projects/github-com-luiz1361-skillsmatrix-master) [![codecov](https://codecov.io/gh/luiz1361/SkillsMatrix/branch/master/graph/badge.svg)](https://codecov.io/gh/luiz1361/SkillsMatrix)

The Skills Matrix was initially built with the goal of providing an easy way to track skills of individuals within an organization.

## Donation

```javascript
function workInProgress(donation) {
    var coffee = donation;
    var wip = 0;
    while (coffee > 0 ){
        wip++;
        coffee--;
    }
    return wip
}
```
[Click here for PayPal Donation](https://paypal.me/luiz1361)

## Screenshots
Login page: 

![alt text](https://github.com/luiz1361/SkillsMatrix/raw/master/docs/screenshots/login.png)

Skills List page:

![alt text](https://github.com/luiz1361/SkillsMatrix/raw/master/docs/screenshots/skillslist.png)

## Demo
> **TBD**

## Installation / Get Started

### Pre-requisites

* Docker
* Docker Compose(Windows and MacOS already include this on the standard Docker install)

### Step by step

#### Linux and MacOS

1. #git clone https://github.com/luiz1361/SkillsMatrix.git && cd SkillsMatrix/build && ./bash_init.sh
2. #cd ./www **(Web files are located here)**
3. **Browse to** http://127.0.0.1/public
4. **Username:** skillsmatrixuser and **Password:** 123456

#### Windows

1. #git clone https://github.com/luiz1361/SkillsMatrix.git && cd SkillsMatrix/build && ./win_init.ps1
2. #cd ./www **(Web files are located here)**
3. **Browse to** http://127.0.0.1/public
4. **Username:** skillsmatrixuser and **Password:** 123456

# Documentation

## Database

1. Normalization: break down tables until each table represents one and only one “thing”.
2. Naming: Singular and consistent ie. person, person2Department.
3. Documentation: Described in detail as much as possible.
4. One table to hold all domain values: One table per "thing" and use relations as much as possible.
5. Using identity/guid columns as your only key: Use other identifiable columns as fk pkeys.
6. Encoding: CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
7. Engine: InnoDB, implements transactions, foreign keys and relationship constraints. Row-level locking and better crash recovery.

Schema:

![alt text](https://github.com/luiz1361/SkillsMatrix/raw/master/docs/database/schema.png)


# References
* https://vincentgarreau.com/particles.js/
* https://dribbble.com/shots/4249163-Animated-login-form-avatar
* https://datatables.net/examples/basic_init/table_sorting.html
* https://bootstrapious.com/p/bootstrap-sidebar
* https://cookie-bar.eu/

# License
SkillsMatrix is GPLv3+.
