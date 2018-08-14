import argparse

import gym

<<<<<<< HEAD:stable_baselines/deepq/experiments/enjoy_mountaincar.py
from stable_baselines import deepq
=======
from baselines.deepq import DeepQ
>>>>>>> refactoring:baselines/deepq/experiments/enjoy_mountaincar.py


def main(args):
    """
    run a trained model for the mountain car problem

    :param args: (ArgumentParser) the input arguments
    """
    env = gym.make("MountainCar-v0")
    model = DeepQ.load("mountaincar_model.pkl", env)

    while True:
        obs, done = env.reset(), False
        episode_rew = 0
        while not done:
            if not args.no_render:
                env.render()
            action, _ = model.predict(obs)
            obs, rew, done, _ = env.step(action)
            episode_rew += rew
        print("Episode reward", episode_rew)
        # No render is only used for automatic testing
        if args.no_render:
            break


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Enjoy trained DQN on MountainCar")
    parser.add_argument('--no-render', default=False, action="store_true", help="Disable rendering")
    args = parser.parse_args()
    main(args)
