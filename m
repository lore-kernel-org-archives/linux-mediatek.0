Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEBEC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 05:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A3120724
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 05:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="syvt3ypJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O8UwMUw9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A3120724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=86VzNfcCYrWzXEGW9OAshEYOG1uYc3Iy29p/J2ry9w8=; b=syvt3ypJV1xspypqJbKJJsTfI
	AyML9SQZUy95lxWYZL1Nt6uIAdJMwmUGATE9H1SMaB5j/bmFMsWISzsKHB+xFZB6Dl1OzEH1eHjwB
	SXabrVCZSSPZ3t090/L4cx7FJopRJycPP1rELpTDxeLdMqi3CpwZVpSg4iI2iyCSbyvaRHJpnhUG6
	cdmUAuwoSLJfxxc6QqSfpI81aYlikTmIumtaoWp+tCUvbR8kaFh8cigVWsLPLNUHmmsEyJ9l5cMT8
	OE9obis7ggsKxkZCg7iveTE0Z7P14cIGxNpHm1X31lgUCQpfGAsu7aLy4XHCxBVEJ6w4uUkVdwchh
	648JnvYCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dQ8-0003Bm-87; Thu, 20 Aug 2020 05:47:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8dQ4-00038P-IN; Thu, 20 Aug 2020 05:47:26 +0000
X-UUID: b80263587d1843689c2f5f90ce16045e-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oAP5zwZxDjrS5iQRAq1dYHyOyODPcgJHQ5kTHeYS9H8=; 
 b=O8UwMUw9lSVGZvMhCMgvO1bsTRmAorNEsDp/Jsfl7mWccv+tJnK6iOVbfWcLdxEt5rA1rHZoEFMv1eiTDkvQ66AVTGjEF1BFsyEU1KFxgr2hTTUDAGPb4VRAu1R1wN9yUlCK2xgUkcI9LtKKi7JxC2KFkzL4u2aV+GBm5AUjDF8=;
X-UUID: b80263587d1843689c2f5f90ce16045e-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 301967878; Wed, 19 Aug 2020 21:47:15 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 22:47:13 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 13:47:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 13:47:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 02/11] usb: early: ehci-dbgp: convert to
 readl_poll_timeout_atomic()
Date: Thu, 20 Aug 2020 13:45:40 +0800
Message-ID: <1597902349-8998-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E1099680E78D2534BB6ACBE72C4DD5FBD99438982FDEED0B0161D86D052EE3452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_014724_836089_DB452DDC 
X-CRM114-Status: GOOD (  15.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <balbi@kernel.org>, Petr Mladek <pmladek@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Petr Mladek <pmladek@suse.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/early/ehci-dbgp.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
index b075dbf..45b42d8 100644
--- a/drivers/usb/early/ehci-dbgp.c
+++ b/drivers/usb/early/ehci-dbgp.c
@@ -15,6 +15,7 @@
 #include <linux/console.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/pci_regs.h>
 #include <linux/pci_ids.h>
 #include <linux/usb/ch9.h>
@@ -161,17 +162,11 @@ static inline u32 dbgp_pid_read_update(u32 x, u32 tok)
 static int dbgp_wait_until_complete(void)
 {
 	u32 ctrl;
-	int loop = DBGP_TIMEOUT;
-
-	do {
-		ctrl = readl(&ehci_debug->control);
-		/* Stop when the transaction is finished */
-		if (ctrl & DBGP_DONE)
-			break;
-		udelay(1);
-	} while (--loop > 0);
+	int ret;
 
-	if (!loop)
+	ret = readl_poll_timeout_atomic(&ehci_debug->control, ctrl,
+				(ctrl & DBGP_DONE), 1, DBGP_TIMEOUT);
+	if (ret)
 		return -DBGP_TIMEOUT;
 
 	/*
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
