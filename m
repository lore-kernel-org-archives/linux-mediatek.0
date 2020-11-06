Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907ADC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:22:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194FC206F9
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UWe2g+rx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D9MPGBiY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194FC206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iMcCwrtaxmBdZbiR3LNE1a8iqC565y37tEs/GpxdRbA=; b=UWe2g+rxViXCcsLEOM987wSht
	OzecSaAyYUsWPJsstc3hDZHp1MHF8aUfgMk4Qje//FoCvVLs0cZ/j5T2zImGIa5/0vnjRwArmB69i
	9l0jzpidNlnC+wUbLor843zKN9q45lm5xQwI9ScW3hbSnuiNkLjO7pbrHshWyAPEe/iC/wCj1xjtp
	v+TRe0KppwAkzC4Nf7/HJ7LeQWlNdqjVvw9RLcwgaGfUsAjIuHqYjvZZRrzqGho7ce3S2lSGnK3e1
	kk72i6xQzj3TwWrglzRkUdAygZgAUgdDoRCMWkqnD6gIfOgGAZu2e/9zRzhkr3YHm2zLEzsS3SNnL
	T6e1y716g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kav85-0004Nr-RF; Fri, 06 Nov 2020 06:21:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kav6P-0003FQ-W7; Fri, 06 Nov 2020 06:20:08 +0000
X-UUID: aef1ace46ee2432d90c423a7f85a90b0-20201105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kcYJOQCUhpL0Je8ZLN8zpzjkwI1DXOb1DaBG4XizmFU=; 
 b=D9MPGBiY1gRZ3SiJsUY7pBdVn+dZy9K23wDRTAv7L9JSydb5ubNRHLRVCF0LXvYlbgoECKmYvr9XQ3mC5rHgCFn09QqA0kJxKwhbVQ7h2+xzN3ctQc2wpZW2AZ6YwwO1GIyY02+ygrNAfjBFcPmkVK9Q2QpbVdQo1/Nra9VxKnI=;
X-UUID: aef1ace46ee2432d90c423a7f85a90b0-20201105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1704202875; Thu, 05 Nov 2020 22:19:50 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Nov 2020 22:10:20 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 14:10:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 Nov 2020 14:10:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 14/17] phy: samsung: convert to
 devm_platform_ioremap_resource
Date: Fri, 6 Nov 2020 14:08:47 +0800
Message-ID: <1604642930-29019-14-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC796B7022F1A2B384200FD8F2280FDFCAF8AABA395D4A6FE9B23C12774B49BB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_012002_287879_BE77EAB8 
X-CRM114-Status: GOOD (  12.77  )
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
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
v2: add Reviewed-by Krzysztof
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
