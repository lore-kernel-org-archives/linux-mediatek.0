Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2484C00528
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWA7GIOFewi2OU47McNhmbZ1Ir0zrg7xiPluBsL/qi8=; b=X5ZznBAU6Bs6UPGF5KRejObg4r
	gV8NN1fPYRDmSMbbgsd4qauJA4H4j9KQ1wRZCQL51Hil5VYkywDPXlMu67873wzm8Sjm/XSioGEHe
	M5abfV/16lNTzNuOJoa9zZFJl91SGPvhmAPGCWBsTO8PK5r0PiG8FzXbFBxfHNOQALUFDZtI0Td8h
	+/OtSWvXBzCsda60FcyRdqECQSLp7N/zgE0iUEDMIzUlFrTNQ4z+JjeM6fEvxkdDV55jD+m11DyKB
	oogRI8q7xcFUUw4Au79HvQTRirvoh1XkW+bp7l5wWXMnpVXWlH9nbTblM6Z/a6kXQ2FtPdqrka5oB
	mp1+AJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt92-00C3hL-2s;
	Mon, 10 Jul 2023 15:49:48 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt8x-00C3ck-28;
	Mon, 10 Jul 2023 15:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004183; x=1720540183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJa3Jmu6iVXPZMGevJvu2fkKY/Gm2mVbHm4RgDFco0c=;
  b=XFKCbzYpDZvlVcWG6i9Zr6Ielx1NCQREwLbasplwQtv/7XXfwEGVYBFi
   m/A7VKhP1mhEgfksm3K8wDFOWVNSYPpS87ZDfT2rLxVQhZPYBBJ9Fiu9c
   gXRIsBPlNYOF1hfdVlyHtca8U/fJvL8n7MPYjWZhVDZa0IRLueSNzuvki
   X8GBP9eIQWW8ts+9OA428eb2TJa7P/fCw3y4AVMal1x03D14UZokamsii
   Ojnjd1Q/LuBrAn8jboBTJRK5Z9KWF77a6rE/UrXi2Dc4WT2W5DdWu9kYO
   VnE1MO8PEuWr/XofT/dz/7gdrw19fq3bCk99HGcHTsrI71ISJUlYFT18n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349185343"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="349185343"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 08:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="844921834"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="844921834"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 08:49:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5A18C4BD; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
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
Subject: [PATCH v2 04/15] spi: Replace open coded spi_controller_xfer_timeout()
Date: Mon, 10 Jul 2023 18:49:21 +0300
Message-Id: <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_084943_801003_3609C880 
X-CRM114-Status: GOOD (  18.52  )
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

Since the new spi_controller_xfer_timeout() helper appeared,
we may replace open coded variant in spi_transfer_wait().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c       | 25 ++-----------------------
 include/linux/spi/spi.h |  6 +++++-
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 125dea8fae00..c99ee4164f11 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1342,8 +1342,7 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 {
 	struct spi_statistics __percpu *statm = ctlr->pcpu_statistics;
 	struct spi_statistics __percpu *stats = msg->spi->pcpu_statistics;
-	u32 speed_hz = xfer->speed_hz;
-	unsigned long long ms;
+	unsigned long ms;
 
 	if (spi_controller_is_slave(ctlr)) {
 		if (wait_for_completion_interruptible(&ctlr->xfer_completion)) {
@@ -1351,29 +1350,9 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 			return -EINTR;
 		}
 	} else {
-		if (!speed_hz)
-			speed_hz = 100000;
-
-		/*
-		 * For each byte we wait for 8 cycles of the SPI clock.
-		 * Since speed is defined in Hz and we want milliseconds,
-		 * use respective multiplier, but before the division,
-		 * otherwise we may get 0 for short transfers.
-		 */
-		ms = 8LL * MSEC_PER_SEC * xfer->len;
-		do_div(ms, speed_hz);
-
-		/*
-		 * Increase it twice and add 200 ms tolerance, use
-		 * predefined maximum in case of overflow.
-		 */
-		ms += ms + 200;
-		if (ms > UINT_MAX)
-			ms = UINT_MAX;
-
+		ms = spi_controller_xfer_timeout(ctlr, xfer);
 		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
 						 msecs_to_jiffies(ms));
-
 		if (ms == 0) {
 			SPI_STATISTICS_INCREMENT_FIELD(statm, timedout);
 			SPI_STATISTICS_INCREMENT_FIELD(stats, timedout);
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 32c94eae8926..0ce1cb18a076 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1270,12 +1270,16 @@ static inline bool spi_is_bpw_supported(struct spi_device *spi, u32 bpw)
  * that it would take on a single data line and take twice this amount of time
  * with a minimum of 500ms to avoid false positives on loaded systems.
  *
+ * Assume speed to be 100 kHz if it's not defined at the time of invocation.
+ *
  * Returns: Transfer timeout value in milliseconds.
  */
 static inline unsigned int spi_controller_xfer_timeout(struct spi_controller *ctlr,
 						       struct spi_transfer *xfer)
 {
-	return max(xfer->len * 8 * 2 / (xfer->speed_hz / 1000), 500U);
+	u32 speed_hz = xfer->speed_hz ?: 100000;
+
+	return max(xfer->len * 8 * 2 / (speed_hz / 1000), 500U);
 }
 
 /*---------------------------------------------------------------------------*/
-- 
2.40.0.1.gaa8946217a0b


