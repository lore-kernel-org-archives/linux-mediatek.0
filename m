Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B1FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 06:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FsTaSh9VCKsrA8vd4WZHIlcZYB79KrDqTmuQM1SfHW8=; b=WtNXVHvjzxI007e0q3nyaX5FEN
	xCb1zFmd25QRsmirxQgUE5CiHPV+simFkYF/XNwDWjAvNmt5+/1o7q5/J4KR+Bh/rplcfmwV8rw9o
	vjnLNnEwVr9ShELNAMt9t0KKQclxY9A9m+28B4yB72E5JDth7Hos49IzQYA+JA3ggXQ7fEE3TDpGx
	2Q8xlTByEWSUSuUYfFp/6ojYw5v+s2kNHcq+q5/h65pYtVDLdCBXBgIGELSxTjmCswuhWLIUJnQ9A
	1+e3aFHYBpr4JJ+a/PQ7ceAmYV0Okcf5en2mQe9YoCrTHuQIkU4s67Val1F0CtOboEhyCsxWRMUI2
	5sRSJt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmgp-00HI6y-OB; Mon, 10 Oct 2022 06:55:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmgn-00HI5I-1M; Mon, 10 Oct 2022 06:55:02 +0000
X-UUID: b167713e909a404ab3408e4171922288-20221009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FsTaSh9VCKsrA8vd4WZHIlcZYB79KrDqTmuQM1SfHW8=;
	b=qmblZ1zx0Lm1QjxgY7v6LVEts5+u6X1MrEtoPUekUp97xjiZ7MkGG5tKi3eEz61kS3fX2b/mUaRqHWyxuZOVtBD4XjRaj8GzyfzNlASFi8HMM1g/1dvjnIUc5vlINcW5dmPSxlNsV4rUpcK8jf+e88kof0rRvj/kk9Keo+cGm2E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:7e2ff790-5884-4971-96e4-93970554ae40,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:e5c906b9-daef-48a8-8c50-40026d6a74c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b167713e909a404ab3408e4171922288-20221009
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingjia.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1104629192; Sun, 09 Oct 2022 23:54:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 10 Oct 2022 14:34:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 10 Oct 2022 14:34:18 +0800
From: Mingjia Zhang <mingjia.zhang@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
	<acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
	<dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>
Subject: [PATCH, v3] media: mediatek: vcodec: Add to support VP9 inner racing mode
Date: Mon, 10 Oct 2022 14:33:41 +0800
Message-ID: <20221010063341.5753-1-mingjia.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_235501_095940_40C7B6BB 
X-CRM114-Status: GOOD (  17.72  )
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

In order to reduce decoder latency, enable VP9 inner racing mode.
Send lat trans buffer information to core when trigger lat to work,
need not to wait until lat decode done.

Signed-off-by: mingjia zhang <mingjia.zhang@mediatek.com>
---
1. CTS/GTS test pass
2. Fluster result: Ran 275/303 tests successfully
---
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 72 +++++++++++--------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index 81de876d51267..f07015eb79218 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -436,6 +436,7 @@ struct vdec_vp9_slice_ref {
  * @frame_ctx:		4 frame context according to VP9 Spec
  * @frame_ctx_helper:	4 frame context according to newest kernel spec
  * @dirty:		state of each frame context
+ * @local_vsi:		local instance vsi information
  * @init_vsi:		vsi used for initialized VP9 instance
  * @vsi:		vsi used for decoding/flush ...
  * @core_vsi:		vsi used for Core stage
@@ -482,6 +483,8 @@ struct vdec_vp9_slice_instance {
 	struct v4l2_vp9_frame_context frame_ctx_helper;
 	unsigned char dirty[4];
 
+	struct vdec_vp9_slice_vsi local_vsi;
+
 	/* MicroP vsi */
 	union {
 		struct vdec_vp9_slice_init_vsi *init_vsi;
@@ -1616,16 +1619,10 @@ static int vdec_vp9_slice_update_single(struct vdec_vp9_slice_instance *instance
 }
 
 static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance *instance,
-				     struct vdec_lat_buf *lat_buf,
-				     struct vdec_vp9_slice_pfc *pfc)
+				     struct vdec_vp9_slice_vsi *vsi)
 {
-	struct vdec_vp9_slice_vsi *vsi;
-
-	vsi = &pfc->vsi;
-	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
-
 	mtk_vcodec_debug(instance, "Frame %u LAT CRC 0x%08x %lx %lx\n",
-			 pfc->seq, vsi->state.crc[0],
+			 (instance->seq - 1), vsi->state.crc[0],
 			 (unsigned long)vsi->trans.dma_addr,
 			 (unsigned long)vsi->trans.dma_addr_end);
 
@@ -2090,6 +2087,13 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		return ret;
 	}
 
+	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability)) {
+		vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
+		memcpy(&instance->local_vsi, vsi, sizeof(*vsi));
+		vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
+		vsi = &instance->local_vsi;
+	}
+
 	if (instance->irq) {
 		ret = mtk_vcodec_wait_for_done_ctx(ctx,	MTK_INST_IRQ_RECEIVED,
 						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
@@ -2102,22 +2106,25 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
-	ret = vdec_vp9_slice_update_lat(instance, lat_buf, pfc);
+	ret = vdec_vp9_slice_update_lat(instance, vsi);
 
-	/* LAT trans full, no more UBE or decode timeout */
-	if (ret) {
-		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
-		return ret;
-	}
+	if (!IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
+		/* LAT trans full, no more UBE or decode timeout */
+		if (ret) {
+			mtk_vcodec_err(instance, "frame[%d] decode error: %d\n",
+				       ret, (instance->seq - 1));
+			return ret;
+		}
 
-	mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
-			 (unsigned long)pfc->vsi.trans.dma_addr,
-			 (unsigned long)pfc->vsi.trans.dma_addr_end);
 
-	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
-				       vsi->trans.dma_addr_end +
-				       ctx->msg_queue.wdma_addr.dma_addr);
-	vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
+	vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
+	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue, vsi->trans.dma_addr_end);
+	if (!IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
+		vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
+
+	mtk_vcodec_debug(instance, "lat trans end addr(0x%lx), ube start addr(0x%lx)\n",
+			 (unsigned long)vsi->trans.dma_addr_end,
+			 (unsigned long)ctx->msg_queue.wdma_addr.dma_addr);
 
 	return 0;
 }
@@ -2139,22 +2146,22 @@ static int vdec_vp9_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 {
 	struct vdec_vp9_slice_instance *instance;
-	struct vdec_vp9_slice_pfc *pfc;
+	struct vdec_vp9_slice_pfc *pfc = NULL;
 	struct mtk_vcodec_ctx *ctx = NULL;
 	struct vdec_fb *fb = NULL;
 	int ret = -EINVAL;
 
 	if (!lat_buf)
-		goto err;
+		return -EINVAL;
 
 	pfc = lat_buf->private_data;
 	ctx = lat_buf->ctx;
 	if (!pfc || !ctx)
-		goto err;
+		return -EINVAL;
 
 	instance = ctx->drv_handle;
 	if (!instance)
-		goto err;
+		return -EINVAL;
 
 	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
 	if (!fb) {
@@ -2193,10 +2200,14 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		goto err;
 	}
 
-	pfc->vsi.trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
 	mtk_vcodec_debug(instance, "core dma_addr_end 0x%lx\n",
 			 (unsigned long)pfc->vsi.trans.dma_addr_end);
-	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
+
+	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
+		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr);
+	else
+		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
+
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
 
 	return 0;
@@ -2204,7 +2215,12 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 err:
 	if (ctx && pfc) {
 		/* always update read pointer */
-		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
+		if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
+			vdec_msg_queue_update_ube_rptr(&ctx->msg_queue,
+						       pfc->vsi.trans.dma_addr);
+		else
+			vdec_msg_queue_update_ube_rptr(&ctx->msg_queue,
+						       pfc->vsi.trans.dma_addr_end);
 
 		if (fb)
 			ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
-- 
2.18.0


