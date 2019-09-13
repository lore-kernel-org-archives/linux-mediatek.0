Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F50C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 17:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB08B21655
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 17:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IYTI6afa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB08B21655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	References:In-Reply-To:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4g8E9RqNCwAjQnYug+JBhrSJPY4WeCKTznIJ5uLO8Xk=; b=IYTI6afad+3stB
	zcQwd53MaKnsTjQT1XWdq/2CC1HrTYmj8uqWHvHJNowxSRgNCkQfhFcBA5cV+zA6qQpeQdwaGlK9f
	0Q2lljUJaWLlaWqNzI6lmMtyjfE7BWmNLhnm04IP8QtFl4Ys6SAm6wNhnj7/tva1UEJGvUrELf6AQ
	YnZQMnmR+bYtdr7bJcNufI7+FlfPIjJwvyU3w5z804XsX8WXjU0+LkRHkD8E4IZuKK7XXW9/4T2sU
	eTES2pePwj/mKguu9d+RXeKCeNgBKdZ6Ox+Dd8GEE/92zluE5yj57vfEuLXZjiE3Hypgn/F2NVwaT
	PsR+3fK6vLV9QYhTWboA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUDGE-0002FN-9h; Mon, 11 Nov 2019 17:13:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8uI1-0005ZJ-MU
 for linux-mediatek@lists.infradead.org; Fri, 13 Sep 2019 22:43:44 +0000
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1i8uHm-0005iJ-Hf; Sat, 14 Sep 2019 00:43:27 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id A23011C04F3;
 Sat, 14 Sep 2019 00:43:25 +0200 (CEST)
Date: Fri, 13 Sep 2019 22:43:25 -0000
From: "tip-bot2 for Miles Chen" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/psi: Correct overly pessimistic size
 calculation
In-Reply-To: <20190912103452.13281-1-miles.chen@mediatek.com>
References: <20190912103452.13281-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Message-ID: <156841460535.24167.6273030361884540421.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_154341_877221_B8E67F98 
X-CRM114-Status: GOOD (  11.03  )
X-Mailman-Approved-At: Mon, 11 Nov 2019 09:13:53 -0800
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: wsd_upstream@mediatek.com, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
Message-ID: <20190913224325.vL1XMerchWUCfNSB5KYD-JLzDk1CspwrNp4NE5ndvQs@z>

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     4adcdcea717cb2d8436bef00dd689aa5bc76f11b
Gitweb:        https://git.kernel.org/tip/4adcdcea717cb2d8436bef00dd689aa5bc76f11b
Author:        Miles Chen <miles.chen@mediatek.com>
AuthorDate:    Thu, 12 Sep 2019 18:34:52 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 13 Sep 2019 07:49:28 +02:00

sched/psi: Correct overly pessimistic size calculation

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
---
 kernel/sched/psi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7acc632..4b14a32 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1190,7 +1190,7 @@ static ssize_t psi_write(struct file *file, const char __user *user_buf,
 	if (static_branch_likely(&psi_disabled))
 		return -EOPNOTSUPP;
 
-	buf_size = min(nbytes, (sizeof(buf) - 1));
+	buf_size = min(nbytes, sizeof(buf));
 	if (copy_from_user(buf, user_buf, buf_size))
 		return -EFAULT;
 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
