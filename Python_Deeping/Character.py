from random import *

class Charater:

    def __init__(self, name, level, hp, attack, defense):
        self.name = name
        self.level = level
        self.hp = hp
        self.attack = attack
        self.defense = defense

    def __str__(self):
        return '이름 : {0} 레벨 : {1} HP : {2} 공격력 : {3} 방어력 : {4}'.format(self.name, self.level, self.hp, self.attack, self.defense)

    def is_alive(self):
        if self.hp > 0: # 체력이 0보다 많으면 True 적으면 False / True 면 생존 False 사망
            return True
        else:
            return False


    def take_damage(self, damage):
        if damage - self.defense > 0: # 받은 데미지가 플레이어 방어력 보다 많으면 데미지를 입는다
            print('{0} 에게 {1} 의 데미지가 들어왔습니다.'.format(self.name, damage))
            print('방어력 {0}만큼 데미지를 덜 받습니다.'.format(self.defense))
            self.hp -= (damage - self.defense)
            print('받은 데미지는 {0} 입니다. 현재 {1} 체력은 {2} 입니다.'.format((damage - self.defense), self.name, self.hp))

        else: # 그렇지 않으면 데미지를 받지 않는다.
            print('{0} 에게 {1} 의 데미지가 들어왔습니다.'.format(self.name, damage))
            print('방어력 {0}만큼 데미지를 덜 받습니다.'.format(self.defense))
            print('방어력이 받은 데미지 보다 높기 때문에 체력이 감소하지 않습니다.')


    def attack_target(self, enemy): # 몬스터를 공격할 떄 1 ~ 플레이어 공격력 사이의 랜덤한 숫자로 공격한다.
        print('{0}이(가) {1}을(를) 공격합니다.'.format(self.name, enemy.name))
        attackDamage = randint(1, self.attack+1)
        print('{0}의 공격을 가합니다.'.format(attackDamage))
        enemy.take_damage(attackDamage)

class Player(Charater):

    def __init__(self, name): # Charater 를 상속 받음
        # self.name = input('플레이어 이름을 지정해주세요. : ')
        self.name = name
        self.level = 1
        self.hp = 100
        self.attack = 25
        self.defense = 5
        self.exp = 0
        super().__init__(self.name, self.level, self.hp, self.attack, self.defense) # Player에 지정된 값을 넣어 줌

    def __str__(self):
        return super().__str__() + ' 경험치 : {0}'.format(self.exp) # Charater 클래스에 있는 플레이어 정보에 경험치를 추가

    def gain_experience(self, gainExp):

        self.exp += gainExp

        while True:
            if self.exp >= 50: # 경험치가 50 이상이라면
                self.level_up() # 레벨업을 하고
                print('레벨이 올랐습니다!')
                if self.exp - 50 != 0: # 남은 경험치를 더해주는 조건
                    self.exp -= 50
                else:
                    self.exp = 0
            else:
                break

    def level_up(self):
        self.level += 1
        self.attack += 10
        self.defense += 5

    def __enter__(self):
       print(f'환영합니다, {self.name}!')
       return self
    
    def __exit__(self, a, b, c):
       print(f'{self.name}, 플레이 해주셔서 감사합니다.')

class Monster(Charater):

    def __init__(self, name, level):

        self.hp = randint(1, 3) * level
        self.attack = randint(1, 3) * level
        self.defense = randint(1, 3) * level
        self.exp = 6 * level
        super().__init__(name, level, self.hp, self.attack, self.defense)

    def __str__(self):
       return super().__str__() + ' 경험치 : {0}'.format(self.exp)
