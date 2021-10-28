Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB17C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 10:29:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D9960724
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 10:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4D9960724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWpxXgoKDsAyen80gah5vLhPDU89iwUz9L/uvu2Frvc=; b=2TyoLKQsz/p6k6
	u+RljTO9ZHLXkzPnmtEJFbX3ZZRVZFBGE/xpG8BQ1yEozuwsqwPHbBiR7laNNHN9HBas0zGOzVSLs
	9a2xTeKOVOC3sKbtTT2uM4ogQdoquagAac9aT4P34/ta9kFUIHhhPRjYVHmpCXMMXLbxhaAHbAwwu
	YAe8k2dBwH+436YHmQhfRDD51p2Cd5UFBae2WchQyk5358Cumb/nyQd1oavlW87X1WvPPHdFyYGy8
	B06Q9sRvLxDabERce1kgeTBAazcaN5+0qqSCT6K87iP3uB15iXFE2b6jg4wMh1B2bWk78MYNATYRv
	aJuFhQGiSAXG77FV9UVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg2f3-007Xt8-3n; Thu, 28 Oct 2021 10:29:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg2f0-007Xsj-Nc; Thu, 28 Oct 2021 10:29:28 +0000
X-UUID: 50853ba3f8034145aae06e825fc6439e-20211028
X-UUID: 50853ba3f8034145aae06e825fc6439e-20211028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 843164320; Thu, 28 Oct 2021 03:29:19 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 03:19:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 18:19:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 28 Oct 2021 18:19:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Subject: [PATCH v6 4/6] drm/mediatek: Add cmdq_handle in mtk_crtc
Date: Thu, 28 Oct 2021 18:19:10 +0800
Message-ID: <20211028101912.4624-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
References: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_032926_808405_0D1B19D3 
X-CRM114-Status: GOOD (  14.43  )
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

From: Chun-Kuang Hu <chunkuang.hu@kernel.org>

One mtk_crtc need just one cmdq_handle, so add one cmdq_handle
in mtk_crtc to prevent frequently allocation and free of
cmdq_handle.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 62 +++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a368cbc18923..56ff09a26dd1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -53,6 +53,7 @@ struct mtk_drm_crtc {
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct cmdq_client		cmdq_client;
+	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
 #endif
@@ -107,12 +108,55 @@ static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	}
 }
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
+				   size_t size)
+{
+	struct device *dev;
+	dma_addr_t dma_addr;
+
+	pkt->va_base = kzalloc(size, GFP_KERNEL);
+	if (!pkt->va_base) {
+		kfree(pkt);
+		return -ENOMEM;
+	}
+	pkt->buf_size = size;
+	pkt->cl = (void *)client;
+
+	dev = client->chan->mbox->dev;
+	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
+				  DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, dma_addr)) {
+		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
+		kfree(pkt->va_base);
+		kfree(pkt);
+		return -ENOMEM;
+	}
+
+	pkt->pa_base = dma_addr;
+
+	return 0;
+}
+
+static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
+{
+	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
+
+	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
+			 DMA_TO_DEVICE);
+	kfree(pkt->va_base);
+	kfree(pkt);
+}
+#endif
+
 static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 
 	mtk_mutex_put(mtk_crtc->mutex);
-
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
+#endif
 	drm_crtc_cleanup(crtc);
 }
 
@@ -227,12 +271,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
-	struct cmdq_cb_data *data = mssg;
 	struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
 	struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
-	cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
@@ -438,7 +480,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 				       bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_pkt *cmdq_handle;
+	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
@@ -478,7 +520,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client.chan) {
 		mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
-		cmdq_handle = cmdq_pkt_create(&mtk_crtc->cmdq_client, PAGE_SIZE);
+		cmdq_handle->cmd_buf_size = 0;
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
@@ -877,6 +919,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				drm_crtc_index(&mtk_crtc->base));
 			mbox_free_channel(mtk_crtc->cmdq_client.chan);
 			mtk_crtc->cmdq_client.chan = NULL;
+		} else {
+			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
+						      &mtk_crtc->cmdq_handle,
+						      PAGE_SIZE);
+			if (ret) {
+				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
+					drm_crtc_index(&mtk_crtc->base));
+				mbox_free_channel(mtk_crtc->cmdq_client.chan);
+				mtk_crtc->cmdq_client.chan = NULL;
+			}
 		}
 	}
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
