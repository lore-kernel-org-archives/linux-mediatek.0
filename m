From: Kobe Wu <kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] locking/lockdep: Remove unnecessary DEBUG_LOCKS_WARN_ON()
Date: Thu, 30 May 2019 19:59:35 +0800
Message-ID: <1559217575-30298-1-git-send-email-kobe-cp.wu@mediatek.com>
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

DEBUG_LOCKS_WARN_ON() will turn off debug_locks and 
makes print_unlock_imbalance_bug() return directly.

Remove a redundant whitespace.

Signed-off-by: Kobe Wu <kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 kernel/locking/lockdep.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index d06190f..37c0a5e 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4049,8 +4049,8 @@ static int __lock_downgrade(struct lockdep_map *lock, unsigned long ip)
 	 * So we're all set to release this lock.. wait what lock? We don't
 	 * own any locks, you've been drinking again?
 	 */
-	if (DEBUG_LOCKS_WARN_ON(depth <= 0))
-		 return print_unlock_imbalance_bug(curr, lock, ip);
+	if (depth <= 0)
+		return print_unlock_imbalance_bug(curr, lock, ip);
 
 	/*
 	 * Check whether the lock exists in the current stack
-- 
1.7.9.5
