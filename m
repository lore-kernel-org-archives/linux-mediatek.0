Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F014C48BC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZGzN7ubTR177376omnKYws6LluzZVJncHmcsyGwrDg=; b=ebcKUXoBl2vH85DZ23SME5AHvO
	ST18pcQp3GkghzaifXV1BBf7/Mga6auRHpSlVzrMsfIMORWvdPaWZNql9Dh9bJUqjPuM0AZw87bDi
	cYk7YF+UxJDjLr4QrzBaXqGLk6EyJR159I0lmNWkwomLel2eB8XsvZuidnpzLjWmn4yAwUL0d9ftI
	pdDYcrbxK7CgYaSWPU12fw7o9y4ZatR86gzTQ6XuTSs1w5Nqh0mVOda8U7uYgd2U2OcfFhqwEKKqG
	JjASpsJG4m6B0JGqX/7LAxgnTbZCt+zQZ6m79d+89HM4jaxANbIGA45Uu0oBk+0X2eU8hTSWuBSn+
	GMDuHK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPx4-0000000Eh3d-1iMV;
	Thu, 15 Feb 2024 00:50:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPx0-0000000Eh1U-3ExX;
	Thu, 15 Feb 2024 00:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 534666125A;
	Thu, 15 Feb 2024 00:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3283C433C7;
	Thu, 15 Feb 2024 00:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958203;
	bh=oUOUUVVZ6ZE4H6VaL1Zw1wSnRwLVun/8c8sWOEB2D/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ag2V3tuALPT3VgSFUAo0/klHrjQ1WrIxAcOnBaBzhTzZNXXmzIBi8I57TIRA+X+f6
	 DZ4WhHkUDXfc9y+xKp8iuiAK3VRfZoWcd5vdiBzBlxguWE/Mi1WBf06pLgdFHZXME5
	 fMdHBlzoNgRzeNGcbWJH305rIsF4lhWzo6GUAoT6ZLLZx1QMVxNeXCHSheR/LEieWj
	 qXowmJgTqmuADgl3uczYo9+kOUVGepiC+M2XGGG+ntsuCdgM4FOBy+KK5hHrebpFTE
	 MN1qK1AdRLMQkLsvVVljZAbgOfW8kiPU1MesybPiIgXTwXAqIA0YOZ+RMrrqIsHq1j
	 cpskpba95MXew==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 1/9] soc: mediatek: cmdq: Remove unused helper funciton
Date: Thu, 15 Feb 2024 00:49:23 +0000
Message-Id: <20240215004931.3808-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165006_923659_88235063 
X-CRM114-Status: GOOD (  14.73  )
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
 include/linux/soc/mediatek/mtk-cmdq.h  | 40 -----------------
 2 files changed, 99 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b0cd071c4719..67e17974d1e6 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -105,50 +105,6 @@ void cmdq_mbox_destroy(struct cmdq_client *client)
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
@@ -426,19 +382,4 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
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
index 649955d2cf5c..6c42d817d368 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -59,21 +59,6 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index);
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
@@ -266,19 +251,6 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
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
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -294,13 +266,6 @@ static inline struct cmdq_client *cmdq_mbox_create(struct device *dev, int index
 
 static inline void cmdq_mbox_destroy(struct cmdq_client *client) { }
 
-static inline  struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
-{
-	return ERR_PTR(-EINVAL);
-}
-
-static inline void cmdq_pkt_destroy(struct cmdq_pkt *pkt) { }
-
 static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
 {
 	return -ENOENT;
@@ -384,11 +349,6 @@ static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
-{
-	return -EINVAL;
-}
-
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.34.1


