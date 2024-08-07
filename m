Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA88C52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qE31DCp4yHPnBShoWFTBjcGkXm/pncTxOzRx1NDfCOU=; b=kpqczII9kANNQJV3HUAGaZneWB
	q58uu+fgzlqEVaRV9oq6oFAJL4QYmPaV966DKoizTdrLDSlW1XnOKpz3hFV+zVEU4eeMvDzrZlP8C
	Bc69Flquaa1zc/sAliU0Rt6sBRXIDYCWdcSXZFpQIybQrJbHwxCS55NphhYNU1ZS96OyI8YUXSGfS
	3F8ga7woe/Vqj1hoMbMOtmX++/VRp4rFGUKECEf1VCiSgW65z3YOsgzjDa67LP91bLbJVfaZbk/3u
	I/bXcHA4W2CA25ZlIcMfN5l+9/wJsfKuTe9d1xBlY1BTkTrxwX6E+M83Mnes0gzM+ciKZcwbKcNSO
	Hi9dpIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbc9L-00000004ObK-1yo6;
	Wed, 07 Aug 2024 08:36:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbc8n-00000004OTG-3BJ8;
	Wed, 07 Aug 2024 08:35:31 +0000
X-UUID: fe8a31ea549711ef955bff358274dad2-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qE31DCp4yHPnBShoWFTBjcGkXm/pncTxOzRx1NDfCOU=;
	b=ZRz9eYSgdl3XAndogrBU29KsiP9jXwcEC5yfu5YwKQGHt/wi9pXUL5JMK5nL6j4W9N/1L84dFOi+OSB65SPLw2ed9f9hdc6nAi/0cZYlcznRdREfnRdSz3bo0dC/EgKjlS6SirVeM+pPNhUsOcTlkQu4N8f/ulefD11ytxBt1dM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:6c8a4f8e-206a-4eda-990d-5aa56def2531,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:6c1e4cc1-acff-4a0f-9582-14bcdf4ed7e0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fe8a31ea549711ef955bff358274dad2-20240807
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1408333497; Wed, 07 Aug 2024 01:35:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 16:24:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 16:24:49 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 3/7] media: mediatek: vcodec: flush decoder before stream off
Date: Wed, 7 Aug 2024 16:24:33 +0800
Message-ID: <20240807082444.21280-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807082444.21280-1-yunfei.dong@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_013529_810950_0905870F 
X-CRM114-Status: GOOD (  14.29  )
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

Flush decoder will reset the driver to flush status. If lat or core
work queue in active before flush when stream off, will lead to get
dst buffer NULL or buff done with one non-existent source buffer.

Flush decoder when stream off no matter output or capture queue
calling stream off firstly.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 45 ++++++++++---------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 7080ca3e18b0..fc4ee1fb7cd1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -882,6 +882,29 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
 
+	if (ctx->state >= MTK_STATE_HEADER && ctx->state != MTK_STATE_FLUSH) {
+		/*
+		 * The resolution hasn't been changed when STREAMOFF is called.
+		 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
+		 * is called.
+		 */
+		ctx->picinfo = ctx->last_decoded_picinfo;
+
+		mtk_v4l2_vdec_dbg(2, ctx,
+				  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
+				  ctx->id, ctx->last_decoded_picinfo.pic_w,
+				  ctx->last_decoded_picinfo.pic_h,
+				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+				  ctx->last_decoded_picinfo.buf_w,
+				  ctx->last_decoded_picinfo.buf_h);
+
+		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
+		if (ret)
+			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
+
+		ctx->state = MTK_STATE_FLUSH;
+	}
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
 			if (src_buf != &ctx->empty_flush_buf.vb) {
@@ -894,28 +917,6 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
-		if (ctx->state >= MTK_STATE_HEADER) {
-			/*
-			 * The resolution hasn't been changed when STREAMOFF is called.
-			 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
-			 * is called.
-			 */
-			ctx->picinfo = ctx->last_decoded_picinfo;
-
-			mtk_v4l2_vdec_dbg(2, ctx,
-					  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
-					  ctx->id, ctx->last_decoded_picinfo.pic_w,
-					  ctx->last_decoded_picinfo.pic_h,
-					  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-					  ctx->last_decoded_picinfo.buf_w,
-					  ctx->last_decoded_picinfo.buf_h);
-
-			ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
-			if (ret)
-				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
-		}
-
-		ctx->state = MTK_STATE_FLUSH;
 		return;
 	}
 
-- 
2.46.0


