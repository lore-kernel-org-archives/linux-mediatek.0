From: Kobe Wu <kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] locking/lockdep: Save and display stack trace of held locks
Date: Mon, 24 Jun 2019 16:00:59 +0800
Message-ID: <1561363259-14705-1-git-send-email-kobe-cp.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Eason Lin <eason-yh.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Kobe Wu <kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Save the stack trace of held locks when lock_acquire() is invoked
and display the stack trace when lockdep_print_held_locks() is
invoked. The runtime stack trace of held locks are helpful in
analyzing code flow and lockdep's warning.

Save stack trace of each held lock will increase runtime overhead
and memory consumption. The operation will be activated under
CONFIG_LOCKDEP_TRACE_HELD_LOCK. So the impact will only occur
when CONFIG_LOCKDEP_TRACE_HELD_LOCK=y.

Signed-off-by: Kobe Wu <kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 include/linux/lockdep.h  |   13 +++++++++++++
 kernel/locking/lockdep.c |   22 ++++++++++++++++++++++
 lib/Kconfig.debug        |   13 +++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 6e2377e..4e8d027 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -224,6 +224,10 @@ struct lock_chain {
  */
 #define MAX_LOCKDEP_KEYS		((1UL << MAX_LOCKDEP_KEYS_BITS) - 1)
 
+#ifdef CONFIG_LOCKDEP_TRACE_HELD_LOCK
+#define MAX_HELD_LOCK_ENTRIES 32
+#endif
+
 struct held_lock {
 	/*
 	 * One-way hash of the dependency chain up to this point. We
@@ -269,6 +273,15 @@ struct held_lock {
 	unsigned int hardirqs_off:1;
 	unsigned int references:12;					/* 32 bits */
 	unsigned int pin_count;
+
+#ifdef CONFIG_LOCKDEP_TRACE_HELD_LOCK
+	/*
+	 * When trying to acquire a lock, the stack trace will be saved
+	 * in the entries.
+	 */
+	unsigned int nr_entries;
+	unsigned long entries[MAX_HELD_LOCK_ENTRIES];
+#endif
 };
 
 /*
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index d06190f..ad7cecf 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -457,6 +457,28 @@ static int save_trace(struct lock_trace *trace)
 	return 1;
 }
 
+/* Stack-trace: record stack backtrace when trying to acquire a lock. */
+#ifdef CONFIG_LOCKDEP_TRACE_HELD_LOCK
+static void save_held_lock_trace(struct held_lock *hlock)
+{
+	hlock->nr_entries =
+		stack_trace_save(hlock->entries, MAX_HELD_LOCK_ENTRIES, 2);
+}
+
+static void print_held_lock_trace(struct held_lock *hlock)
+{
+	stack_trace_print(hlock->entries, hlock->nr_entries, 6);
+}
+#else
+static void save_held_lock_trace(struct held_lock *hlock)
+{
+}
+
+static void print_held_lock_trace(struct held_lock *hlock)
+{
+}
+#endif
+
 unsigned int nr_hardirq_chains;
 unsigned int nr_softirq_chains;
 unsigned int nr_process_chains;
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index eae4395..7082843 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1285,6 +1285,19 @@ config WW_MUTEX_SELFTEST
 	  Say M if you want these self tests to build as a module.
 	  Say N if you are unsure.
 
+config LOCKDEP_TRACE_HELD_LOCK
+	bool "Lock information: save and display stack trace of held locks"
+	depends on PROVE_LOCKING
+	default n
+	help
+	  This feature will save the stack trace when trying to acquire a lock
+	  and display the stack trace when a lockdep warning is reported. This
+	  might be helpful in analyzing lockdep's warnings.
+
+	  Enable this will increase runtime overhead and memory consumption.
+
+	  If unsure, say N.
+
 endmenu # lock debugging
 
 config TRACE_IRQFLAGS
-- 
1.7.9.5
