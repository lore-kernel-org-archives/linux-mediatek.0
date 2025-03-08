Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A2DC282EC
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Mar 2025 07:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yrs6Kl3s6CsDWXhNqJl2Oe/kmJUZdpz3oXbEeCXJujo=; b=AgVsn/h/DsUqoDSfH9G85ruBgL
	F3puq3+ZCMlprmwhdZPeOrrx9bf5KzfJZfW++A+Vq2l5zhmeAuoUhMARF1tXdO/fPloY/zvUtIEny
	KnZS8uC4Y0NlboKtqVR2m1djAziyUeCD6Yz9X+n90gTD/GwQ3Jgk0MRmBa4i4OvzKrHklufWID1vb
	0LmMlW2U44FvEDFLAqVq4gBccufCugI/QR46e2NYJ9JhvgTm28iZvWcHykgqnxmxOZszxZ1r0NxqL
	ReT/qmglcWOvhZeKDkSEeRtT7yKKLwQi8fBfJyjTVdqEjBh0Nj5sxznkCU6+5w3OjYQrSMwPtXZwL
	FH8aSu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqowR-0000000GKMA-348c;
	Sat, 08 Mar 2025 07:49:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqouo-0000000GK8k-2zPP;
	Sat, 08 Mar 2025 07:48:11 +0000
X-UUID: ac9e71fafbf111ef83f2a1c9db70dae0-20250308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Yrs6Kl3s6CsDWXhNqJl2Oe/kmJUZdpz3oXbEeCXJujo=;
	b=F0t7dYElJyrQtg9qfGf2jBHoZz/2YpR2RzI4uJr2mCxQhI6ZAVlZfdvj5bhfisaPCcNjqTaZmoGO4I8R39ye2CwhlB5/7lXyk+msJ5JuO8MdGtQY7zUVuuOMdKSb1pCSkxq7+JmqYrO3WHlwWtxKBh9fo47r1qHmZPp8gP4C7ys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:93660576-1ead-4341-8a28-408b7ac6d405,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:e1a113c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ac9e71fafbf111ef83f2a1c9db70dae0-20250308
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2001265094; Sat, 08 Mar 2025 00:48:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Mar 2025 15:48:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Mar 2025 15:48:03 +0800
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
Subject: [PATCH v8 1/3] media: mediatek: vcodec: remove vsi operation in common interface
Date: Sat, 8 Mar 2025 15:47:55 +0800
Message-ID: <20250308074802.18929-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250308074802.18929-1-yunfei.dong@mediatek.com>
References: <20250308074802.18929-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_234810_752548_BCE0A70B 
X-CRM114-Status: GOOD (  13.17  )
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

Extend the VSI (video shared information) struct to allow sending slice
parameters to SCP, as the parameters have changed on MT8188 architecture.
Remove VSI related information from the common interface to ensure, that
the interface is usable by architectures with and without the extended
parameters. The new VSI extensions will be introduced in later patches.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 1ed0ccec5665..ab192ce0b851 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -171,9 +171,9 @@ struct vdec_h264_slice_inst {
 };
 
 static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
-						  struct vdec_h264_slice_share_info *share_info)
+						  struct vdec_h264_slice_share_info *share_info,
+						  struct vdec_h264_slice_lat_dec_param *slice_param)
 {
-	struct vdec_h264_slice_lat_dec_param *slice_param = &inst->vsi->h264_slice_params;
 	const struct v4l2_ctrl_h264_decode_params *dec_params;
 	const struct v4l2_ctrl_h264_scaling_matrix *src_matrix;
 	const struct v4l2_ctrl_h264_sps *sps;
@@ -266,9 +266,6 @@ static int get_vdec_sig_decode_parameters(struct vdec_h264_slice_inst *inst)
 	mtk_vdec_h264_get_ref_list(b0_reflist, v4l2_b0_reflist, reflist_builder.num_valid);
 	mtk_vdec_h264_get_ref_list(b1_reflist, v4l2_b1_reflist, reflist_builder.num_valid);
 
-	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
-	       sizeof(inst->vsi_ctx.h264_slice_params));
-
 	return 0;
 }
 
@@ -608,7 +605,8 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
-	err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
+						     &inst->vsi->h264_slice_params);
 	if (err)
 		goto err_free_fb_out;
 
@@ -749,6 +747,9 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
+	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx.h264_slice_params));
+
 	buf = (unsigned char *)bs->va;
 	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
 	if (nal_start_idx < 0) {
-- 
2.46.0


