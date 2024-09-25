import pygame
import time
import random
pygame.font.init()

WIDTH, HEIGHT = 1600, 900
WIN = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Bullet Hell")

BG = pygame.transform.scale(pygame.image.load("gradient.jpg") , (WIDTH,HEIGHT))

PLAYER_WIDTH = 30
PLAYER_HEIGHT = 50
PLAYER_VEL = 15

PLAYER_HEALTH = 100
health = PLAYER_HEALTH

REGEN_COUNTER = 30
CONTACT_DMG = 25

enemies = []
ENEMY_WIDTH = 20
ENEMY_HEIGHT = 40
ENEMY_VEL = 5

def pause_screen():
    pygame.time.delay(1000)
    waiting = True
    while waiting:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                quit()
            if event.type == pygame.KEYDOWN:
                waiting = False  # End the waiting loop if any key is pressed

def draw(player, elapsed_time, health):
    WIN.blit(BG, (0,0))

    FONT = pygame.font.SysFont("arial", 30)
    time_text = FONT.render(f"Time: {round(elapsed_time)}s", 1, "white")
    WIN.blit(time_text, (WIDTH-time_text.get_width()- 10, 10))

    hp_text = FONT.render(f"HP: {health}/{PLAYER_HEALTH}", 1, "red")
    WIN.blit(hp_text, (10, 10))

    pygame.draw.rect(WIN, (255,255,0), player)

    for enemy in enemies :
        pygame.draw.rect(WIN, "red", enemy)

    pygame.display.update()

def main():
    run = True
    resetflag = True

    while run:

        if resetflag == True:
            player = pygame.Rect(WIDTH/2, HEIGHT - PLAYER_HEIGHT, PLAYER_WIDTH, PLAYER_HEIGHT)
            health = PLAYER_HEALTH
            regen = 0
            clock = pygame.time.Clock()
            start_time = time.time()
            elapsed_time = 0

            enemy_add_increment = 2000
            enemies.clear()
            enemy_count = 0
            hit = False
            resetflag = False

        regen += 1
        if (regen >= REGEN_COUNTER) and (health < PLAYER_HEALTH):
            health += 1
            regen = 0

        enemy_count += clock.tick(60)
        elapsed_time = time.time() - start_time

        if enemy_count > enemy_add_increment:
            for _ in range(3):
                enemy_x = random.randint(0, WIDTH - ENEMY_WIDTH)
                enemy = pygame.Rect(enemy_x, -ENEMY_HEIGHT, ENEMY_WIDTH, ENEMY_HEIGHT)
                enemies.append(enemy)

            enemy_add_increment = max(200, enemy_add_increment - 50)
            enemy_count = 0

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run = False
                break

        keys = pygame.key.get_pressed()
        if (keys[pygame.K_a] or keys[pygame.K_LEFT]) and player.x - PLAYER_VEL >= 0:
            player.x -= PLAYER_VEL
        if (keys[pygame.K_s] or keys[pygame.K_DOWN]) and player.y + PLAYER_VEL <= HEIGHT - PLAYER_HEIGHT:
            player.y += PLAYER_VEL
        if (keys[pygame.K_d] or keys[pygame.K_RIGHT]) and player.x + PLAYER_VEL <= WIDTH - PLAYER_WIDTH:
            player.x += PLAYER_VEL
        if (keys[pygame.K_w] or keys[pygame.K_UP]) and player.y - PLAYER_VEL >= 0:
            player.y -= PLAYER_VEL
        
        #border movement
        if (keys[pygame.K_a] or keys[pygame.K_LEFT]) and player.x - PLAYER_VEL <= 0:
            player.x = 0
        if (keys[pygame.K_s] or keys[pygame.K_DOWN]) and player.y + PLAYER_VEL >= HEIGHT - PLAYER_HEIGHT:
            player.y = HEIGHT - PLAYER_HEIGHT
        if (keys[pygame.K_d] or keys[pygame.K_RIGHT]) and player.x + PLAYER_VEL >= WIDTH - PLAYER_WIDTH:
            player.x = WIDTH - PLAYER_WIDTH
        if (keys[pygame.K_w] or keys[pygame.K_UP]) and player.y - PLAYER_VEL <= 0:
            player.y = 0

        for enemy in enemies[:]:
            enemy.y += ENEMY_VEL
            if enemy.y > HEIGHT:
                enemies.remove(enemy)
            elif enemy.y + ENEMY_HEIGHT >= player.y and enemy.colliderect(player):
                enemies.remove(enemy)
                hit = True

        if hit:
            hit = False
            health -= CONTACT_DMG
            
            if (health <= 0):
                FONT = pygame.font.SysFont("IMPACT", 100)
                lost_text = FONT.render("DEFEAT", True, (255,50,50))
                WIN.blit(lost_text, (WIDTH/2 - lost_text.get_width()/2, HEIGHT/2 - lost_text.get_height()/2))
                pygame.display.update()
                pause_screen()
                resetflag = True

        draw(player, elapsed_time, health)

    pygame.quit()

if __name__ == "__main__":
    main()