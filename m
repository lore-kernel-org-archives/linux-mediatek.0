Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E65C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 05:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q44V2KOaAYcD/N+xk+VWumpglKqAK6Nls/jOUYK03DQ=; b=3Xzl/B6E6POMfgohP7w6QyDl9w
	wtBpDVkbEGX6SuK+gY5JDseK6yNHVnKksohcH1XazUFDL0ndfUJwFnvhJNcpd1QinlgKgSTe/d58D
	qufGqcdWh3WMP7Hygx24DhqdyjtH9ktD6dKD/Cvx9yNtak/52kMpjn1LF8Xz/RBtFHYca4lDYhFdt
	ZHKDT3x6/Kz1IxH+fXJLiQNWBzVxRBUDdn09ks4w1Y2G4iyeakUKhGJGWu17vO4YRtzxi7sJmt77l
	st3PrianH74P0tQp+fQDPKWoJ4LZtoItbnyBGQoQEEZcxnsMDTDMfcZ4SYRvqFADkfZkCm0k+ZK/2
	97Q2m9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovBPp-0008pO-SG; Wed, 16 Nov 2022 05:56:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovBPn-0008np-1h; Wed, 16 Nov 2022 05:56:52 +0000
X-UUID: add3c15c149a447fb23ed65a6146bc37-20221115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=q44V2KOaAYcD/N+xk+VWumpglKqAK6Nls/jOUYK03DQ=;
	b=vFGnSrW4nJV/bfqQNcxabBjTXcTUmPtijIvXK8SG1rLpoCjm6BjEcFKFLLxm5tIaLdBw6OaxVoKZg8Oe4oEQ34G3lVYyODCzYLkGspO1riVmBDx5A3G2H3AbX1qvBFLp+Z2aZUPsMPlaHcwVMUJf1f0lWgQYvTKK3qvgotaBEdE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:70983d50-021a-4b5a-ba40-45c9c90e44fb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:dec8a1f3-9094-45e8-b6eb-26f09041f731,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: add3c15c149a447fb23ed65a6146bc37-20221115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 936939334; Tue, 15 Nov 2022 22:56:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 16 Nov 2022 13:56:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 16 Nov 2022 13:56:15 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3] media: mediatek: vcodec: fix h264 cavlc bitstream fail
Date: Wed, 16 Nov 2022 13:56:13 +0800
Message-ID: <20221116055613.13991-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_215651_104288_C30ED305 
X-CRM114-Status: GOOD (  18.12  )
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

Some cavlc bistream will decode fail when the frame size is smaller than
20 bytes. Need to add pending data at the end of the bitstream.

For the minimum size of mapped memory is 256 bytes(16x16), adding four bytes data
won't lead to access unknown virtual memory.

Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless H.264 decoding for mt8192")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
changed with v2:
- using flag to separate, not compatible name.
- replace small with smaller.
---
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
index 2b7576265f48..0e7a70862525 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
@@ -150,6 +150,7 @@ struct vdec_h264_slice_share_info {
  * @dpb:		decoded picture buffer used to store reference
  *			buffer information
  *@is_field_bitstream:	is field bitstream
+ * @is_need_pending_data: add startcode for cavlc bistream when bs size is smaller than 20 bytes
  */
 struct vdec_h264_slice_inst {
 	unsigned int slice_dec_num;
@@ -169,6 +170,7 @@ struct vdec_h264_slice_inst {
 
 	struct v4l2_h264_dpb_entry dpb[16];
 	bool is_field_bitstream;
+	bool is_need_pending_data;
 };
 
 static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
@@ -395,6 +397,7 @@ static void vdec_h264_slice_get_crop_info(struct vdec_h264_slice_inst *inst,
 
 static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
 {
+	struct device *dev = &ctx->dev->plat_dev->dev;
 	struct vdec_h264_slice_inst *inst;
 	int err, vsi_size;
 
@@ -423,6 +426,16 @@ static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
 
+	/* Need to add pending data at the end of bitstream when bs_sz is small than
+	 * 20 bytes for cavlc bitstream, or lat will decode fail. This pending data is
+	 * useful for mt8192 and mt8195 platform.
+	 *
+	 * cavlc bitstream when entropy_coding_mode_flag is false.
+	 */
+	if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec") ||
+	    of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
+		inst->is_need_pending_data = true;
+
 	mtk_vcodec_debug(inst, "lat struct size = %d,%d,%d,%d vsi: %d\n",
 			 (int)sizeof(struct mtk_h264_sps_param),
 			 (int)sizeof(struct mtk_h264_pps_param),
@@ -545,6 +558,19 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	return 0;
 }
 
+static void vdec_h264_insert_startcode(struct vdec_h264_slice_inst *inst, unsigned char *buf,
+				       size_t *bs_size, struct mtk_h264_pps_param *pps)
+{
+	if (!inst->is_need_pending_data || pps->entropy_coding_mode_flag || *bs_size > 20)
+		return;
+
+	buf[*bs_size] = 0;
+	buf[*bs_size + 1] = 0;
+	buf[*bs_size + 2] = 1;
+	buf[*bs_size + 3] = 0xff;
+	(*bs_size) += 4;
+}
+
 static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 				      struct vdec_fb *fb, bool *res_chg)
 {
@@ -588,9 +614,6 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	inst->vsi->dec.nal_info = buf[nal_start_idx];
-	inst->vsi->dec.bs_buf_addr = (u64)bs->dma_addr;
-	inst->vsi->dec.bs_buf_size = bs->size;
-
 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
@@ -598,6 +621,10 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (err)
 		goto err_free_fb_out;
 
+	vdec_h264_insert_startcode(inst, buf, &bs->size, &share_info->h264_slice_params.pps);
+	inst->vsi->dec.bs_buf_addr = (uint64_t)bs->dma_addr;
+	inst->vsi->dec.bs_buf_size = bs->size;
+
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
 		mtk_vcodec_debug(inst, "- resolution changed -");
-- 
2.18.0


