Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB28EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnF+LMHcVlGKDCydGVoyV5aZC40d8p/xMENgpGUnHO0=; b=PgJfjCV0Shh4jXcT7C0iVG3GJi
	NJwi4ucx6xUOIHQ8BaTk1gSdt2fHJwd5obJo1QnOQpPlbgjh/eQMxaJswbDTeSq5ScBTlgyNOwCOr
	9uspRRqBTDtEFcRLIFHUc6UDjrMC+CvqQC5vq1bGlv0UmqhGoFE2K2ICH2qUXVuX9+aYhT8orONxw
	rmUFpBPm5ta0dXqvif7QgcOlQmnus/jUu4jbDpFZa8FOiuL3rspQt+YQgL4vC1yjCl+2Bx2x4fFhx
	3WHCTPQo5H+1BJ0o35+2ZYOz9aHJUQ5UkhHVSiIRE/UuMXLQxFh3Ac5WfCHZjpHvSn9x5uWvavLdH
	VClAIuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt9H-00C3wb-2M;
	Mon, 10 Jul 2023 15:50:03 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt8z-00C3ck-1j;
	Mon, 10 Jul 2023 15:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004185; x=1720540185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0v8XTkg22X4+SjZKJZYJseJJcu9T6jyLmPuYe7Mrmmg=;
  b=m5EPXefyfEsitSnH+YeTKbD4Lke0xr1Cb3d/TSdcQNoUCn6q3kwCLsKI
   SMO+ADxSIX2c0gv0N78lJSGs6HIIeYTniT1bsfU6IaNo8t/Nj6RVJvcNO
   S9VBB/wH5Cn//zY1gU1zKKo82W5vsCv2ADv5JVmL3MRZiO9iezP08TGxU
   pwwB+M+Cl0717nGdAVa5ICa1RmLGiTwBzH6L1N5bTB9pwA6CljPtVPJK4
   W2H2WWzxyeukT4NWA16kWXSnhc2adzqRqob2Py+BfgKoXqwZwjK/G8nGg
   bYX6T3NQ2NjPbgwLN39tUb8Ll09jOTFJYWORu4vNTG60oZxzrh6EldsZe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349185396"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="349185396"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 08:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="844921854"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="844921854"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 08:49:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6932A5FC; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
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
Subject: [PATCH v2 05/15] spi: Remove code duplication in spi_add_device_locked()
Date: Mon, 10 Jul 2023 18:49:22 +0300
Message-Id: <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_084945_651464_8F5915EC 
X-CRM114-Status: GOOD (  12.59  )
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

Seems by unknown reason, probably some kind of mis-rebase,
the commit 0c79378c0199 ("spi: add ancillary device support")
adds a dozen of duplicating lines of code. Drop them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c99ee4164f11..46cbda383228 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -712,17 +712,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
 static int spi_add_device_locked(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
-	struct device *dev = ctlr->dev.parent;
-
-	/* Chipselects are numbered 0..max; validate. */
-	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
-		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
-			ctlr->num_chipselect);
-		return -EINVAL;
-	}
-
-	/* Set the bus ID string */
-	spi_dev_set_name(spi);
 
 	WARN_ON(!mutex_is_locked(&ctlr->add_lock));
 	return __spi_add_device(spi);
-- 
2.40.0.1.gaa8946217a0b


