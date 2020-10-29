Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91719C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 02:56:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0228A2076D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 02:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usMmolvP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Re8BvPRY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0228A2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=skrnr50KMINPIef/QsRbZpQ/8vnGTnh7pgZutfxhMyU=; b=usMmolvP6EcPL8XCbd18Pjcey
	YA3dgcJ5LUgvNN5OxBEAnfk4fmhulTEJqYsAeVq2lSE3/Zu6STZsYfg8k57gstDkjSs3fGs/+7+v4
	wBGZeXOkz1wZ7UtGDLjm8l1N6yDV/WElVTbdOZNR5q84gDZR1xvTgpfYckOKvh96QOBxav1c7Lsnb
	aDztgSxM6aTmC97PhHNq168hZEdyCu509s/6UKBsdX+Kp1kBzgt9bQALF3WwHdgE4BCnAFU2nkK+n
	NO1+FGhjgK07wwVZDCguKKzKnNzJVaZYb15Z9aYu/hAHOGAXpRbC7iT5vw4NSx5iaWeqCeCdRcdi8
	ucHSHu4ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXy6d-0001lW-1E; Thu, 29 Oct 2020 02:56:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXy6R-0001hR-Ld; Thu, 29 Oct 2020 02:55:53 +0000
X-UUID: 08ac90a41c894fd781539fef68cfd887-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RKuDKEmKgeDl31OX/zx0Hpz0rVP1Wo3Qq95F1KYNP4c=; 
 b=Re8BvPRYrWrC3aP0SqHSsJR1ADbkuCcqX0PIrItyGkStSH++iFidRVYEwaUpXiWP7M+L8J1e0KdZi7D2uDiItu/LT44MG1uP4A81ONynmD4vIpbQq1cNfuVNhWDq+4mJZVk0m/YYRqCKqdv3MNVicqpRnM8CI5DAPwlQoQ3jyO4=;
X-UUID: 08ac90a41c894fd781539fef68cfd887-20201028
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 99060184; Wed, 28 Oct 2020 18:55:47 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 19:55:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:55:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 10:55:38 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 07/17] phy: marvell: convert to devm_platform_ioremap_resource
Date: Thu, 29 Oct 2020 10:54:29 +0800
Message-ID: <1603940079-8131-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FD329C3298B07CEC0B12C3C41CA78FABF43BB42433630AA9BB6FDA2651E700632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_225551_895274_531882D0 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: Ondrej Jirman <megous@megous.com>, Peter Chen <peter.chen@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Anil Varughese <aniljoy@cadence.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin
 Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Icenowy Zheng <icenowy@aosc.io>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Remi Pommarel <repk@triplefau.lt>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger
 Quadros <rogerq@ti.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Ma Feng <mafeng.ma@huawei.com>, Scott
 Branden <sbranden@broadcom.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Sanket Parmar <sparmar@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/marvell/phy-armada375-usb2.c | 4 +---
 drivers/phy/marvell/phy-berlin-usb.c     | 4 +---
 drivers/phy/marvell/phy-mmp3-usb.c       | 4 +---
 drivers/phy/marvell/phy-mvebu-sata.c     | 4 +---
 drivers/phy/marvell/phy-pxa-28nm-hsic.c  | 4 +---
 drivers/phy/marvell/phy-pxa-28nm-usb2.c  | 4 +---
 drivers/phy/marvell/phy-pxa-usb.c        | 4 +---
 7 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/marvell/phy-armada375-usb2.c b/drivers/phy/marvell/phy-armada375-usb2.c
index fa5dc9462d09..b141e3cd8a94 100644
--- a/drivers/phy/marvell/phy-armada375-usb2.c
+++ b/drivers/phy/marvell/phy-armada375-usb2.c
@@ -105,15 +105,13 @@ static int armada375_usb_phy_probe(struct platform_device *pdev)
 	struct phy *phy;
 	struct phy_provider *phy_provider;
 	void __iomem *usb_cluster_base;
-	struct resource *res;
 	struct armada375_cluster_phy *cluster_phy;
 
 	cluster_phy = devm_kzalloc(dev, sizeof(*cluster_phy), GFP_KERNEL);
 	if (!cluster_phy)
 		return  -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	usb_cluster_base = devm_ioremap_resource(&pdev->dev, res);
+	usb_cluster_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(usb_cluster_base))
 		return PTR_ERR(usb_cluster_base);
 
diff --git a/drivers/phy/marvell/phy-berlin-usb.c b/drivers/phy/marvell/phy-berlin-usb.c
index a43df63007c5..78ef6ae72a9a 100644
--- a/drivers/phy/marvell/phy-berlin-usb.c
+++ b/drivers/phy/marvell/phy-berlin-usb.c
@@ -165,7 +165,6 @@ static int phy_berlin_usb_probe(struct platform_device *pdev)
 	const struct of_device_id *match =
 		of_match_device(phy_berlin_usb_of_match, &pdev->dev);
 	struct phy_berlin_usb_priv *priv;
-	struct resource *res;
 	struct phy *phy;
 	struct phy_provider *phy_provider;
 
@@ -173,8 +172,7 @@ static int phy_berlin_usb_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
diff --git a/drivers/phy/marvell/phy-mmp3-usb.c b/drivers/phy/marvell/phy-mmp3-usb.c
index 499869595a58..04c0bada3519 100644
--- a/drivers/phy/marvell/phy-mmp3-usb.c
+++ b/drivers/phy/marvell/phy-mmp3-usb.c
@@ -246,7 +246,6 @@ MODULE_DEVICE_TABLE(of, mmp3_usb_phy_of_match);
 static int mmp3_usb_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *resource;
 	struct mmp3_usb_phy *mmp3_usb_phy;
 	struct phy_provider *provider;
 
@@ -254,8 +253,7 @@ static int mmp3_usb_phy_probe(struct platform_device *pdev)
 	if (!mmp3_usb_phy)
 		return -ENOMEM;
 
-	resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mmp3_usb_phy->base = devm_ioremap_resource(dev, resource);
+	mmp3_usb_phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mmp3_usb_phy->base)) {
 		dev_err(dev, "failed to remap PHY regs\n");
 		return PTR_ERR(mmp3_usb_phy->base);
diff --git a/drivers/phy/marvell/phy-mvebu-sata.c b/drivers/phy/marvell/phy-mvebu-sata.c
index 3c01b5dceaae..51a4646e2933 100644
--- a/drivers/phy/marvell/phy-mvebu-sata.c
+++ b/drivers/phy/marvell/phy-mvebu-sata.c
@@ -80,7 +80,6 @@ static const struct phy_ops phy_mvebu_sata_ops = {
 static int phy_mvebu_sata_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
-	struct resource *res;
 	struct priv *priv;
 	struct phy *phy;
 
@@ -88,8 +87,7 @@ static int phy_mvebu_sata_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
diff --git a/drivers/phy/marvell/phy-pxa-28nm-hsic.c b/drivers/phy/marvell/phy-pxa-28nm-hsic.c
index 31b43d2ee39a..c5c100563f55 100644
--- a/drivers/phy/marvell/phy-pxa-28nm-hsic.c
+++ b/drivers/phy/marvell/phy-pxa-28nm-hsic.c
@@ -162,7 +162,6 @@ static int mv_hsic_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct mv_hsic_phy *mv_phy;
-	struct resource *r;
 
 	mv_phy = devm_kzalloc(&pdev->dev, sizeof(*mv_phy), GFP_KERNEL);
 	if (!mv_phy)
@@ -176,8 +175,7 @@ static int mv_hsic_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(mv_phy->clk);
 	}
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mv_phy->base = devm_ioremap_resource(&pdev->dev, r);
+	mv_phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mv_phy->base))
 		return PTR_ERR(mv_phy->base);
 
diff --git a/drivers/phy/marvell/phy-pxa-28nm-usb2.c b/drivers/phy/marvell/phy-pxa-28nm-usb2.c
index a175ae915f02..0b390b9d2ae1 100644
--- a/drivers/phy/marvell/phy-pxa-28nm-usb2.c
+++ b/drivers/phy/marvell/phy-pxa-28nm-usb2.c
@@ -294,7 +294,6 @@ static int mv_usb2_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct mv_usb2_phy *mv_phy;
-	struct resource *r;
 
 	mv_phy = devm_kzalloc(&pdev->dev, sizeof(*mv_phy), GFP_KERNEL);
 	if (!mv_phy)
@@ -308,8 +307,7 @@ static int mv_usb2_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(mv_phy->clk);
 	}
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mv_phy->base = devm_ioremap_resource(&pdev->dev, r);
+	mv_phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mv_phy->base))
 		return PTR_ERR(mv_phy->base);
 
diff --git a/drivers/phy/marvell/phy-pxa-usb.c b/drivers/phy/marvell/phy-pxa-usb.c
index 87ff7550b912..ffe889893ff4 100644
--- a/drivers/phy/marvell/phy-pxa-usb.c
+++ b/drivers/phy/marvell/phy-pxa-usb.c
@@ -286,7 +286,6 @@ MODULE_DEVICE_TABLE(of, pxa_usb_phy_of_match);
 static int pxa_usb_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *resource;
 	struct pxa_usb_phy *pxa_usb_phy;
 	struct phy_provider *provider;
 	const struct of_device_id *of_id;
@@ -301,8 +300,7 @@ static int pxa_usb_phy_probe(struct platform_device *pdev)
 	else
 		pxa_usb_phy->version = PXA_USB_PHY_MMP2;
 
-	resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pxa_usb_phy->base = devm_ioremap_resource(dev, resource);
+	pxa_usb_phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pxa_usb_phy->base)) {
 		dev_err(dev, "failed to remap PHY regs\n");
 		return PTR_ERR(pxa_usb_phy->base);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
