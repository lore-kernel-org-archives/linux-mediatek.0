Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E253C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:06:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3233A20709
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeQGruhk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ptu5NTzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3233A20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yT+/rzsdWo5p3CHpHuktDTrpkuNvjbJX3CICVr8p3oE=; b=oeQGruhkkMd7uDxzSL0G7mQ9hB
	h/EkaY+BkTQ9aEjW7Kbm7u1djrqk+cXipBRQHklRTFL7DIQbgk3REHAeHKCm5K2lcaRqX6J1WM0OU
	fU9N9lOTaNiF1m9A4X1ZEzncrGj/QqpVrTvEKbyKJ3JaCKgHC5w+UdZTOu6P/MQ/3PR1LM7ffS+9i
	dTm1JE0Sip5HoeTSCt3Xzb3OWypJ9PDdoELwFfdFMMuc4T0rul+GmMwt1EjHQQ0+vj2xBwrnEixko
	DKDkASNvfwmgkih8IJMHgr/0/mBuA/7HXKg62Xf2Hfm88eUuH23Zj69xEH2/5blBx6kHv+wLMwhav
	bwLNoCpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy8pu-00024G-Qn; Wed, 22 Jul 2020 07:06:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy8pq-000229-5v; Wed, 22 Jul 2020 07:06:39 +0000
X-UUID: 9062c63da080456ab9ea4034b53bacab-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=svTg6Y0J2kRBPHwhPL7b3ZSCWm0llLAuPVvNsUvQr4k=; 
 b=ptu5NTzV5sZ8K0cXD3yJgtkuWuYWZXvgySqhw2XyYAk/mjzHIVFR5ZkCbQp4DLUlHhBCsmKHZnmCKgj1ZRwCo+pBl+kWkOzymIGj7MXBsySMkknyyWDqJtUQdX66Jzb1dTLVrkL0G8svPRSGAyvq1QcIyecWAfpjUlmtP/dBZlc=;
X-UUID: 9062c63da080456ab9ea4034b53bacab-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 749027999; Tue, 21 Jul 2020 23:00:20 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 23:53:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 14:52:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 14:52:37 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [RESEND v3 PATCH] usb: gadget: bdc: use readl_poll_timeout() to
 simplify code
Date: Wed, 22 Jul 2020 14:51:27 +0800
Message-ID: <1595400687-7207-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6BC2D767A334078E97F78F2FE45985FB26E6852540760D6A9D82AFBE3E0893672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_030638_374344_9D56A733 
X-CRM114-Status: GOOD (  15.03  )
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
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
v3 changes:
  1. indent code to match open parenthesis suggested by Florian
  2. add Reviewed-by Florian

v2 changes, suggested by Stephen:
  1. use unsigned int instead of int for @usec parameter
  2. add dev_log() back
  3. drop "Err" in error log
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 02a3a77..d567e20 100644
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
+				 (BDC_CSTS(status) != BDC_OIP), 10, usec);
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
