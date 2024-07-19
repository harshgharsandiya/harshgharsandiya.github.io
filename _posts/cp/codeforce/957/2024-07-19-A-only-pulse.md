---
layout: post
title: A Only Pulse
date: 2024-07-19 21:44:00 +0000
categories: [cp,CF957]
tags: [codeforce, dsa, java]
---

# A. Only Pluses

## Problem Description

Kmes has written three integers `a`, `b`, and `c` in order to remember that he has to give Noobish_Monk `a × b × c` bananas.

Noobish_Monk has found these integers and decided to do the following at most 5 times:

1. Pick one of these integers.
2. Increase it by 1.

For example, if `a=2`, `b=3`, and `c=4`, then one can increase `a` three times by one and increase `b` two times. After that, `a=5`, `b=5`, and `c=4`. Then the total number of bananas will be `5 × 5 × 4 = 100`.

**What is the maximum value of `a × b × c` Noobish_Monk can achieve with these operations?**

## Input

Each test contains multiple test cases. The first line of input contains a single integer `t` (1 ≤ `t` ≤ 1000) — the number of test cases. The description of the test cases follows.

The first and only line of each test case contains three integers `a`, `b`, and `c` (1 ≤ `a`, `b`, `c` ≤ 10) — Kmes's integers.

## Output

For each test case, output a single integer — the maximum amount of bananas Noobish_Monk can get.

## Example

**Input**
```
2
2 3 4
10 1 10
```

**Output**
```
100
600
```

```java
import java.util.Scanner;

public class A_only_pulse {

    static int solution(int a, int b, int c) {
        int max = Integer.MIN_VALUE;
        int product,k;
        for(int i=0; i<=5; i++) {
            for(int j=0; j<=5-i; j++) {
                k = 5-j-i;
                product = (a+i)*(b+j)*(c+k);
                max = Math.max(product, max);
            }
        }
        return max;
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int t = sc.nextInt();

        for(int i=0; i<t; i++) {
            int a = sc.nextInt();
            int b = sc.nextInt();
            int c = sc.nextInt();

            int ans = solution(a, b, c);
            System.out.println(ans);
        }

        sc.close();
    }
}
```