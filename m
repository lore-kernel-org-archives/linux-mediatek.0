Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBECC54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 06:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZAfwv86coCz5ya7gMWl0Ox3qdQ9eNNNMvWYUUmsfUA=; b=MebnXI0s/78F0F
	EZ68ph3OWUkC2Eq230Ztn6swF08VJ+gbswv1ParkuMGisU6kXMzyaDmGNNuW/Y0dpvf2HNAXAYiTc
	crGTS5J4EifaPMmTIVuZXIVCsRt/2myUi1A4B2nZqrGMuR1p4bDAICgG+ulasISbP4VoPvk/8uMsz
	HtL8iDVCdsb8iAICxdgtUE/ws7RQGJJ0jhJ4zOGOo+nrYMZSMLliIr1ro/2GfLbImCUJ3k9+AwDPb
	gNzSgjjgA+Thvee/cqmFrzRSlDXeEsSwC1j3PxGnzmsYyl7OlUg26TV2UqSzhA9vFc9jZgQGzZqk5
	NZiEYhbN4BME8IPHjDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnC9I-000000024M7-29ks;
	Thu, 21 Mar 2024 06:43:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnC9G-000000024Ku-0XTz
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 06:43:35 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso432262b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Mar 2024 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711003412; x=1711608212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZAfwv86coCz5ya7gMWl0Ox3qdQ9eNNNMvWYUUmsfUA=;
        b=Mebimv6NKbjUu3x6R2FX1mZj4bQVRyfp8/uPs7eRMgo07W049pngv8iZXzR85YAXIB
         iM+KSLsbkNdYxvh0vuVIWn0S4S6nxlEY7AaWIKBSz4DBkRaL+S07BsAH5du3pPlcopCR
         RDSuHgREBRRiS5+QxneNJ+sfMt5zDY1YePYnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711003412; x=1711608212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZAfwv86coCz5ya7gMWl0Ox3qdQ9eNNNMvWYUUmsfUA=;
        b=KzKmloe3ufyBJaCV2yu2WxLN9GVxzcO/7dTmW+pnaIncV1S4nPCPmzMPbaYwoHI5l5
         OfVD5U5mCSoySvXMZnAKMJI7J+VmpnJjIAx9iNkie2WwH9o1ezMVe0+G350CKnfScd+S
         o5SAIqGPxFAxwyZXzXN1x5VdXvCcvrXhfZadRnFRhgalQeEwgHKeGmmoW/ioFMxvt20A
         /mz9tL2dHI/mAN1C2MavCP1B3V5d+exTCzAjcHYx8WGA0wQu+pZtMdYV2G9UepInL/S3
         18QhZa2ZedJzO7FXIW55G4AX5No703syh6eZqKN4s5rgxr/yJ8QKuVpT3sWlDsPZxsmk
         hoLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6WQ9v99U32bQj0mDxXG0y1nBwqNJ8jnyZqjXnc9yhmihH5eGMYA1pPUAEfmWR7aljtDkO4G/LBNSXWBTAtBpHKkeoXsMCwj7Ws0OIUMNCSY2z
X-Gm-Message-State: AOJu0YwEWnd3Rz+5UsZOQvKLLXcr+YINqnJF/H1HpGKG+4K3TwAxltoW
	vwpzQmHGO1fwSk2vHzfLjfLF2h4/452QcXaolsTlVoJVs9g4PGLAjlYS5SlcOw==
X-Google-Smtp-Source: AGHT+IHJ7XBfPwZHrNtWiP2YqVZanIquFTWV/V+ARNJsur65k8HYfqQbCwDBftzvaRVLDOior2pzIg==
X-Received: by 2002:a05:6a00:2d1e:b0:6e6:c73b:bec2 with SMTP id fa30-20020a056a002d1e00b006e6c73bbec2mr2482638pfb.14.1711003411802;
        Wed, 20 Mar 2024 23:43:31 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:c1ff:a4cf:ac35:8df6])
        by smtp.gmail.com with ESMTPSA id lb3-20020a056a004f0300b006e664031f10sm12874938pfb.51.2024.03.20.23.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 23:43:31 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] spi: spi-mt65xx: Rename a variable in interrupt handler
Date: Thu, 21 Mar 2024 14:41:02 +0800
Message-ID: <20240321064313.1385316-3-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240321064313.1385316-1-fshao@chromium.org>
References: <20240321064313.1385316-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_234334_333210_4AFED44D 
X-CRM114-Status: GOOD (  14.09  )
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

 drivers/spi/spi-mt65xx.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 86ea822c942b..aaa0006a02a3 100644
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
@@ -808,21 +806,21 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
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
@@ -840,7 +838,7 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 
 	mtk_spi_update_mdata_len(host);
 	mtk_spi_setup_packet(host);
-	mtk_spi_setup_dma_addr(host, trans);
+	mtk_spi_setup_dma_addr(host, xfer);
 	mtk_spi_enable_transfer(host);
 
 	return IRQ_HANDLED;
-- 
2.44.0.396.g6e790dbe36-goog


