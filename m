Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D699EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 02:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACA3617E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 02:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7ACA3617E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/D0G0MgYHDfvcMBvZnh+X5rtLZJecn5u4KcFmniqGs=; b=pxaQUMrPmuFReq
	vjJROTYN0LYHPjfheO9yXd2QZSsn/vYwrV8aTaO/oj8zZJ0vXH4DYKluLbJm/ZjWmDG8XMVxyJctN
	L4gkblsD1lem4N6nl1WcBX3SRBGiVrmLeWjK9bwCXwMRWDIXo3TK94Ny4+L6m90tAbzNXfqG3FMqW
	nzGNGnaQCjSDUZJz9skDnMHs9dOsu+5BaD6G0xCTXhpT/wuMi30lggP3NumvDxmH/YFT+5wkNfWHR
	lpbd3YngwBHKjp6T59ii0rmX6Z50CzDCCa8jmvtsKEQsh/HOrd7Uh2Vh1xjS2z35pgpEFJ65XrXKK
	AJEHxmV96SamqjYEBpoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVm7H-00CoON-ID; Thu, 30 Sep 2021 02:48:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVm6N-00Co1q-Gf; Thu, 30 Sep 2021 02:47:17 +0000
X-UUID: 2634b7d9f7044d91b8d7841f28557de6-20210929
X-UUID: 2634b7d9f7044d91b8d7841f28557de6-20210929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1808763230; Wed, 29 Sep 2021 19:47:09 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 19:47:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 10:47:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Sep 2021 10:47:06 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hsinyi@chromium.org>, <fshao@chromium.org>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [v2 PATCH 1/3] drm/mediatek: Fix crash at using pkt->cl->chan in
 cmdq_pkt_finalize
Date: Thu, 30 Sep 2021 10:47:02 +0800
Message-ID: <20210930024704.6966-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_194715_638068_23746CA6 
X-CRM114-Status: GOOD (  18.15  )
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

Because mtk_drm_crtc_create_pkt didn't assign pkt->cl, it will
crash at using pkt->cl->chan in cmdq_pkt_finalize.

So add struct cmdq_client and let mtk_drm_crtc instance define
cmdq_client as:

struct mtk_drm_crtc {
	/* client instance data */
	struct cmdq_client cmdq_client;
};

and in rx_callback function can use pkt->cl to get
struct cmdq_client.

Fixes: f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 73 +++++++++++++------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5f81489fc60c..411d99fcbb8f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -52,8 +52,7 @@ struct mtk_drm_crtc {
 	bool				pending_async_planes;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct mbox_client		cmdq_cl;
-	struct mbox_chan		*cmdq_chan;
+	struct cmdq_client		cmdq_client;
 	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
@@ -227,8 +226,8 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
-				    size_t size)
+static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
+				   size_t size)
 {
 	struct device *dev;
 	dma_addr_t dma_addr;
@@ -239,8 +238,9 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
 		return -ENOMEM;
 	}
 	pkt->buf_size = size;
+	pkt->cl = (void *)client;
 
-	dev = chan->mbox->dev;
+	dev = client->chan->mbox->dev;
 	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
 				  DMA_TO_DEVICE);
 	if (dma_mapping_error(dev, dma_addr)) {
@@ -255,9 +255,11 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
 	return 0;
 }
 
-static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
+static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
 {
-	dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size,
+	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
+
+	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
 	kfree(pkt);
@@ -265,8 +267,9 @@ static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pk
 
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
-	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
+	struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
+	struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
 	struct mtk_crtc_state *state;
 	unsigned int i;
 
@@ -299,7 +302,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
-	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
+	mtk_drm_cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
@@ -550,24 +553,24 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		mtk_mutex_release(mtk_crtc->mutex);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (mtk_crtc->cmdq_chan) {
-		mbox_flush(mtk_crtc->cmdq_chan, 2000);
+	if (mtk_crtc->cmdq_client.chan) {
+		mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
 		cmdq_handle->cmd_buf_size = 0;
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox->dev,
-					    cmdq_handle->pa_base,
-					    cmdq_handle->cmd_buf_size,
-					    DMA_TO_DEVICE);
+		dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
+					   cmdq_handle->pa_base,
+					   cmdq_handle->cmd_buf_size,
+					   DMA_TO_DEVICE);
 		/*
 		 * CMDQ command should execute in next vblank,
 		 * If it fail to execute in next 2 vblank, timeout happen.
 		 */
 		mtk_crtc->cmdq_vblank_cnt = 2;
-		mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
+		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
+		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -581,7 +584,7 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
 		mtk_crtc_ddp_config(crtc, NULL);
 	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
 		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
@@ -924,20 +927,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
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
+	mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
+	mtk_crtc->cmdq_client.client.tx_block = false;
+	mtk_crtc->cmdq_client.client.knows_txdone = true;
+	mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
+	mtk_crtc->cmdq_client.chan =
+			mbox_request_channel(&mtk_crtc->cmdq_client.client,
+					     drm_crtc_index(&mtk_crtc->base));
+	if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
-		mtk_crtc->cmdq_chan = NULL;
+		mtk_crtc->cmdq_client.chan = NULL;
 	}
 
-	if (mtk_crtc->cmdq_chan) {
+	if (mtk_crtc->cmdq_client.chan) {
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
@@ -945,17 +948,17 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			mbox_free_channel(mtk_crtc->cmdq_chan);
-			mtk_crtc->cmdq_chan = NULL;
+			mbox_free_channel(mtk_crtc->cmdq_client.chan);
+			mtk_crtc->cmdq_client.chan = NULL;
 		} else {
-			ret = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan,
-						       &mtk_crtc->cmdq_handle,
-						       PAGE_SIZE);
+			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
+						      &mtk_crtc->cmdq_handle,
+						      PAGE_SIZE);
 			if (ret) {
 				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
 					drm_crtc_index(&mtk_crtc->base));
-				mbox_free_channel(mtk_crtc->cmdq_chan);
-				mtk_crtc->cmdq_chan = NULL;
+				mbox_free_channel(mtk_crtc->cmdq_client.chan);
+				mtk_crtc->cmdq_client.chan = NULL;
 			}
 		}
 	}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
