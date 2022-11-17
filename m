Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FDBC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrBrelk5E6V7oQz6lAqQbyOq+sxngawPs1R5zG57/GQ=; b=XgE45AZiP/WszrVyJqiWY8xAbw
	L6jvue+n9nhJRmWCQWnUlWEmeTvtzh5Il+MiycX2K55AJgZJmWNfeu99igFnlT1t0t0MvJgz3VZHV
	uHTQnRgldtqdj0PvY0nF95OXSoLajnCYIqn4tg05qbX4qbLRodnkLxLsUdX/NUDhK3C2Mk+Jp7Vnq
	geTEk6VFu8qT2hLjj8TosMX3Z1tMo4wTU1ruhjH5pOn651DLlAJFz0hRcWC5D+D+uKSiNvTfGR41p
	RMSnuGsaNIfXR6OSqLm7mw3Np+78dyy7igj1VD5ISIxJpPf/iZwD6DSC6Zw7qmx+TxSesTVe3vnfk
	iI0XobYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovbfX-00CLcW-80; Thu, 17 Nov 2022 09:58:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovbSk-00CDMj-5x; Thu, 17 Nov 2022 09:45:39 +0000
X-UUID: d7b1b600a41349d2b5ec28a19492a7ab-20221117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hrBrelk5E6V7oQz6lAqQbyOq+sxngawPs1R5zG57/GQ=;
	b=Op1tIZu7VhygqmgiBfYKeVBX4zoTKK2TX8ixOpVAQITd/GbK27jNMu8VRjut45wZ2ruvt6+BV34Ntp9FsBn0riPKe1GiR7nLfvUSPAFXZIyV1+YBu3w3TTVt5Xdy0O8XoUT4IiQlbH8zXowGmsLh8rkEmW+J8d0HQ1PjQ4WZnqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:952d797b-3aa1-404a-9828-04afee0bbf34,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:132789f8-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d7b1b600a41349d2b5ec28a19492a7ab-20221117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 279735915; Thu, 17 Nov 2022 02:45:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 17 Nov 2022 17:24:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 17 Nov 2022 17:24:58 +0800
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
Subject: [PATCH v2,3/5] media: mediatek: vcodec: Fix h264 set lat buffer error
Date: Thu, 17 Nov 2022 17:24:51 +0800
Message-ID: <20221117092453.31366-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117092453.31366-1-yunfei.dong@mediatek.com>
References: <20221117092453.31366-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_014538_252599_4681671B 
X-CRM114-Status: GOOD (  13.92  )
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

Will set lat buffer to lat_list two times when lat decode timeout for
inner racing mode.

If core thread can't get frame buffer, need to return error value.

Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless H.264 decoding for mt8192")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
- fix comments according to AngeloGioacchino's suggestion.
---
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 28 +++++++++++--------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
index 4cc92700692b..8f262e86bb05 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
@@ -471,14 +471,19 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	       sizeof(share_info->h264_slice_params));
 
 	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
-	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
-	vdec_fb_va = (unsigned long)fb;
+	if (!fb) {
+		err = -EBUSY;
+		mtk_vcodec_err(inst, "fb buffer is NULL");
+		goto vdec_dec_end;
+	}
 
+	vdec_fb_va = (unsigned long)fb;
+	y_fb_dma = (u64)fb->base_y.dma_addr;
 	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
 		c_fb_dma =
 			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
 	else
-		c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+		c_fb_dma = (u64)fb->base_c.dma_addr;
 
 	mtk_vcodec_debug(inst, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma,
 			 c_fb_dma);
@@ -630,7 +635,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
 		mtk_vcodec_debug(inst, "lat decode err: %d", err);
-		goto err_scp_decode;
+		goto err_free_fb_out;
 	}
 
 	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
@@ -647,12 +652,17 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	/* wait decoder done interrupt */
 	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+	if (timeout)
+		mtk_vcodec_err(inst, "lat decode timeout: pic_%d", inst->slice_dec_num);
 	inst->vsi->dec.timeout = !!timeout;
 
 	err = vpu_dec_end(vpu);
-	if (err == SLICE_HEADER_FULL || timeout || err == TRANS_BUFFER_FULL) {
-		err = -EINVAL;
-		goto err_scp_decode;
+	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
+		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
+			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
+		inst->slice_dec_num++;
+		mtk_vcodec_err(inst, "lat dec fail: pic_%d err:%d", inst->slice_dec_num, err);
+		return -EINVAL;
 	}
 
 	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
@@ -669,10 +679,6 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	inst->slice_dec_num++;
 	return 0;
-
-err_scp_decode:
-	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
-		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
 err_free_fb_out:
 	vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
 	mtk_vcodec_err(inst, "slice dec number: %d err: %d", inst->slice_dec_num, err);
-- 
2.18.0


