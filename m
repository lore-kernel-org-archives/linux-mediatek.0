Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D36C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F58560E53
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F58560E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGflP4VjKLFF7b2YrK8BVX2C410phRYbGsW3FlWZE6c=; b=DEIrp8Iqc9XpOi
	k8XWmSLLuuLEljF5oxmo+5fsSzscfxdlW3zrzJI7Ae2p1rqyJ7A0DUj97NzFf7GM+f8eiQeK+0tIs
	tXiq3gmgF2GBH+djO0cy12B3ELrq2PKu816guPRM6Eubm+A2CM9NP+dh97NXvH1GZOowbyzs60URk
	VrevBlD6K9jiV1Bgb5b/1Zp2ygY0eFAvozs2j5apd/qg5Rbd0nnAxePAsCfntdSCqsvhPmZrdCJJ7
	1yu7dFjjmBdhDZTf1mYQCp/yZ0v7/6F3UZJkA6ytkPek2pFlzSLZ0wbI5/5l482iAUOCnMSR+fk50
	x6emHI0jdz9dhFO8xF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYdCk-0015Q3-E1; Thu, 07 Oct 2021 23:53:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYdCW-0015F9-QG
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 23:53:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2343061090;
 Thu,  7 Oct 2021 23:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650804;
 bh=mPRVdtxzBthmAzQsdEWN6hMyf+MHv7KWVtcwYta4aVc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z/ZAdieFY4/KWaLn+0UR5xpDC91Z8RhCchUxaUJdafOwY8GM8CymsakgPE9E35EAs
 n3oZSE2AqABe3dct69b0UJSk+dAHpVpFguP+NL8FfX+/pWNOkIC1QaBq9h3evTvSxY
 xrDFrJX6a5pLzWaNsSkiOhpCdnC1EtVNlqCEnqpB9xOgHUCfusG0OaFp1tKD3Q4m1V
 kK8eOpr1aGdi0PMJpmsX78d88kdNLKf7mmqQp2ZE7wUxA3gVAh++na9XmAJkhCdi/J
 o3wTyDJp3fm4VVlP0mxI2mg0drQ5G4P0rKJ6I3zSaL33Ur4IM/IhB5IwpyflaEN320
 dqeShNSkuMuTQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 4/5] Revert "drm/mediatek: Remove struct cmdq_client"
Date: Fri,  8 Oct 2021 07:53:09 +0800
Message-Id: <20211007235310.14626-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007235310.14626-1-chunkuang.hu@kernel.org>
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_165325_467355_768D5848 
X-CRM114-Status: GOOD (  12.56  )
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

This reverts commit f4be17cd5b14dd73545b0e014a63ebe9ab5ef837.

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch and all the patches depend on that patch.

Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 80 ++++++-------------------
 1 file changed, 18 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0cd5b9ed8956..3f9802d21bf0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -52,8 +52,7 @@ struct mtk_drm_crtc {
 	bool				pending_async_planes;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct mbox_client		cmdq_cl;
-	struct mbox_chan		*cmdq_chan;
+	struct cmdq_client		*cmdq_client;
 	u32				cmdq_event;
 #endif
 
@@ -225,51 +224,11 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static struct cmdq_pkt *mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, size_t size)
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
-
-	dev = chan->mbox->dev;
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
-
-static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
-{
-	dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size,
-			 DMA_TO_DEVICE);
-	kfree(pkt->va_base);
-	kfree(pkt);
-}
-
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
-	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
 
-	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
+	cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
@@ -513,19 +472,19 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		mtk_mutex_release(mtk_crtc->mutex);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (mtk_crtc->cmdq_chan) {
-		mbox_flush(mtk_crtc->cmdq_chan, 2000);
-		cmdq_handle = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan, PAGE_SIZE);
+	if (mtk_crtc->cmdq_client) {
+		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
+		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox->dev,
+		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
 					    cmdq_handle->pa_base,
 					    cmdq_handle->cmd_buf_size,
 					    DMA_TO_DEVICE);
-		mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
+		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
+		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -539,7 +498,7 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
 #else
 	if (!priv->data->shadow_register)
 #endif
@@ -879,20 +838,17 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	mutex_init(&mtk_crtc->hw_lock);
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_crtc->cmdq_cl.dev = mtk_crtc->mmsys_dev;
-	mtk_crtc->cmdq_cl.tx_block = false;
-	mtk_crtc->cmdq_cl.knows_txdone = true;
-	mtk_crtc->cmdq_cl.rx_callback = ddp_cmdq_cb;
-	mtk_crtc->cmdq_chan =
-			mbox_request_channel(&mtk_crtc->cmdq_cl,
-					      drm_crtc_index(&mtk_crtc->base));
-	if (IS_ERR(mtk_crtc->cmdq_chan)) {
+	mtk_crtc->cmdq_client =
+			cmdq_mbox_create(mtk_crtc->mmsys_dev,
+					 drm_crtc_index(&mtk_crtc->base));
+	if (IS_ERR(mtk_crtc->cmdq_client)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
-		mtk_crtc->cmdq_chan = NULL;
+		mtk_crtc->cmdq_client = NULL;
 	}
 
-	if (mtk_crtc->cmdq_chan) {
+	if (mtk_crtc->cmdq_client) {
+		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
@@ -900,8 +856,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			mbox_free_channel(mtk_crtc->cmdq_chan);
-			mtk_crtc->cmdq_chan = NULL;
+			cmdq_mbox_destroy(mtk_crtc->cmdq_client);
+			mtk_crtc->cmdq_client = NULL;
 		}
 	}
 #endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
