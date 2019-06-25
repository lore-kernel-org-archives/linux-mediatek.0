From: tip-bot for Kobe Wu <tipbot@zytor.com>
Subject: [tip:locking/core] locking/lockdep: increase size of counters for
 lockdep statistics
Date: Tue, 25 Jun 2019 01:47:34 -0700
Message-ID: <tip-9156e545765e467e6268c4814cfa609ebb16237e@git.kernel.org>
References: <1561365348-16050-1-git-send-email-kobe-cp.wu@mediatek.com>
Reply-To: will.deacon@arm.com, wsd_upstream@mediatek.com,
          eason-yh.lin@mediatek.com, linux-mediatek@lists.infradead.org,
          torvalds@linux-foundation.org, tglx@linutronix.de,
          mingo@kernel.org, peterz@infradead.org,
          linux-kernel@vger.kernel.org, hpa@zytor.com,
          kobe-cp.wu@mediatek.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561365348-16050-1-git-send-email-kobe-cp.wu@mediatek.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Cc: kobe-cp.wu@mediatek.com, hpa@zytor.com, linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@kernel.org, tglx@linutronix.de, linux-mediatek@lists.infradead.org, torvalds@linux-foundation.org, wsd_upstream@mediatek.com, eason-yh.lin@mediatek.com, will.deacon@arm.com
List-Id: linux-mediatek@lists.infradead.org

Commit-ID:  9156e545765e467e6268c4814cfa609ebb16237e
Gitweb:     https://git.kernel.org/tip/9156e545765e467e6268c4814cfa609ebb16237e
Author:     Kobe Wu <kobe-cp.wu@mediatek.com>
AuthorDate: Mon, 24 Jun 2019 16:35:48 +0800
Committer:  Ingo Molnar <mingo@kernel.org>
CommitDate: Tue, 25 Jun 2019 10:17:08 +0200

locking/lockdep: increase size of counters for lockdep statistics

When system has been running for a long time, signed integer
counters are not enough for some lockdep statistics. Using
unsigned long counters can satisfy the requirement. Besides,
most of lockdep statistics are unsigned. It is better to use
unsigned int instead of int.

Remove unused variables.
- max_recursion_depth
- nr_cyclic_check_recursions
- nr_find_usage_forwards_recursions
- nr_find_usage_backwards_recursions

Signed-off-by: Kobe Wu <kobe-cp.wu@mediatek.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: <linux-mediatek@lists.infradead.org>
Cc: <wsd_upstream@mediatek.com>
Cc: Eason Lin <eason-yh.lin@mediatek.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Will Deacon <will.deacon@arm.com>
Link: https://lkml.kernel.org/r/1561365348-16050-1-git-send-email-kobe-cp.wu@mediatek.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 kernel/locking/lockdep_internals.h | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 150ec3f0c5b5..cc83568d5012 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -131,7 +131,6 @@ extern unsigned int nr_hardirq_chains;
 extern unsigned int nr_softirq_chains;
 extern unsigned int nr_process_chains;
 extern unsigned int max_lockdep_depth;
-extern unsigned int max_recursion_depth;
 
 extern unsigned int max_bfs_queue_depth;
 
@@ -160,25 +159,22 @@ lockdep_count_backward_deps(struct lock_class *class)
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
