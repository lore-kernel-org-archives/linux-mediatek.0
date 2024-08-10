Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF7BC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Aug 2024 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kt8rA/3mRtd87yJ9Hq4/1ce3UKML39DlL8vEnJCE960=; b=gMOc2bCcPvi0i2K5zUGJvwQxVS
	80w4Wdon0uteVQoagKgnVdv1Erv/8nFXDUjcUIj1BxjxlKwjjkbUVaCDbLs4bP7SHSnA5CvpyXtTC
	Xo77++70ExWDwoICwMgMAyDcv6ws/U2FbtMxGqr5XAQHh9PVpfBXy57uZnjPmtOOajnNzeO15on4W
	qcoZGlnI7XucyeLcBHlUS3cX8BKp7f/ACZ5k6vGyiUSPYimVUjFeY7DjrWvCgGqrgZ2zj1cEqRMv2
	cn07m7qmq7kJgHdyv67OMWQFcdJIVUsg0usTGNanJZDRK7T49QvqFQuF8YFUTL/evzxpK6G/uUyXV
	yl47MMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci85-0000000Dn9S-3n47;
	Sat, 10 Aug 2024 09:11:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci6Q-0000000DmF5-1InC;
	Sat, 10 Aug 2024 09:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57EC060AC9;
	Sat, 10 Aug 2024 09:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787E4C32781;
	Sat, 10 Aug 2024 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723280973;
	bh=HspsSskBa2s3o+CjExE7DqUE/JIgX3VED+Eb67tWGS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kF7YFE/2LlWrLH2YjCy2uRPJgfw+n22HeBfBcO0ao5x77U84Kz9JIRKr6VlnT2ZLG
	 nuQH9W6hvA7GdI/fdeK7CSzcAGuLeuZCn61vWIoJJM7GjljMKn7DfpqjYUhLN+gKBC
	 BkmOLv2nHfNvtXYAD/+1cYHpnnoZqshoJdq41/dgXIpdNy4PVuX2UlV7Olsy5ooOOJ
	 gowd2Dxt6EF4DnIIhYADwtrxPIGVLD2q3R23jgEXUPs66aeWaYzhhq3vNtUULejsuD
	 NW8mKozh8GopMFavdh00U/bfRySSdk41tc0JiEPHGApzpxBN9lBCWK9wA1plPLcrCX
	 tQm2FtdeRXkRg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 2/5] drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
Date: Sat, 10 Aug 2024 09:09:15 +0000
Message-Id: <20240810090918.7457-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810090918.7457-1-chunkuang.hu@kernel.org>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_020934_609863_24FE1FB1 
X-CRM114-Status: GOOD (  11.34  )
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

Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
instead of implementing drm version.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 46 +++--------------------------
 1 file changed, 4 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index a1976c3ae001..5413c0c3dfe8 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -113,44 +113,6 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 	}
 }
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
-				   size_t size)
-{
-	struct device *dev;
-	dma_addr_t dma_addr;
-
-	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base)
-		return -ENOMEM;
-
-	pkt->buf_size = size;
-	pkt->cl = (void *)client;
-
-	dev = client->chan->mbox->dev;
-	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
-				  DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, dma_addr)) {
-		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
-		kfree(pkt->va_base);
-		return -ENOMEM;
-	}
-
-	pkt->pa_base = dma_addr;
-
-	return 0;
-}
-
-static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
-{
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
-			 DMA_TO_DEVICE);
-	kfree(pkt->va_base);
-}
-#endif
-
 static void mtk_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
@@ -158,7 +120,7 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
+	cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
 
 	if (mtk_crtc->cmdq_client.chan) {
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
@@ -1094,9 +1056,9 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 			mbox_free_channel(mtk_crtc->cmdq_client.chan);
 			mtk_crtc->cmdq_client.chan = NULL;
 		} else {
-			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
-						      &mtk_crtc->cmdq_handle,
-						      PAGE_SIZE);
+			ret = cmdq_pkt_create(&mtk_crtc->cmdq_client,
+					      &mtk_crtc->cmdq_handle,
+					      PAGE_SIZE);
 			if (ret) {
 				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
 					drm_crtc_index(&mtk_crtc->base));
-- 
2.34.1


