Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98641C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSVRkP1CEN/2Cgd43eVZqXzzvCIz80rEAhuUK1PkoaA=; b=V58i/v0VliO55x
	Vt9aZDKhQ8W1hoaJK0IU4ZHzdWdpNX+0rUfQZYsdxMuRwCiR61vQ9YCGDgNtaHETYMBolzUUzL8tW
	48mcKGf+HNZPwuxUkmNhjIXHwYIMkUrmE3AXyuCw2P7FBMSihPEu13xLfMgp0skuurhOeaMtDMdUV
	+Q8JuDqcBjckf1AS2BJ5l245yGayXljug2HVeYMVyp4lD/FgQ9qG3BtK2rtfZ45Ltvy9z9Cpf1pOe
	HSHouvDdRBaFJ3HqkpRKZZoKVQkK3j1HLbVWxZ0E3+ZLZkVQWY0FfH9r1xnAmqlq4NJGg8VkB+a5W
	QtATFEeYA6CzkRwu+EXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCfS-000000029MG-2S0W;
	Thu, 21 Mar 2024 07:16:50 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCfP-000000029KR-2m98
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 07:16:49 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-690caa6438aso4433236d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Mar 2024 00:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711005399; x=1711610199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSVRkP1CEN/2Cgd43eVZqXzzvCIz80rEAhuUK1PkoaA=;
        b=HvknTrQFTVLVP2ymUQJ+X2ulDWKPAl4uh1p67UNBoYBsORIJDUtR4Fm4oXRiiSs1mu
         r3mhwwn3+fNMdkpTffmtE0B10ZwO+UIpYjTESFtj4DQWF3FZe4lPZBdMmDamqRLE4qrq
         YUpHCfFLHUGbzmw9ARGJfMtlyR9+ppkSzIR+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711005399; x=1711610199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSVRkP1CEN/2Cgd43eVZqXzzvCIz80rEAhuUK1PkoaA=;
        b=L4jBt4WaT7vqIZoioFIZfm8ZoRqEJviDcG+FeG3IcWxSk+7W85iExlFb51ND0r3YI+
         coPGMOLgpLRfdjNIqygSvx6k9ck6tUDo3YWJ2w3AgwNBA3BsGnuv+6VQoGPJTHaexM9b
         2gCLoS4+JAYIbt2a7+Mnshl9nEjwRapkTedETw7YhNCtPvXBwTq/K8i0JiqCdx+nVssB
         74RsiVYfNvaRoxvbX32cb/vxQ26EK0vurRJ0E0UFFbUxmx6vw3g05OQh6kC1Y/I+23gU
         Rs2UjZ0XhDxWuIOAkOZfUb2R/KnwrKxNOILykRRjAXbhBowBZzsZlla5De7gSSUMXZbH
         imdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG/DGTDyc/VTOKQ+VxavRr9ha1FcAueaQ8YW7adabUEVM9VCM8iu8DVXG2+LrTrdkAHNWm2HJDr8+N8GlYrjJqLVaW/nAzfD6dPtboB7IuSaXc
X-Gm-Message-State: AOJu0YzJTyOOIC3pfGual7Y0Bbdq9MMfjZapyj4NAz7M/QTbJTEIZQGk
	QAobngRh9FrT2QJ9DfHCHTNZECrTrmk4qNWpqGoDRUXsHD2GwqvtWo8FfMLL37oCIwYd3jRIKwF
	y4Q==
X-Google-Smtp-Source: AGHT+IE7zDY2bPbXvYy4oPA05ILy81XLNYUL1pNTca/VSSwS1G6IzocntbS/L6V+8RGTtIae+u5dmw==
X-Received: by 2002:a05:6a21:3396:b0:1a1:87b5:298b with SMTP id yy22-20020a056a21339600b001a187b5298bmr1341758pzb.21.1711004993178;
        Thu, 21 Mar 2024 00:09:53 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:c1ff:a4cf:ac35:8df6])
        by smtp.gmail.com with ESMTPSA id o1-20020a170902d4c100b001dbcfb4766csm8705582plg.226.2024.03.21.00.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 00:09:52 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] spi: spi-mt65xx: Rename a variable in interrupt handler
Date: Thu, 21 Mar 2024 15:08:58 +0800
Message-ID: <20240321070942.1587146-3-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240321070942.1587146-1-fshao@chromium.org>
References: <20240321070942.1587146-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_001647_713488_0AC522B0 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

All the spi_transfer variables in this file use the name "xfer" except
the one in mtk_spi_interrupt(). Align the naming for consistency and
easier searching.

While at it, reformat one memcpy() usage since the coding style allows
100 column lines today.

This commit has no functional change.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 drivers/spi/spi-mt65xx.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index e4cb22fe0075..36c2f52cd6b8 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -748,7 +748,7 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 	u32 cmd, reg_val, cnt, remainder, len;
 	struct spi_controller *host = dev_id;
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
-	struct spi_transfer *trans = mdata->cur_transfer;
+	struct spi_transfer *xfer = mdata->cur_transfer;
 
 	reg_val = readl(mdata->base + SPI_STATUS0_REG);
 	if (reg_val & MTK_SPI_PAUSE_INT_STATUS)
@@ -762,42 +762,40 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 		return IRQ_HANDLED;
 	}
 
-	if (!host->can_dma(host, NULL, trans)) {
-		if (trans->rx_buf) {
+	if (!host->can_dma(host, NULL, xfer)) {
+		if (xfer->rx_buf) {
 			cnt = mdata->xfer_len / 4;
 			ioread32_rep(mdata->base + SPI_RX_DATA_REG,
-				     trans->rx_buf + mdata->num_xfered, cnt);
+				     xfer->rx_buf + mdata->num_xfered, cnt);
 			remainder = mdata->xfer_len % 4;
 			if (remainder > 0) {
 				reg_val = readl(mdata->base + SPI_RX_DATA_REG);
-				memcpy(trans->rx_buf +
-					mdata->num_xfered +
-					(cnt * 4),
+				memcpy(xfer->rx_buf + (cnt * 4) + mdata->num_xfered,
 					&reg_val,
 					remainder);
 			}
 		}
 
 		mdata->num_xfered += mdata->xfer_len;
-		if (mdata->num_xfered == trans->len) {
+		if (mdata->num_xfered == xfer->len) {
 			spi_finalize_current_transfer(host);
 			return IRQ_HANDLED;
 		}
 
-		len = trans->len - mdata->num_xfered;
+		len = xfer->len - mdata->num_xfered;
 		mdata->xfer_len = min(MTK_SPI_MAX_FIFO_SIZE, len);
 		mtk_spi_setup_packet(host);
 
-		if (trans->tx_buf) {
+		if (xfer->tx_buf) {
 			cnt = mdata->xfer_len / 4;
 			iowrite32_rep(mdata->base + SPI_TX_DATA_REG,
-					trans->tx_buf + mdata->num_xfered, cnt);
+					xfer->tx_buf + mdata->num_xfered, cnt);
 
 			remainder = mdata->xfer_len % 4;
 			if (remainder > 0) {
 				reg_val = 0;
 				memcpy(&reg_val,
-					trans->tx_buf + (cnt * 4) + mdata->num_xfered,
+					xfer->tx_buf + (cnt * 4) + mdata->num_xfered,
 					remainder);
 				writel(reg_val, mdata->base + SPI_TX_DATA_REG);
 			}
@@ -809,21 +807,21 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 	}
 
 	if (mdata->tx_sgl)
-		trans->tx_dma += mdata->xfer_len;
+		xfer->tx_dma += mdata->xfer_len;
 	if (mdata->rx_sgl)
-		trans->rx_dma += mdata->xfer_len;
+		xfer->rx_dma += mdata->xfer_len;
 
 	if (mdata->tx_sgl && (mdata->tx_sgl_len == 0)) {
 		mdata->tx_sgl = sg_next(mdata->tx_sgl);
 		if (mdata->tx_sgl) {
-			trans->tx_dma = sg_dma_address(mdata->tx_sgl);
+			xfer->tx_dma = sg_dma_address(mdata->tx_sgl);
 			mdata->tx_sgl_len = sg_dma_len(mdata->tx_sgl);
 		}
 	}
 	if (mdata->rx_sgl && (mdata->rx_sgl_len == 0)) {
 		mdata->rx_sgl = sg_next(mdata->rx_sgl);
 		if (mdata->rx_sgl) {
-			trans->rx_dma = sg_dma_address(mdata->rx_sgl);
+			xfer->rx_dma = sg_dma_address(mdata->rx_sgl);
 			mdata->rx_sgl_len = sg_dma_len(mdata->rx_sgl);
 		}
 	}
@@ -841,7 +839,7 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 
 	mtk_spi_update_mdata_len(host);
 	mtk_spi_setup_packet(host);
-	mtk_spi_setup_dma_addr(host, trans);
+	mtk_spi_setup_dma_addr(host, xfer);
 	mtk_spi_enable_transfer(host);
 
 	return IRQ_HANDLED;
-- 
2.44.0.396.g6e790dbe36-goog


