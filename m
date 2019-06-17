From: tip-bot for Kobe Wu <tipbot@zytor.com>
Subject: [tip:locking/core] locking/lockdep: Remove unnecessary
 DEBUG_LOCKS_WARN_ON()
Date: Mon, 17 Jun 2019 07:18:00 -0700
Message-ID: <tip-dd471efe345bf6f9e1206f6c629ca3e80eb43523@git.kernel.org>
References: <1559217575-30298-1-git-send-email-kobe-cp.wu@mediatek.com>
Reply-To: peterz@infradead.org, linux-mediatek@lists.infradead.org,
          will.deacon@arm.com, linux-kernel@vger.kernel.org,
          eason-yh.lin@mediatek.com, kobe-cp.wu@mediatek.com,
          wsd_upstream@mediatek.com, tglx@linutronix.de, hpa@zytor.com,
          torvalds@linux-foundation.org, mingo@kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559217575-30298-1-git-send-email-kobe-cp.wu@mediatek.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, will.deacon@arm.com, hpa@zytor.com, tglx@linutronix.de, kobe-cp.wu@mediatek.com, eason-yh.lin@mediatek.com, mingo@kernel.org, torvalds@linux-foundation.org, peterz@infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Commit-ID:  dd471efe345bf6f9e1206f6c629ca3e80eb43523
Gitweb:     https://git.kernel.org/tip/dd471efe345bf6f9e1206f6c629ca3e80eb43523
Author:     Kobe Wu <kobe-cp.wu@mediatek.com>
AuthorDate: Thu, 30 May 2019 19:59:35 +0800
Committer:  Ingo Molnar <mingo@kernel.org>
CommitDate: Mon, 17 Jun 2019 12:09:37 +0200

locking/lockdep: Remove unnecessary DEBUG_LOCKS_WARN_ON()

DEBUG_LOCKS_WARN_ON() will turn off debug_locks and
makes print_unlock_imbalance_bug() return directly.

Remove a redundant whitespace.

Signed-off-by: Kobe Wu <kobe-cp.wu@mediatek.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: <linux-mediatek@lists.infradead.org>
Cc: <wsd_upstream@mediatek.com>
Cc: Eason Lin <eason-yh.lin@mediatek.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Will Deacon <will.deacon@arm.com>
Link: https://lkml.kernel.org/r/1559217575-30298-1-git-send-email-kobe-cp.wu@mediatek.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 kernel/locking/lockdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 48a840adb281..5e368f485330 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4160,7 +4160,7 @@ __lock_release(struct lockdep_map *lock, unsigned long ip)
 	 * So we're all set to release this lock.. wait what lock? We don't
 	 * own any locks, you've been drinking again?
 	 */
-	if (DEBUG_LOCKS_WARN_ON(depth <= 0)) {
+	if (depth <= 0) {
 		print_unlock_imbalance_bug(curr, lock, ip);
 		return 0;
 	}
