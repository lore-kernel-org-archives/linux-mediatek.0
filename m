Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378C1C4320E
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 23:48:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D351360F42
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 23:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D351360F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cnPlg/z5WKdf1u0ODyoHfY8ySUUgUyir0yU3LnJMfs=; b=aA7LIF9qqyyzS1
	YpyeFEaVPFu86Yp7ZP0IXZzzaD5UiJ80AA+iWD6bW1Iagi62Hqr84tiJm3NNSApxdNbVv6si/h9e6
	sCpApOKXiUJlTmkvQksSM1/JoN+eVSxrR+GiVlw3GQHUOmh6fKeVo1Ca2L95liMdhJswqG4HOGwBT
	Gb6IQzNaZDlBK2Zi5Rhcf3adaUTN+Cc8DU+uVj6tI3C77EkX1gK4aXKelwr97i8NgN+MsjkwNXXV3
	2vn1NzxjOjROQB6ptyO9UoDEnvmxODe7vqUOfhkoXmgdFdjMgRW72+zU18NXzpLwwDmb2OLZkiCgz
	/T3A91XtKDqY2qB/drGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCsWl-00GiN7-DJ; Sun, 08 Aug 2021 23:48:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCsWK-00GiHL-BX
 for linux-mediatek@lists.infradead.org; Sun, 08 Aug 2021 23:47:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95FAA60F4B;
 Sun,  8 Aug 2021 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628466476;
 bh=irCDUoflXrwrU0O7GCvMgdGWeBXXUYACkrzcuuKo/AY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FMXcAu5EM7JgFWHb237ckQQzfPfyJr5XZ+9q+pWFm7kx2NwHfhDPpRl683WqMM1qU
 1juvUmx6xH+x9IIq6itTIV9y7ldz6yVWqAIMfrAuro3+hSMGW1NKDc+XSCG1s/fdqR
 6Q14UIWpfhlTUelLgp0XK0IBS0m/jOAB9MyiKcPjZ3143EafxdAmOA01xfpa3bz++U
 296FhikaurV1KOa65KR2kFTVkBP25f8SIphaF/9tIDRp9MGqVmt5LSor6NUASn1bWb
 bEbrMSSZ6Z0r6JJz/aLPwcgL3PryeXRH84BegNZBWxCU2bXDtQXbyju0NukqBHzbY5
 qjk+F85nfJzgw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 4/4] drm/mediatek: Add cmdq_handle in mtk_crtc
Date: Mon,  9 Aug 2021 07:47:33 +0800
Message-Id: <20210808234733.14782-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808234733.14782-1-chunkuang.hu@kernel.org>
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_164756_469529_08952C40 
X-CRM114-Status: GOOD (  12.94  )
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

One mtk_crtc need just one cmdq_handle, so add one cmdq_handle
in mtk_crtc to prevent frequently allocation and free of
cmdq_handle.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 28 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ad4c1a3a9294..2d9becec04a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -54,6 +54,7 @@ struct mtk_drm_crtc {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct mbox_client		cmdq_cl;
 	struct mbox_chan		*cmdq_chan;
+	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
 #endif
@@ -226,19 +227,16 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static struct cmdq_pkt *mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, size_t size)
+static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
+				    size_t size)
 {
-	struct cmdq_pkt *pkt;
 	struct device *dev;
 	dma_addr_t dma_addr;
 
-	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
-	if (!pkt)
-		return ERR_PTR(-ENOMEM);
 	pkt->va_base = kzalloc(size, GFP_KERNEL);
 	if (!pkt->va_base) {
 		kfree(pkt);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 	pkt->buf_size = size;
 
@@ -249,12 +247,12 @@ static struct cmdq_pkt *mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, size_t s
 		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
 		kfree(pkt->va_base);
 		kfree(pkt);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	pkt->pa_base = dma_addr;
 
-	return pkt;
+	return 0;
 }
 
 static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
@@ -477,7 +475,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 				       bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_pkt *cmdq_handle;
+	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
@@ -517,7 +515,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_chan) {
 		mbox_flush(mtk_crtc->cmdq_chan, 2000);
-		cmdq_handle = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan, PAGE_SIZE);
+		cmdq_handle->cmd_buf_size = 0;
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
@@ -915,6 +913,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				drm_crtc_index(&mtk_crtc->base));
 			mbox_free_channel(mtk_crtc->cmdq_chan);
 			mtk_crtc->cmdq_chan = NULL;
+		} else {
+			ret = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan,
+						       &mtk_crtc->cmdq_handle,
+						       PAGE_SIZE);
+			if (ret) {
+				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
+					drm_crtc_index(&mtk_crtc->base));
+				mbox_free_channel(mtk_crtc->cmdq_chan);
+				mtk_crtc->cmdq_chan = NULL;
+			}
 		}
 	}
 #endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
