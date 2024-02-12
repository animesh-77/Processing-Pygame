import pygame
import random
import numpy as np


# Pygame setup
pygame.init()
WIDTH, HEIGHT = 800, 600
persistence = 20
WINDOW = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Gaussian Plotter")

# Gaussian parameters
mu_x, sigma_x = WIDTH / 2, 100
mu_y, sigma_y = HEIGHT / 2, 100

x = np.random.normal(loc=mu_x, scale=sigma_x, size=persistence)
y = np.random.normal(loc=mu_y, scale=sigma_y, size=persistence)


def generate_point():
    x = int(random.gauss(mu_x, sigma_x))
    y = int(random.gauss(mu_y, sigma_y))
    return x, y


def generate_points(x, y):

    x1, y1 = generate_point()

    x = np.append(x1, x[:-1])
    y = np.append(y1, y[:-1])

    return x, y


def plot_points(x, y):

    for x1, y1 in zip(x, y):
        pygame.draw.circle(WINDOW, (255, 0, 0), (x1, y1), 5)


running = True
while running:
    for event in pygame.event.get():
        # when closing the window
        if event.type == pygame.QUIT:
            running = False

    WINDOW.fill((255, 255, 255))  # Clear the screen

    plot_points(x, y)
    x, y = generate_points(x, y)

    pygame.display.update()
    pygame.time.delay(10)

pygame.quit()
