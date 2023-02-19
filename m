Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C8C05027
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Feb 2023 23:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2wDpPJkfT2YIwWWbiyfi4z1aOfCgfNG2q7Yxjg6WS/w=; b=TafTeqIUDInok2eWh5n8pwoTUM
	1vHjk55EZYCbzuFCp8eINZC8djSRRwSqke1U7NQOzOi2HIpMNmz9UQZPKw2I64hrx9qX70giu44X+
	Z2jpcKVo1EucQBsoxIyH8MmqxVzsnYBXAkGqeoUe9tLyYDJYue2ggXEDNOekRi/sAKmHlhWL1jD1C
	07seRtZL69jAgqR9iziPoSesqXtf/e/Z8LP7clOGTU2rn3GaT/ZTY4MZBTpzKSFSAlJOv8/6KXyeV
	PaLBd+JUiPZWyOCAc96oEQghElKwmGrBdKZzM/ZRMLNIZF0ofGcPpNZEwOQQ7MFn/QmnnpuNgJ8t9
	4NYZ2LWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTtD8-002VLm-DH; Sun, 19 Feb 2023 23:35:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTtCu-002VKL-IL; Sun, 19 Feb 2023 23:35:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BB37DB80ABC;
	Sun, 19 Feb 2023 23:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23564C433D2;
	Sun, 19 Feb 2023 23:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676849695;
	bh=HpPijLAkeZBcfgpuO4krVSl+jKWdeWQmrUDYyhPWGcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=NsGjE+1Lp+eCe7wYIRJcHYd1KJ1QXkrs8uba2KgCXiVTVm9VfHlSxqhqsFKyYx3nH
	 ZW+5Gfxa5m95Cn0o3sn4WT/vHujk83q4/vwkiMj2eORE8Df1Nn7y3S+CqitnfLAIQY
	 VxIHWE8FFSnAzr4wY9Ypjstyr2KJDN14XMHLyUPLY2i1fjazCq4rLT/E3IitW4fZg2
	 lTT0Gdp0gVvnpOYKwAceBoN0h0It0DBDjK8YtaoiMU6OCRWpQvCeR5uJfSmAQuw2pV
	 GQcVFDgQRYW8aCWY8TRG88kwMEkx8Ea4sANyThy9uiNQZc3QEMnbNG3wuhngg70aI+
	 5KlzsgpCVrVTg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] soc: mediatek: cmdq: Remove unused helper funciton
Date: Sun, 19 Feb 2023 23:34:39 +0000
Message-Id: <20230219233439.3157-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_153500_965912_36978B14 
X-CRM114-Status: GOOD (  14.38  )
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

cmdq_pkt_create(), cmdq_pkt_destroy(), and cmdq_pkt_flush_async()
are not used by all client drivers (MediaTek drm driver and
MediaTek mdp3 driver), so remove them.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 59 --------------------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 28 ------------
 2 files changed, 87 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index c1837a468267..d4ab39236c79 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -104,50 +104,6 @@ void cmdq_mbox_destroy(struct cmdq_client *client)
 }
 EXPORT_SYMBOL(cmdq_mbox_destroy);
 
-struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
-{
-	struct cmdq_pkt *pkt;
-	struct device *dev;
-	dma_addr_t dma_addr;
-
-	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
-	if (!pkt)
-		return ERR_PTR(-ENOMEM);
-	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base) {
-		kfree(pkt);
-		return ERR_PTR(-ENOMEM);
-	}
-	pkt->buf_size = size;
-	pkt->cl = (void *)client;
-
-	dev = client->chan->mbox->dev;
-	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
-				  DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, dma_addr)) {
-		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
-		kfree(pkt->va_base);
-		kfree(pkt);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	pkt->pa_base = dma_addr;
-
-	return pkt;
-}
-EXPORT_SYMBOL(cmdq_pkt_create);
-
-void cmdq_pkt_destroy(struct cmdq_pkt *pkt)
-{
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
-			 DMA_TO_DEVICE);
-	kfree(pkt->va_base);
-	kfree(pkt);
-}
-EXPORT_SYMBOL(cmdq_pkt_destroy);
-
 static int cmdq_pkt_append_command(struct cmdq_pkt *pkt,
 				   struct cmdq_instruction inst)
 {
@@ -425,19 +381,4 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
-{
-	int err;
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	err = mbox_send_message(client->chan, pkt);
-	if (err < 0)
-		return err;
-	/* We can send next packet immediately, so just call txdone. */
-	mbox_client_txdone(client->chan, 0);
-
-	return 0;
-}
-EXPORT_SYMBOL(cmdq_pkt_flush_async);
-
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 2b498f4f3946..60e4c0ca52a1 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -57,21 +57,6 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index);
  */
 void cmdq_mbox_destroy(struct cmdq_client *client);
 
-/**
- * cmdq_pkt_create() - create a CMDQ packet
- * @client:	the CMDQ mailbox client
- * @size:	required CMDQ buffer size
- *
- * Return: CMDQ packet pointer
- */
-struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size);
-
-/**
- * cmdq_pkt_destroy() - destroy the CMDQ packet
- * @pkt:	the CMDQ packet
- */
-void cmdq_pkt_destroy(struct cmdq_pkt *pkt);
-
 /**
  * cmdq_pkt_write() - append write command to the CMDQ packet
  * @pkt:	the CMDQ packet
@@ -264,17 +249,4 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
- *                          packet and call back at the end of done packet
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- *
- * Trigger CMDQ to asynchronously execute the CMDQ packet and call back
- * at the end of done packet. Note that this is an ASYNC function. When the
- * function returned, it may or may not be finished.
- */
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
-
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.34.1


