Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68021C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:13:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36246204EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOF07141";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nIzJHXVO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36246204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LmFBani7jngC2CYG0jHYs35kviBADvh+L6lNFv338Fk=; b=OOF07141bRpjuWEpLnNBb/GGR
	naeZlLZh7vGfiDvxRw036B1IDh6SK9bkt6Jp7Df3aDg7gF9hjTg6hi3LDnOuxUk2CKhBtYijrH8DK
	T8HAqdJ6YBjpX2AwAiAcE4Z52ECEkgdGhNV4jcr2jd3Vz8atehpJKVTrrFY1Bj1SzZNbi7dO8suqz
	nsxr+eYhpw2WxqNcYa5RCr4vRJUYuv9japO7ndGOXGGox5PncHPbHqOGm0hPE5phe5Cc2fs+7aYjs
	KyQuXsBxFR1drpnD386QrQlKCKO1JvyFO7wW6smV05uwKVC475GRL/tN4Gtv4ySTiV0QkWMnD1htX
	wb1ae8QdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOT4-00064z-1K; Tue, 25 Aug 2020 02:13:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOSk-0005v6-Ut; Tue, 25 Aug 2020 02:13:28 +0000
X-UUID: 54c02f8a86b84f678b7654c4cb86bc40-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hg3xDnzPmtGQak8Ute3Rvxu6qZDbOpMb8i88ROzC9nY=; 
 b=nIzJHXVOyUvsPDgAYT1WbGLBtEBGEutmsKY7XeW6YRKkQtHz4pdzZCV853rtgKPteifDMNwInSrOK9eGAytx6DtLDnmAK0lUFwFitzMk3zceEHNAPD6im+VcWz6ktWxJrmDj48s4tqfr1ZC1L4P5ero2X32AufC6iHgCRrwSu6U=;
X-UUID: 54c02f8a86b84f678b7654c4cb86bc40-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1916301067; Mon, 24 Aug 2020 18:10:14 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 19:04:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 5/6] phy: phy-pxa-28nm-hsic: convert to readl_poll_timeout()
Date: Tue, 25 Aug 2020 10:03:06 +0800
Message-ID: <1598320987-25518-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 28FF1B787476A0B3AF2469E02C492C33A28A47D3B4816BF7035E5B68A61F09612000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_221327_194147_E0191E76 
X-CRM114-Status: GOOD (  15.27  )
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
 drivers/phy/marvell/phy-pxa-28nm-hsic.c | 40 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/marvell/phy-pxa-28nm-hsic.c b/drivers/phy/marvell/phy-pxa-28nm-hsic.c
index ae8370a..31b43d2 100644
--- a/drivers/phy/marvell/phy-pxa-28nm-hsic.c
+++ b/drivers/phy/marvell/phy-pxa-28nm-hsic.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/module.h>
@@ -44,15 +45,12 @@ struct mv_hsic_phy {
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
+				  1000, 1000 * ms);
 }
 
 static int mv_hsic_phy_init(struct phy *phy)
@@ -60,6 +58,7 @@ static int mv_hsic_phy_init(struct phy *phy)
 	struct mv_hsic_phy *mv_phy = phy_get_drvdata(phy);
 	struct platform_device *pdev = mv_phy->pdev;
 	void __iomem *base = mv_phy->base;
+	int ret;
 
 	clk_prepare_enable(mv_phy->clk);
 
@@ -75,14 +74,14 @@ static int mv_hsic_phy_init(struct phy *phy)
 		base + PHY_28NM_HSIC_PLL_CTRL2);
 
 	/* Make sure PHY PLL is locked */
-	if (!wait_for_reg(base + PHY_28NM_HSIC_PLL_CTRL2,
-	    PHY_28NM_HSIC_H2S_PLL_LOCK, HZ / 10)) {
+	ret = wait_for_reg(base + PHY_28NM_HSIC_PLL_CTRL2,
+			   PHY_28NM_HSIC_H2S_PLL_LOCK, 100);
+	if (ret) {
 		dev_err(&pdev->dev, "HSIC PHY PLL not locked after 100mS.");
 		clk_disable_unprepare(mv_phy->clk);
-		return -ETIMEDOUT;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mv_hsic_phy_power_on(struct phy *phy)
@@ -91,6 +90,7 @@ static int mv_hsic_phy_power_on(struct phy *phy)
 	struct platform_device *pdev = mv_phy->pdev;
 	void __iomem *base = mv_phy->base;
 	u32 reg;
+	int ret;
 
 	reg = readl(base + PHY_28NM_HSIC_CTRL);
 	/* Avoid SE0 state when resume for some device will take it as reset */
@@ -108,20 +108,20 @@ static int mv_hsic_phy_power_on(struct phy *phy)
 	 */
 
 	/* Make sure PHY Calibration is ready */
-	if (!wait_for_reg(base + PHY_28NM_HSIC_IMPCAL_CAL,
-	    PHY_28NM_HSIC_H2S_IMPCAL_DONE, HZ / 10)) {
+	ret = wait_for_reg(base + PHY_28NM_HSIC_IMPCAL_CAL,
+			   PHY_28NM_HSIC_H2S_IMPCAL_DONE, 100);
+	if (ret) {
 		dev_warn(&pdev->dev, "HSIC PHY READY not set after 100mS.");
-		return -ETIMEDOUT;
+		return ret;
 	}
 
 	/* Waiting for HSIC connect int*/
-	if (!wait_for_reg(base + PHY_28NM_HSIC_INT,
-	    PHY_28NM_HSIC_CONNECT_INT, HZ / 5)) {
+	ret = wait_for_reg(base + PHY_28NM_HSIC_INT,
+			   PHY_28NM_HSIC_CONNECT_INT, 200);
+	if (ret)
 		dev_warn(&pdev->dev, "HSIC wait for connect interrupt timeout.");
-		return -ETIMEDOUT;
-	}
 
-	return 0;
+	return ret;
 }
 
 static int mv_hsic_phy_power_off(struct phy *phy)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
