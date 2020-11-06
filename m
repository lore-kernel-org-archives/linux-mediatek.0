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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238C6C388F2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:22:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9573B20936
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bZJiG58l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oSRPx34D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9573B20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0ijG5onfrMCukqBkL8lHEJEmrWXDeKY8t5kDknpx9FA=; b=bZJiG58lc+l8RaTUJhZVRchG6
	vhmwS1OsasepP+vmTvhGJdLuWXXolB9B79znLXyT7zEHne1PWqGgYChFSZNu9Id53DD5AUuni4kn0
	WZFivT3vbO/iobFCGYIPR/0Xh6cj8sLJcMQy1ChaF76HGn/YcWAoKaHYcE1Di0iIPQoWJh7tP+Nof
	b3W4+hQWYn3ytASQIkBHL8as200uolTYq6xEXbqeoTLRp+VSHDhLZqFgp4a7+Pjj5Dut9+lXeQP7K
	dG1toLdm5PO2Gm4V4ERMoYp6PBNjWQumZQGxSGcrbxrNxoytdFiplkT9dC+MFrazwhY91zdFHwqLG
	vaEhbJB+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kav8l-0004rH-9X; Fri, 06 Nov 2020 06:22:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kav6Z-0003FQ-25; Fri, 06 Nov 2020 06:20:20 +0000
X-UUID: 7bf841fa0545464cb9753682a31684e8-20201105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zhPGloZsKYH70pD64IqLi9e6Z3H0sSFRjHjf/LGQPMk=; 
 b=oSRPx34D8ISb7a67Oz464gT2tvl9dbcs5ej09Y0gzvpA8bq3bf7+YdLWsE7fD2e20Mo0cLkNCEupXgM1HDjTKNXmCKp9GZ18SYtT1R6tZc34UbXYX3i+t2ogyfyo3c9AGj+Vd1IDsHWZsrYa5iDYBdFVFRpiJiyptMQPXwzcUDk=;
X-UUID: 7bf841fa0545464cb9753682a31684e8-20201105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 280927242; Thu, 05 Nov 2020 22:19:50 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Nov 2020 22:10:28 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 14:10:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 Nov 2020 14:10:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 17/17] phy: ti: convert to
 devm_platform_ioremap_resource(_byname)
Date: Fri, 6 Nov 2020 14:08:50 +0800
Message-ID: <1604642930-29019-17-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D8457DDF41A86BD7A8A76CCFBE5E0E3DB9E888E7619A5D95075F3CC13754BA312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_012011_268241_9D317F8D 
X-CRM114-Status: GOOD (  13.54  )
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

Use devm_platform_ioremap_resource(_byname) to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/phy/ti/phy-omap-control.c | 17 ++++++-----------
 drivers/phy/ti/phy-omap-usb2.c    |  4 +---
 drivers/phy/ti/phy-ti-pipe3.c     | 15 ++++-----------
 3 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/ti/phy-omap-control.c b/drivers/phy/ti/phy-omap-control.c
index ccd0e4e00451..47482f106fab 100644
--- a/drivers/phy/ti/phy-omap-control.c
+++ b/drivers/phy/ti/phy-omap-control.c
@@ -268,7 +268,6 @@ MODULE_DEVICE_TABLE(of, omap_control_phy_id_table);
 
 static int omap_control_phy_probe(struct platform_device *pdev)
 {
-	struct resource	*res;
 	const struct of_device_id *of_id;
 	struct omap_control_phy *control_phy;
 
@@ -285,16 +284,13 @@ static int omap_control_phy_probe(struct platform_device *pdev)
 	control_phy->type = *(enum omap_control_phy_type *)of_id->data;
 
 	if (control_phy->type == OMAP_CTRL_TYPE_OTGHS) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-			"otghs_control");
-		control_phy->otghs_control = devm_ioremap_resource(
-			&pdev->dev, res);
+		control_phy->otghs_control =
+			devm_platform_ioremap_resource_byname(pdev, "otghs_control");
 		if (IS_ERR(control_phy->otghs_control))
 			return PTR_ERR(control_phy->otghs_control);
 	} else {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-				"power");
-		control_phy->power = devm_ioremap_resource(&pdev->dev, res);
+		control_phy->power =
+			devm_platform_ioremap_resource_byname(pdev, "power");
 		if (IS_ERR(control_phy->power)) {
 			dev_err(&pdev->dev, "Couldn't get power register\n");
 			return PTR_ERR(control_phy->power);
@@ -312,9 +308,8 @@ static int omap_control_phy_probe(struct platform_device *pdev)
 	}
 
 	if (control_phy->type == OMAP_CTRL_TYPE_PCIE) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "pcie_pcs");
-		control_phy->pcie_pcs = devm_ioremap_resource(&pdev->dev, res);
+		control_phy->pcie_pcs =
+			devm_platform_ioremap_resource_byname(pdev, "pcie_pcs");
 		if (IS_ERR(control_phy->pcie_pcs))
 			return PTR_ERR(control_phy->pcie_pcs);
 	}
diff --git a/drivers/phy/ti/phy-omap-usb2.c b/drivers/phy/ti/phy-omap-usb2.c
index 4fec90d2624f..ebceb1520ce8 100644
--- a/drivers/phy/ti/phy-omap-usb2.c
+++ b/drivers/phy/ti/phy-omap-usb2.c
@@ -366,7 +366,6 @@ static int omap_usb2_probe(struct platform_device *pdev)
 {
 	struct omap_usb	*phy;
 	struct phy *generic_phy;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 	struct usb_otg *otg;
 	struct device_node *node = pdev->dev.of_node;
@@ -403,8 +402,7 @@ static int omap_usb2_probe(struct platform_device *pdev)
 
 	omap_usb2_init_errata(phy);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	phy->phy_base = devm_ioremap_resource(&pdev->dev, res);
+	phy->phy_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->phy_base))
 		return PTR_ERR(phy->phy_base);
 
diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
index e9332c90f75f..2cbc91e535d4 100644
--- a/drivers/phy/ti/phy-ti-pipe3.c
+++ b/drivers/phy/ti/phy-ti-pipe3.c
@@ -745,35 +745,28 @@ static int ti_pipe3_get_sysctrl(struct ti_pipe3 *phy)
 
 static int ti_pipe3_get_tx_rx_base(struct ti_pipe3 *phy)
 {
-	struct resource *res;
 	struct device *dev = phy->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "phy_rx");
-	phy->phy_rx = devm_ioremap_resource(dev, res);
+	phy->phy_rx = devm_platform_ioremap_resource_byname(pdev, "phy_rx");
 	if (IS_ERR(phy->phy_rx))
 		return PTR_ERR(phy->phy_rx);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "phy_tx");
-	phy->phy_tx = devm_ioremap_resource(dev, res);
+	phy->phy_tx = devm_platform_ioremap_resource_byname(pdev, "phy_tx");
 
 	return PTR_ERR_OR_ZERO(phy->phy_tx);
 }
 
 static int ti_pipe3_get_pll_base(struct ti_pipe3 *phy)
 {
-	struct resource *res;
 	struct device *dev = phy->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 
 	if (phy->mode == PIPE3_MODE_PCIE)
 		return 0;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "pll_ctrl");
-	phy->pll_ctrl_base = devm_ioremap_resource(dev, res);
+	phy->pll_ctrl_base =
+		devm_platform_ioremap_resource_byname(pdev, "pll_ctrl");
 	return PTR_ERR_OR_ZERO(phy->pll_ctrl_base);
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
