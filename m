Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA0AC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:39:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F1922B3F
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ttRVljnq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nt/j0SsC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F1922B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5o7+odSV3mtVumi/G/WoqM+HeG6FBtFflDSzKv4bK4=; b=ttRVljnq8LaIPpK+SgkcDMy/Bf
	Kf1v0A5MGMKii1wkDwPh/M9/cdouCxRCoz0Mrz0cWVo8UUyl2B7astFDz2EzbcT2d/hYikcGCpBPA
	XttPii4WP4zZ88+WZH59XMOnNoBgDYJOI0X8D2j8XgQ/3bKNfIohesrdSDyRlorZJvt69dBq6zSpx
	B2KrLqOSePa2XkNUsp3vDo/ltFomQceY0YMTroHo1XbNui7pdaxaT8r6ohEnwRLwSPSnyw1Pz4oF9
	V8jkFNNwDf6qYWEHD4sAR1Bq01khbJs04GCfWcSHLhF4fkQg1Tv4enm1jwP+8PXxAOf9mRz7DwK6S
	1kfpGXfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVof-0004yi-Tm; Thu, 23 Jul 2020 07:38:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVo8-0004gA-9X; Thu, 23 Jul 2020 07:38:25 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D30B8206C1;
 Thu, 23 Jul 2020 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489903;
 bh=0PlnX2dyoEdPY2VCFqgAqjrHcIQdbtj0eBfEmrlOaoE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nt/j0SsCR2UawV+yqbto/KCMDEmbNz7H3Td9fI+GDJx4PZ7yU1wsZKj16RvcHzXZN
 X/yNOgcRlbEGCcnc0YEI1BLviFxETBMcHwBavEDPeu8Z3BZO9DBRRZCnQ1k6foX6o8
 6Kn9fPkia0gxOkCkkCjpkloz1n6D1blb0ULqJ4x0=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 05/23] memory: Enable compile testing for most of the drivers
Date: Thu, 23 Jul 2020 09:37:26 +0200
Message-Id: <20200723073744.13400-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033824_697919_EBCC31AD 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Most of the memory controller drivers do not depend on architecture
specific code so can be compile tested to increase build coverage.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/Kconfig | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index efcb4dfaccc2..2c0fe2d75b57 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -27,7 +27,8 @@ config ARM_PL172_MPMC
 config ATMEL_SDRAMC
 	bool "Atmel (Multi-port DDR-)SDRAM Controller"
 	default y
-	depends on ARCH_AT91 && OF
+	depends on ARCH_AT91 || COMPILE_TEST
+	depends on OF
 	help
 	  This driver is for Atmel SDRAM Controller or Atmel Multi-port
 	  DDR-SDRAM Controller available on Atmel AT91SAM9 and SAMA5 SoCs.
@@ -37,7 +38,8 @@ config ATMEL_SDRAMC
 config ATMEL_EBI
 	bool "Atmel EBI driver"
 	default y
-	depends on ARCH_AT91 && OF
+	depends on ARCH_AT91 || COMPILE_TEST
+	depends on OF
 	select MFD_SYSCON
 	select MFD_ATMEL_SMC
 	help
@@ -59,7 +61,8 @@ config BT1_L2_CTL
 
 config TI_AEMIF
 	tristate "Texas Instruments AEMIF driver"
-	depends on (ARCH_DAVINCI || ARCH_KEYSTONE) && OF
+	depends on ARCH_DAVINCI || ARCH_KEYSTONE || COMPILE_TEST
+	depends on OF
 	help
 	  This driver is for the AEMIF module available in Texas Instruments
 	  SoCs. AEMIF stands for Asynchronous External Memory Interface and
@@ -70,7 +73,7 @@ config TI_AEMIF
 
 config TI_EMIF
 	tristate "Texas Instruments EMIF driver"
-	depends on ARCH_OMAP2PLUS
+	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	select DDR
 	help
 	  This driver is for the EMIF module available in Texas Instruments
@@ -82,7 +85,7 @@ config TI_EMIF
 	  temperature changes
 
 config OMAP_GPMC
-	bool
+	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
 	select GPIOLIB
 	help
 	  This driver is for the General Purpose Memory Controller (GPMC)
@@ -106,7 +109,8 @@ config OMAP_GPMC_DEBUG
 
 config TI_EMIF_SRAM
 	tristate "Texas Instruments EMIF SRAM driver"
-	depends on (SOC_AM33XX || SOC_AM43XX) && SRAM
+	depends on SOC_AM33XX || SOC_AM43XX || (ARM && COMPILE_TEST)
+	depends on SRAM
 	help
 	  This driver is for the EMIF module available on Texas Instruments
 	  AM33XX and AM43XX SoCs and is required for PM. Certain parts of
@@ -117,7 +121,8 @@ config TI_EMIF_SRAM
 config MVEBU_DEVBUS
 	bool "Marvell EBU Device Bus Controller"
 	default y
-	depends on PLAT_ORION && OF
+	depends on PLAT_ORION || COMPILE_TEST
+	depends on OF
 	help
 	  This driver is for the Device Bus controller available in some
 	  Marvell EBU SoCs such as Discovery (mv78xx0), Orion (88f5xxx) and
@@ -126,7 +131,7 @@ config MVEBU_DEVBUS
 
 config FSL_CORENET_CF
 	tristate "Freescale CoreNet Error Reporting"
-	depends on FSL_SOC_BOOKE
+	depends on FSL_SOC_BOOKE || COMPILE_TEST
 	help
 	  Say Y for reporting of errors from the Freescale CoreNet
 	  Coherency Fabric.  Errors reported include accesses to
@@ -135,7 +140,7 @@ config FSL_CORENET_CF
 	  represents a coherency violation.
 
 config FSL_IFC
-	bool
+	bool "Freescale IFC driver" if COMPILE_TEST
 	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST
 	depends on HAS_IOMEM
 
@@ -150,7 +155,7 @@ config JZ4780_NEMC
 	  memory devices such as NAND and SRAM.
 
 config MTK_SMI
-	bool
+	bool "Mediatek SoC Memory Controller driver" if COMPILE_TEST
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
 	  This driver is for the Memory Controller module in MediaTek SoCs,
@@ -159,7 +164,7 @@ config MTK_SMI
 
 config DA8XX_DDRCTL
 	bool "Texas Instruments da8xx DDR2/mDDR driver"
-	depends on ARCH_DAVINCI_DA8XX
+	depends on ARCH_DAVINCI_DA8XX || COMPILE_TEST
 	help
 	  This driver is for the DDR2/mDDR Memory Controller present on
 	  Texas Instruments da8xx SoCs. It's used to tweak various memory
@@ -169,14 +174,14 @@ config PL353_SMC
 	tristate "ARM PL35X Static Memory Controller(SMC) driver"
 	default y
 	depends on ARM
-	depends on ARM_AMBA
+	depends on ARM_AMBA || COMPILE_TEST
 	help
 	  This driver is for the ARM PL351/PL353 Static Memory
 	  Controller(SMC) module.
 
 config RENESAS_RPCIF
 	tristate "Renesas RPC-IF driver"
-	depends on ARCH_RENESAS
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  This supports Renesas R-Car Gen3 RPC-IF which provides either SPI
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
