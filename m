Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F5DD1D48A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7MPukKq2QUGycxvjKoEcD0cCyYhtwldjjcDoXHG9ek=; b=Z+epaMH2Ur48ygBMwbxdpidw4O
	jVIXx8WvWOmjjImqHrp/zz0voKa1VzUVe7gyqCidYD56ru5BegL3uSxZmf0sd7UxaTE5noXkfEjTD
	yymcC579SJi6/+LUzWMCnvQ4E6L4xEwaIWjiBOR9ljXWO9F8M9juzc4Zhf739ruQcowZLsDa11+Zv
	ryiWjVGFLxKV3chGckjUPOGhKZRrIYMOyU2LmjTFX5P0NpUk97nZx8zRLXI8rLZK3I6+6sUWdbGDq
	DimMpMe46/JPpWbx2q5j4iY7z9Xc5MBvD/SHHv5sxtUiSZhTbqbgdWXQZ/7vQjjwQpWl7wlloXA5P
	4iFfUHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdweb-00000000puU-47qY;
	Thu, 08 Jan 2026 20:30:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdweV-00000000po5-0AtB;
	Thu, 08 Jan 2026 20:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767904239; x=1799440239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gweGXKEQGc4/hwMnHXoXPIZG21hxC6IQVTr9HcEdhzU=;
  b=mDy5nqC/34+0L8e/MIhIr0DlOJ7ES3Z+xeexpU+cvhXu0J6X+RI6r/Z5
   Ljz3DW6mxM/bR9mYuigxhr7bP6x48SE6tecjxIX686b3rNz4cRORAjU+Q
   0POouhOrxTiPL/23hh0bmshhmWaWyYVAQz61slUKm6hqCegmvy+dwQM5Q
   jyyQZbEZNnwNmWLCkyQ6iZzHmNATTGDPt48KfcnLKx23n3wyhHf9PUjqe
   bb+cTHTj/kYJrJ3zOq8r/yWl1ZvcmATjXmRLOpOoKVR3sIKKIYIgUiQ0K
   rQ9v7W2T+ynsoTJtCR0Y98b7GshJfma3gOOrBWIv45CrYTtTrY50eCWR7
   Q==;
X-CSE-ConnectionGUID: OPo9m5YyTnWbBao8FU7nTw==
X-CSE-MsgGUID: Y6JEXl2jS6uMXjOd5+e3BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68485981"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="68485981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 12:30:36 -0800
X-CSE-ConnectionGUID: 2l9MyugHSY+hvi2iINWAWA==
X-CSE-MsgGUID: x8IxwEW9QjitcU2+B5Oi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="226706631"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2026 12:30:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 65F759B; Thu, 08 Jan 2026 21:30:18 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Janne Grunau <j@jannau.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	CL Wang <cl634@andestech.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Hang Zhou <929513338@qq.com>,
	Jun Guo <jun.guo@cixtech.com>,
	Philipp Stanner <phasta@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Shiji Yang <yangshiji66@outlook.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Carlos Song <carlos.song@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Sergio Perez Gonzalez <sperezglz@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Rosen Penev <rosenp@gmail.com>,
	Luis de Arquer <luis.dearquer@inertim.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Alessandro Grassi <alessandro.grassi@mailbox.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Darshan R <rathod.darshan.0896@gmail.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Vishwaroop A <va@nvidia.com>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Yang Shen <shenyang39@huawei.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Han Xu <han.xu@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Heiko Stuebner <heiko@sntech.de>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Masahisa Kojima <masahisa.kojima@linaro.org>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Michal Simek <michal.simek@amd.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v1 3/4] spi: Drop duplicate fwnode assignment
Date: Thu,  8 Jan 2026 21:23:40 +0100
Message-ID: <20260108203004.3538449-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_123039_234795_EF8D96DA 
X-CRM114-Status: GOOD (  13.85  )
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

The SPI core provides the default fwnode for the controller,
inherited from the actual (parent) device. No need to repeat it
in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-hisi-kunpeng.c | 1 -
 drivers/spi/spi-synquacer.c    | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/spi/spi-hisi-kunpeng.c b/drivers/spi/spi-hisi-kunpeng.c
index dadf558dd9c0..afe51adcc507 100644
--- a/drivers/spi/spi-hisi-kunpeng.c
+++ b/drivers/spi/spi-hisi-kunpeng.c
@@ -497,7 +497,6 @@ static int hisi_spi_probe(struct platform_device *pdev)
 	host->cleanup = hisi_spi_cleanup;
 	host->transfer_one = hisi_spi_transfer_one;
 	host->handle_err = hisi_spi_handle_err;
-	host->dev.fwnode = dev->fwnode;
 	host->min_speed_hz = DIV_ROUND_UP(host->max_speed_hz, CLK_DIV_MAX);
 
 	hisi_spi_hw_init(hs);
diff --git a/drivers/spi/spi-synquacer.c b/drivers/spi/spi-synquacer.c
index eaf560487591..d0a875249910 100644
--- a/drivers/spi/spi-synquacer.c
+++ b/drivers/spi/spi-synquacer.c
@@ -600,7 +600,6 @@ static irqreturn_t sq_spi_tx_handler(int irq, void *priv)
 
 static int synquacer_spi_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct spi_controller *host;
 	struct synquacer_spi *sspi;
 	int ret;
@@ -699,8 +698,6 @@ static int synquacer_spi_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
-	host->dev.of_node = np;
-	host->dev.fwnode = pdev->dev.fwnode;
 	host->auto_runtime_pm = true;
 	host->bus_num = pdev->id;
 
-- 
2.50.1


