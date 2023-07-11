Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB91C001E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj9fKtfNH/PzK/4CXugttlVk8uBnmcfIi9nKOCvN9LU=; b=3gRP5V/GWTxqgjQI6x+BJibXG9
	iLQT/0p63Ya39uDCYwxN+vODvQbl6hrau1UhN6CzopIyAaLT/WyMgQXc3sWtmxX0FcdiXQ7LGx1GJ
	Zwju42jxXn0RKC0mQDrDTP+vtRMTnvQZ2RKwTovC3Win7k49pNMx24gPH1IUeNpRRvSfOSF+83AD8
	LfHw6Cba4IWFehM+MOCk/SY1JAzO91MUPWfX6xYzaufzLvBJQAb3w6b6nk3dr+tmdKlO+U7s0Gst5
	kniCzlt4SXFpNRK+eIzlXlQPI8X3SdHOFc0ncco0jgwwVy7NSM9PCgCC3sOa2Wz1T61UI91aYbsJZ
	DOetaW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJH0f-00FUzu-1A;
	Tue, 11 Jul 2023 17:18:45 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJH0Z-00FUud-1y;
	Tue, 11 Jul 2023 17:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689095919; x=1720631919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W7NEY71PqQVA5BZGww/eT8EMuOmo4A0EIfyDr5wmKTE=;
  b=fzBcz1tpBslz5nnsAPLO7V70QVldMPw7OlBG86wd+3zgLY7UWZ39thb+
   4b0lnNqhG0sPOBsJQIAkVHFphCUOcMfNBBP438xvOV5s042iM+LUNyKh6
   ZTo2KiLUNHMzgvdt5j2sPgCtIFThnl1Nz0aSTTqOPVpED1vI7E7Z437Q0
   cY1Iys9G0x+CIAnWxBhDjQhxzhEjtxC+Hy4uZmUFRBfC/iwFGbvDOahTf
   HvZmK773AJsAIwhJweY9TbH5KrGp/8jgZAPyhwxwcMC2rv4RBGyZ/GAA3
   DMzDoKqhsQ8aUdIr3r8Pu7TfU+gphNwxVdFLQBuHyJeBQ1S7+40CDn5/o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344283998"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="344283998"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845338539"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="845338539"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 10:18:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7A51969A; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Subject: [PATCH v3 07/14] spi: Use BITS_TO_BYTES()
Date: Tue, 11 Jul 2023 20:17:49 +0300
Message-Id: <20230711171756.86736-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
References: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_101839_670981_871E8109 
X-CRM114-Status: GOOD (  11.67  )
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

BITS_TO_BYTES() is the existing macro which takes care about full
bytes that may fully hold the given amount of bits. Use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 19846fe4c4d5..0259516a6943 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3881,11 +3881,9 @@ static int __spi_validate(struct spi_device *spi, struct spi_message *message)
 	 */
 	if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WORD) ||
 					  spi_get_csgpiod(spi, 0))) {
-		size_t maxsize;
+		size_t maxsize = BITS_TO_BYTES(spi->bits_per_word);
 		int ret;
 
-		maxsize = (spi->bits_per_word + 7) / 8;
-
 		/* spi_split_transfers_maxsize() requires message->spi */
 		message->spi = spi;
 
-- 
2.40.0.1.gaa8946217a0b


