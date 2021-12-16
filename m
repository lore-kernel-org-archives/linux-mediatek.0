Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CC5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RIlDb/e1JN13vQ9+Z60Mqr3iNRrgtXlPdSMWqx7g/A=; b=kWjQliuEE+9O6d
	DQijj9Yukh4w9MHi5FZ661kwBOfrMZCJ7jWYhAV4yS7G4ViWOZM7d6SAV52yjh9ngnuTKaJoh7jR1
	Wj6Pf5gV5P4H+Q1BPN03E09B3JFqJqqjJIYAJMCCUdMJXonIdcUzdaRJF/OGKIGvitWlJYh3V/Qhd
	vAjkN8sesPWMRGlUdUoWH+vBqJw7dew8OVqyPDs6Ch9gfdLanT9mFaovGNeK95OleV/r5UxhtxwbB
	AA5Nd7OKf4sMb2ANXRMrh6THgeDL+pTgOHvpWMejHQ7jga/gDHPgEuqVzgD6dfBqz38qD4JTZgXBm
	3NE65Jtcso8vtF6M9ZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxqgY-005jW4-Tj; Thu, 16 Dec 2021 13:20:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqKd-005a3o-TC; Thu, 16 Dec 2021 12:58:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E6C771F4628E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639659476; bh=4TdGbUGIeTVxOIguEjJvEZfyGK3EgCiTdErpnWEzqWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=atnacH+mBG+G5Tq9HQwafvLXg/nC8eiWi2MxeJIo8GRcFnYqpaVy7AiY6FXBqmNXP
 7LOdvnTL7437yXU6tpolFxjase3HSdVyCFBQTis1SHV00mOh4zXwPXJawZrqs/Uz8S
 jRowMD3Xnohgzr7erUgrzGCqpvY2iAuMndkNCMeJlAdsSW/uSH2DQZMAUeBsFZu3aY
 OM5mK7LPANu/mt/qaRR7JCkzmK4WUd3wTqjPJXWOJ5ThA4bAMGIbWbpASM0E1PRg5p
 2v+5FCN9Zl2mSzCfyYvelVdGT9Lz31ylktEq2XCpjR9KTNUnhDCHKvwcDRvbZ4L9JZ
 4rfmqDhj8r4vQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org, matthias.bgg@gmail.com, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/5] mmc: mtk-sd: Take action for no-sdio device-tree parameter
Date: Thu, 16 Dec 2021 13:57:46 +0100
Message-Id: <20211216125748.179602-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216125748.179602-1-angelogioacchino.delregno@collabora.com>
References: <20211216125748.179602-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_045800_151332_86CE42D7 
X-CRM114-Status: GOOD (  11.81  )
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

This driver was unconditionally enabling support for SDIO mode,
but we do have a generic "no-sdio" DT parameter that sets caps2
MMC_CAP2_NO_SDIO.

Modify the HW initialization sequence to enable SDIO support only
if it hasn't been explicitly disabled in device-tree.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index d067636434ca..f08695e52601 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1638,6 +1638,7 @@ static void msdc_init_hw(struct msdc_host *host)
 {
 	u32 val;
 	u32 tune_reg = host->dev_comp->pad_tune_reg;
+	struct mmc_host *mmc = mmc_from_priv(host);
 
 	if (host->reset) {
 		reset_control_assert(host->reset);
@@ -1743,14 +1744,18 @@ static void msdc_init_hw(struct msdc_host *host)
 				     MSDC_PAD_TUNE_RXDLYSEL);
 	}
 
-	/* Configure to enable SDIO mode.
-	 * it's must otherwise sdio cmd5 failed
-	 */
-	sdr_set_bits(host->base + SDC_CFG, SDC_CFG_SDIO);
+	if (mmc->caps2 & MMC_CAP2_NO_SDIO) {
+		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIO);
+		sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INTEN_SDIOIRQ);
+		sdr_clr_bits(host->base + SDC_ADV_CFG0, SDC_DAT1_IRQ_TRIGGER);
+	} else {
+		/* Configure to enable SDIO mode, otherwise SDIO CMD5 fails */
+		sdr_set_bits(host->base + SDC_CFG, SDC_CFG_SDIO);
 
-	/* Config SDIO device detect interrupt function */
-	sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
-	sdr_set_bits(host->base + SDC_ADV_CFG0, SDC_DAT1_IRQ_TRIGGER);
+		/* Config SDIO device detect interrupt function */
+		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
+		sdr_set_bits(host->base + SDC_ADV_CFG0, SDC_DAT1_IRQ_TRIGGER);
+	}
 
 	/* Configure to default data timeout */
 	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC, 3);
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
