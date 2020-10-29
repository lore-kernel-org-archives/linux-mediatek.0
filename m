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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE92C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 03:06:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A920D20780
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 03:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="elSh34Os";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sJ7A/yin"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A920D20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n09SHM2OUOiA7jylVw0x3qQn3vF+0zvnq+ugsYNd4AY=; b=elSh34OsuTGlhX99aQ2A5LLpp
	7t2lwpCjXAT4KQ1jIe3KEZpJghASU6WZ9pxnGLIYlX4zqcBlBBG6E+y8Zs9BV3AEH6mZeX1f0vLvE
	HcgXqAAolRrkl2h6MhGxGh3iGF6ysS1yY25tZYHGpqjzrtmtiqF5QnUDzFpFYNZPnN/6ZfwwIVvin
	/wBwezeKGDoHre9Zo7/kiszgO/HqYd7S6qw/WVs75nt6vosEV6mrQIv3HQlBNOZRWQyGzH2ueqnOX
	ccyhHRSEdAdv89NrlToOicFTs4/F3Lx4Qp/hll+fcy+bdFRmM/fx+IJi8eBLxIhBJJt1fvIAYtFxV
	5nxYpj49A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXyGy-0005fh-OK; Thu, 29 Oct 2020 03:06:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXyGl-0005aC-BT; Thu, 29 Oct 2020 03:06:34 +0000
X-UUID: 437cf386bdc84b87a4301c897becca75-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VI1lLSM2L5tfGc8w+CZ2fxMh0tMCoyW/ltMd10m6b3s=; 
 b=sJ7A/yinPmPgyd78oGLa2LurCYrmyx6T4WXNxE5d40k1b53TaQOlOw+Ri3sihQPzR1LLBw1cTLtXWMyryHjqyukz2dhGt9/M0CL0jk85EB8hdDv53f32IOPKtJMKUu5SD0b0OqkC0oyLK91M6RnLjHi2d//kXFWvnYAu4LPzXH0=;
X-UUID: 437cf386bdc84b87a4301c897becca75-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 283058860; Wed, 28 Oct 2020 19:06:25 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 19:56:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:56:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 10:56:21 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 14/17] phy: samsung: convert to devm_platform_ioremap_resource
Date: Thu, 29 Oct 2020 10:54:36 +0800
Message-ID: <1603940079-8131-14-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1ED7C3E6902A63E6C52A97CF181246FB80AEBC859282DDD95AF4A7038F4DB2A42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_230631_583009_A4D11880 
X-CRM114-Status: GOOD (  12.66  )
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
 drivers/phy/samsung/phy-exynos-pcie.c     | 7 ++-----
 drivers/phy/samsung/phy-exynos5-usbdrd.c  | 4 +---
 drivers/phy/samsung/phy-exynos5250-sata.c | 5 +----
 drivers/phy/samsung/phy-samsung-usb2.c    | 4 +---
 4 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 7e28b1aea0d1..c98fff5c1ac8 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -232,7 +232,6 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
 	struct exynos_pcie_phy *exynos_phy;
 	struct phy *generic_phy;
 	struct phy_provider *phy_provider;
-	struct resource *res;
 	const struct exynos_pcie_phy_data *drv_data;
 
 	drv_data = of_device_get_match_data(dev);
@@ -243,13 +242,11 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
 	if (!exynos_phy)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	exynos_phy->phy_base = devm_ioremap_resource(dev, res);
+	exynos_phy->phy_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(exynos_phy->phy_base))
 		return PTR_ERR(exynos_phy->phy_base);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	exynos_phy->blk_base = devm_ioremap_resource(dev, res);
+	exynos_phy->blk_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(exynos_phy->blk_base))
 		return PTR_ERR(exynos_phy->blk_base);
 
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index cfa9b8b7e5ac..ee0848fe8432 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -829,7 +829,6 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct exynos5_usbdrd_phy *phy_drd;
 	struct phy_provider *phy_provider;
-	struct resource *res;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
 	struct regmap *reg_pmu;
 	u32 pmu_offset;
@@ -843,8 +842,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, phy_drd);
 	phy_drd->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	phy_drd->reg_phy = devm_ioremap_resource(dev, res);
+	phy_drd->reg_phy = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy_drd->reg_phy))
 		return PTR_ERR(phy_drd->reg_phy);
 
diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
index 4dd7324d91b2..9ec234243f7c 100644
--- a/drivers/phy/samsung/phy-exynos5250-sata.c
+++ b/drivers/phy/samsung/phy-exynos5250-sata.c
@@ -162,7 +162,6 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 {
 	struct exynos_sata_phy *sata_phy;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 	struct device_node *node;
 	int ret = 0;
@@ -171,9 +170,7 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 	if (!sata_phy)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	sata_phy->regs = devm_ioremap_resource(dev, res);
+	sata_phy->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sata_phy->regs))
 		return PTR_ERR(sata_phy->regs);
 
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index a3ed3ff04690..f79f605cff79 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -143,7 +143,6 @@ static int samsung_usb2_phy_probe(struct platform_device *pdev)
 	const struct samsung_usb2_phy_config *cfg;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
-	struct resource *mem;
 	struct samsung_usb2_phy_driver *drv;
 	int i, ret;
 
@@ -167,8 +166,7 @@ static int samsung_usb2_phy_probe(struct platform_device *pdev)
 	drv->cfg = cfg;
 	drv->dev = dev;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	drv->reg_phy = devm_ioremap_resource(dev, mem);
+	drv->reg_phy = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drv->reg_phy)) {
 		dev_err(dev, "Failed to map register memory (phy)\n");
 		return PTR_ERR(drv->reg_phy);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
