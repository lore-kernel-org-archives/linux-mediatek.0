Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC3CC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 17:25:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1908206DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 17:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W3+8djCk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/iW3Rcz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1908206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EuiIxKEIypvdNnHh1DjBK4X9kUzs89tT6IYzlFIgiag=; b=W3+8djCkFJyx+x6EBK7BAaDnt0
	hE0uxXhW/1SbhaV5+e2QuqUqIM00Rhy9EeJGQbgq3S70aRS9Lkl4AQa9hF4qbL58BMRLfDQava+8x
	+qsOjBzkQZ0tk6FCBfTw+Ntkcrsv8AoVpItk7sZ+caZ7MvjBnftfn596mVry3O+ANEL7vRJb6XAy1
	SHIwGa+MjJicnX6xWwOOC8XptHPyLnV4kDQwA8nu5RDjzD7DtJBhyxG5WiQMPlXElAr7daCt2B6fT
	HcjwTBJKGYZKQJUC3CUuWpvP0ayDFV3NKxSpmzpltmoCqvRWwX4d68cj9rw4MMtkV+a/OkJo5hhOX
	WL0j1ijQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilynN-0001zX-45; Mon, 30 Dec 2019 17:25:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilymo-0000L6-Ip; Mon, 30 Dec 2019 17:25:00 +0000
Received: from localhost.localdomain (unknown [194.230.155.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BFF520730;
 Mon, 30 Dec 2019 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577726698;
 bh=xProeiYu5vgPcHmICU4n7eaHiDoR3FPz703liMheMto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M/iW3Rcz/4DoY3fZmnSbrQkVyMj4c6mIzOHR1F6sj7ISyJa57elsEm4m3F+caG5X2
 CCcx6H4fWRiAsUkiFm4GBjTiFXZDyPAwFwjM2FbviltfSK9ys1dFWtCdoWBx75AGXo
 CECjIh+MP5aYHYK+bEdSUoMO9r9ve651NzGX4XkY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] phy: Enable compile testing for some of drivers
Date: Mon, 30 Dec 2019 18:24:49 +0100
Message-Id: <20191230172449.17648-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230172449.17648-1-krzk@kernel.org>
References: <20191230172449.17648-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_092458_655324_1E5446D0 
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some of the phy drivers can be compile tested to increase build
coverage.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/phy/allwinner/Kconfig | 3 ++-
 drivers/phy/marvell/Kconfig   | 8 +++++---
 drivers/phy/mediatek/Kconfig  | 9 ++++++---
 drivers/phy/samsung/Kconfig   | 8 ++++----
 drivers/phy/ti/Kconfig        | 4 ++--
 5 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfig
index 3dab79e9d52b..e760d89d3976 100644
--- a/drivers/phy/allwinner/Kconfig
+++ b/drivers/phy/allwinner/Kconfig
@@ -48,7 +48,8 @@ config PHY_SUN9I_USB
 
 config PHY_SUN50I_USB3
 	tristate "Allwinner H6 SoC USB3 PHY driver"
-	depends on ARCH_SUNXI && HAS_IOMEM && OF
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on HAS_IOMEM && OF
 	depends on RESET_CONTROLLER
 	select GENERIC_PHY
 	help
diff --git a/drivers/phy/marvell/Kconfig b/drivers/phy/marvell/Kconfig
index 005e02dd4a91..8f6273c837ec 100644
--- a/drivers/phy/marvell/Kconfig
+++ b/drivers/phy/marvell/Kconfig
@@ -10,14 +10,16 @@ config ARMADA375_USBCLUSTER_PHY
 
 config PHY_BERLIN_SATA
 	tristate "Marvell Berlin SATA PHY driver"
-	depends on ARCH_BERLIN && HAS_IOMEM && OF
+	depends on ARCH_BERLIN || COMPILE_TEST
+	depends on OF && HAS_IOMEM
 	select GENERIC_PHY
 	help
 	  Enable this to support the SATA PHY on Marvell Berlin SoCs.
 
 config PHY_BERLIN_USB
 	tristate "Marvell Berlin USB PHY Driver"
-	depends on ARCH_BERLIN && RESET_CONTROLLER && HAS_IOMEM && OF
+	depends on ARCH_BERLIN || COMPILE_TEST
+	depends on OF && HAS_IOMEM && RESET_CONTROLLER
 	select GENERIC_PHY
 	help
 	  Enable this to support the USB PHY on Marvell Berlin SoCs.
@@ -95,7 +97,7 @@ config PHY_PXA_28NM_USB2
 
 config PHY_PXA_USB
 	tristate "Marvell PXA USB PHY Driver"
-	depends on ARCH_PXA || ARCH_MMP
+	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
 	select GENERIC_PHY
 	help
 	  Enable this to support Marvell PXA USB PHY driver for Marvell
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 7d19134c6b7c..dee757c957f2 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -4,7 +4,8 @@
 #
 config PHY_MTK_TPHY
 	tristate "MediaTek T-PHY Driver"
-	depends on ARCH_MEDIATEK && OF
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
 	select GENERIC_PHY
 	help
 	  Say 'Y' here to add support for MediaTek T-PHY driver,
@@ -16,7 +17,8 @@ config PHY_MTK_TPHY
 
 config PHY_MTK_UFS
 	tristate "MediaTek UFS M-PHY driver"
-	depends on ARCH_MEDIATEK && OF
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
 	select GENERIC_PHY
 	help
 	  Support for UFS M-PHY on MediaTek chipsets.
@@ -26,7 +28,8 @@ config PHY_MTK_UFS
 
 config PHY_MTK_XSPHY
 	tristate "MediaTek XS-PHY Driver"
-	depends on ARCH_MEDIATEK && OF
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
 	select GENERIC_PHY
 	help
 	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index 290a6c70f570..349fcb23e5f3 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -32,7 +32,7 @@ config PHY_EXYNOS_PCIE
 config PHY_SAMSUNG_USB2
 	tristate "Samsung USB 2.0 PHY driver"
 	depends on HAS_IOMEM
-	depends on USB_EHCI_EXYNOS || USB_OHCI_EXYNOS || USB_DWC2
+	depends on USB_EHCI_EXYNOS || USB_OHCI_EXYNOS || USB_DWC2 || COMPILE_TEST
 	select GENERIC_PHY
 	select MFD_SYSCON
 	default ARCH_EXYNOS
@@ -60,7 +60,7 @@ config PHY_EXYNOS5250_USB2
 config PHY_S5PV210_USB2
 	bool "Support for S5PV210"
 	depends on PHY_SAMSUNG_USB2
-	depends on ARCH_S5PV210
+	depends on ARCH_S5PV210 || COMPILE_TEST
 	help
 	  Enable USB PHY support for S5PV210. This option requires that Samsung
 	  USB 2.0 PHY driver is enabled and means that support for this
@@ -69,7 +69,7 @@ config PHY_S5PV210_USB2
 
 config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
-	depends on ARCH_EXYNOS && OF
+	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on USB_DWC3_EXYNOS
 	select GENERIC_PHY
@@ -82,7 +82,7 @@ config PHY_EXYNOS5_USBDRD
 
 config PHY_EXYNOS5250_SATA
 	tristate "Exynos5250 Sata SerDes/PHY driver"
-	depends on SOC_EXYNOS5250
+	depends on SOC_EXYNOS5250 || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
 	select GENERIC_PHY
diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
index 174888609779..e231c0e369c5 100644
--- a/drivers/phy/ti/Kconfig
+++ b/drivers/phy/ti/Kconfig
@@ -4,7 +4,7 @@
 #
 config PHY_DA8XX_USB
 	tristate "TI DA8xx USB PHY Driver"
-	depends on ARCH_DAVINCI_DA8XX
+	depends on ARCH_DAVINCI_DA8XX || COMPILE_TEST
 	select GENERIC_PHY
 	select MFD_SYSCON
 	help
@@ -14,7 +14,7 @@ config PHY_DA8XX_USB
 
 config PHY_DM816X_USB
 	tristate "TI dm816x USB PHY driver"
-	depends on ARCH_OMAP2PLUS
+	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	depends on USB_SUPPORT
 	select GENERIC_PHY
 	select USB_PHY
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
