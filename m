Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E1CC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 03:32:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68ABB2065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 03:32:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDpd0HSO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nx0ywG3U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68ABB2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bf9mc386jj2CO9waR12C1p3mFVnktOJVd8IjN8306ro=; b=DDpd0HSOboKoz1v/PiSZ2NLLN7
	GXZuEwx16A7VwIDpTNXS6JDmkTYqipX7itTCwTZTUQTOwSrNPOhKy6W/zBzpddFMqIQ4P2AKipzN/
	zmJcSEjy3ZVtSQ8j+7US2K+k08tMoL91Iso7MA7Gjd2szYg4xLH9bj91yM5XMU0YNjFuEluc3Uyf2
	4FsbR/7HV7aNodFyLwIXzKJFPDbR9gPjguURTkBFTsyiukr3W3Nhsa+ZX3gs3Z+FL6AeWkn6ahTyU
	BGHqCew9wZBhFh83gqvoSTG/A4u65G7HFawiZ+B4OfPRF8mp+ABuuX1WWnhyvsOQNhtMeGo7PLC5Q
	rqrrNtUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtjlS-0001iM-Fe; Fri, 10 Jul 2020 03:31:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtjlP-0001hU-Qh; Fri, 10 Jul 2020 03:31:53 +0000
X-UUID: 9c27855d63054d0e92b71bb79369d56c-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EGM3/BWA8LhSsl+HU+sSKjzVuEq3sKi1FpSTwosiG/Y=; 
 b=nx0ywG3UFrBU0jPuTeVq7HNV5sLjB56T57UY7fFULkQTJYkIT4dhVbW4K97Ev+6/oUAkkB3uLcsaVrqGMn5TL8AYc5mOaLvOoxhSaSamMQo8eo8y4TWwzbqPL94LvpjZezJ2DgT9coKBwx876y7Z4lBhoiFEjNLk1T7SbRi/u4o=;
X-UUID: 9c27855d63054d0e92b71bb79369d56c-20200709
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 336436444; Thu, 09 Jul 2020 19:31:40 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 20:31:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 11:31:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 11:31:38 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify code
Date: Fri, 10 Jul 2020 11:30:56 +0800
Message-ID: <1594351856-876-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: FE010D8AB826172DBF251444CD9B52F4A7F285AF900E9FB851C849394F2C0CB92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_233152_050428_49E5A718 
X-CRM114-Status: GOOD (  14.41  )
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

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 02a3a77..fa173de 100644
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
@@ -32,21 +33,14 @@
 static int poll_oip(struct bdc *bdc, int usec)
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
+		dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", status);
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
