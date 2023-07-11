Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEE4C001DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYdnMuea752Oafx6+bdT61CJtwT3ZWu6h+IBFyHjMI4=; b=DTPHUvSTDZPlRfPdy8mWIm7deh
	iuzn8vGfEcgw/W61Tu2i8zcKwDeXxvL0iMI0AM6h83FbX71mLZsW+fg1DlRTKnY0747KT9R+5uznQ
	k4P1OZsB3Xk5RT7A2xRvsufXMDTnJkyEfk4lnkvFEzNu8R4O2nQDJZUkDHTPETwGjf6DlVWzn64nU
	OAUN1KfAT5grsTOE9ZzkTxTC6E9gnLSux1yB4UGfexi6viY7LyY8eqDaxaG1YCkcihdGpOSC2thMu
	92i7OcOHPXi4JuOlBBsgAKUPJIlFIPNfIAZ4WtmAeTvQ9Tu/dhPik55qc1xB1bDDUOaCEQkHrHwyc
	fcG58NxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJH1b-00FVfL-1t;
	Tue, 11 Jul 2023 17:19:43 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJH1J-00FVLX-2a;
	Tue, 11 Jul 2023 17:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689095965; x=1720631965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rn9d/T3W6Uq2IhVx3LkqBWZwSCJuFxg8vPiXigm9Nk4=;
  b=XnjtmnfT1WX5IbKp7I2szRjsJZMVP55SE8czQdLv57sM2zweSRiwR8e8
   xCjmVhBR8xSVQZ3eKzdrCnEtFLCtCqthzBug/uVDiHktQ5FNo0i4P/XBz
   3XvlkqM0xSCFYNrN3UPUbuXs0xB8n3Ptn4sVdC+W/H9WYDBpdSoAA1H8r
   i+nzifwIj3oG7RclREvSNDt9fEuv84cwbQnInqg6ZIPdkapFaLa05TQII
   cACnItb7AhCx6myxmn1iPcvL6cdWBAVDlUi3sGyV+LHvTmSO47V3hZw3f
   PMeu6XAI643T3XOzbqOEj4Bd4XbAQV2otaL1xXA4o7DbdpQ7XBKZq9lmw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148857"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="362148857"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240840"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="715240840"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:17:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3818F3E3; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Subject: [PATCH v3 03/14] spi: Refactor bus number assigning code in spi_register_controller()
Date: Tue, 11 Jul 2023 20:17:45 +0300
Message-Id: <20230711171756.86736-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
References: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_101925_865403_396E5779 
X-CRM114-Status: GOOD (  16.06  )
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

Instead of 'else' branching use two sequential if:s, which allows
to re-use the logic of IDR allocation in both cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index d8064998aa27..6d74218cf38e 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3122,8 +3122,8 @@ int spi_register_controller(struct spi_controller *ctlr)
 {
 	struct device		*dev = ctlr->dev.parent;
 	struct boardinfo	*bi;
+	int			first_dynamic;
 	int			status;
-	int			id, first_dynamic;
 
 	if (!dev)
 		return -ENODEV;
@@ -3136,19 +3136,13 @@ int spi_register_controller(struct spi_controller *ctlr)
 	if (status)
 		return status;
 
+	if (ctlr->bus_num < 0)
+		ctlr->bus_num = of_alias_get_id(ctlr->dev.of_node, "spi");
 	if (ctlr->bus_num >= 0) {
 		/* Devices with a fixed bus num must check-in with the num */
 		status = spi_controller_id_alloc(ctlr, ctlr->bus_num, ctlr->bus_num + 1);
 		if (status)
 			return status;
-	} else {
-		/* Allocate dynamic bus number using Linux idr */
-		id = of_alias_get_id(ctlr->dev.of_node, "spi");
-		if (id >= 0) {
-			status = spi_controller_id_alloc(ctlr, id, id + 1);
-			if (status)
-				return status;
-		}
 	}
 	if (ctlr->bus_num < 0) {
 		first_dynamic = of_alias_get_highest_id("spi");
-- 
2.40.0.1.gaa8946217a0b


