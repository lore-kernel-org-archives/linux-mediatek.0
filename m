Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2377EC001DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrhJoc6o4TDzRGY1WlNBZgEqxV790LEL96nwwJKbxoQ=; b=Lxj2LW3O0LAuaHfYypG/2HlKtE
	JOV6S06H8zdKq3a8Ug2HfYz+bP/jXeTslGt2vz8bD0s4H6T24EyuY3U1vb1Zta2jSNKh7FH2yAyOv
	Jv6aJVGFgUsm2BU9kZyD3msldqmanLFTB5nFtYy0rY7E8104F3clpohuaMqTayEXfXh9qnTFo0O9N
	62egTPMyNfUi6qvgR8ndIWso2d5XWkNuG0i8EzdQUM4W/OPhP5O5q8EruMrcvEl8Xx2rXmrKWsAti
	DhAiHSvC9EY8KVw+tLAsOuqfHsVpEcZbr/X3hLBq5huFl5yhJuNP1sVEJVp6V2sqcdJ92wwSU7LKj
	cDqJc5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJH24-00FWAY-0p;
	Tue, 11 Jul 2023 17:20:12 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJH1N-00FVLX-1R;
	Tue, 11 Jul 2023 17:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689095969; x=1720631969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dEFDFR9Zjzcis3/WsD8642CwaquIx3KoLxGVFvTwtnY=;
  b=VT2+UkFiZRef6/Vq8JMwSuBa+IzE5/jkTo9jOGVsmyyqW/LXglIb6hEP
   8jBwStt41lHmqSixqg0rttWTDBKXyNSPefVPVQ2E73sXAI556pykl5+IO
   TCZukP6JebYN6xqqZ5x7UKSki0likXgnjbCSPeU2soVKNoJwCK2Bsj0wz
   3sT+4bOfM5vRsEBCc4ajfd2iu2hyqOeeMpOyRRXjbSCeL6G1oOVpqE54C
   iQnYsnZ4j+7Map+NKo2Qk+dnAzSvZy4vxo5gT6hUr1DddNXipacBztWXS
   Y9LHxNyiILCaUAM0BLocQxD3olM7vn5TmvEMimuN8FSibm15+Dti3ae/N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148975"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="362148975"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240953"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="715240953"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:18:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BEBD9748; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 11/14] spi: Get rid of old SPI_MASTER_MUST_TX & SPI_MASTER_MUST_RX
Date: Tue, 11 Jul 2023 20:17:53 +0300
Message-Id: <20230711171756.86736-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
References: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_101929_531289_C83CADE5 
X-CRM114-Status: GOOD (  15.98  )
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

Convert the users from SPI_MASTER_MUST_TX and/or SPI_MASTER_MUST_RX
to SPI_CONTROLLER_MUST_TX and/or SPI_CONTROLLER_MUST_RX respectively
and kill the not used anymore definitions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-at91-usart.c   | 2 +-
 drivers/spi/spi-atmel.c        | 2 +-
 drivers/spi/spi-davinci.c      | 2 +-
 drivers/spi/spi-fsl-lpspi.c    | 2 +-
 drivers/spi/spi-meson-spicc.c  | 2 +-
 drivers/spi/spi-mt65xx.c       | 2 +-
 drivers/spi/spi-pci1xxxx.c     | 2 +-
 drivers/spi/spi-pic32.c        | 2 +-
 drivers/spi/spi-rb4xx.c        | 2 +-
 drivers/spi/spi-slave-mt27xx.c | 2 +-
 drivers/spi/spi-stm32.c        | 2 +-
 include/linux/spi/spi.h        | 2 --
 12 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-at91-usart.c b/drivers/spi/spi-at91-usart.c
index 7854d9790fe9..7dfe2b6c2990 100644
--- a/drivers/spi/spi-at91-usart.c
+++ b/drivers/spi/spi-at91-usart.c
@@ -527,7 +527,7 @@ static int at91_usart_spi_probe(struct platform_device *pdev)
 	controller->dev.of_node = pdev->dev.parent->of_node;
 	controller->bits_per_word_mask = SPI_BPW_MASK(8);
 	controller->setup = at91_usart_spi_setup;
-	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
+	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
 	controller->transfer_one = at91_usart_spi_transfer_one;
 	controller->prepare_message = at91_usart_spi_prepare_message;
 	controller->unprepare_message = at91_usart_spi_unprepare_message;
diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 152cd6773403..0865993005b2 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -1475,7 +1475,7 @@ static int atmel_spi_probe(struct platform_device *pdev)
 	host->bus_num = pdev->id;
 	host->num_chipselect = 4;
 	host->setup = atmel_spi_setup;
-	host->flags = (SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX |
+	host->flags = (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX |
 			SPI_MASTER_GPIO_SS);
 	host->transfer_one = atmel_spi_one_transfer;
 	host->set_cs = atmel_spi_set_cs;
diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index b04811c911e2..014392459d5e 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -939,7 +939,7 @@ static int davinci_spi_probe(struct platform_device *pdev)
 	master->bus_num = pdev->id;
 	master->num_chipselect = pdata->num_chipselect;
 	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(2, 16);
-	master->flags = SPI_MASTER_MUST_RX | SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_MUST_RX | SPI_MASTER_GPIO_SS;
 	master->setup = davinci_spi_setup;
 	master->cleanup = davinci_spi_cleanup;
 	master->can_dma = davinci_spi_can_dma;
diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index fb68c72df171..1c907d5d5bb3 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -856,7 +856,7 @@ static int fsl_lpspi_probe(struct platform_device *pdev)
 	controller->prepare_transfer_hardware = lpspi_prepare_xfer_hardware;
 	controller->unprepare_transfer_hardware = lpspi_unprepare_xfer_hardware;
 	controller->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
-	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
+	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
 	controller->dev.of_node = pdev->dev.of_node;
 	controller->bus_num = pdev->id;
 	controller->num_chipselect = fsl_lpspi->num_cs;
diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 141562c882f1..7a9eba35ac38 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -864,7 +864,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 				     SPI_BPW_MASK(24) |
 				     SPI_BPW_MASK(16) |
 				     SPI_BPW_MASK(8);
-	master->flags = (SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX);
+	master->flags = (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX);
 	master->min_speed_hz = spicc->data->min_speed_hz;
 	master->max_speed_hz = spicc->data->max_speed_hz;
 	master->setup = meson_spicc_setup;
diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 39272ad6641b..0757985947dd 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1142,7 +1142,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		master->mode_bits |= SPI_CS_HIGH;
 
 	if (mdata->dev_comp->must_tx)
-		master->flags = SPI_MASTER_MUST_TX;
+		master->flags = SPI_CONTROLLER_MUST_TX;
 	if (mdata->dev_comp->ipm_design)
 		master->mode_bits |= SPI_LOOP | SPI_RX_DUAL | SPI_TX_DUAL |
 				     SPI_RX_QUAD | SPI_TX_QUAD;
diff --git a/drivers/spi/spi-pci1xxxx.c b/drivers/spi/spi-pci1xxxx.c
index 4445d82409d6..d23c42839da1 100644
--- a/drivers/spi/spi-pci1xxxx.c
+++ b/drivers/spi/spi-pci1xxxx.c
@@ -365,7 +365,7 @@ static int pci1xxxx_spi_probe(struct pci_dev *pdev, const struct pci_device_id *
 		spi_host->bits_per_word_mask = SPI_BPW_MASK(8);
 		spi_host->max_speed_hz = PCI1XXXX_SPI_MAX_CLOCK_HZ;
 		spi_host->min_speed_hz = PCI1XXXX_SPI_MIN_CLOCK_HZ;
-		spi_host->flags = SPI_MASTER_MUST_TX;
+		spi_host->flags = SPI_CONTROLLER_MUST_TX;
 		spi_master_set_devdata(spi_host, spi_sub_ptr);
 		ret = devm_spi_register_master(dev, spi_host);
 		if (ret)
diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index f2af5e653f3d..e9b4c9cb97fb 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -773,7 +773,7 @@ static int pic32_spi_probe(struct platform_device *pdev)
 	master->max_speed_hz	= clk_get_rate(pic32s->clk);
 	master->setup		= pic32_spi_setup;
 	master->cleanup		= pic32_spi_cleanup;
-	master->flags		= SPI_MASTER_MUST_TX | SPI_MASTER_MUST_RX;
+	master->flags		= SPI_CONTROLLER_MUST_TX | SPI_CONTROLLER_MUST_RX;
 	master->bits_per_word_mask	= SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
 					  SPI_BPW_MASK(32);
 	master->transfer_one		= pic32_spi_one_transfer;
diff --git a/drivers/spi/spi-rb4xx.c b/drivers/spi/spi-rb4xx.c
index 5073736d3d1f..c817889a7797 100644
--- a/drivers/spi/spi-rb4xx.c
+++ b/drivers/spi/spi-rb4xx.c
@@ -156,7 +156,7 @@ static int rb4xx_spi_probe(struct platform_device *pdev)
 	master->num_chipselect = 3;
 	master->mode_bits = SPI_TX_DUAL;
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
-	master->flags = SPI_MASTER_MUST_TX;
+	master->flags = SPI_CONTROLLER_MUST_TX;
 	master->transfer_one = rb4xx_transfer_one;
 	master->set_cs = rb4xx_set_cs;
 
diff --git a/drivers/spi/spi-slave-mt27xx.c b/drivers/spi/spi-slave-mt27xx.c
index 4e4d426bfb43..6d6772974783 100644
--- a/drivers/spi/spi-slave-mt27xx.c
+++ b/drivers/spi/spi-slave-mt27xx.c
@@ -414,7 +414,7 @@ static int mtk_spi_slave_probe(struct platform_device *pdev)
 	mdata->dev_comp = of_id->data;
 
 	if (mdata->dev_comp->must_rx)
-		ctlr->flags = SPI_MASTER_MUST_RX;
+		ctlr->flags = SPI_CONTROLLER_MUST_RX;
 
 	platform_set_drvdata(pdev, ctlr);
 
diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 6d10fa4ab783..423212bd0675 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1750,7 +1750,7 @@ static const struct stm32_spi_cfg stm32f4_spi_cfg = {
 	.baud_rate_div_min = STM32F4_SPI_BR_DIV_MIN,
 	.baud_rate_div_max = STM32F4_SPI_BR_DIV_MAX,
 	.has_fifo = false,
-	.flags = SPI_MASTER_MUST_TX,
+	.flags = SPI_CONTROLLER_MUST_TX,
 };
 
 static const struct stm32_spi_cfg stm32h7_spi_cfg = {
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 39e6271b5003..b90c53332909 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1626,8 +1626,6 @@ spi_transfer_is_last(struct spi_controller *ctlr, struct spi_transfer *xfer)
 #define spi_master			spi_controller
 
 #define SPI_MASTER_HALF_DUPLEX		SPI_CONTROLLER_HALF_DUPLEX
-#define SPI_MASTER_MUST_RX		SPI_CONTROLLER_MUST_RX
-#define SPI_MASTER_MUST_TX		SPI_CONTROLLER_MUST_TX
 
 #define spi_master_get_devdata(_ctlr)	spi_controller_get_devdata(_ctlr)
 #define spi_master_set_devdata(_ctlr, _data)	\
-- 
2.40.0.1.gaa8946217a0b


