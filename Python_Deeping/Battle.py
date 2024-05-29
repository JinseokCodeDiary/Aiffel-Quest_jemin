from Character import *

upper1_1 = "￣  ￣￣🐬￣O ￣.￣￣￣￣￣  ￣￣🐬￣O ￣.￣￣￣￣🐬￣￣"
upper1_2 = "🐳    。    o      *   🐟  🐳    。    o      *   🐟  o"

lower1_1 = "🌀🌀🌀🌀🌀🐠🌀🌀🌀🌀🌀🌀🌀🌀🐠🌀🌀🌀🌀🌀🌀"
lower1_2 = "💙🐙💙💙💙💙🐙💙💙💙💙💙💙💙💙🐙💙💙💙💙💙"

def deco_stage1(text):
  def line(a, b):
    print(upper1_1)
    print(upper1_2)
    text(a, b)
    print(lower1_1)
    print(lower1_2)
  return line

upper2_1 = "ට     ⠀◝◜    ⠀⠀◝◜ට     ⠀◝◜    ⠀⠀◝◜ට     ⠀◝◜    ◝◜"
upper2_2 = "⠀◝◜  ⠀◝◜⠀◝◜    ⠀⠀⠀⠀⠀◝◜ ⠀◝◜  ⠀◝◜⠀◝◜    ⠀⠀⠀⠀⠀◝◜"

lower2_1 = "_◢╲______◢╲____◢╲___◢╲◢╲__◢╲_____◢╲____◢╲___◢╲"
lower2_2 = "𓀚 𓀛 𓀜 𓀝 𓀞 𓀟 𓀠 𓀡 𓀢 𓀣 𓀤 𓀥 𓀦 𓀧 𓀨 𓀩𓀚 𓀛 𓀜 𓀝 𓀞 𓀟 𓀠 𓀡 𓀢 𓀣 𓀤 𓀥 𓀦 "

def deco_stage2(text):
  def line(a,b):
    print(upper2_1)
    print(upper2_2)
    text(a,b)
    print(lower2_1)
    print(lower2_2)
  return line

upper3_1 = ".•   🌎   °🌓    •.°    • 🚀 .•   🌎   °🌓    •.°    •"
upper3_2 = "🛰     °·      🛸 ★     🪐🛰     °·      🛸 ★     🪐"

lower3_1 = "★ 🪐   * °    🛰     °·✯ ★ 🪐   * °    🛰     °· ✯ "
lower3_2 = ".   •    ° 🌎    ★    •  ☄.   •    ° 🌎    ★     •   ☄ "

def deco_stage3(text):
  def line(a,b):
    print(upper3_1)
    print(upper3_2)
    text(a,b)
    print(lower3_1)
    print(lower3_2)
  return line

def gen_monster(dic):
  count = randint(1,3)

  for i in range(count):
    yield Monster(dic['monstername'], dic['level'])


# # 전투 함수
@deco_stage3
def battle(player,monster):
      print("\n전투에 돌입합니다. 현재 상태")
      print(player)
      print(monster)
      print("-"*100)
      while player.is_alive() and monster.is_alive():
        player.attack_target(monster)
        print("-"*50)

        if monster.is_alive():
          monster.attack_target(player)

      if player.is_alive():
        player.gain_experience(monster.exp)
        print('전투 승리')
        return
      else:
        print(f'{player.name}이 사망했습니다.')
        print('전투 패배')
        return

def stage(player, stage_number):
    monsterdic = {'monstername' : '고블린', 'level' : 2}
    monster_list = list(gen_monster(monsterdic)) # 몬스터 list 생성
    print(f"{stage_number}번째 스테이지 시작")
    print("{0}마리의 {1}을 마주쳤습니다!".format(len(monster_list), monsterdic["monstername"]))
    for monster in monster_list:
      if player.is_alive():
        battle(player, monster)
      else:
        break
    if player.is_alive():
      print(f"{stage_number}번째 스테이지 종료")
    else:
      print(f"{stage_number}번째 스테이지 종료")
      print(f"{player.name}이 사망했습니다. {player.name}, 플레이 해 주셔서 감사합니다!")
      return
