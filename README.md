# CS250-Assembly Language and Computer Organization

## Links

### Important Links

 - [RARS](./Resources/rars_27a7c1f.jar)
 - [Syllabus](./Resources/alod+syllabus+20240408_linyu.pdf)

## Hw 1 Combination and Permutation

 - [Problem](./Hw1/Hw1.pdf)
 - [Code](./Hw1/Hw1.asm)

 ## Hw 2 Nameology of the Five Elements

 - [Problem](./Hw2/Hw2.pdf)
 - [Code](./Hw2/Hw2.asm)

 ## Hw 3 Steiner trees

 - [Problem](./Hw3/Hw3.pdf)
 - [Testcase Explain](./Hw3/HW3_UPDATE.docx)
 - [Testcase Input](./Hw3/testcase1/1.txt)
 - [Testcase Output](./Hw3/testcase1/testcase1.jpg)

## Some Github Commands

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
