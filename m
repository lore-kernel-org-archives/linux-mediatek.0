Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E3EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxqOkkZIYJ+JLUxIAQdXn9uH6VPTkt1ZLWCwGfRndUY=; b=zZlRuhT3pMM5Mw
	b65IBG4sSEXL4RSbdoy4q5T73PuU4VlrU1f4iNwAhRQWjEKiRc6yvyNBHeHI5j88PWH7AFKTFd84p
	2w/fA11NcrbhYKhemNMEsVPMz/LbzZs/YCTxlOyvHawnWjliQg48H9l4LHTIPLeY2gVnZK38MdhfM
	h1VXmM9CImdA29w4SUe2k3XdSrc+Tjy+AAX9IK4XusEQynIR6tEl72Y2lzDJkZZThPccKxTnHs9fy
	4Ojlp7w/IKu6kTvlr0Fbn0kDaiAeIwVHLiPEO9QJn4M3sdKH3nqj1cFPA+HY8+QVL/opDqcRCIZ+4
	PkWPuMf2tfpk12FyOCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGZo-007UWK-2q; Mon, 21 Mar 2022 11:51:56 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGZL-007UE0-Sm
 for linux-mediatek@lists.infradead.org; Mon, 21 Mar 2022 11:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=vgh5Qz7xpYNiUd
 NyatSDwqGUyPjgf/Bm/A5158qFWOI=; b=vY6NGv7en2Z3dynFbL7wGT+tMxsrxl
 ywAkLtcy7gYgI6AG4z3XCxcpLy7j7dewtEAUQg76MWAUlSshPl3M3fgVxrcV2yi8
 KriuFDWUIOJnme7pJqiTDTBOnUho4O+0FB0SMQ9yZXnGlG6knp9gnv/bnC1Yayd6
 GEQec/uZaFuDQ=
Received: (qmail 860539 invoked from network); 21 Mar 2022 12:51:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 21 Mar 2022 12:51:13 +0100
X-UD-Smtp-Session: l3s3148p1@1Bn0HLnaFKcgAQnoAFxnAN8BywfgXJ9V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 10/10] mmc: improve API to make clear hw_reset callback is
 for cards
Date: Mon, 21 Mar 2022 12:50:56 +0100
Message-Id: <20220321115059.21803-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
References: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_045128_239046_44A3D2B3 
X-CRM114-Status: GOOD (  16.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To make it unambiguous that the hw_reset callback is for cards and not
for controllers, we add 'card' to the callback name and convert all
users in one go. We keep the argument as mmc_host, though, because the
callback is used very early when mmc_card is not yet populated.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/core.c              | 4 ++--
 drivers/mmc/core/mmc.c               | 4 ++--
 drivers/mmc/host/bcm2835.c           | 2 +-
 drivers/mmc/host/dw_mmc.c            | 2 +-
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 2 +-
 drivers/mmc/host/mtk-sd.c            | 2 +-
 drivers/mmc/host/sdhci.c             | 2 +-
 drivers/mmc/host/sunxi-mmc.c         | 2 +-
 drivers/mmc/host/uniphier-sd.c       | 2 +-
 include/linux/mmc/host.h             | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 7e48570007f9..9b8455c6e0c3 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -1989,9 +1989,9 @@ static void mmc_card_hw_reset_for_init(struct mmc_host *host)
 {
 	mmc_pwrseq_reset(host);
 
-	if (!(host->caps & MMC_CAP_HW_RESET) || !host->ops->hw_reset)
+	if (!(host->caps & MMC_CAP_HW_RESET) || !host->ops->card_hw_reset)
 		return;
-	host->ops->hw_reset(host);
+	host->ops->card_hw_reset(host);
 }
 
 /**
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 1857f398298b..9ea837e2c1ab 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2225,11 +2225,11 @@ static int _mmc_card_hw_reset(struct mmc_card *card)
 	 */
 	_mmc_flush_cache(host);
 
-	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->hw_reset &&
+	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
 	     mmc_can_reset(card)) {
 		/* If the card accept RST_n signal, send it. */
 		mmc_set_clock(host, host->f_init);
-		host->ops->hw_reset(host);
+		host->ops->card_hw_reset(host);
 		/* Set initial state and call mmc_set_ios */
 		mmc_set_initial_state(host);
 	} else {
diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index 463b707d9e99..641ab4f42125 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -1259,7 +1259,7 @@ static void bcm2835_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 static const struct mmc_host_ops bcm2835_ops = {
 	.request = bcm2835_request,
 	.set_ios = bcm2835_set_ios,
-	.hw_reset = bcm2835_reset,
+	.card_hw_reset = bcm2835_reset,
 };
 
 static int bcm2835_add_host(struct bcm2835_host *host)
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 06dc56cbada8..581614196a84 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1812,7 +1812,7 @@ static const struct mmc_host_ops dw_mci_ops = {
 	.set_ios		= dw_mci_set_ios,
 	.get_ro			= dw_mci_get_ro,
 	.get_cd			= dw_mci_get_cd,
-	.hw_reset               = dw_mci_hw_reset,
+	.card_hw_reset          = dw_mci_hw_reset,
 	.enable_sdio_irq	= dw_mci_enable_sdio_irq,
 	.ack_sdio_irq		= dw_mci_ack_sdio_irq,
 	.execute_tuning		= dw_mci_execute_tuning,
diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index 28aa78aa08f3..e92e63cb5641 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -511,7 +511,7 @@ static int meson_mx_sdhc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 }
 
 static const struct mmc_host_ops meson_mx_sdhc_ops = {
-	.hw_reset			= meson_mx_sdhc_hw_reset,
+	.card_hw_reset			= meson_mx_sdhc_hw_reset,
 	.request			= meson_mx_sdhc_request,
 	.set_ios			= meson_mx_sdhc_set_ios,
 	.card_busy			= meson_mx_sdhc_card_busy,
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index e61b0b98065a..195dc897188b 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2458,7 +2458,7 @@ static const struct mmc_host_ops mt_msdc_ops = {
 	.execute_tuning = msdc_execute_tuning,
 	.prepare_hs400_tuning = msdc_prepare_hs400_tuning,
 	.execute_hs400_tuning = msdc_execute_hs400_tuning,
-	.hw_reset = msdc_hw_reset,
+	.card_hw_reset = msdc_hw_reset,
 };
 
 static const struct cqhci_host_ops msdc_cmdq_ops = {
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 07c6da1f2f0f..22152029e14c 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2999,7 +2999,7 @@ static const struct mmc_host_ops sdhci_ops = {
 	.set_ios	= sdhci_set_ios,
 	.get_cd		= sdhci_get_cd,
 	.get_ro		= sdhci_get_ro,
-	.hw_reset	= sdhci_hw_reset,
+	.card_hw_reset	= sdhci_hw_reset,
 	.enable_sdio_irq = sdhci_enable_sdio_irq,
 	.ack_sdio_irq    = sdhci_ack_sdio_irq,
 	.start_signal_voltage_switch	= sdhci_start_signal_voltage_switch,
diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index c62afd212692..0e8fbf4957d8 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1115,7 +1115,7 @@ static const struct mmc_host_ops sunxi_mmc_ops = {
 	.get_cd		 = mmc_gpio_get_cd,
 	.enable_sdio_irq = sunxi_mmc_enable_sdio_irq,
 	.start_signal_voltage_switch = sunxi_mmc_volt_switch,
-	.hw_reset	 = sunxi_mmc_hw_reset,
+	.card_hw_reset	 = sunxi_mmc_hw_reset,
 	.card_busy	 = sunxi_mmc_card_busy,
 };
 
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index ccbf9885a52b..3a8defdcca77 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -597,7 +597,7 @@ static int uniphier_sd_probe(struct platform_device *pdev)
 			ret = PTR_ERR(priv->rst_hw);
 			goto free_host;
 		}
-		host->ops.hw_reset = uniphier_sd_hw_reset;
+		host->ops.card_hw_reset = uniphier_sd_hw_reset;
 	}
 
 	if (host->mmc->caps & MMC_CAP_UHS) {
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 7afb57cab00b..c193c50ccd78 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -181,7 +181,7 @@ struct mmc_host_ops {
 					 unsigned int max_dtr, int host_drv,
 					 int card_drv, int *drv_type);
 	/* Reset the eMMC card via RST_n */
-	void	(*hw_reset)(struct mmc_host *host);
+	void	(*card_hw_reset)(struct mmc_host *host);
 	void	(*card_event)(struct mmc_host *host);
 
 	/*
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
