From: Ji Zhang <ji.zhang@mediatek.com>
Subject: [PATCH] arm: avoid race condition issue in dump_backtrace
Date: Thu, 22 Mar 2018 11:34:16 +0800
Message-ID: <1521689656-4694-1-git-send-email-ji.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Mickael GUENE <mickael.guene@st.com>, Andrew Morton <akpm@linux-foundation.org>, Ji Zhang <ji.zhang@mediatek.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, shadanji@163.com
List-Id: linux-mediatek@lists.infradead.org

When we dump the backtrace of some specific task, there is a potential race
condition due to the task may be running on other cores if SMP enabled.
That is because for current implementation, if the task is not the current
task, we will get the registers used for unwind from cpu_context saved in
thread_info, which the snapshot before context switch, but if the task is
running on other cores, the registers and the content of stack are changed.
This may cause that we get the wrong backtrace or incomplete backtrace or
even crash the kernel.
To avoid this case, do not dump the backtrace of the task which is running
on other cores.
This patch cannot solve the issue completely but can shrink the window of
race condition.

Signed-off-by: Ji Zhang <ji.zhang@mediatek.com>
---
 arch/arm/kernel/traps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 5e3633c..faa3d45 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -220,6 +220,10 @@ static void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk)
 		fp = frame_pointer(regs);
 		mode = processor_mode(regs);
 	} else if (tsk != current) {
+		if (tsk->state == TASK_RUNNING) {
+			pr_notice("Do not dump other running tasks\n");
+			return;
+		}
 		fp = thread_saved_fp(tsk);
 		mode = 0x10;
 	} else {
-- 
1.9.1
