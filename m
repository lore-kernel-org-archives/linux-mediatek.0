Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA98EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LmNSLpeZ0QjG6g9PNqY58DOX9RmzSaoQ1e9/PLbjqPE=; b=oitALPTxVKWF3y+vyX3oBQOefJ
	M5vtO6sn5i7VviEbWKLAH8CcrMFMLjLOjqgdbO4v/dUf6B6Kimfq/jrN5JD/ssB5M05SHWyebAsF5
	G3c7yR2c053qO2FaVeICvH7ydrivhywSotCA8zUP9PzgLYTpph91DNwKy16A5QEls9oTEaGmy09IZ
	ND4fCFqEeM7cCo3xnXfF0g+z/phBMMudvGAquXnn31mF4mL2Iqwqevt7fRg9nTX5cHTs4nWJVFVJ8
	WJx2/Dl4stIuI07UGxAT931cbK27U1qSLfKo4WPtUmTUMy+Mz/aK+osztAxlMMrPbunYpS9J4/kgp
	q5EuC8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzPM-0059Wu-33;
	Wed, 19 Jul 2023 05:07:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzPI-0059V4-2a;
	Wed, 19 Jul 2023 05:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LmNSLpeZ0QjG6g9PNqY58DOX9RmzSaoQ1e9/PLbjqPE=; b=jCCWVP5bhd5aPgW4skCCuFDlXA
	IZHFYS+UT6RRNL697134rtbILx9M9SxYMvVn7yLkGgyJPWvRtvqS2q8dZyBIQvVonLLKMb5DgMAJx
	TNa4dBS+X8/L2ES49llQXt3PE8DHHmyVsP9ZveZUCWu8Tm56nO8+OtUSkftyiOTHGi7/qwlSsYWPs
	GAO2sCgVS+3f0G9BPPAKo8OzMqV6CLFEeh27sXRDmIt2HMGVZv0Wmy2+EXhuWWX/pX/zM6pRWAgLG
	RylRsxaaMRB0ATLC++UjBTZnkcaC/Ewx6RrGs2YMw4m5YRF8buD8iA1LyJIIdF96Vjs88fjFV5fYU
	fc3C65DQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLljn-00BdbK-1T;
	Tue, 18 Jul 2023 14:31:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8A09615F5;
	Tue, 18 Jul 2023 14:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD910C433C9;
	Tue, 18 Jul 2023 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689690664;
	bh=HFuY1Cjqgujo0hwfrqnQglAT2HUw2FWQel+8316MUmk=;
	h=From:To:Cc:Subject:Date:From;
	b=c2AMHtG3EDEzhWpumzWjIXtZxVQHy8w8ayUmbYRQ0qKSH6FcauoW8JEL8hwoqi1tu
	 Kj6kwMY23MewN95GtN4Ld/mD34FwOvkZTlwcsFTcHD0AEtkSLEVnICivnenZbSBO9D
	 kRj/joyjG0/U2wvZum6qnC+sIvqBkN1pDy1jmS5RmOoljqCXMTuGTQgpjMnEoYO3sR
	 UlIfEf7kHw5z+npN+BKPgtEXxPB9FBeikeBRO+iwYq93g7cXbDIHRqHhlR8lfnRmpm
	 P6WvQYnK5iMfOkLB+6WER9X5GhxP+xfBCuG6ypcrtVNDuGsTFNLOmBn1ktBfp1CmHV
	 Azq5U9DkaihCA==
Received: (nullmailer pid 1065421 invoked by uid 1000);
	Tue, 18 Jul 2023 14:30:58 -0000
From: Rob Herring <robh@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Robert Richter <rric@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainel
 li <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, Eugen Hristev <eugen.hristev@collabora.com>, Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Vignesh Raghavendra <vigneshr@ti.com>, Ben Dooks <ben-linux@fluff.org>, Jaehoon Chung <jh80.chung@samsung.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] mmc: Explicitly include correct DT includes
Date: Tue, 18 Jul 2023 08:30:52 -0600
Message-Id: <20230718143054.1065288-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_153139_972205_D5B0D2A9 
X-CRM114-Status: GOOD (  15.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- Fix double include of of.h
---
 drivers/mmc/host/atmel-mci.c                  | 1 -
 drivers/mmc/host/cavium-octeon.c              | 2 ++
 drivers/mmc/host/cavium-thunderx.c            | 1 +
 drivers/mmc/host/davinci_mmc.c                | 1 -
 drivers/mmc/host/meson-gx-mmc.c               | 2 +-
 drivers/mmc/host/mtk-sd.c                     | 4 +---
 drivers/mmc/host/mxcmmc.c                     | 1 -
 drivers/mmc/host/mxs-mmc.c                    | 1 -
 drivers/mmc/host/owl-mmc.c                    | 3 ++-
 drivers/mmc/host/pxamci.c                     | 1 -
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 3 ++-
 drivers/mmc/host/sdhci-bcm-kona.c             | 1 -
 drivers/mmc/host/sdhci-cadence.c              | 2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c            | 2 +-
 drivers/mmc/host/sdhci-iproc.c                | 2 +-
 drivers/mmc/host/sdhci-msm.c                  | 2 +-
 drivers/mmc/host/sdhci-of-arasan.c            | 4 ++--
 drivers/mmc/host/sdhci-of-at91.c              | 2 +-
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 2 +-
 drivers/mmc/host/sdhci-of-sparx5.c            | 2 +-
 drivers/mmc/host/sdhci-omap.c                 | 1 -
 drivers/mmc/host/sdhci-pxav2.c                | 1 -
 drivers/mmc/host/sdhci-s3c.c                  | 1 -
 drivers/mmc/host/sdhci-sprd.c                 | 1 -
 drivers/mmc/host/sdhci-tegra.c                | 1 -
 drivers/mmc/host/sh_mmcif.c                   | 1 -
 drivers/mmc/host/uniphier-sd.c                | 1 -
 drivers/mmc/host/wmt-sdmmc.c                  | 1 -
 29 files changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index dd18440a90c5..2fdf352b3d86 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -18,7 +18,6 @@
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/scatterlist.h>
diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
index 12dca91a8ef6..02429f7afb42 100644
--- a/drivers/mmc/host/cavium-octeon.c
+++ b/drivers/mmc/host/cavium-octeon.c
@@ -13,7 +13,9 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <asm/octeon/octeon.h>
 #include "cavium.h"
 
diff --git a/drivers/mmc/host/cavium-thunderx.c b/drivers/mmc/host/cavium-thunderx.c
index 202b1d6da678..2e2ff984f0b3 100644
--- a/drivers/mmc/host/cavium-thunderx.c
+++ b/drivers/mmc/host/cavium-thunderx.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pci.h>
 #include "cavium.h"
 
diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index 7138dfa065bf..17a137f85cbe 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -21,7 +21,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/mmc/mmc.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/interrupt.h>
 
diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index ee9a25b900ae..0669993108ec 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -11,7 +11,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/iopoll.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/ioport.h>
 #include <linux/dma-mapping.h>
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 02403ff99e0d..6c68c642ef61 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -12,9 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 668f865f3efb..226a10202d25 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -31,7 +31,6 @@
 #include <linux/dmaengine.h>
 #include <linux/types.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/mmc/slot-gpio.h>
 
diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
index 8c3655d3be96..951c6c48b4f7 100644
--- a/drivers/mmc/host/mxs-mmc.c
+++ b/drivers/mmc/host/mxs-mmc.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
index 1bf22b08b373..62d2993573d0 100644
--- a/drivers/mmc/host/owl-mmc.c
+++ b/drivers/mmc/host/owl-mmc.c
@@ -16,8 +16,9 @@
 #include <linux/interrupt.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/slot-gpio.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 2a988f942b6c..d274e4433fc1 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -30,7 +30,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gfp.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/soc/pxa/cpu.h>
 
 #include <linux/sizes.h>
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 9ab813903b2c..4cc5bcb3213a 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -15,7 +15,8 @@
 #include <linux/mmc/host.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pagemap.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index b559ad38b667..452982e670d2 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -15,7 +15,8 @@
 #include <linux/mmc/host.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pagemap.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
diff --git a/drivers/mmc/host/sdhci-bcm-kona.c b/drivers/mmc/host/sdhci-bcm-kona.c
index 6a93a54fe067..ef1fb383e1e7 100644
--- a/drivers/mmc/host/sdhci-bcm-kona.c
+++ b/drivers/mmc/host/sdhci-bcm-kona.c
@@ -11,7 +11,6 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mmc/slot-gpio.h>
 
 #include "sdhci-pltfm.h"
diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-cadence.c
index d2f625054689..25d9849ef0d1 100644
--- a/drivers/mmc/host/sdhci-cadence.c
+++ b/drivers/mmc/host/sdhci-cadence.c
@@ -11,7 +11,7 @@
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 
 #include "sdhci-pltfm.h"
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index eebf94604a7f..e767fe058023 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -22,7 +22,7 @@
 #include <linux/mmc/sdio.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include "sdhci-cqhci.h"
diff --git a/drivers/mmc/host/sdhci-iproc.c b/drivers/mmc/host/sdhci-iproc.c
index 86eb0045515e..6a93b1ee0b30 100644
--- a/drivers/mmc/host/sdhci-iproc.c
+++ b/drivers/mmc/host/sdhci-iproc.c
@@ -10,7 +10,7 @@
 #include <linux/module.h>
 #include <linux/mmc/host.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include "sdhci-pltfm.h"
 
 struct sdhci_iproc_data {
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 1c935b5bafe1..c0ce187e740a 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/delay.h>
 #include <linux/mmc/mmc.h>
 #include <linux/pm_runtime.h>
@@ -15,6 +14,7 @@
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
 #include <linux/interconnect.h>
+#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
 
diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 294dd605fd2b..2f9de2518942 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -18,11 +18,11 @@
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-#include <linux/of.h>
 #include <linux/firmware/xlnx-zynqmp.h>
 
 #include "cqhci.h"
diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index cd0134580a90..808307a211f2 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -17,7 +17,7 @@
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index e68cd87998c8..55e1e2d0494d 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -14,7 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/sizes.h>
 
diff --git a/drivers/mmc/host/sdhci-of-sparx5.c b/drivers/mmc/host/sdhci-of-sparx5.c
index 28e4ee69e100..2e983cf49bc6 100644
--- a/drivers/mmc/host/sdhci-of-sparx5.c
+++ b/drivers/mmc/host/sdhci-of-sparx5.c
@@ -13,9 +13,9 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/of_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/dma-mapping.h>
+#include <linux/of.h>
 
 #include "sdhci-pltfm.h"
 
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 8ed9256b83da..2593e3fbd0d9 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -11,7 +11,6 @@
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/mmc/host/sdhci-pxav2.c b/drivers/mmc/host/sdhci-pxav2.c
index 91aca8f8d6ef..86b60b0447b3 100644
--- a/drivers/mmc/host/sdhci-pxav2.c
+++ b/drivers/mmc/host/sdhci-pxav2.c
@@ -19,7 +19,6 @@
 #include <linux/platform_data/pxa_sdhci.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mmc/sdio.h>
 #include <linux/mmc/mmc.h>
 #include <linux/pinctrl/consumer.h>
diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 504015e84308..6245fb4584fe 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -20,7 +20,6 @@
 #include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
index 7f4ee2e12735..a21d6524d7ca 100644
--- a/drivers/mmc/host/sdhci-sprd.c
+++ b/drivers/mmc/host/sdhci-sprd.c
@@ -11,7 +11,6 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index bff084f178c9..1e1eac953691 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -19,7 +19,6 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 5cf53348372a..838dab179724 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -46,7 +46,6 @@
 #include <linux/mmc/slot-gpio.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
 #include <linux/pagemap.h>
 #include <linux/platform_data/sh_mmcif.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 61acd69fac0e..c1400d616fff 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -13,7 +13,6 @@
 #include <linux/mmc/host.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
index 68525d900046..f860f363be56 100644
--- a/drivers/mmc/host/wmt-sdmmc.c
+++ b/drivers/mmc/host/wmt-sdmmc.c
@@ -21,7 +21,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_device.h>
 
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
-- 
2.40.1


