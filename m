Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F31CC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:14:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DB8204EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yBTRQG+T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ip5esf9s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DB8204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ivJUW0pjJTwonaV/kTkw1LJU1p+o4Te5GFAryusheAc=; b=yBTRQG+TrZZg/YwJB2vbjQZ0I
	bea92I9T/Dg9DJxz/uaEF1WD4YBbEyohM0l1dIfLJ4bFyUl1kEI8UrnGk45GUk73Yda0d6SaF7v88
	TB5aDv4MBBcZhN70jRDmAjExqny8x2d7IxTBBgdqPdS0w2ZlJPf0X32e/1c+naaX2REcwea3fBeoA
	eoXTBf/9MwRSQcu0dYcGynE1yT+jNg2TJjz60/KuNDx0ouhwJiM470bQqAJrsfY4efgPlTy2QV+x1
	kMpsthKFnZvXSeBa7M8fx5XoTBtx93e3AirETnEFgZrbj9t6/bHpwz0rRub8YyD2Q5tXy0Wg7TXMb
	ON0qI5yPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOTA-00068X-E4; Tue, 25 Aug 2020 02:13:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOSl-0005vT-5c; Tue, 25 Aug 2020 02:13:31 +0000
X-UUID: 2dee172b13704c479872182f822e5f8c-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FJjaeYDfj7zaJAqd4TVOuDNqHaL59TRiYSGWfzunuhk=; 
 b=ip5esf9sufZVbFMNoZpyPMk9Gh+e72isLiyaw554ntLqPgjC1kaMdlAX1XJkdQPGFPRVjpB9ydecLbupHLbvFiNFrCVCNsup0wqJcpK2HAPXYyqmWX5t1xUzqRHWgxV6AuDzPH10SLMQ40kzq7SgqNyvZVF8JBoJ2OVc5xO8lEI=;
X-UUID: 2dee172b13704c479872182f822e5f8c-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1966894339; Mon, 24 Aug 2020 18:10:14 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 19:04:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:43 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 6/6] phy: phy-pxa-28nm-usb2: convert to readl_poll_timeout()
Date: Tue, 25 Aug 2020 10:03:07 +0800
Message-ID: <1598320987-25518-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4B7CA52755C8D266865A594E4B03F79BCD596B20C172F3EC76907D9CF8D018632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_221327_399593_A65D6975 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rikard
 Falkeborn <rikard.falkeborn@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout() to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/marvell/phy-pxa-28nm-usb2.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/marvell/phy-pxa-28nm-usb2.c b/drivers/phy/marvell/phy-pxa-28nm-usb2.c
index 9fd8817..a175ae9 100644
--- a/drivers/phy/marvell/phy-pxa-28nm-usb2.c
+++ b/drivers/phy/marvell/phy-pxa-28nm-usb2.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/module.h>
@@ -138,15 +139,12 @@ struct mv_usb2_phy {
 	struct clk		*clk;
 };
 
-static bool wait_for_reg(void __iomem *reg, u32 mask, unsigned long timeout)
+static int wait_for_reg(void __iomem *reg, u32 mask, u32 ms)
 {
-	timeout += jiffies;
-	while (time_is_after_eq_jiffies(timeout)) {
-		if ((readl(reg) & mask) == mask)
-			return true;
-		msleep(1);
-	}
-	return false;
+	u32 val;
+
+	return readl_poll_timeout(reg, val, ((val & mask) == mask),
+				   1000, 1000 * ms);
 }
 
 static int mv_usb2_phy_28nm_init(struct phy *phy)
@@ -208,24 +206,23 @@ static int mv_usb2_phy_28nm_init(struct phy *phy)
 	 */
 
 	/* Make sure PHY Calibration is ready */
-	if (!wait_for_reg(base + PHY_28NM_CAL_REG,
-	    PHY_28NM_PLL_PLLCAL_DONE | PHY_28NM_PLL_IMPCAL_DONE,
-	    HZ / 10)) {
+	ret = wait_for_reg(base + PHY_28NM_CAL_REG,
+			   PHY_28NM_PLL_PLLCAL_DONE | PHY_28NM_PLL_IMPCAL_DONE,
+			   100);
+	if (ret) {
 		dev_warn(&pdev->dev, "USB PHY PLL calibrate not done after 100mS.");
-		ret = -ETIMEDOUT;
 		goto err_clk;
 	}
-	if (!wait_for_reg(base + PHY_28NM_RX_REG1,
-	    PHY_28NM_RX_SQCAL_DONE, HZ / 10)) {
+	ret = wait_for_reg(base + PHY_28NM_RX_REG1,
+			   PHY_28NM_RX_SQCAL_DONE, 100);
+	if (ret) {
 		dev_warn(&pdev->dev, "USB PHY RX SQ calibrate not done after 100mS.");
-		ret = -ETIMEDOUT;
 		goto err_clk;
 	}
 	/* Make sure PHY PLL is ready */
-	if (!wait_for_reg(base + PHY_28NM_PLL_REG0,
-	    PHY_28NM_PLL_READY, HZ / 10)) {
+	ret = wait_for_reg(base + PHY_28NM_PLL_REG0, PHY_28NM_PLL_READY, 100);
+	if (ret) {
 		dev_warn(&pdev->dev, "PLL_READY not set after 100mS.");
-		ret = -ETIMEDOUT;
 		goto err_clk;
 	}
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
