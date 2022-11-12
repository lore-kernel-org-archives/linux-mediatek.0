Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A48FC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Nov 2022 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqUwc0KfzE+JLt+0m8FqWIvXx2dWICjp0wZ8oKRmkCA=; b=YxQSYzjOAWBzCosJLxymldrNBk
	upayt1odxTuvYXJjZi83y5SCzl/87G4eWaAUZsCb83V0KisevCA2wRagfpWmh0+vanyqFmIsv9UIp
	YRsopPIhp4VyNtTLCqiMdU9tdGyXn6v+ME0uF6qJloOv62axzrLzaDmpJ57yftmbgVHoUiB9D6pUN
	c+b99Nsp/o1OA715qJ0MXHo1d0DpIo2o/FnI0/S+SspFmU2TN9y07njzoSJ5kJmikt6dFcFVqorwv
	bR/YJx9mGOVirTNBsukZqL+22QC94uu7SlVaaBjeN1MqnLy+ocr+Mz9c35jOJ9ZQwPCeesjIlZ6zm
	oBHp8gcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otn24-004kXN-6D; Sat, 12 Nov 2022 09:42:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otn1x-004kTg-6G; Sat, 12 Nov 2022 09:42:30 +0000
X-UUID: cbe815b46f914f0dabdcdf91226fee29-20221112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fqUwc0KfzE+JLt+0m8FqWIvXx2dWICjp0wZ8oKRmkCA=;
	b=ioDcLLHk3+YFVlti36YL8oNMhG2mVyaX26b3kxI7ffZfYiLVrw8HYKRoFF0TZ9GLVq2qrWHH5V7jjPHU1MpWII6JwzZntHL7dQQWaSG402QulDgFSfzxE2LU1yL505+TMiMSsC6txUw3JtT3AuV9NfkBryEmasWckCGNWJKNavY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:86809fab-7947-4e50-837f-de31d3e0e23d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.12,REQID:86809fab-7947-4e50-837f-de31d3e0e23d,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:62cd327,CLOUDID:1fe91286-088c-4756-8f76-577be701e693,B
	ulkID:221112174153PU5PVGYW,BulkQuantity:4,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: cbe815b46f914f0dabdcdf91226fee29-20221112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 921200093; Sat, 12 Nov 2022 02:42:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 12 Nov 2022 17:41:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 12 Nov 2022 17:41:48 +0800
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
Subject: [PATCH 3/5] media: mediatek: vcodec: Fix h264 set lat buffer error
Date: Sat, 12 Nov 2022 17:41:42 +0800
Message-ID: <20221112094144.4256-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221112094144.4256-1-yunfei.dong@mediatek.com>
References: <20221112094144.4256-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_014229_249397_A448E490 
X-CRM114-Status: GOOD (  13.53  )
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
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
index 4cc92700692b..2b7576265f48 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
@@ -471,6 +471,12 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	       sizeof(share_info->h264_slice_params));
 
 	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
+	if (!fb) {
+		err = -EBUSY;
+		mtk_vcodec_err(inst, "fb buffer is NULL");
+		goto vdec_dec_end;
+	}
+
 	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
 	vdec_fb_va = (unsigned long)fb;
 
@@ -630,7 +636,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
 		mtk_vcodec_debug(inst, "lat decode err: %d", err);
-		goto err_scp_decode;
+		goto err_free_fb_out;
 	}
 
 	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
@@ -647,12 +653,17 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
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
@@ -669,10 +680,6 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
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


