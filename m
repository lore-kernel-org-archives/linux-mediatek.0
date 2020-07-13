Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0895C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:49:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEEF820720
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XyglNjDR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dmVBhsYz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEEF820720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yT+/rzsdWo5p3CHpHuktDTrpkuNvjbJX3CICVr8p3oE=; b=XyglNjDR+qAXWs0DdkQx9/+S40
	MlHaEweEE+cYlAVPMEx2FPdg3hLtMNciOrNWh+4FAngoxBFUaVSceo8W4uf6qYtcqji958tp3U5VE
	TpG67B4m7RiTnofjwLOnrfpIspaO3n5ZQJrEq5P8mX6WH3kBG3zStgyJ0vS6pUt3XBfrrEMnAZzmm
	PBVj/Mdoc/fhgFlxp1TiABuBNGrbuN6i8I1Itov1ttS3c3IVE209WfI1qACyQs2Eyp5LqSyWaDtXH
	1OGZRIYzlkmMSF7Xz+OBs5GTWtIrY3euKKweZL7athNkHMZjTN8b+RPjPPm38zePvHNxgXvheP45z
	XTA9mFFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jusHD-0007Nm-EP; Mon, 13 Jul 2020 06:49:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jusHA-0007ME-Nt; Mon, 13 Jul 2020 06:49:22 +0000
X-UUID: b03efc33bbfb4bfe9c03509813c7896b-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=svTg6Y0J2kRBPHwhPL7b3ZSCWm0llLAuPVvNsUvQr4k=; 
 b=dmVBhsYzFklLMN0AfUNtRIU8l6MoQ2HSUVistNSwbVMthy6xJ+4cjCeh01kVOZcMI1kUnF1mf8H8e8KAz1FOpHpQ/iEXb66tWBiQVGCWJoQRXIyizLO1QbZ5gIAGcxWXx+e8MUvBL/zcSj9oOHJherKBEJTlQf7bWzz+eva/T1U=;
X-UUID: b03efc33bbfb4bfe9c03509813c7896b-20200712
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1116477721; Sun, 12 Jul 2020 22:49:14 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 23:49:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 14:48:57 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:48:57 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [v3 PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify code
Date: Mon, 13 Jul 2020 14:48:01 +0800
Message-ID: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: A74F600D8912FA0CAB6EA76F87F3D7DE540BD84732E377910E3B4BD15F3F74452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_024920_940554_3CB3DB70 
X-CRM114-Status: GOOD (  13.61  )
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
