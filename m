Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F96EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lIJPdGkN8uLn9mONHPYVKKU3qJXRSOU2BNXEaUK7xdI=; b=JYD9DtVxkZgK3RuzDdW2QONoVu
	5mRPNaB3PwA9K6YYMYf8Zrh7d6tCIh7toDyRWXJ1D2gYxc/nbVJvd3mYvnl5yO6hvmcW/KEp9jYdK
	zwP8s96vzYpP029bid8Ru92IgE6AYgGeBgzN6ZREkDiJ/W0pQQdm7zLAuSneb4xfl3D313KiMGLs2
	vy4K2OiS/bcctQGUDTByP2KBcEkIK2EQ/OEZPT0RiijComjFytjZoRlOvMhCaLRIsXy9LcdNXuWYu
	036udn9ryH1IoWBSHO9ZzQBaiDC2A7CnMQCi5J7cFI1rbjIi719MiwRNM0bCj8WCdSTxfgUnUd7AJ
	XHCfyMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMwH-006qxU-0q;
	Fri, 14 Jul 2023 17:50:45 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMw5-006qmb-0u;
	Fri, 14 Jul 2023 17:50:38 +0000
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-34611de0ee4so9358945ab.0;
        Fri, 14 Jul 2023 10:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357030; x=1691949030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIJPdGkN8uLn9mONHPYVKKU3qJXRSOU2BNXEaUK7xdI=;
        b=kPTQ1SLT2El03LlFOY3oLxqjzmTggN322XDo/1uEopO1LJzdmNVPJ+cnOpa4vYLEVq
         T6UHskCpbDrF1rOGncC8RkHtLVeHByr/Au5/xGEFE3/ok/J1fhtYsrOusSr1S8jBpQBR
         6kLiDUWSG5XX+5dxEgIJTqF0oqlb3urfwM7x/s/CnhuLlXBBaMtfzHNCEzBdZRu6u3Ud
         WT3oNnkxkCik28SkLVZ4hJoY7359LCN5LsCyRokXuoJqJa6nTp5veU8SXj2PnAuUplhE
         aRCbl/0xgL9+DT57siKgGpejs1ByOk1XsHFVKAwDcwioXWzNGgs5cThzYbKkHyBJDcky
         OHEQ==
X-Gm-Message-State: ABy/qLbBU6DYmQge/giOHqM6egcxKM84TvdAEWVhGPAKDK+znSG2+0wC
	FG3q1HjAh9uNk3IAzkg4fg==
X-Google-Smtp-Source: APBJJlF5AyU+U7hHqgWVqLEm81f6v5Dto0Z6wXBlIVFoH22Ciigj5qFW2mT+yzr1/iyAvgE53/OLLQ==
X-Received: by 2002:a92:da4f:0:b0:345:cea0:a676 with SMTP id p15-20020a92da4f000000b00345cea0a676mr5038625ilq.10.1689357030329;
        Fri, 14 Jul 2023 10:50:30 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id u10-20020a92d1ca000000b00345ad48aa94sm2910179ilg.58.2023.07.14.10.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:50:29 -0700 (PDT)
Received: (nullmailer pid 4064368 invoked by uid 1000);
	Fri, 14 Jul 2023 17:50:00 -0000
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>, Radu Pirea <radu_nicolae.pirea@upb.ro>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Han Xu <han.xu@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: [PATCH] spi: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:49:52 -0600
Message-Id: <20230714174955.4064174-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_105033_429089_A4D715FD 
X-CRM114-Status: GOOD (  13.48  )
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
 drivers/spi/spi-ar934x.c          | 3 ++-
 drivers/spi/spi-armada-3700.c     | 3 +--
 drivers/spi/spi-at91-usart.c      | 1 -
 drivers/spi/spi-bcm2835.c         | 2 +-
 drivers/spi/spi-bcm2835aux.c      | 4 +---
 drivers/spi/spi-cadence-quadspi.c | 1 -
 drivers/spi/spi-cadence-xspi.c    | 1 -
 drivers/spi/spi-davinci.c         | 1 -
 drivers/spi/spi-fsl-dspi.c        | 3 ++-
 drivers/spi/spi-fsl-lib.c         | 3 ++-
 drivers/spi/spi-fsl-lpspi.c       | 1 -
 drivers/spi/spi-fsl-qspi.c        | 1 -
 drivers/spi/spi-gpio.c            | 1 -
 drivers/spi/spi-gxp.c             | 1 -
 drivers/spi/spi-imx.c             | 1 -
 drivers/spi/spi-ingenic.c         | 2 +-
 drivers/spi/spi-lantiq-ssc.c      | 3 ++-
 drivers/spi/spi-loopback-test.c   | 2 +-
 drivers/spi/spi-lp8841-rtc.c      | 1 -
 drivers/spi/spi-meson-spicc.c     | 1 -
 drivers/spi/spi-mt7621.c          | 2 ++
 drivers/spi/spi-mtk-nor.c         | 3 ++-
 drivers/spi/spi-mtk-snfi.c        | 3 ++-
 drivers/spi/spi-npcm-fiu.c        | 2 +-
 drivers/spi/spi-nxp-fspi.c        | 1 -
 drivers/spi/spi-orion.c           | 1 -
 drivers/spi/spi-qcom-qspi.c       | 2 +-
 drivers/spi/spi-qup.c             | 1 -
 drivers/spi/spi-rspi.c            | 2 +-
 drivers/spi/spi-s3c64xx.c         | 1 -
 drivers/spi/spi-sc18is602.c       | 1 -
 drivers/spi/spi-sh-msiof.c        | 1 -
 drivers/spi/spi-sn-f-ospi.c       | 2 +-
 drivers/spi/spi-sprd-adi.c        | 1 -
 drivers/spi/spi-sprd.c            | 1 -
 drivers/spi/spi-stm32-qspi.c      | 1 -
 drivers/spi/spi-sun6i.c           | 2 +-
 drivers/spi/spi-tegra114.c        | 1 -
 drivers/spi/spi-tegra20-slink.c   | 1 -
 drivers/spi/spi-tegra210-quad.c   | 1 -
 drivers/spi/spi-ti-qspi.c         | 1 -
 drivers/spi/spi-wpcm-fiu.c        | 3 +--
 drivers/spi/spi-zynqmp-gqspi.c    | 4 +---
 43 files changed, 26 insertions(+), 48 deletions(-)

diff --git a/drivers/spi/spi-ar934x.c b/drivers/spi/spi-ar934x.c
index 9dcada8c4cb9..58b98cea31d9 100644
--- a/drivers/spi/spi-ar934x.c
+++ b/drivers/spi/spi-ar934x.c
@@ -14,7 +14,8 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 
 #define DRIVER_NAME "spi-ar934x"
diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index a7fb7c94e70e..0103ac0158c0 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -17,8 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/spi/spi.h>
 
diff --git a/drivers/spi/spi-at91-usart.c b/drivers/spi/spi-at91-usart.c
index 7854d9790fe9..fb9c8da57b0c 100644
--- a/drivers/spi/spi-at91-usart.c
+++ b/drivers/spi/spi-at91-usart.c
@@ -13,7 +13,6 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index 3b253da98c05..b247ee887562 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -24,7 +24,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h> /* FIXME: using chip internals */
 #include <linux/gpio/driver.h> /* FIXME: using chip internals */
diff --git a/drivers/spi/spi-bcm2835aux.c b/drivers/spi/spi-bcm2835aux.c
index 288f7b994b36..8ace417c0a29 100644
--- a/drivers/spi/spi-bcm2835aux.c
+++ b/drivers/spi/spi-bcm2835aux.c
@@ -20,9 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 #include <linux/spinlock.h>
diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index abf10f92415d..e1a8cf08ef66 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -21,7 +21,6 @@
 #include <linux/kernel.h>
 #include <linux/log2.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index ce4a3145f065..11d623cbba2e 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -11,7 +11,6 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index b04811c911e2..7052783dcfb4 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -15,7 +15,6 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi_bitbang.h>
 #include <linux/slab.h>
diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 674cfe05f411..ca41c8a8ba42 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -13,7 +13,8 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
diff --git a/drivers/spi/spi-fsl-lib.c b/drivers/spi/spi-fsl-lib.c
index 76e1192eb025..885757c29fbb 100644
--- a/drivers/spi/spi-fsl-lib.c
+++ b/drivers/spi/spi-fsl-lib.c
@@ -18,7 +18,8 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #ifdef CONFIG_FSL_SOC
 #include <sysdev/fsl_soc.h>
diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index fb68c72df171..a9d3919487e8 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -17,7 +17,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/dma/imx-dma.h>
diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 8ade61e5ebc0..e3de81248893 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -34,7 +34,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 #include <linux/sizes.h>
diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index 092afc7679d4..0a7f7b0188a1 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -10,7 +10,6 @@
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include <linux/spi/spi.h>
 #include <linux/spi/spi_bitbang.h>
diff --git a/drivers/spi/spi-gxp.c b/drivers/spi/spi-gxp.c
index 684d63f402f3..88ab3032736b 100644
--- a/drivers/spi/spi-gxp.c
+++ b/drivers/spi/spi-gxp.c
@@ -3,7 +3,6 @@
 
 #include <linux/iopoll.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 528ae46c087f..548eea7a0a90 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -20,7 +20,6 @@
 #include <linux/spi/spi.h>
 #include <linux/types.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/property.h>
 
 #include <linux/dma/imx-dma.h>
diff --git a/drivers/spi/spi-ingenic.c b/drivers/spi/spi-ingenic.c
index 7d4b515a160d..cfa665a80bc6 100644
--- a/drivers/spi/spi-ingenic.c
+++ b/drivers/spi/spi-ingenic.c
@@ -12,7 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
diff --git a/drivers/spi/spi-lantiq-ssc.c b/drivers/spi/spi-lantiq-ssc.c
index 8d6ecc5d6f70..65568272cfd9 100644
--- a/drivers/spi/spi-lantiq-ssc.c
+++ b/drivers/spi/spi-lantiq-ssc.c
@@ -6,7 +6,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/delay.h>
diff --git a/drivers/spi/spi-loopback-test.c b/drivers/spi/spi-loopback-test.c
index 675a73cf1579..bbf2015d8e5c 100644
--- a/drivers/spi/spi-loopback-test.c
+++ b/drivers/spi/spi-loopback-test.c
@@ -14,8 +14,8 @@
 #include <linux/ktime.h>
 #include <linux/list.h>
 #include <linux/list_sort.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/printk.h>
 #include <linux/vmalloc.h>
 #include <linux/spi/spi.h>
diff --git a/drivers/spi/spi-lp8841-rtc.c b/drivers/spi/spi-lp8841-rtc.c
index 2d436541d6c2..d732ac1ee73c 100644
--- a/drivers/spi/spi-lp8841-rtc.c
+++ b/drivers/spi/spi-lp8841-rtc.c
@@ -15,7 +15,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/spi/spi.h>
 
 #define DRIVER_NAME	"spi_lp8841_rtc"
diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 141562c882f1..2d254cfaece5 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -15,7 +15,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/types.h>
diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
index 3e9d396b33bd..91600e5c22e4 100644
--- a/drivers/spi/spi-mt7621.c
+++ b/drivers/spi/spi-mt7621.c
@@ -14,7 +14,9 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 
diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index baa7a5353987..cf4ee8b19e42 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -13,7 +13,8 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index bed8317cd205..4433a8a9299f 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -76,7 +76,8 @@
 #include <linux/interrupt.h>
 #include <linux/dma-mapping.h>
 #include <linux/iopoll.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/mtd/nand-ecc-mtk.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index eb353561509a..9e8c914ff26c 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -12,7 +12,7 @@
 #include <linux/io.h>
 #include <linux/vmalloc.h>
 #include <linux/regmap.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/mfd/syscon.h>
 
diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 544017655787..2d7a2f702453 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -47,7 +47,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 #include <linux/regmap.h>
diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index ad9e83e34297..0ffe3777f97d 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -16,7 +16,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/clk.h>
 #include <linux/sizes.h>
 #include <asm/unaligned.h>
diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index a8a683d6145c..08b060dd7bb8 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -9,7 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_opp.h>
diff --git a/drivers/spi/spi-qup.c b/drivers/spi/spi-qup.c
index 00e5e88e72c4..fd16acb1f578 100644
--- a/drivers/spi/spi-qup.c
+++ b/drivers/spi/spi-qup.c
@@ -11,7 +11,6 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 08ceebbaf69b..abc97e9bf109 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -19,7 +19,7 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/sh_dma.h>
diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index fd55697144cc..29982839d971 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -14,7 +14,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include <linux/platform_data/spi-s3c64xx.h>
 
diff --git a/drivers/spi/spi-sc18is602.c b/drivers/spi/spi-sc18is602.c
index d52ed67243f7..c67a24daaaf9 100644
--- a/drivers/spi/spi-sc18is602.c
+++ b/drivers/spi/spi-sc18is602.c
@@ -12,7 +12,6 @@
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_data/sc18is602.h>
 #include <linux/gpio/consumer.h>
diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 9e90b4f8b357..5c75b5c58d97 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -20,7 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/sh_dma.h>
diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
index d64d3f75c726..85e4a01bc8b0 100644
--- a/drivers/spi/spi-sn-f-ospi.c
+++ b/drivers/spi/spi-sn-f-ospi.c
@@ -10,7 +10,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
index 22e39c4c12c4..42786b28cd35 100644
--- a/drivers/spi/spi-sprd-adi.c
+++ b/drivers/spi/spi-sprd-adi.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/spi/spi.h>
diff --git a/drivers/spi/spi-sprd.c b/drivers/spi/spi-sprd.c
index 518c7eaca84e..95377cf748c0 100644
--- a/drivers/spi/spi-sprd.c
+++ b/drivers/spi/spi-sprd.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 2b6804aa6901..def74ae9b5f6 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 30d541612253..1aa32094d7c9 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -14,7 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
index 488df681eaef..ca4bdd45f56e 100644
--- a/drivers/spi/spi-tegra114.c
+++ b/drivers/spi/spi-tegra114.c
@@ -20,7 +20,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 
diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index c2915f7672cc..8feba07a1980 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -21,7 +21,6 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 
diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
index fbd14dd7be44..e9ad9b0b598b 100644
--- a/drivers/spi/spi-tegra210-quad.c
+++ b/drivers/spi/spi-tegra210-quad.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>
diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 5914335ff63d..1cfc97c20928 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -22,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
index f15312fdcdaf..852ffe013d32 100644
--- a/drivers/spi/spi-wpcm-fiu.c
+++ b/drivers/spi/spi-wpcm-fiu.c
@@ -3,9 +3,8 @@
 
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi-mem.h>
diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index fb2ca9b90eab..a6b892d01038 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -14,9 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
-- 
2.40.1


