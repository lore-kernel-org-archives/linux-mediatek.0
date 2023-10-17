Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C80CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 06:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UDEgHbPyazwe4jaNh9a6MwFvs052dVGA2QRbkF32Po=; b=SToDEYiU7Shx6k0CPAPpZ002Jd
	UgaLXZH207kkVh56STzKXoYbvLhza+w35UcpPWf4x+PCfjInIryGTOtPCty45hXF7VbCCsREyC9MQ
	jOtSIsUdG4S6svW57m8729H/XdmYby5m01FkzXYxlOjYNJLfo0VJlVmcV+aC1vkVdKp2vTD849FcE
	9/Doh8YzyXSUwu/uZqooCVZwPGlQbn3gNkOI/rbsENyEpePxI1NnPtLNagZfHYTbTku+P0mq4oGy0
	BHudt7uSzAli9EPExKaMq00YnJzvNO4flnvNDSkOXbGkfxqPevWnqPyfkz0txh7dPSpBWjj4O3mdG
	nPbOuIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdsB-00BTW8-2S;
	Tue, 17 Oct 2023 06:48:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsds2-00BTQM-2g;
	Tue, 17 Oct 2023 06:48:06 +0000
X-UUID: 199687e46cb911ee86758d4a7c00f3a0-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2UDEgHbPyazwe4jaNh9a6MwFvs052dVGA2QRbkF32Po=;
	b=pSRqCRI9DunbGOwI1YDTOHghq3VTS8i/dLOgZ+A4/sA+COkUiSUSbgAOsbRLwKPPrfP8PPzcYuetWxf7W/ZuZZZTij0ZZwnDnxY7ffk8j/MqbXwpnLxCLORtTBJiDSChndE3sWhCXaY1wrP1nk5Rbehkl4SnezV5Q4MJPIiHoY8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:841e5974-b85a-42ab-b10f-cc2005c9f2a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:81bb05c0-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 199687e46cb911ee86758d4a7c00f3a0-20231016
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1857558988; Mon, 16 Oct 2023 23:47:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Oct 2023 14:47:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 17 Oct 2023 14:47:19 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Sean Paul <sean@poorly.run>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v3 09/11] drm/mediatek: Support CRC in display driver
Date: Tue, 17 Oct 2023 14:47:15 +0800
Message-ID: <20231017064717.21616-10-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231017064717.21616-1-shawn.sung@mediatek.com>
References: <20231017064717.21616-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_234802_893799_436BAFE5 
X-CRM114-Status: GOOD (  35.35  )
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

Register CRC related function pointers to support
CRC retrieval.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 261 +++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  39 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  35 +++
 3 files changed, 332 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index c7edd80be428..c97dbbf32072 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -27,14 +27,30 @@
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
  * @base: crtc object.
  * @enabled: records whether crtc_enable succeeded
+ * @pending_needs_vblank: determine if we need to handle vblank event
+ * @event: the vblank event to handle
  * @planes: array of 4 drm_plane structures, one for each overlay plane
+ * @layer_nr: layer numbers that the crtc supports
  * @pending_planes: whether any plane has pending changes to be applied
+ * @pending_async_planes: if there is any pending async update
+ * @cmdq_client: a handler to control cmdq (mbox channel, thread ...etc.)
+ * @cmdq_handle: cmdq packet to store the commands
+ * @cmdq_event: cmdq event that the thread is waiting for
+ * @cmdq_vblank_cnt: vblank count that is dedicated for the cmdq thread
+ * @cb_blocking_queue: wait queue to determine if cmdq is blocked
  * @mmsys_dev: pointer to the mmsys device for configuration registers
+ * @dma_dev: pointer to the dma device (usually rdma)
  * @mutex: handle to one of the ten disp_mutex streams
- * @ddp_comp_nr: number of components in ddp_comp
+ * @ddp_comp_nr_ori: number of the components excludes the route (origin)
+ * @max_ddp_comp_nr: maximum number of the components in routes
+ * @ddp_comp_nr: number of the components in the current path
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
- *
- * TODO: Needs update: this header is missing a bunch of member descriptions.
+ * @conn_route_nr: number of the components in route
+ * @conn_routes: route to the connector
+ * @hw_lock: mutex lock to avoid race condition when layer config
+ * @config_updating: determine if the layer configuration is done
+ * @crc_provider: get crc provider of the crtc
+ * @frames: count the frames that are added to crc entry
  */
 struct mtk_drm_crtc {
 	struct drm_crtc			base;
@@ -70,6 +86,9 @@ struct mtk_drm_crtc {
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
+
+	struct mtk_ddp_comp		*crc_provider;
+	unsigned int			frames;
 };
 
 struct mtk_crtc_state {
@@ -613,6 +632,14 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct drm_crtc *crtc = data;
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
+
+	/*
+	 * crc providers should make sure the crc is always correct
+	 * by resetting it in .crc_read()
+	 */
+	if (crtc->crc.opened)
+		comp->funcs->crc_read(comp->dev);
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
@@ -624,6 +651,24 @@ static void mtk_crtc_ddp_irq(void *data)
 	if (!priv->data->shadow_register)
 		mtk_crtc_ddp_config(crtc, NULL);
 #endif
+
+	/*
+	 * drm_crtc_add_crc_entry() could take more than 50ms to finish
+	 * put it at the end of the isr
+	 */
+	if (crtc->crc.opened) {
+		/*
+		 * skip the first crc because the first frame is configured by
+		 * mtk_crtc_ddp_hw_init() when atomic enable
+		 */
+		if (++mtk_crtc->frames > 1) {
+			drm_crtc_add_crc_entry(crtc, true,
+					       drm_crtc_vblank_count(crtc),
+					       comp->funcs->crc_entry(comp->dev));
+		}
+	} else {
+		mtk_crtc->frames = 0;
+	}
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
 
@@ -724,6 +769,40 @@ static int mtk_drm_crtc_update_output(struct drm_crtc *crtc,
 	return 0;
 }
 
+static int mtk_drm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src)
+{
+	if (src && strcmp(src, "auto") != 0) {
+		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
+			  __func__, drm_crtc_index(crtc), src);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int mtk_drm_crtc_verify_crc_source(struct drm_crtc *crtc,
+					  const char *src,
+					  size_t *cnt)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
+
+	if (!comp) {
+		DRM_ERROR("%s(crtc-%d): no crc provider\n",
+			  __func__, drm_crtc_index(crtc));
+		return -ENOENT;
+	}
+
+	if (src && strcmp(src, "auto") != 0) {
+		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
+			  __func__, drm_crtc_index(crtc), src);
+		return -EINVAL;
+	}
+
+	*cnt = comp->funcs->crc_cnt(comp->dev);
+
+	return 0;
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -860,6 +939,8 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
 	.enable_vblank		= mtk_drm_crtc_enable_vblank,
 	.disable_vblank		= mtk_drm_crtc_disable_vblank,
+	.set_crc_source		= mtk_drm_crtc_set_crc_source,
+	.verify_crc_source	= mtk_drm_crtc_verify_crc_source,
 };
 
 static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
@@ -1061,6 +1142,11 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 			if (comp->funcs->ctm_set)
 				has_ctm = true;
+
+			if (comp->funcs->crc_cnt &&
+			    comp->funcs->crc_entry &&
+			    comp->funcs->crc_read)
+				mtk_crtc->crc_provider = comp;
 		}
 
 		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
@@ -1140,3 +1226,172 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 #endif
 	return 0;
 }
+
+void mtk_drm_crc_init(struct mtk_drm_crc *crc,
+		      const u32 *crc_offset_table, size_t crc_count,
+		      u32 reset_offset, u32 reset_mask)
+{
+	crc->ofs = crc_offset_table;
+	crc->cnt = crc_count;
+	crc->rst_ofs = reset_offset;
+	crc->rst_msk = reset_mask;
+	crc->va = kcalloc(crc->cnt, sizeof(*crc->va), GFP_KERNEL);
+	if (!crc->va) {
+		DRM_ERROR("failed to allocate memory for crc\n");
+		crc->cnt = 0;
+	}
+}
+
+void mtk_drm_crc_read(struct mtk_drm_crc *crc, void __iomem *reg)
+{
+	if (!crc->cnt || !crc->ofs || !crc->va)
+		return;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	/* sync to see the most up-to-date copy of the DMA buffer */
+	dma_sync_single_for_cpu(crc->cmdq_client.chan->mbox->dev,
+				crc->pa, crc->cnt * sizeof(*crc->va),
+				DMA_FROM_DEVICE);
+#else
+	/* read crc with cpu for the platforms without cmdq */
+	{
+		u32 n;
+
+		for (n = 0; n < crc->cnt; n++)
+			crc->va[n] = readl(reg + crc->ofs[n]);
+
+		n = readl(reg + crc->rst_ofs);
+
+		/* pull reset bit */
+		n |= crc->rst_msk;
+		writel(n, reg + crc->rst_ofs);
+
+		/* release reset bit */
+		n &= ~crc->rst_msk;
+		writel(n, reg + crc->rst_ofs);
+	}
+#endif
+}
+
+void mtk_drm_crc_destroy(struct mtk_drm_crc *crc)
+{
+	if (!crc->cnt)
+		return;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (crc->pa) {
+		dma_unmap_single(crc->cmdq_client.chan->mbox->dev,
+				 crc->pa, crc->cnt * sizeof(*crc->va),
+				 DMA_TO_DEVICE);
+		crc->pa = 0;
+	}
+	if (crc->cmdq_client.chan) {
+		mtk_drm_cmdq_pkt_destroy(&crc->cmdq_handle);
+		mbox_free_channel(crc->cmdq_client.chan);
+		crc->cmdq_client.chan = NULL;
+	}
+#endif
+	kfree(crc->va);
+	crc->va = NULL;
+	crc->cnt = 0;
+}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+void mtk_drm_crc_cmdq_create(struct device *dev, struct mtk_drm_crc *crc)
+{
+	int i;
+
+	if (!crc->cnt) {
+		dev_warn(dev, "%s: not support\n", __func__);
+		goto cleanup;
+	}
+
+	if (!crc->ofs) {
+		dev_warn(dev, "%s: not defined\n", __func__);
+		goto cleanup;
+	}
+
+	crc->cmdq_client.client.dev = dev;
+	crc->cmdq_client.client.tx_block = false;
+	crc->cmdq_client.client.knows_txdone = true;
+	crc->cmdq_client.client.rx_callback = NULL;
+	crc->cmdq_client.chan = mbox_request_channel(&crc->cmdq_client.client, 0);
+	if (IS_ERR(crc->cmdq_client.chan)) {
+		dev_warn(dev, "%s: failed to create mailbox client\n", __func__);
+		crc->cmdq_client.chan = NULL;
+		goto cleanup;
+	}
+
+	if (mtk_drm_cmdq_pkt_create(&crc->cmdq_client, &crc->cmdq_handle, PAGE_SIZE)) {
+		dev_warn(dev, "%s: failed to create cmdq packet\n", __func__);
+		goto cleanup;
+	}
+
+	if (!crc->va) {
+		dev_warn(dev, "%s: no memory\n", __func__);
+		goto cleanup;
+	}
+
+	/* map the entry to get a dma address for cmdq to store the crc */
+	crc->pa = dma_map_single(crc->cmdq_client.chan->mbox->dev,
+				 crc->va, crc->cnt * sizeof(*crc->va),
+				 DMA_FROM_DEVICE);
+
+	if (dma_mapping_error(crc->cmdq_client.chan->mbox->dev, crc->pa)) {
+		dev_err(dev, "%s: failed to map dma\n", __func__);
+		goto cleanup;
+	}
+
+	if (crc->cmdq_event)
+		cmdq_pkt_wfe(&crc->cmdq_handle, crc->cmdq_event, true);
+
+	for (i = 0; i < crc->cnt; i++) {
+		/* put crc to spr1 register */
+		cmdq_pkt_read_s(&crc->cmdq_handle, crc->cmdq_reg->subsys,
+				crc->cmdq_reg->offset + crc->ofs[i],
+				CMDQ_THR_SPR_IDX1);
+
+		/* copy spr1 register to physical address of the crc */
+		cmdq_pkt_assign(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
+				CMDQ_ADDR_HIGH(crc->pa + i * sizeof(*crc->va)));
+		cmdq_pkt_write_s(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
+				 CMDQ_ADDR_LOW(crc->pa + i * sizeof(*crc->va)),
+				 CMDQ_THR_SPR_IDX1);
+	}
+	/* reset crc */
+	mtk_ddp_write_mask(&crc->cmdq_handle, ~0, crc->cmdq_reg, 0,
+			   crc->rst_ofs, crc->rst_msk);
+
+	/* clear reset bit */
+	mtk_ddp_write_mask(&crc->cmdq_handle, 0, crc->cmdq_reg, 0,
+			   crc->rst_ofs, crc->rst_msk);
+
+	/* jump to head of the cmdq packet */
+	cmdq_pkt_jump(&crc->cmdq_handle, crc->cmdq_handle.pa_base);
+
+	return;
+cleanup:
+	mtk_drm_crc_destroy(crc);
+}
+
+void mtk_drm_crc_cmdq_start(struct mtk_drm_crc *crc)
+{
+	if (!crc->cmdq_client.chan)
+		return;
+
+	dma_sync_single_for_device(crc->cmdq_client.chan->mbox->dev,
+				   crc->cmdq_handle.pa_base,
+				   crc->cmdq_handle.cmd_buf_size,
+				   DMA_TO_DEVICE);
+	mbox_send_message(crc->cmdq_client.chan, &crc->cmdq_handle);
+	mbox_client_txdone(crc->cmdq_client.chan, 0);
+}
+
+void mtk_drm_crc_cmdq_stop(struct mtk_drm_crc *crc)
+{
+	if (!crc->cmdq_client.chan)
+		return;
+
+	mbox_flush(crc->cmdq_client.chan, 2000);
+}
+#endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 96790f8f7a94..3440c154ad1e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -15,6 +15,45 @@
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
 
+/**
+ * struct mtk_drm_crc - crc related information
+ * @ofs: register offset of crc
+ * @rst_ofs: register offset of crc reset
+ * @rst_msk: register mask of crc reset
+ * @cnt: count of crc
+ * @va: pointer to the start of crc array
+ * @pa: physical address of the crc for gce to access
+ * @cmdq_event: the event to trigger the cmdq
+ * @cmdq_reg: address of the register that cmdq is going to access
+ * @cmdq_client: handler to control cmdq (mbox channel, thread ...etc.)
+ * @cmdq_handle: cmdq packet to store the commands
+ */
+struct mtk_drm_crc {
+	const u32 *ofs;
+	u32 rst_ofs;
+	u32 rst_msk;
+	size_t cnt;
+	u32 *va;
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	dma_addr_t pa;
+	u32 cmdq_event;
+	struct cmdq_client_reg *cmdq_reg;
+	struct cmdq_client cmdq_client;
+	struct cmdq_pkt cmdq_handle;
+#endif
+};
+
+void mtk_drm_crc_init(struct mtk_drm_crc *crc,
+		      const u32 *crc_offset_table, size_t crc_count,
+		      u32 reset_offset, u32 reset_mask);
+void mtk_drm_crc_read(struct mtk_drm_crc *crc, void __iomem *reg);
+void mtk_drm_crc_destroy(struct mtk_drm_crc *crc);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+void mtk_drm_crc_cmdq_create(struct device *dev, struct mtk_drm_crc *crc);
+void mtk_drm_crc_cmdq_start(struct mtk_drm_crc *crc);
+void mtk_drm_crc_cmdq_stop(struct mtk_drm_crc *crc);
+#endif
+
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 2597dd7ac0d2..af80c9e50d36 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -46,6 +46,38 @@ enum mtk_ddp_comp_type {
 
 struct mtk_ddp_comp;
 struct cmdq_pkt;
+
+/* struct mtk_ddp_comp_funcs - function pointers of the ddp components
+ * @clk_enable: enable the clocks of the component
+ * @clk_disable: disable the clocks of the component
+ * @config: configure the component
+ * @start: start (enable) the component
+ * @stop: stop (disable) the component
+ * @register_vblank_cb: to register a callback function when vblank irq occurs
+ * @unregister_vblank_cb: to unregister the callback function from the vblank irq
+ * @enable_vblank: enable vblank irq
+ * @disable_vblank: disable vblank irq
+ * @supported_rotations: return rotation capability of the component
+ * @layer_nr: how many layers the component supports
+ * @layer_check: to check if the state of the layer is valid for the component
+ * @layer_config: to configure the component according to the state of the layer
+ * @gamma_set: to set gamma for the component
+ * @bgclr_in_on: turn on background color
+ * @bgclr_in_off: turn off background color
+ * @ctm_set: set color transformation matrix
+ * @dma_dev_get: return the device that uses direct memory access
+ * @get_formats: get the format that is currently in use by the component
+ * @get_num_formats: get number of the formats that the component supports
+ * @connect: connect the sub modules of the component
+ * @disconnect: disconnect the sub modules of the component
+ * @add: add the device to the component (mount them in the mutex)
+ * @remove: remove the device from the component (unmount them from the mutex)
+ * @encoder_index: get the encoder index of the component
+ * @crc: return the start of crc array
+ * @crc_cnt: how many CRCs the component supports
+ * @crc_entry: get the pointer to the crc entry
+ * @crc_read: call this function to read crc from the hardware component
+ */
 struct mtk_ddp_comp_funcs {
 	int (*power_on)(struct device *dev);
 	void (*power_off)(struct device *dev);
@@ -84,6 +116,9 @@ struct mtk_ddp_comp_funcs {
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);
 	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
 	int (*encoder_index)(struct device *dev);
+	size_t (*crc_cnt)(struct device *dev);
+	u32 *(*crc_entry)(struct device *dev);
+	void (*crc_read)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
-- 
2.18.0


