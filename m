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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362F4C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 03:00:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986DF206B6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 03:00:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUxdoC8l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t/Ye8pPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 986DF206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=njLHhUdKBLWR2EXhntDHacCV/Xt7TYxd17kk/XNwcK4=; b=KUxdoC8lbKyq22gjoBSbbBIHo
	rII5VjJjyl1kurdICY/fdFi2lEZ8qArbZNDICrzPRkWAPMFD1U2og7Iy5Ewjehl16s7nfY5WEOvt0
	+KUSImzGp+LU92lqF7ECS+VlXe1ool4G2d0iTdqf+uYv57QbkuRS0xjmNFWOBLO/sDKGzxUft/YA6
	O0Nw97yFS6Z5ehGvs3AhPBWrxZwcNKJpIF6N3NJk2hp78B0YrSqwqen+YAAL1TqLpTWyrtKCfWoAV
	yIAU+jQxd0YGtN3fiBbkiUUpOts20saUiwE5XG6nLQPgHoh2T0HZnf9juB2FTZovXdzvAlu3iHyyN
	PemehWZ3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXyAO-0002kW-MM; Thu, 29 Oct 2020 02:59:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXy9e-0002Oi-P2; Thu, 29 Oct 2020 02:59:15 +0000
X-UUID: f94462e808ae497f86e791292cca52d1-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2yglO2+Fw9yrkCr6zLS67+gi/jATwblG8RbFe/ClajA=; 
 b=t/Ye8pPFdAPOhPhmv18iDkFY8HVxvbAyX5N5etFuDk6jlRpTw1DEE9AEY8+X3gfLlp+T2MGk/ZyEhS1pCa3FJWoz/1E+TBGV1yBP/6njsu53Iv9hRnnuhEqqe2Du0PmGjzBTqeBNEDXSnS0y3nrRf+D+UimGCF8VSEliA2LSBHg=;
X-UUID: f94462e808ae497f86e791292cca52d1-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1384615871; Wed, 28 Oct 2020 18:59:04 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 19:55:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:55:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 10:55:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 03/17] phy: broadcom: convert to
 devm_platform_ioremap_resource(_byname)
Date: Thu, 29 Oct 2020 10:54:25 +0800
Message-ID: <1603940079-8131-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9711090682E4990AAE49B6CF90781ECCEAD14381B3DB1D43AAF43C5A4AAAC73D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_225911_037356_DE2BEBE3 
X-CRM114-Status: GOOD (  13.72  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Anil Varughese <aniljoy@cadence.com>, Wei Yongjun <weiyongjun1@huawei.com>,
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

Use devm_platform_ioremap_resource(_byname) to simplify code

Cc: Al Cooper <alcooperx@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/broadcom/phy-bcm-cygnus-pcie.c |  4 +---
 drivers/phy/broadcom/phy-bcm-kona-usb2.c   |  4 +---
 drivers/phy/broadcom/phy-bcm-ns-usb2.c     |  4 +---
 drivers/phy/broadcom/phy-bcm-ns-usb3.c     |  7 ++-----
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c  | 13 ++++---------
 drivers/phy/broadcom/phy-bcm-sr-pcie.c     |  5 +----
 drivers/phy/broadcom/phy-bcm-sr-usb.c      |  4 +---
 drivers/phy/broadcom/phy-brcm-sata.c       |  8 ++------
 8 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
index b074682d9dd8..548e46776100 100644
--- a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
@@ -126,7 +126,6 @@ static int cygnus_pcie_phy_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node, *child;
 	struct cygnus_pcie_phy_core *core;
 	struct phy_provider *provider;
-	struct resource *res;
 	unsigned cnt = 0;
 	int ret;
 
@@ -141,8 +140,7 @@ static int cygnus_pcie_phy_probe(struct platform_device *pdev)
 
 	core->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	core->base = devm_ioremap_resource(dev, res);
+	core->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
diff --git a/drivers/phy/broadcom/phy-bcm-kona-usb2.c b/drivers/phy/broadcom/phy-bcm-kona-usb2.c
index 6459296d9bf9..e9cc5f2cb89a 100644
--- a/drivers/phy/broadcom/phy-bcm-kona-usb2.c
+++ b/drivers/phy/broadcom/phy-bcm-kona-usb2.c
@@ -94,7 +94,6 @@ static int bcm_kona_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm_kona_usb *phy;
-	struct resource *res;
 	struct phy *gphy;
 	struct phy_provider *phy_provider;
 
@@ -102,8 +101,7 @@ static int bcm_kona_usb2_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	phy->regs = devm_ioremap_resource(&pdev->dev, res);
+	phy->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->regs))
 		return PTR_ERR(phy->regs);
 
diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb2.c b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
index 9f2f84d65dcd..4b015b8a71c3 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb2.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
@@ -83,7 +83,6 @@ static int bcm_ns_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm_ns_usb2 *usb2;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 
 	usb2 = devm_kzalloc(&pdev->dev, sizeof(*usb2), GFP_KERNEL);
@@ -91,8 +90,7 @@ static int bcm_ns_usb2_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	usb2->dev = dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmu");
-	usb2->dmu = devm_ioremap_resource(dev, res);
+	usb2->dmu = devm_platform_ioremap_resource_byname(pdev, "dmu");
 	if (IS_ERR(usb2->dmu)) {
 		dev_err(dev, "Failed to map DMU regs\n");
 		return PTR_ERR(usb2->dmu);
diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb3.c b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
index 47b029fbebbd..42baf4d6dd5d 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb3.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
@@ -305,7 +305,6 @@ static int bcm_ns_usb3_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *of_id;
 	struct bcm_ns_usb3 *usb3;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 
 	usb3 = devm_kzalloc(dev, sizeof(*usb3), GFP_KERNEL);
@@ -319,15 +318,13 @@ static int bcm_ns_usb3_probe(struct platform_device *pdev)
 		return -EINVAL;
 	usb3->family = (enum bcm_ns_family)of_id->data;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmp");
-	usb3->dmp = devm_ioremap_resource(dev, res);
+	usb3->dmp = devm_platform_ioremap_resource_byname(pdev, "dmp");
 	if (IS_ERR(usb3->dmp)) {
 		dev_err(dev, "Failed to map DMP regs\n");
 		return PTR_ERR(usb3->dmp);
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ccb-mii");
-	usb3->ccb_mii = devm_ioremap_resource(dev, res);
+	usb3->ccb_mii = devm_platform_ioremap_resource_byname(pdev, "ccb-mii");
 	if (IS_ERR(usb3->ccb_mii)) {
 		dev_err(dev, "Failed to map ChipCommon B MII regs\n");
 		return PTR_ERR(usb3->ccb_mii);
diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
index 9630ac127366..65a399acc845 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
@@ -293,7 +293,6 @@ static int ns2_drd_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ns2_phy_driver *driver;
 	struct ns2_phy_data *data;
-	struct resource *res;
 	int ret;
 	u32 val;
 
@@ -307,23 +306,19 @@ static int ns2_drd_phy_probe(struct platform_device *pdev)
 	if (!driver->data)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "icfg");
-	driver->icfgdrd_regs = devm_ioremap_resource(dev, res);
+	driver->icfgdrd_regs = devm_platform_ioremap_resource_byname(pdev, "icfg");
 	if (IS_ERR(driver->icfgdrd_regs))
 		return PTR_ERR(driver->icfgdrd_regs);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rst-ctrl");
-	driver->idmdrd_rst_ctrl = devm_ioremap_resource(dev, res);
+	driver->idmdrd_rst_ctrl = devm_platform_ioremap_resource_byname(pdev, "rst-ctrl");
 	if (IS_ERR(driver->idmdrd_rst_ctrl))
 		return PTR_ERR(driver->idmdrd_rst_ctrl);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "crmu-ctrl");
-	driver->crmu_usb2_ctrl = devm_ioremap_resource(dev, res);
+	driver->crmu_usb2_ctrl = devm_platform_ioremap_resource_byname(pdev, "crmu-ctrl");
 	if (IS_ERR(driver->crmu_usb2_ctrl))
 		return PTR_ERR(driver->crmu_usb2_ctrl);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "usb2-strap");
-	driver->usb2h_strap_reg = devm_ioremap_resource(dev, res);
+	driver->usb2h_strap_reg = devm_platform_ioremap_resource_byname(pdev, "usb2-strap");
 	if (IS_ERR(driver->usb2h_strap_reg))
 		return PTR_ERR(driver->usb2h_strap_reg);
 
diff --git a/drivers/phy/broadcom/phy-bcm-sr-pcie.c b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
index 96a3af126a78..8a4aadf166cf 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
@@ -217,7 +217,6 @@ static int sr_pcie_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct sr_pcie_phy_core *core;
-	struct resource *res;
 	struct phy_provider *provider;
 	unsigned int phy_idx = 0;
 
@@ -226,9 +225,7 @@ static int sr_pcie_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	core->dev = dev;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	core->base = devm_ioremap_resource(core->dev, res);
+	core->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
diff --git a/drivers/phy/broadcom/phy-bcm-sr-usb.c b/drivers/phy/broadcom/phy-bcm-sr-usb.c
index c3e99ad17487..0002da3b5b5d 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-usb.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-usb.c
@@ -300,14 +300,12 @@ static int bcm_usb_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node;
 	const struct of_device_id *of_id;
-	struct resource *res;
 	void __iomem *regs;
 	int ret;
 	enum bcm_usb_phy_version version;
 	struct phy_provider *phy_provider;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index 18251f232172..53942973f508 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -726,7 +726,6 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 	struct device_node *dn = dev->of_node, *child;
 	const struct of_device_id *of_id;
 	struct brcm_sata_phy *priv;
-	struct resource *res;
 	struct phy_provider *provider;
 	int ret, count = 0;
 
@@ -739,8 +738,7 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, priv);
 	priv->dev = dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
-	priv->phy_base = devm_ioremap_resource(dev, res);
+	priv->phy_base = devm_platform_ioremap_resource_byname(pdev, "phy");
 	if (IS_ERR(priv->phy_base))
 		return PTR_ERR(priv->phy_base);
 
@@ -751,9 +749,7 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 		priv->version = BRCM_SATA_PHY_STB_28NM;
 
 	if (priv->version == BRCM_SATA_PHY_IPROC_NS2) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "phy-ctrl");
-		priv->ctrl_base = devm_ioremap_resource(dev, res);
+		priv->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "phy-ctrl");
 		if (IS_ERR(priv->ctrl_base))
 			return PTR_ERR(priv->ctrl_base);
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
