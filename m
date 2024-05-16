Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EC9C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 May 2024 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPacLAmOU2PAiXqjNye9zrrbFHfDqQBexSnTykqUISc=; b=JbivtpyF5tJsntpynmEL6O3+NA
	3oMEU40AEHtKxDKU9KyGRWXsu1eGaax3XU07u6mlEeEt4A8kwNvWzeQGcdYybyjkaHunoRTDkIICE
	7qyJ1NM2xvr1Pu1kdHFWqeI3HM9g6jRfY8BOQsX/96s30wsgkYwfvIAp7ut51+B2FMGgSqYJ/XCHY
	ZmF/XdbCv5N2aqR6jiwB6INZ/ckeZCMWLY5gjBqklfAzPLIYV/L+pMZoTOmafDJjAvoeU3slsT33p
	ujh2N6sVYi1x9BgxgYhAuGajDPhB8qGGAKmC/dxt92BCj+n5GqExYxUeVcA6cDSO4zx12EqVAlSwy
	XqH2Dqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7a8H-00000004lkw-1jpn;
	Thu, 16 May 2024 12:22:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7a7a-00000004lGL-0Q25;
	Thu, 16 May 2024 12:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iPacLAmOU2PAiXqjNye9zrrbFHfDqQBexSnTykqUISc=; b=cA6wcxPAu2MtMCFL2NR3+D+7IO
	EESBbLCC6s7d3ptsdBjZB9Z+QwKZFHKgRqXx8N7Gf1LSSgW0uyKBPxxPS7HlP83DvF+ApMXt6MUCC
	nHdhfUFR+r+UrAasbLxreRdzXwVYbUVl472wpxobuPqLc+vQ/i31Ez5KTya83IBymoWPITvim0ytV
	F/doNYLBs5GxnkuBwjSBxfdvwhX7eWpI4OZc8TVAxZzt7vmpCsZVEAhdMxPjBfI+Wekf8Ed2qX5nH
	+Yg/dMtGI/LL+5L011JoIg5LDIrgQlCSSuRiTn7UA0GbPvq5ld+ns0VltEmQmNsjHOWEbrog627t6
	qFxmq+Eg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7a7V-00000005QTk-3GqT;
	Thu, 16 May 2024 12:22:04 +0000
X-UUID: e27d9078137e11ef9a78ddf43a9225dc-20240516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iPacLAmOU2PAiXqjNye9zrrbFHfDqQBexSnTykqUISc=;
	b=TF+ekz6MfARDpix5EqgaTInJqGIxUV0UnSEtS6pxn4QLzD7UM7keeFrVQNKcKlNQGtypzprWH7oNV9pdPKiDX2jKWSZCJRaomM6+CMTxv9TVtNEizUw/UBT22jyanACTu81kYocsRO2Ccsd7CcUaAMLJw0qjrjGU+93ZHwQ6lKI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:327bb32d-d42e-4b62-88aa-cf1eb0eeb2f9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:0d21d792-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e27d9078137e11ef9a78ddf43a9225dc-20240516
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1133840434; Thu, 16 May 2024 05:21:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 May 2024 20:21:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 May 2024 20:21:37 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6,22/24] media: mediatek: vcodec: support hevc svp for mt8188
Date: Thu, 16 May 2024 20:21:00 +0800
Message-ID: <20240516122102.16379-23-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516122102.16379-1-yunfei.dong@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_132202_231541_BD29AA30 
X-CRM114-Status: GOOD (  13.54  )
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

Change hevc driver to support secure video playback(svp) for
mt8188. Need to map shared memory with optee interface and
wait interrupt in optee-os.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_hevc_req_multi_if.c     | 89 +++++++++++--------
 1 file changed, 54 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index fe0a8508d632..30c85d053f18 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -415,11 +415,14 @@ static void vdec_hevc_fill_dpb_info(struct mtk_vcodec_dec_ctx *ctx,
 		hevc_dpb_info[index].field = dpb->field_pic;
 
 		hevc_dpb_info[index].y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
-			hevc_dpb_info[index].c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
-		else
-			hevc_dpb_info[index].c_dma_addr =
-				hevc_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
+		if (!ctx->is_secure_playback) {
+			if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+				hevc_dpb_info[index].c_dma_addr =
+					vb2_dma_contig_plane_dma_addr(vb, 1);
+			else
+				hevc_dpb_info[index].c_dma_addr =
+					hevc_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
+		}
 	}
 }
 
@@ -800,7 +803,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 	struct mtk_vcodec_dec_ctx *ctx = inst->ctx;
 	struct vb2_v4l2_buffer *vb2_v4l2;
 	struct vdec_fb *fb;
-	u64 y_fb_dma, c_fb_dma;
+	u64 y_fb_dma, c_fb_dma = 0;
 	int i;
 
 	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
@@ -810,18 +813,20 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 	}
 
 	y_fb_dma = (u64)fb->base_y.dma_addr;
-	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
-		c_fb_dma =
-			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
-	else
-		c_fb_dma = (u64)fb->base_c.dma_addr;
+	if (!ctx->is_secure_playback) {
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+			c_fb_dma =
+				y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+		else
+			c_fb_dma = (u64)fb->base_c.dma_addr;
+	}
 
 	mtk_vdec_debug(inst->ctx, "[hevc-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
 
 	inst->vsi_core->fb.y.dma_addr = y_fb_dma;
 	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[0];
 	inst->vsi_core->fb.c.dma_addr = c_fb_dma;
-	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[1];
+	inst->vsi_core->fb.c.size = ctx->picinfo.fb_sz[1];
 
 	inst->vsi_core->dec.vdec_fb_va = (unsigned long)fb;
 
@@ -878,8 +883,13 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	vsi_size = round_up(sizeof(struct vdec_hevc_slice_vsi), VCODEC_DEC_ALIGNED_64);
 	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	if (ctx->is_secure_playback)
+		inst->vsi_core =
+			mtk_vcodec_dec_get_shm_buffer_va(ctx->dev->optee_private, MTK_VDEC_CORE,
+							 OPTEE_DATA_INDEX);
+	else
+		inst->vsi_core =
+			(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
 
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
@@ -944,21 +954,22 @@ static int vdec_hevc_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		goto vdec_dec_end;
 	}
 
-	/* wait decoder done interrupt */
-	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
-	if (timeout)
-		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
-	inst->vsi_core->dec.timeout = !!timeout;
+	if (!vpu->ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+		if (timeout)
+			mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
+		inst->vsi_core->dec.timeout = !!timeout;
 
-	vpu_dec_core_end(vpu);
-	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
-		       ctx->decoded_frame_cnt,
+		vpu_dec_core_end(vpu);
+	}
+	mtk_vdec_debug(ctx, "pic[%d] svp:%d crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       ctx->decoded_frame_cnt, ctx->is_secure_playback,
 		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
 		       inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
 		       inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
 		       inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
-
 vdec_dec_end:
 	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans.dma_addr_end);
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
@@ -1015,14 +1026,17 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
 
-	/* wait decoder done interrupt */
-	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
-	if (timeout)
-		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
-	inst->vsi->dec.timeout = !!timeout;
+	if (!inst->ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+		if (timeout)
+			mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
+		inst->vsi->dec.timeout = !!timeout;
+
+		err = vpu_dec_end(vpu);
+	}
 
-	err = vpu_dec_end(vpu);
 	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
 		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
 			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
@@ -1031,8 +1045,11 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		return -EINVAL;
 	}
 
-	share_info->trans.dma_addr_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-		inst->vsi->dec.wdma_end_addr_offset;
+	if (inst->ctx->is_secure_playback)
+		share_info->trans.dma_addr_end = inst->vsi->dec.wdma_end_addr_offset;
+	else
+		share_info->trans.dma_addr_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+			inst->vsi->dec.wdma_end_addr_offset;
 	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans.dma_addr_end);
 
 	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
@@ -1040,8 +1057,10 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		       sizeof(share_info->hevc_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
-	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
-		       inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
+
+	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x 0x%x size:%d",
+		       inst->slice_dec_num, inst->vsi->dec.crc[0], inst->vsi->dec.crc[1],
+		       inst->vsi->dec.crc[2], inst->vsi->dec.crc[3], (unsigned int)bs->size);
 
 	inst->slice_dec_num++;
 	return 0;
-- 
2.25.1


