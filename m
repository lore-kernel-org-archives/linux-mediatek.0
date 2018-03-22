From: Ji Zhang <ji.zhang@mediatek.com>
Subject: [PATCH] arm64: avoid race condition issue in dump_backtrace
Date: Thu, 22 Mar 2018 11:06:00 +0800
Message-ID: <1521687960-3744-1-git-send-email-ji.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Michael Weiser <michael.weiser@gmx.de>, Julien Thierry <julien.thierry@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Ji Zhang <ji.zhang@mediatek.com>, shadanji@163.com
List-Id: linux-mediatek@lists.infradead.org

When we dump the backtrace of some specific task, there is a potential race
condition due to the task may be running on other cores if SMP enabled.
That is because for current implementation, if the task is not the current
task, we will get the registers used for unwind from cpu_context saved in
thread_info, which is the snapshot before context switch, but if the task
is running on other cores, the registers and the content of stack are
changed.
This may cause that we get the wrong backtrace or incomplete backtrace or
even crash the kernel.
To avoid this case, do not dump the backtrace of the tasks which are
running on other cores.
This patch cannot solve the issue completely but can shrink the window of
race condition.

Signed-off-by: Ji Zhang <ji.zhang@mediatek.com>
---
 arch/arm64/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index eb2d151..95749364 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -113,6 +113,9 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk)
 	if (tsk == current) {
 		frame.fp = (unsigned long)__builtin_frame_address(0);
 		frame.pc = (unsigned long)dump_backtrace;
+	else if (tsk->state == TASK_RUNNING) {
+		pr_notice("Do not dump other running tasks\n");
+		return;
 	} else {
 		/*
 		 * task blocked in __switch_to
-- 
1.9.1
