# CS250-Assembly Language and Computer Organization

## Links

### Important Links

 - [RARS](https://github.com/TheThirdOne/rars)
 - [Syllabus]()

 - ## Some Github Commands

* Remember to save and git add, git commit before doing further operations

1. upload

    ```shell
    git add .
    git commit -m "your comments"
    git push
    ```

2. download

    ```shell
    git checkout <branch>
    git fetch
    git merge
    ```

3. new branch

    ```shell
    git checkout -b <branch>
    ```

4. switch branch

    ```shell
    git checkout <branch>
    ```

5. delete a local branch

    ```shell
    git branch -d <branch> # for merged branches
    git branch -D <branch> # force deleting
    ```

6. delete a remote branch

    ```shell
    git push origin --delete <remote branch>
    ```

7. merge branch

    ```shell
    git merge <branch to be merged>
    ```

8. bring back deleted files
   
   ```shell
   git checkout <PREVIUS COMMIT> -- .
   git add .
   git commit -m "Restore all deleted files"
   ```