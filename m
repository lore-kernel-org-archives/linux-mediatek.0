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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4EAC5517A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 02:59:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBC02076D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 02:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A0dmb3NH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b5+d8Icx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBC02076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DeUB4/V5HprvFwUfR7dyR+G0tJOFq3bpT9oeAc2Q1Iw=; b=A0dmb3NHzhSTtfNA/7l6Xo5fY
	W01xmtf1tys6gSOK7Tok/Kbo6meNx/eWbWaZMzHr6DFmQc0OvJ9LalQBOrlYitLz+KWFCnIm2YMVU
	X2fwVNUUSLfewDGgT8AUJlxYmtqdxuTMQrMSQjLe8j80wb7RZeZQ1Q8g5ym90UgvB41RzZQgkLD+r
	nGI+jqDIiVOvmVuDbXZxdIL8nBO6HPDKbiEnkPiov/kcjM0AvpkkrZJnnDPE6vznf7u4/dlAEGcV0
	Xko+lz6ps3/BSuNZY4voE+OTVNZfUxdp3yMqMnF+dH46ygR0gAYSWNkyLjDjNqzzJMgRLQFUwpWDP
	2F96dHH4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXy9z-0002YP-8G; Thu, 29 Oct 2020 02:59:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXy9a-0002Oi-VZ; Thu, 29 Oct 2020 02:59:10 +0000
X-UUID: 2610910b0e5a465d8d6cc7c6e7f37682-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cHeIffwYgoDL9k0IVTYPfJACHq3OQ4CLAGOcBV2j3Ww=; 
 b=b5+d8IcxQtdclNqVBDA9UMbnOA9zNUvLt04I25ayag5G9f5TC4q9Q80QjitukD2OCTq+uFcteXYad6tmEonCGc/KWPK79rlh6Rzh9RvaWaN+n6UP9l0OcneXxvpbYnKJXnL6KqBnbRl25zixcAG+i8hqRyB2cTK9oFt+7zUUkSY=;
X-UUID: 2610910b0e5a465d8d6cc7c6e7f37682-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1264483752; Wed, 28 Oct 2020 18:59:04 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 19:55:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:55:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 10:55:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 10/17] phy: qualcomm: convert to
 devm_platform_ioremap_resource(_byname)
Date: Thu, 29 Oct 2020 10:54:32 +0800
Message-ID: <1603940079-8131-10-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D8BEFCF41A209E0C077E004FA21DEAFF2405D905F2FA4FE82B00C69EEBF695CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_225907_166397_2E66AB92 
X-CRM114-Status: GOOD (  12.73  )
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
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 4 +---
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c  | 4 +---
 drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c | 4 +---
 drivers/phy/qualcomm/phy-qcom-pcie2.c        | 5 +----
 drivers/phy/qualcomm/phy-qcom-qusb2.c        | 4 +---
 5 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index ce91ae7f8dbd..d437a249cd73 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -201,7 +201,6 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
 {
 	struct qcom_apq8064_sata_phy *phy;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
 	int ret;
@@ -210,8 +209,7 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	phy->mmio = devm_ioremap_resource(dev, res);
+	phy->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->mmio))
 		return PTR_ERR(phy->mmio);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
index fc7f9df80a7b..d3e7d5e1d1b6 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
@@ -95,7 +95,6 @@ MODULE_DEVICE_TABLE(of, ipq4019_usb_phy_of_match);
 static int ipq4019_usb_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 	struct ipq4019_usb_phy *phy;
 
@@ -104,8 +103,7 @@ static int ipq4019_usb_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	phy->dev = &pdev->dev;
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	phy->base = devm_ioremap_resource(&pdev->dev, res);
+	phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->base)) {
 		dev_err(dev, "failed to remap register memory\n");
 		return PTR_ERR(phy->base);
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
index 41a69f56b346..0fc2a1ed39b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
@@ -128,7 +128,6 @@ static int qcom_ipq806x_sata_phy_probe(struct platform_device *pdev)
 {
 	struct qcom_ipq806x_sata_phy *phy;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
 	int ret;
@@ -137,8 +136,7 @@ static int qcom_ipq806x_sata_phy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	phy->mmio = devm_ioremap_resource(dev, res);
+	phy->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->mmio))
 		return PTR_ERR(phy->mmio);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-pcie2.c b/drivers/phy/qualcomm/phy-qcom-pcie2.c
index 9dba3594e6d9..5407e59bb185 100644
--- a/drivers/phy/qualcomm/phy-qcom-pcie2.c
+++ b/drivers/phy/qualcomm/phy-qcom-pcie2.c
@@ -250,7 +250,6 @@ static int qcom_pcie2_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct qcom_phy *qphy;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct phy *phy;
 	int ret;
@@ -260,9 +259,7 @@ static int qcom_pcie2_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qphy->dev = dev;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qphy->base = devm_ioremap_resource(dev, res);
+	qphy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qphy->base))
 		return PTR_ERR(qphy->base);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 557547dabfd5..109792203baf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -844,7 +844,6 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 	struct qusb2_phy *qphy;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
-	struct resource *res;
 	int ret, i;
 	int num;
 	u32 value;
@@ -855,8 +854,7 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	or = &qphy->overrides;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qphy->base = devm_ioremap_resource(dev, res);
+	qphy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qphy->base))
 		return PTR_ERR(qphy->base);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
