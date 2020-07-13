Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1CEC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 03:41:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1713120724
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 03:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYp/xXCl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F39RfS2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1713120724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DMU1MMt33DI9UkOPx+otlvkW8ZjsbB2G2cFgRpio/0Q=; b=BYp/xXClv/wm95EP1sI4QMjhM0
	hOVEqGetvuQqJ2PoAwIoU3WPyu1O0u+yCmd+2GcXiJDDa2N2/M7fg0HTT9t6Y3rYob5xkvXSaDIXX
	kkkz/icpy2T+zBnh3Q7d1jg2euUP4FxxHuDXzn/QXAyqfPYRVS6xs4Aw++OePVoMwTDU0cZI1PmL6
	eL91xT80/WzIAmOmgKGQYQpfV2cUZi4xuRReUlbB3H9O/tpk7jTxZrafhYJWNRys5Llwjohht44rR
	1J6iXeL4371xOifxBewl1v575krsmn7mjPMd8W1gkW745r3N1EOq8Rl1/uNCo8PkStr+AtBYAj1fz
	CLbgoCkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jupLF-0004uT-7o; Mon, 13 Jul 2020 03:41:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jupLC-0004tt-Uu; Mon, 13 Jul 2020 03:41:19 +0000
X-UUID: ba725972ba91496580d3c624e6a5bd1c-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JuW3jP9J1lIS5V8IiLWPSVxE4HCb/Oj2hKarwYDEQFg=; 
 b=F39RfS2lfJlj5/DOJsZj+DHVxj3HTSsLROaSSuBi7UWZUekcJT4E7Y+irMlgdN6aO0s7OSpVXIt3I0tBG06qyFllSZad8TQgOXiDXOT9ARLQSskcdtYhypuYKYLabLBx1jRAFRhIjsO8+XMQbXe2MJEkBZWXBeCp2I0nAysh+yg=;
X-UUID: ba725972ba91496580d3c624e6a5bd1c-20200712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 71386034; Sun, 12 Jul 2020 19:41:11 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 20:31:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 11:31:11 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 11:31:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [v2 PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify code
Date: Mon, 13 Jul 2020 11:30:17 +0800
Message-ID: <1594611017-4535-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 68E0EF0317ACCA01D29A26B236ED2441F27383EAF5EEF084C4683CE8F0DE3D5E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_234119_188486_BA160AF2 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout() to poll register status

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2 changes, suggested by Stephen:
  1. use unsigned int instead of int for @usec parameter
  2. add dev_log() back
  3. drop "Err" in error log
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 02a3a77..53dccb1 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -12,6 +12,7 @@
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/io.h>
 #include <linux/list.h>
@@ -29,24 +30,19 @@
 #include "bdc_dbg.h"
 
 /* Poll till controller status is not OIP */
-static int poll_oip(struct bdc *bdc, int usec)
+static int poll_oip(struct bdc *bdc, u32 usec)
 {
 	u32 status;
-	/* Poll till STS!= OIP */
-	while (usec) {
-		status = bdc_readl(bdc->regs, BDC_BDCSC);
-		if (BDC_CSTS(status) != BDC_OIP) {
-			dev_dbg(bdc->dev,
-				"poll_oip complete status=%d",
-				BDC_CSTS(status));
-			return 0;
-		}
-		udelay(10);
-		usec -= 10;
-	}
-	dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", status);
+	int ret;
 
-	return -ETIMEDOUT;
+	ret = readl_poll_timeout(bdc->regs + BDC_BDCSC, status,
+		(BDC_CSTS(status) != BDC_OIP), 10, usec);
+	if (ret)
+		dev_err(bdc->dev, "operation timedout BDCSC: 0x%08x\n", status);
+	else
+		dev_dbg(bdc->dev, "%s complete status=%d", __func__, BDC_CSTS(status));
+
+	return ret;
 }
 
 /* Stop the BDC controller */
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
