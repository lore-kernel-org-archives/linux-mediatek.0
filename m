Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0019FC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C33E2076C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYb8yRaS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B2oCmNNu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C33E2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wyexPLQ0eGUbq+llE7feJufzKJ6fEemZgiaaND/xaPs=; b=SYb8yRaSue+uRsD/nUt7ozhJs
	Df834Yh5/iJyB2iaZff7eQ/W1FI59gtXEt9Vwr/xDsXlMcBcBW+wGwJY23Pin/bHM50NDLRQc8a3E
	OmPfUnEaqrEkteT7IKl+H4n+doofezePHSC1nNWER3LMK01vQGgpMUYxDH5+isOZPsD6sKCvoWnUp
	4Hm1zyuwpyb1crShs1r+27NvKLQYfD9kqSHlhhuXKNuJN4wRtyhvRJnbDW2dsJbCf9dgZaXHfQX8p
	MUJqcIHq9Xdj+aJHGJg7jfCw0OvDXthynKCvPYHVZwgOFMLYU/6kwHUVFCj33hEcRvauc2lqHWsVh
	Im/R2fz9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGI2A-0005i7-P1; Thu, 10 Sep 2020 08:34:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGI1z-0005cS-0w; Thu, 10 Sep 2020 08:34:13 +0000
X-UUID: 2094afe97d994d6abe41c31d5ae7a685-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=J3BiqWxfV1+Z3aDvfR83RogHjSnqeDdQl3tqJBLcqsI=; 
 b=B2oCmNNuUvhJYTzSkv73vpVlrUU6J8fPCvCeHsoy3UT6u1m8+0vz3eVAa+Qz5OSoGmozcWYzvTYZoqokNcPfJZoRrhn+YBogMwkNLd6CcpOEH3/+Z6149tyksAj3LGCTKG8QWM87PP2Y2G7erSE2BUoegu/P9PC8DFHlN2hziao=;
X-UUID: 2094afe97d994d6abe41c31d5ae7a685-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1629440851; Thu, 10 Sep 2020 00:34:05 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 01:24:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 16:24:00 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 16:23:58 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v3 02/11] usb: early: ehci-dbgp: convert to
 readl_poll_timeout_atomic()
Date: Thu, 10 Sep 2020 16:21:43 +0800
Message-ID: <1599726112-4439-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AFF16CD37DCA3267BBDFA7FEB25A7875F550A782E36CA49A37CE082BE0907E122000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_043411_215740_5BDE7725 
X-CRM114-Status: GOOD (  14.48  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jason Yan <yanaijie@huawei.com>,
 linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Lee Jones <lee.jones@linaro.org>, Ben
 Dooks <ben.dooks@codethink.co.uk>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Petr Mladek <pmladek@suse.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
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
