From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] psi: put NULL char correctly in psi_write()
Date: Thu, 12 Sep 2019 18:34:52 +0800
Message-ID: <20190912103452.13281-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

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

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 kernel/sched/psi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 6e52b67b420e..517e3719027e 100644
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
2.18.0
