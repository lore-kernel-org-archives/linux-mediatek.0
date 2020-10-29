Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F50EC388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 02:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 786482076C
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 02:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OONdKA+j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f5C04r3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 786482076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xF0AzAyK3viuGuymeR+qyakqJs7rbYaMOJdv+TZHrm0=; b=OONdKA+j985CVZ5tqy249btpq
	Cx3zyQFnyRgg1gl+uMexQHXibJwg2hYLuCrEkTKmm/byiV1nkydpfT/3j9nzeI4FrRHPrh7vW4VAn
	khMk80LNTD2mpgThejLPVQF5FGnxmEf9fI5DBxvlQvZHMZYnsv0hpXtQ7BkNnqOggX0j7Rw+bYfTb
	YKGeovPAW8ignz7zssCLX2QeEiVtT0zZj/rIREPrzHOv9mJPCdZd3w1KuLE/RJ5ki1SPNYOz0rdWT
	ibRrbrXf9dFP72xkp4F6cSbgcFbB9XOFDiBflWurukJ07DddXKDXWHQopigkmFqAgXGzwNReqsvQa
	zhvex8uqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXy6F-0001g2-UK; Thu, 29 Oct 2020 02:55:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXy6B-0001ed-Oy; Thu, 29 Oct 2020 02:55:37 +0000
X-UUID: 22e1ca956f864afa81e11e56301e1992-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cEM1LWDBi2N7/5hyjwmoorAI0e6rVfo41SEmYG6o+0E=; 
 b=f5C04r3kVSAk52EiZN2jfVbGRNhd73ygw5Rgkejo7Kq4EmrllKJu1WyrP9qmAsSQ89JYaeO0kF0OGi6MfRckoElUpe4wFEtXjfZZqgUYWy0hRobpeqahQS8KISQ7ji1jLHM6Qabg5FWmfRnHCIhj1EJPua7l+aZ7uCUHtWdNaWg=;
X-UUID: 22e1ca956f864afa81e11e56301e1992-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1858679838; Wed, 28 Oct 2020 18:55:27 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 19:55:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:55:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 10:55:20 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 02/17] phy: amlogic: convert to devm_platform_ioremap_resource
Date: Thu, 29 Oct 2020 10:54:24 +0800
Message-ID: <1603940079-8131-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A5C93524AEAEF77FF4004B70ABFA4DD214476DFA35D26D8AC7DF7AAF039F51D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_225536_007488_C2418278 
X-CRM114-Status: GOOD (  12.58  )
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
 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c | 4 +---
 drivers/phy/amlogic/phy-meson-axg-pcie.c             | 4 +---
 drivers/phy/amlogic/phy-meson-g12a-usb2.c            | 4 +---
 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c       | 4 +---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c             | 4 +---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
index 1431cbf885e1..7d06cda329fb 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
@@ -126,7 +126,6 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 	struct phy_axg_mipi_pcie_analog_priv *priv;
 	struct device_node *np = dev->of_node;
 	struct regmap *map;
-	struct resource *res;
 	void __iomem *base;
 	int ret;
 
@@ -134,8 +133,7 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(dev, "failed to get regmap base\n");
 		return PTR_ERR(base);
diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 377ed0dcd0d9..58a7507a8422 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -129,7 +129,6 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_axg_pcie_priv *priv;
 	struct device_node *np = dev->of_node;
-	struct resource *res;
 	void __iomem *base;
 	int ret;
 
@@ -145,8 +144,7 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index b26e30e1afaf..9d1efa0d9394 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -292,7 +292,6 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
-	struct resource *res;
 	struct phy_meson_g12a_usb2_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
@@ -305,8 +304,7 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	platform_set_drvdata(pdev, priv);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 08e322789e59..ebe3d0ddd304 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -386,7 +386,6 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct phy_g12a_usb3_pcie_priv *priv;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 	void __iomem *base;
 	int ret;
@@ -395,8 +394,7 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 43ec9bf24abf..875afb2672c7 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -230,7 +230,6 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
-	struct resource *res;
 	struct phy_meson_gxl_usb2_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
@@ -242,8 +241,7 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
