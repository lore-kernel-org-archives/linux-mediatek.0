From: Chang-An Chen <chang-an.chen@mediatek.com>
Subject: [PATCH v2] sched/clock: Prevent generic sched_clock wrap caused by tick_freeze()
Date: Fri, 29 Mar 2019 10:59:09 +0800
Message-ID: <1553828349-8914-1-git-send-email-chang-an.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frederic Weisbecker <fweisbec@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>, Kees Cook <keescook@chromium.org>, Corey Minyard <cminyard@mvista.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>, kuohong.wang@mediatek.com, freddy.hsin@mediatek.com, Chang-An Chen <chang-an.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

tick_freeze() introduced by suspend-to-idle in commit 124cf9117c5f
("PM / sleep: Make it possible to quiesce timers during suspend-to-idle")
will use timekeeping_suspend() instead of syscore_suspend() during
suspend-to-idle. It means that generic sched_clock will keep going because
sched_clock_suspend() and sched_clock_resume() are not taken during
suspend-to-idle. This will lead to generic sched_clock wrap.

For example:
In my arm system with suspend-to-idle enabled, sched_clock is registered
as "56 bits at 13MHz, resolution 76ns, wraps every 4398046511101ns", which
means the real wrapping duration is 8796093022202ns.

[  134.551779] suspend-to-idle suspend (timekeeping_suspend())
[ 1204.912239] suspend-to-idle resume (timekeeping_resume())
......
[ 1206.912239] suspend-to-idle suspend (timekeeping_suspend())
[ 5880.502807] suspend-to-idle resume (timekeeping_resume())
......
[ 6000.403724] suspend-to-idle suspend (timekeeping_suspend())
[ 8035.753167] suspend-to-idle resume  (timekeeping_resume())
......
[ 8795.786684] (2)[321:charger_thread]......
[ 8795.788387] (2)[321:charger_thread]......
[    0.057226] (0)[0:swapper/0]......
[    0.061447] (2)[0:swapper/2]......

Sched_clock was not stopped during suspend-to-idle, and sched_clock_poll
hrtimer was not expired because timekeeping_suspend() is taken during
suspend-to-idle. It makes sched_clock wrap at kernel time 8796s.

To fix this issue, we add sched_clock_suspend() and sched_clock_resume() in
tick_freeze() together with timekeeping_suspend() and timekeeping_resume()
to make sure generic sched_clock wrapping will not happen.

Signed-off-by: Chang-An Chen <chang-an.chen@mediatek.com>
Fixes: 124cf9117c5f (PM / sleep: Make it possible to quiesce timers during suspend-to-idle)
---
 kernel/time/sched_clock.c |    4 ++--
 kernel/time/tick-common.c |    2 ++
 kernel/time/timekeeping.h |    7 +++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index 094b82c..930113b 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -272,7 +272,7 @@ static u64 notrace suspended_sched_clock_read(void)
 	return cd.read_data[seq & 1].epoch_cyc;
 }
 
-static int sched_clock_suspend(void)
+int sched_clock_suspend(void)
 {
 	struct clock_read_data *rd = &cd.read_data[0];
 
@@ -283,7 +283,7 @@ static int sched_clock_suspend(void)
 	return 0;
 }
 
-static void sched_clock_resume(void)
+void sched_clock_resume(void)
 {
 	struct clock_read_data *rd = &cd.read_data[0];
 
diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
index 529143b..df40146 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -487,6 +487,7 @@ void tick_freeze(void)
 		trace_suspend_resume(TPS("timekeeping_freeze"),
 				     smp_processor_id(), true);
 		system_state = SYSTEM_SUSPEND;
+		sched_clock_suspend();
 		timekeeping_suspend();
 	} else {
 		tick_suspend_local();
@@ -510,6 +511,7 @@ void tick_unfreeze(void)
 
 	if (tick_freeze_depth == num_online_cpus()) {
 		timekeeping_resume();
+		sched_clock_resume();
 		system_state = SYSTEM_RUNNING;
 		trace_suspend_resume(TPS("timekeeping_freeze"),
 				     smp_processor_id(), false);
diff --git a/kernel/time/timekeeping.h b/kernel/time/timekeeping.h
index 7a9b4eb..141ab3a 100644
--- a/kernel/time/timekeeping.h
+++ b/kernel/time/timekeeping.h
@@ -14,6 +14,13 @@ extern ktime_t ktime_get_update_offsets_now(unsigned int *cwsseq,
 extern void timekeeping_warp_clock(void);
 extern int timekeeping_suspend(void);
 extern void timekeeping_resume(void);
+#ifdef CONFIG_GENERIC_SCHED_CLOCK
+extern int sched_clock_suspend(void);
+extern void sched_clock_resume(void);
+#else
+static inline int sched_clock_suspend(void) { return 0; }
+static inline void sched_clock_resume(void) { }
+#endif
 
 extern void do_timer(unsigned long ticks);
 extern void update_wall_time(void);
-- 
1.7.9.5
