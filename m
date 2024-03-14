Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5949C54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 11:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8AOqNEE2z+8/C4fBu6xT5uIPzpeWScBA5hbmroPZmo=; b=b3O/NvzYdotmlBPZtrWRPaUPP7
	ikdRe0fITuGYz8Qkr/EmTOoL3sYGdwEHG5QDdzK4Lwwsit0B4Pas1vpL6LNVnHqUgQvCB9tVKXrUc
	QrXEaacASPdKwfl3H7bvbitN3qXHJHUQJ6fCobhnbWorkPCwQLkSMSEj8xGhgn+Sn+zB+ENrVwBAF
	t4YRz1j4iTX790aqXr6aCAGe0NlUXMu0svjAjkD6PzEQL3Nsz8OYOQotPKwAXdRaGrklgpFDfVJND
	MIh6d8rCZMvrFRNox6gxVVMMQodRQE4chp5TG5jQNMFvALescpvrfrjnxL/oURH8jir4Bf3DTf4V8
	YgHzZUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjgV-0000000E8vA-06cL;
	Thu, 14 Mar 2024 11:55:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjgR-0000000E8u6-41IR;
	Thu, 14 Mar 2024 11:55:41 +0000
X-UUID: c3e70650e1f911eeacdb61a41848c7d2-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Y8AOqNEE2z+8/C4fBu6xT5uIPzpeWScBA5hbmroPZmo=;
	b=qLmfq5aaW433KL62H6X/ARRjZexknv8j8OaK7A8VIJgMFNiHz8Kxht99QQopvK1m/QmKJkk88MViSRL+UhPeBHO1s0MrFW42N2n2rVjyoIwSdG7fVAbfbA5Fwe/k5u2pPIsZRhguy0i4CNVHZGuok284S+39anrw9tgcDi6BrB8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4071faf4-277c-4c69-8b08-edf529b81738,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:32890085-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c3e70650e1f911eeacdb61a41848c7d2-20240314
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1241093369; Thu, 14 Mar 2024 04:55:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 19:44:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 19:44:56 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,3/4] media: mediatek: vcodec: flush decoder before remove all source buffer
Date: Thu, 14 Mar 2024 19:44:51 +0800
Message-ID: <20240314114452.17532-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314114452.17532-1-yunfei.dong@mediatek.com>
References: <20240314114452.17532-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.180300-8.000000
X-TMASE-MatchedRID: LQTn7QLkznoEQqIqKFLtTlu4M/xm4KZebnWMzHijq6Sen0qBdy7fjBXb
	HvCbSY/6sTCecWdCeaflMF4v3SREo4x1g1lTiexdA9lly13c/gGOJZyIAulM0xQLE16MmfDLS20
	1H/juErxAEhD9e0n6VSfyuWB93oCTC9YpJ/fXjNeeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8ifEz
	J5hPndGZnMVq7tIlw2tPfRu/NO6WJzOLRNuFmkzrkqWJxjUSaiqe1i8szqq0zFmp618OSM6Obqo
	nfkRZEWXfGn12bbCvxioaYV0aSx3Bz+PhojlLUuev0YPTN868QBqq+/+aGCsQhzL04Or2eZVlxr
	1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.180300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6680B778D7103250B9479887C3CEB8CB3823E585258715E9BDE23C31FE0953662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_045540_017186_D3A837BD 
X-CRM114-Status: GOOD (  11.87  )
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

Flush decoder will reset all driver to init status, lat and core work
queue will stop to work. If lat or core work queue in working when
remove all source buffer, will lead to remove source buffer again
or buff done with one non-existent source buffer.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 3766e2176899..cdd36a5320cd 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -835,17 +835,6 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			if (src_buf != &ctx->empty_flush_buf.vb) {
-				struct media_request *req =
-					src_buf->vb2_buf.req_obj.req;
-
-				if (req)
-					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
-				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-			}
-		}
-
 		if (ctx->state >= MTK_STATE_HEADER) {
 			/* Until STREAMOFF is called on the CAPTURE queue
 			 * (acknowledging the event), the driver operates
@@ -868,6 +857,17 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
 		}
 
+		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
+			if (src_buf != &ctx->empty_flush_buf.vb) {
+				struct media_request *req =
+					src_buf->vb2_buf.req_obj.req;
+
+				if (req)
+					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			}
+		}
+
 		ctx->state = MTK_STATE_FLUSH;
 		return;
 	}
-- 
2.18.0


