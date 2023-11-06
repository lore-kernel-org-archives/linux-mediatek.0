Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A1EC0018A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRAFQ+jwRgRo6NnJ7zv/dcX/8of1HrZt9dT6lYUrdUs=; b=qzx5xVXfHFVjpr4jLRrepUUFWx
	7rHQmlR92bd2PYA6yx7zg2UlmHd3KRQabBFtES29yat+xgj8aqR6ZfLWX4l1+TgJykQq6xlvpg9vT
	kKc6td2hNm6R6jzRjwVm1CWRU9uXPN4nP5dKEpy15HeKLHTCJsrVVhgOPGpmfDDzXM9vzMyQJUbax
	9a/WCwuIp/HvvAzV9IUb3amH7orjMLwS4iGU1LG6pl/PCNhX6yTP5jPrWOoaGjfeLXbzoTKojkC4h
	hOa8xLbOcQEMRWWVU/sm4z5XJEIWZKsyRQKpHcnCeSX/DNV0GiVYxrTwkC9nxHhUon4gZLdvjLE+v
	p/pMIhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyM5-00GaOl-0X;
	Mon, 06 Nov 2023 12:05:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyLu-00GaB5-2h;
	Mon, 06 Nov 2023 12:05:13 +0000
X-UUID: b89e415e7c9c11ee9b7791016c24628a-20231106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZRAFQ+jwRgRo6NnJ7zv/dcX/8of1HrZt9dT6lYUrdUs=;
	b=nW9J1Blq1PwQazy45ojhODdUcVUirAhomfwdA7yQWiOsOpqAITCFo/i+QzWl1liNliat16aRN4+Yyll071BHTTGDZk5M4zxCSLlAY9MBl52nhl0z8ECTPF91bT8wnRfr5xHxnaaW/d1a5YH5pXUyBctZG7kVIAaLhvyhJ5OcXcU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:37ef1fbb-36cb-4038-93c3-40a83b498397,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:38495472-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b89e415e7c9c11ee9b7791016c24628a-20231106
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1276156293; Mon, 06 Nov 2023 05:05:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 20:04:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 20:04:42 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>, "T . J . Mercier"
	<tjmercier@google.com>, John Stultz <jstultz@google.com>, Yong Wu
	<yong.wu@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,16/21] media: medkatek: vcodec: support one plane capture buffer
Date: Mon, 6 Nov 2023 20:04:18 +0800
Message-ID: <20231106120423.23364-17-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231106120423.23364-1-yunfei.dong@mediatek.com>
References: <20231106120423.23364-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.238200-8.000000
X-TMASE-MatchedRID: IdwiQWGfGmyON+GapO42vQI0yP/uoH+Dh+w9Wz/xXDr7efdnqtsaE5kC
	erFMaabilTJXKqh1ne29cOdjc/43lUMpVZZsZyZGHPYwOJi6PLmBHKTJ+sfXGfNhzIgXtFJVBsf
	S6+plWAGfKCv8T5zKvmF6wLzbAtAr7U4NkBX42MYQ9/tMNQ4aiuWNJG9IamrcGM7yl/HgfuBLbT
	Uf+O4SvG0xs/kJ5jkfbhGQTDKMjW9sQJ9Z3jpPTZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyMdRT
	5TQAJnA3aJFD5rLC2NwZZgef8WPbYE9AmzOHQTFA/OV2SAxKGqeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.238200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 192AFC317563856581534F8288B66C8AAC5A660ABE830ADB66655D33EEB726B32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_040510_915487_70C77DA9 
X-CRM114-Status: GOOD (  14.44  )
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

The capture buffer has two planes for format MM21, but user space only
allocate secure memory for plane[0], and the size is Y data + uv data.
The driver need to support one plane decoder for svp mode.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  7 ++++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 26 ++++++++++---------
 .../decoder/vdec/vdec_h264_req_common.c       | 11 +++-----
 .../mediatek/vcodec/decoder/vdec_drv_if.c     |  4 +--
 4 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 1c6ecaa0c874..cede9b387eb2 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -675,7 +675,12 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 		 * So we just return picinfo yet, and update picinfo in
 		 * stop_streaming hook function
 		 */
-		q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
+
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0] + ctx->picinfo.fb_sz[1];
+		else
+			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
+
 		q_data->sizeimage[1] = ctx->picinfo.fb_sz[1];
 		q_data->bytesperline[0] = ctx->last_decoded_picinfo.buf_w;
 		q_data->bytesperline[1] = ctx->last_decoded_picinfo.buf_w;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 0f9cd5abd025..e8f8d7ed53ff 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -256,14 +256,14 @@ static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
 	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
 
 	pfb = &framebuf->frame_buffer;
-	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
+	if (!ctx->is_secure_playback)
+		pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
 	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
 
-	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2 && !ctx->is_secure_playback) {
 		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
-		pfb->base_c.dma_addr =
-			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
+		pfb->base_c.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 1);
 		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
 	}
 	mtk_v4l2_vdec_dbg(1, ctx,
@@ -310,16 +310,18 @@ static void mtk_vdec_worker(struct work_struct *work)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) id=%d, vb=%p", ctx->id,
 			  vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
 
-	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
-	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
-	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
-				  vb2_src->index);
-		return;
+	if (!ctx->is_secure_playback) {
+		bs_src->va = vb2_plane_vaddr(vb2_src, 0);
+		if (!bs_src->va) {
+			v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+			mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
+					  vb2_src->index);
+			return;
+		}
 	}
 
+	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
+	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
index 5ca20d75dc8e..2a57e689ec07 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
@@ -79,15 +79,12 @@ void mtk_vdec_h264_fill_dpb_info(struct mtk_vcodec_dec_ctx *ctx,
 		vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
 		h264_dpb_info[index].field = vb2_v4l2->field;
 
-		h264_dpb_info[index].y_dma_addr =
-			vb2_dma_contig_plane_dma_addr(vb, 0);
+		h264_dpb_info[index].y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
 		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			h264_dpb_info[index].c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
+		else if (!ctx->is_secure_playback)
 			h264_dpb_info[index].c_dma_addr =
-				vb2_dma_contig_plane_dma_addr(vb, 1);
-		else
-			h264_dpb_info[index].c_dma_addr =
-				h264_dpb_info[index].y_dma_addr +
-				ctx->picinfo.fb_sz[0];
+				h264_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
 	}
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
index d0b459b1603f..fb3e4f75ed93 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
@@ -73,14 +73,14 @@ int vdec_if_decode(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *bs,
 {
 	int ret = 0;
 
-	if (bs) {
+	if (bs && !ctx->is_secure_playback) {
 		if ((bs->dma_addr & 63) != 0) {
 			mtk_v4l2_vdec_err(ctx, "bs dma_addr should 64 byte align");
 			return -EINVAL;
 		}
 	}
 
-	if (fb) {
+	if (fb && !ctx->is_secure_playback) {
 		if (((fb->base_y.dma_addr & 511) != 0) ||
 		    ((fb->base_c.dma_addr & 511) != 0)) {
 			mtk_v4l2_vdec_err(ctx, "frame buffer dma_addr should 512 byte align");
-- 
2.18.0


