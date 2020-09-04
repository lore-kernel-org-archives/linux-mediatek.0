Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E7AC2BB84
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 16:44:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39D8B20797
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 16:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jf/FNAkN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNhuRd9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39D8B20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SImiVgubYEu/hHcp74H0220gjrP7b7AJAP6yHF2a5U8=; b=Jf/FNAkN+Qs2hc/iUnvE8rrTMw
	r/h37P5JB1MBKTVlXWSim/six5nOELKPF0u+EtHEvLuiKUpGCkQi6YF/4+ZghsgtuYbiUhmjUwPsD
	/xqQGfc/8X6vR2alQ4/GbnBwzRwoVHtJgihFCEplcBFJYrqp4LesN3DuecY45EDoTP/fK6T7fN8Jo
	JdEqaDLCGF78FQcTzzed8w4wS7fldEdIwhBO2jPgi1UKWoA8RLYTvO3PccEo/f2pfmWEmT1CfYivW
	7+ZmqSaLYDmryMyUlNlEIv2i1ZBxwo5g5+n84lo93qPVio46QGd+Ue0ElgWSDCwKh21YRzOEkCEuX
	kpqXGtlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEof-0003LK-M3; Fri, 04 Sep 2020 16:43:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEoX-0003HR-1G; Fri, 04 Sep 2020 16:43:50 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 808062074D;
 Fri,  4 Sep 2020 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599237828;
 bh=M0F0NujsJbA6VRAoiFk6VohTncRpdlqvI+V+EXO6eTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YNhuRd9bPGkZy4dXcqM4wKBiNUbzE9fZg+ZWuG0rftUJ+tr0tNSNpYkBZTA38LTUr
 C2BCBXN88B/3wM5OaP8T8RT99NAHiaGDVfp8omRAWmcls7cWRlAVAhuHexZ1jV1ODZ
 D3tvHvz+KgvITSlGuGrAtkaCNFw9z57g2bkJBSCk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Prabu Thangamuthu <prabu.t@synopsys.com>,
 Manjunath M B <manjumb@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@axis.com
Subject: [PATCH v2 2/2] mmc: host: Enable compile testing of multiple drivers
Date: Fri,  4 Sep 2020 18:43:15 +0200
Message-Id: <20200904164315.24618-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904164315.24618-1-krzk@kernel.org>
References: <20200904164315.24618-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_124349_249500_282A72AA 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Multiple MMC host controller driver can be compile tested as they do not
depend on architecture specific headers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Add COMMON_CLK dependency to MESON_GX to fix errors like:
   ERROR: modpost: "devm_clk_register" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
---
 drivers/mmc/host/Kconfig | 41 +++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index eea01fde0591..93db789cf8ec 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -178,7 +178,7 @@ config MMC_SDHCI_OF_AT91
 config MMC_SDHCI_OF_ESDHC
 	tristate "SDHCI OF support for the Freescale eSDHC controller"
 	depends on MMC_SDHCI_PLTFM
-	depends on PPC || ARCH_MXC || ARCH_LAYERSCAPE
+	depends on PPC || ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
 	select MMC_SDHCI_IO_ACCESSORS
 	select FSL_GUTS
 	help
@@ -216,7 +216,7 @@ config MMC_SDHCI_OF_DWCMSHC
 config MMC_SDHCI_OF_SPARX5
 	tristate "SDHCI OF support for the MCHP Sparx5 SoC"
 	depends on MMC_SDHCI_PLTFM
-	depends on ARCH_SPARX5
+	depends on ARCH_SPARX5 || COMPILE_TEST
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
 	  found in the MCHP Sparx5 SoC.
@@ -238,7 +238,7 @@ config MMC_SDHCI_CADENCE
 
 config MMC_SDHCI_CNS3XXX
 	tristate "SDHCI support on the Cavium Networks CNS3xxx SoC"
-	depends on ARCH_CNS3XXX
+	depends on ARCH_CNS3XXX || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	help
 	  This selects the SDHCI support for CNS3xxx System-on-Chip devices.
@@ -262,7 +262,7 @@ config MMC_SDHCI_ESDHC_MCF
 
 config MMC_SDHCI_ESDHC_IMX
 	tristate "SDHCI support for the Freescale eSDHC/uSDHC i.MX controller"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_CQHCI
@@ -276,7 +276,7 @@ config MMC_SDHCI_ESDHC_IMX
 
 config MMC_SDHCI_DOVE
 	tristate "SDHCI support on Marvell's Dove SoC"
-	depends on ARCH_DOVE || MACH_DOVE
+	depends on ARCH_DOVE || MACH_DOVE || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	select MMC_SDHCI_IO_ACCESSORS
 	help
@@ -289,7 +289,7 @@ config MMC_SDHCI_DOVE
 
 config MMC_SDHCI_TEGRA
 	tristate "SDHCI platform support for the Tegra SD/MMC Controller"
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_CQHCI
@@ -301,7 +301,8 @@ config MMC_SDHCI_TEGRA
 
 config MMC_SDHCI_S3C
 	tristate "SDHCI support on Samsung S3C SoC"
-	depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS)
+	depends on MMC_SDHCI
+	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
 	  often referrered to as the HSMMC block in some of the Samsung S3C
@@ -313,7 +314,7 @@ config MMC_SDHCI_S3C
 
 config MMC_SDHCI_SIRF
 	tristate "SDHCI support on CSR SiRFprimaII and SiRFmarco SoCs"
-	depends on ARCH_SIRF
+	depends on ARCH_SIRF || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	select MMC_SDHCI_IO_ACCESSORS
 	help
@@ -351,7 +352,8 @@ config MMC_SDHCI_PXAV2
 
 config MMC_SDHCI_SPEAR
 	tristate "SDHCI support on ST SPEAr platform"
-	depends on MMC_SDHCI && PLAT_SPEAR
+	depends on MMC_SDHCI
+	depends on PLAT_SPEAR || COMPILE_TEST
 	depends on OF
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
@@ -374,7 +376,7 @@ config MMC_SDHCI_S3C_DMA
 
 config MMC_SDHCI_BCM_KONA
 	tristate "SDHCI support on Broadcom KONA platform"
-	depends on ARCH_BCM_MOBILE
+	depends on ARCH_BCM_MOBILE || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	help
 	  This selects the Broadcom Kona Secure Digital Host Controller
@@ -422,7 +424,8 @@ config MMC_SDHCI_IPROC
 
 config MMC_MESON_GX
 	tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
-	depends on ARCH_MESON
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on COMMON_CLK
 	help
 	  This selects support for the Amlogic SD/MMC Host Controller
 	  found on the S905/GX*/AXG family of SoCs.  This controller is
@@ -458,7 +461,7 @@ config MMC_MESON_MX_SDIO
 
 config MMC_MOXART
 	tristate "MOXART SD/MMC Host Controller support"
-	depends on ARCH_MOXART
+	depends on ARCH_MOXART || COMPILE_TEST
 	help
 	  This selects support for the MOXART SD/MMC Host Controller.
 	  MOXA provides one multi-functional card reader which can
@@ -467,7 +470,7 @@ config MMC_MOXART
 
 config MMC_SDHCI_ST
 	tristate "SDHCI support on STMicroelectronics SoC"
-	depends on ARCH_STI || FSP2
+	depends on ARCH_STI || FSP2 || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	select MMC_SDHCI_IO_ACCESSORS
 	help
@@ -587,7 +590,7 @@ config MMC_TIFM_SD
 
 config MMC_MVSDIO
 	tristate "Marvell MMC/SD/SDIO host driver"
-	depends on PLAT_ORION
+	depends on PLAT_ORION || (COMPILE_TEST && ARM)
 	depends on OF
 	help
 	  This selects the Marvell SDIO host driver.
@@ -599,7 +602,7 @@ config MMC_MVSDIO
 
 config MMC_DAVINCI
 	tristate "TI DAVINCI Multimedia Card Interface support"
-	depends on ARCH_DAVINCI
+	depends on ARCH_DAVINCI || COMPILE_TEST
 	help
 	  This selects the TI DAVINCI Multimedia card Interface.
 	  If you have an DAVINCI board with a Multimedia Card slot,
@@ -628,7 +631,7 @@ config MMC_SPI
 
 config MMC_S3C
 	tristate "Samsung S3C SD/MMC Card Interface support"
-	depends on ARCH_S3C24XX
+	depends on ARCH_S3C24XX || COMPILE_TEST
 	depends on S3C24XX_DMAC
 	help
 	  This selects a driver for the MCI interface found in
@@ -681,7 +684,7 @@ config MMC_SDRICOH_CS
 
 config MMC_SDHCI_SPRD
 	tristate "Spreadtrum SDIO host Controller"
-	depends on ARCH_SPRD
+	depends on ARCH_SPRD || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_HSQ
@@ -698,7 +701,7 @@ config MMC_TMIO_CORE
 
 config MMC_TMIO
 	tristate "Toshiba Mobile IO Controller (TMIO) MMC/SD function support"
-	depends on MFD_TMIO || MFD_ASIC3
+	depends on MFD_TMIO || MFD_ASIC3 || COMPILE_TEST
 	select MMC_TMIO_CORE
 	help
 	  This provides support for the SD/MMC cell found in TC6393XB,
@@ -971,7 +974,7 @@ config MMC_REALTEK_USB
 
 config MMC_SUNXI
 	tristate "Allwinner sunxi SD/MMC Host Controller support"
-	depends on ARCH_SUNXI
+	depends on ARCH_SUNXI || COMPILE_TEST
 	help
 	  This selects support for the SD/MMC Host Controller on
 	  Allwinner sunxi SoCs.
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
