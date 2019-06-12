From: Kobe Wu <kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] locking/lockdep: Fix UBSAN warnings
Date: Wed, 12 Jun 2019 13:49:04 +0800
Message-ID: <1560318544-27635-1-git-send-email-kobe-cp.wu@mediatek.com>
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

Fix complaints from UBSAN about signed integer overflow.

========================================================================
UBSAN: Undefined behaviour in kernel/locking/lockdep.c:2998:3
signed integer overflow:
2147483647 + 1 cannot be represented in type 'int'
Call trace:
 dump_backtrace+0x0/0x470
 show_stack+0x14/0x20
 dump_stack+0xc8/0x11c
 ubsan_epilogue+0x14/0xa8
 handle_overflow+0x138/0x1a8
 __ubsan_handle_add_overflow+0x10/0x18
 trace_hardirqs_off_caller+0x1a0/0x268
 trace_hardirqs_off+0x1c/0x28
 rcu_irq_enter_irqson+0x18/0x50
 handle_IPI+0x4cc/0x898
 gic_handle_irq+0x1f4/0x240

When system has been running for a long time, signed integer counters
are not enough for some lockdep statistics. Such as the warning above,
it occurs at debug_atomic_inc(hardirqs_off_events). Using unsigned long
counters can satisfy the requirement. Besides, most of other lockdep
statistics are unsigned. It is better to use unsigned int instead of int.

Remove unused variables.
- max_recursion_depth
- nr_cyclic_check_recursions
- nr_find_usage_forwards_recursions
- nr_find_usage_backwards_recursions

Signed-off-by: Kobe Wu <kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 kernel/locking/lockdep_internals.h |   36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 150ec3f..cc83568 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -131,7 +131,6 @@ extern void get_usage_chars(struct lock_class *class,
 extern unsigned int nr_softirq_chains;
 extern unsigned int nr_process_chains;
 extern unsigned int max_lockdep_depth;
-extern unsigned int max_recursion_depth;
 
 extern unsigned int max_bfs_queue_depth;
 
@@ -160,25 +159,22 @@ extern void get_usage_chars(struct lock_class *class,
  * and we want to avoid too much cache bouncing.
  */
 struct lockdep_stats {
-	int	chain_lookup_hits;
-	int	chain_lookup_misses;
-	int	hardirqs_on_events;
-	int	hardirqs_off_events;
-	int	redundant_hardirqs_on;
-	int	redundant_hardirqs_off;
-	int	softirqs_on_events;
-	int	softirqs_off_events;
-	int	redundant_softirqs_on;
-	int	redundant_softirqs_off;
-	int	nr_unused_locks;
-	int	nr_redundant_checks;
-	int	nr_redundant;
-	int	nr_cyclic_checks;
-	int	nr_cyclic_check_recursions;
-	int	nr_find_usage_forwards_checks;
-	int	nr_find_usage_forwards_recursions;
-	int	nr_find_usage_backwards_checks;
-	int	nr_find_usage_backwards_recursions;
+	unsigned long  chain_lookup_hits;
+	unsigned int   chain_lookup_misses;
+	unsigned long  hardirqs_on_events;
+	unsigned long  hardirqs_off_events;
+	unsigned long  redundant_hardirqs_on;
+	unsigned long  redundant_hardirqs_off;
+	unsigned long  softirqs_on_events;
+	unsigned long  softirqs_off_events;
+	unsigned long  redundant_softirqs_on;
+	unsigned long  redundant_softirqs_off;
+	int            nr_unused_locks;
+	unsigned int   nr_redundant_checks;
+	unsigned int   nr_redundant;
+	unsigned int   nr_cyclic_checks;
+	unsigned int   nr_find_usage_forwards_checks;
+	unsigned int   nr_find_usage_backwards_checks;
 
 	/*
 	 * Per lock class locking operation stat counts
-- 
1.7.9.5
