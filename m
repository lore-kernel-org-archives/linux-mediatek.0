From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5.2 190/313] sched/psi: Correct overly pessimistic size calculation
Date: Thu,  3 Oct 2019 17:52:48 +0200
Message-ID: <20191003154551.693711288@linuxfoundation.org>
References: <20191003154533.590915454@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003154533.590915454@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Sasha Levin <sashal@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

From: Miles Chen <miles.chen@mediatek.com>

[ Upstream commit 4adcdcea717cb2d8436bef00dd689aa5bc76f11b ]

When passing a equal or more then 32 bytes long string to psi_write(),
psi_write() copies 31 bytes to its buf and overwrites buf[30]
with '\0'. Which makes the input string 1 byte shorter than
it should be.

Fix it by copying sizeof(buf) bytes when nbytes >= sizeof(buf).

This does not cause problems in normal use case like:
"some 500000 10000000" or "full 500000 10000000" because they
are less than 32 bytes in length.

	/* assuming nbytes == 35 */
	char buf[32];

	buf_size = min(nbytes, (sizeof(buf) - 1)); /* buf_size = 31 */
	if (copy_from_user(buf, user_buf, buf_size))
		return -EFAULT;

	buf[buf_size - 1] = '\0'; /* buf[30] = '\0' */

Before:

 %cd /proc/pressure/
 %echo "123456789|123456789|123456789|1234" > memory
 [   22.473497] nbytes=35,buf_size=31
 [   22.473775] 123456789|123456789|123456789| (print 30 chars)
 %sh: write error: Invalid argument

 %echo "123456789|123456789|123456789|1" > memory
 [   64.916162] nbytes=32,buf_size=31
 [   64.916331] 123456789|123456789|123456789| (print 30 chars)
 %sh: write error: Invalid argument

After:

 %cd /proc/pressure/
 %echo "123456789|123456789|123456789|1234" > memory
 [  254.837863] nbytes=35,buf_size=32
 [  254.838541] 123456789|123456789|123456789|1 (print 31 chars)
 %sh: write error: Invalid argument

 %echo "123456789|123456789|123456789|1" > memory
 [ 9965.714935] nbytes=32,buf_size=32
 [ 9965.715096] 123456789|123456789|123456789|1 (print 31 chars)
 %sh: write error: Invalid argument

Also remove the superfluous parentheses.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
Cc: <linux-mediatek@lists.infradead.org>
Cc: <wsd_upstream@mediatek.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Link: https://lkml.kernel.org/r/20190912103452.13281-1-miles.chen@mediatek.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/sched/psi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 6e52b67b420e7..517e3719027e6 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1198,7 +1198,7 @@ static ssize_t psi_write(struct file *file, const char __user *user_buf,
 	if (static_branch_likely(&psi_disabled))
 		return -EOPNOTSUPP;
 
-	buf_size = min(nbytes, (sizeof(buf) - 1));
+	buf_size = min(nbytes, sizeof(buf));
 	if (copy_from_user(buf, user_buf, buf_size))
 		return -EFAULT;
 
-- 
2.20.1
