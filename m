Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B05D20698
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 03:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU+SSnfV5dVJ6uVsk3EVppgf5w+lsXXrvc/G9j3QhJA=; b=g3b2EN86XMrQfz8v0j6k5nNBUC
	dARwkYDqacNfqJhGW2Lxcdcp2qTF5XGC/txQ5DmhiTCo1AesP362RIwn1r9HT2yylX486mIDSiavA
	WsVYS0uzGEu2vOFgweWwqTZE0vM/kRUNgYtRl5wnRDsMNHIdjuWCT3WAo588UssK0DBICtCp/5+uz
	pjQOdFCjFGFnMcBnemBGmdIuQmGSIgZWoPCwJeq25xYK0w55WSSwq79r0gqQe3CDlsa9peP7b2F8n
	NNXNtPVDo8sa0Uh6b8CcTECCCCB0tglJ4kcXvX9/s/qhYguL/qR1HMWbAdpwS+KO2GE2tlogAoxHo
	mDca0dwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0v8p-0000000APiS-1Zfb;
	Wed, 16 Oct 2024 03:56:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0v2Y-0000000AOTD-242g;
	Wed, 16 Oct 2024 03:49:40 +0000
X-UUID: a965425c8b7111efb3adad29d29602c1-20241015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YU+SSnfV5dVJ6uVsk3EVppgf5w+lsXXrvc/G9j3QhJA=;
	b=VOFEMlXrRLOq5n0WNoIdsk0c1gNkOGPcrnYr6YS4QGY5j9SDWN8zncrIXjDcgCfNRUSz8Hx2s0gxWkARfpyYlxUNVVZ4GQsuFyez0CqC7gYn2SYYVZZ2EgEbJdMsHYZ4KF4jOPG1+OUrg1lkTWNSPUFmMDWX1OJgT/oVopXaFjw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a3d048f9-36f8-48cf-8df9-caee89ba0d38,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:0331db06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a965425c8b7111efb3adad29d29602c1-20241015
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 584500443; Tue, 15 Oct 2024 20:49:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 11:49:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:49:30 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 4/4] media: mediatek: vcodec: remove parse nal info in kernel
Date: Wed, 16 Oct 2024 11:49:23 +0800
Message-ID: <20241016034927.8181-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016034927.8181-1-yunfei.dong@mediatek.com>
References: <20241016034927.8181-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.212500-8.000000
X-TMASE-MatchedRID: MFGjWhwUm9sS5iXdhf8hbuKXavbHY/C1xKAxBgoYewkS+jFO7d+PW3VX
	4shSYpPIKuucQMr5Le3XJhQ9fMGhecusSZtP31YsntCoZKs0mGWWHGENdT+VPwjGzxulqlQso8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgRktVxdpRt2L6uhz2mk+iQ0FGMo0B+b/BqbA6Blak4rF50r
	hAIR6PdJ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.212500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E8DADA46021DFC2E8C7393D37B35AA3742B47599BEDC26FD6778400713A5933D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_204938_750228_CA0F2755 
X-CRM114-Status: GOOD (  12.60  )
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

Hardware can parse the slice syntax to get nal information in
scp for extend architecture, needn't to parse it again in
kernel.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 24 +++----------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 69ca775bb3f1..c99a64384edf 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -802,11 +802,10 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	struct mtk_video_dec_buf *src_buf_info;
-	int nal_start_idx, err, timeout = 0;
+	int err, timeout = 0;
 	unsigned int data[2];
 	struct vdec_lat_buf *lat_buf;
 	struct vdec_h264_slice_share_info *share_info;
-	unsigned char *buf;
 
 	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
 				vdec_h264_slice_core_decode_ex,
@@ -830,14 +829,6 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs
 	share_info = lat_buf->private_data;
 	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
 
-	buf = (unsigned char *)bs->va;
-	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
-	if (nal_start_idx < 0) {
-		err = -EINVAL;
-		goto err_free_fb_out;
-	}
-
-	inst->vsi->dec.nal_info = buf[nal_start_idx];
 	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
@@ -846,7 +837,7 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
-	vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
+	vdec_h264_insert_startcode(inst->ctx->dev, bs->va, &bs->size,
 				   &share_info->h264_slice_params.pps);
 
 	*res_chg = inst->resolution_changed;
@@ -1078,11 +1069,10 @@ static int vdec_h264_slice_single_decode_ex(void *h_vdec, struct mtk_vcodec_mem
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
 	struct vdec_fb *fb;
-	unsigned char *buf;
 	unsigned int data[2], i;
 	u64 y_fb_dma, c_fb_dma;
 	struct mtk_vcodec_mem *mem;
-	int err, nal_start_idx;
+	int err;
 
 	/* bs NULL means flush decoder */
 	if (!bs)
@@ -1117,14 +1107,6 @@ static int vdec_h264_slice_single_decode_ex(void *h_vdec, struct mtk_vcodec_mem
 	memcpy(&inst->vsi_ctx_ex.h264_slice_params, &inst->h264_slice_param,
 	       sizeof(inst->vsi_ctx_ex.h264_slice_params));
 
-	buf = (unsigned char *)bs->va;
-	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
-	if (nal_start_idx < 0) {
-		err = -EINVAL;
-		goto err_free_fb_out;
-	}
-	inst->vsi_ctx_ex.dec.nal_info = buf[nal_start_idx];
-
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
 		mtk_vdec_debug(inst->ctx, "- resolution changed -");
-- 
2.46.0


