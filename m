Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C25C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/T1+ETU4HKY13N1/qW+GdSTm2ZCn+muVgWZ4DXNhYYA=; b=g4A8ftc/8gQKAhSg1dl5KNEUOl
	eMuKJt12ui9vs8DPOSrTZgDXK6Xsv7XAYBj3hruo4GnZRSD8TwR2ivUiOhTBeC1d2rRBgjLEvC890
	KrER6QTri0aRP7kwldfNF/DV7OeVbM+0fJ5UWz94LRRtKuI81YElRT/CpUaQ0eY7nrkNWr/nr8G+A
	up1JxT0xlBqRixC3P5eQZcIVbwKZZjal+g8yHyCAWsW2JVym4iOAwnvvGZcy+Wjnbp7Y7Lwm6K+NH
	nomsyOsvSE9oidSyprUaDltZqYRrf7MI2S6mAWBJTesT/dZW2HdrR/jbwVAmR9OK2p90wx7bjN8pc
	DtzN94+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt9R-00C46e-0J;
	Mon, 10 Jul 2023 15:50:13 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt90-00C3cH-0E;
	Mon, 10 Jul 2023 15:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004186; x=1720540186;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qyXZ9l/eDXJvwNtej9Cq3pKS54WfQZS0AfJJYPgySOQ=;
  b=GbdgI1Z9GZoY5mEls7A78yDMB1UOgwe9EuDSzYNsHjG/wu5p6JU4fsBI
   huv2d4EfgqvpZPQ3v8WUYrPRly5cV0v3dQ6vwSRQVR0cXUSdznlywxHIf
   FbBUfz5xm/sRENtjdQvgQoI7yMWZRS2HwSvytkl+1uUIpnSmmfUFFlLh5
   lwUSnqo53j/s5Py0dxoyoH591/r3i5nnVGkMD/zoWWOLfPoKI5ZESAyP+
   RkNja3Gti55XQAjaEc/Km8zTaNP2fC/XQafru2T+5LO9aKPppU8ujfY+u
   Xj9oCa7J9z3wXVrTRiggO+HpJ8DrRLpFUcp2yobcfEQlIXr6siuM/92c6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361842457"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="361842457"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 08:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720743951"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="720743951"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 08:49:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 115861FC; Mon, 10 Jul 2023 18:49:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
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
	Serge Semin <fancer.lancer@gmail.com>,
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
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v2 00/15] spi: Header and core clean up and refactoring
Date: Mon, 10 Jul 2023 18:49:17 +0300
Message-Id: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_084946_131905_9CFACAB5 
X-CRM114-Status: GOOD (  13.82  )
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

Various cleanups and refactorings of the SPI header and core parts
united in a single series. It also touches drivers under SPI subsystem
folder on the pure renaming purposes of some constants.

No functional change intended.

Changelog v2:
- added new patches 3,4,5,10,13,14
- massaged comment and kernel doc in patch 9
- split used to be patch 4 to patches 11,12
- covered a few things in SPI core in patch 15
- amended commit message for above (Mark)
- reshuffled patches in the series for better logical grouping

Andy Shevchenko (15):
  spi: Remove unneeded OF node NULL checks
  spi: Drop duplicate IDR allocation code in spi_register_controller()
  spi: Replace if-else-if by bitops and multiplications
  spi: Replace open coded spi_controller_xfer_timeout()
  spi: Remove code duplication in spi_add_device_locked()
  spi: Use sysfs_emit() to instead of s*printf()
  spi: Sort headers alphabetically
  spi: Clean up headers
  spi: Use struct_size() helper
  spi: Use predefined constants from bits.h and units.h
  spi: Get rid of old SPI_MASTER_NO_TX & SPI_MASTER_NO_RX
  spi: Get rid of old SPI_MASTER_MUST_TX & SPI_MASTER_MUST_RX
  spi: Rename SPI_MASTER_GPIO_SS to SPI_CONTROLLER_GPIO_SS
  spi: Convert to SPI_CONTROLLER_HALF_DUPLEX
  spi: Fix spelling typos and acronyms capitalization

 drivers/spi/spi-amd.c             |   2 +-
 drivers/spi/spi-at91-usart.c      |   2 +-
 drivers/spi/spi-ath79.c           |   2 +-
 drivers/spi/spi-atmel.c           |   4 +-
 drivers/spi/spi-bitbang-txrx.h    |  16 +--
 drivers/spi/spi-bitbang.c         |   8 +-
 drivers/spi/spi-cavium-thunderx.c |   2 +-
 drivers/spi/spi-davinci.c         |   2 +-
 drivers/spi/spi-dw-core.c         |   2 +-
 drivers/spi/spi-falcon.c          |   2 +-
 drivers/spi/spi-fsl-lpspi.c       |   2 +-
 drivers/spi/spi-gpio.c            |  10 +-
 drivers/spi/spi-imx.c             |   2 +-
 drivers/spi/spi-lp8841-rtc.c      |  10 +-
 drivers/spi/spi-meson-spicc.c     |   2 +-
 drivers/spi/spi-mt65xx.c          |   2 +-
 drivers/spi/spi-mxs.c             |   2 +-
 drivers/spi/spi-omap-uwire.c      |   2 +-
 drivers/spi/spi-orion.c           |   2 +-
 drivers/spi/spi-pci1xxxx.c        |   2 +-
 drivers/spi/spi-pic32-sqi.c       |   2 +-
 drivers/spi/spi-pic32.c           |   2 +-
 drivers/spi/spi-qcom-qspi.c       |   2 +-
 drivers/spi/spi-rb4xx.c           |   2 +-
 drivers/spi/spi-rockchip-sfc.c    |   2 +-
 drivers/spi/spi-rockchip.c        |   2 +-
 drivers/spi/spi-sifive.c          |   2 +-
 drivers/spi/spi-slave-mt27xx.c    |   2 +-
 drivers/spi/spi-sprd-adi.c        |   2 +-
 drivers/spi/spi-stm32.c           |   2 +-
 drivers/spi/spi-ti-qspi.c         |   2 +-
 drivers/spi/spi-xcomm.c           |   2 +-
 drivers/spi/spi-xtensa-xtfpga.c   |   2 +-
 drivers/spi/spi.c                 | 204 ++++++++++++------------------
 include/linux/spi/spi.h           | 198 +++++++++++++++++------------
 include/trace/events/spi.h        |   2 +-
 36 files changed, 247 insertions(+), 261 deletions(-)

-- 
2.40.0.1.gaa8946217a0b


