# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
Usually, toggling an output whenever the counter reaches its terminal count. One toggle takes M input clock pulses. A full output cycle (high→low→high) requires two toggles, so it takes 2·M clocks per output period.
### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?

There are a few common causes; which one applies depends on how the ring counter was implemented and how it was initialized. Two likely reasons:

A. Improper initialization / power-up state.
Flip-flops can power up to unpredictable values (often a mixture of 0s and 1s). If your ring counter was supposed to start with a single ‘1’ but the hardware (or simulator) didn’t clear/preset it, you can get all 1s at power up. On the first clock that pattern can propagate to produce all-1 outputs.

B. Feedback or loading logic that injects 1s.
If your design shifts in the inverted last bit or otherwise feeds a constant 1 into the first stage (intentionally or accidentally), then the shift may fill the register with 1s quickly — for example, if your feedback path produces a 1 on the first active edge, then after one or a few clocks many bits will be 1. (A Johnson counter / twisted ring has inverted feedback and produces long runs of 1s/0s during startup, so depending on implementation you can see many 1s early on.)
### 3 - What width of ring counter would you use to get to an output of ~1KHz?

A ring counter divides the clock by its width (number of flip-flops):

𝑓
𝑜
𝑢
𝑡
=
𝑓
𝑖
𝑛
𝑁
f
out
	​

=
N
f
in
	​

	​


So:

𝑁
=
𝑓
𝑖
𝑛
𝑓
𝑜
𝑢
𝑡
N=
f
out
	​

f
in
	​

	​


Assuming the DE0-Lite / FPGA 50 MHz clock (typical for your labs):

𝑁
=
50
,
000
,
000
1
,
000
=
50
,
000
N=
1,000
50,000,000
	​

=50,000

So you would need a ring counter with:

 50,000 bits (flip-flops)

This is why we never use a ring counter for large divisions — it’s massively inefficient. A binary counter would only require:

log
⁡
2
(
50
,
000
)
≈
16
 flip-flops
log
2
	​

(50,000)≈16 flip-flops
