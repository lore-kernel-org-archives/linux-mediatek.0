Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE47D5E120
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 03:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQ5zwEcgw6qdiVEtIoT8wTzF/dTbwsX8dOlMsiNZqo4=; b=x4QN6cBGVnw2NJYRUDmOW15q4c
	9ctkZbyMUPOPi+SIQTRQayvOVWTg36kJySyxya+5zXrXxFyNHJyUrXNl4c8auqGCuJtzA83QtIrfC
	2ljubY4imi+usHWfSSCQqPdOckKTrePkA0MiteZj7/NMfwe0dGKXBvUGWGW4fbyLWHdz3ddEbpmEt
	BEHH1l4Echc4CuN4u5pbHRz1CneehnSY5WIFy/v0Bh7oqqhVEHGJnV1s64QebA9i3OZhvOo1wx7TG
	VksZ1tIUpXkRFVDG4bXrPRVTChFAxG5PzoRAAA2POslDusvKhb9YbPxtZr2+PA5ti8Ilwhup88GwT
	XiFF50qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9FsC-00000009A23-1HH9;
	Fri, 08 Nov 2024 03:41:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Fjf-000000098nM-0jyc;
	Fri, 08 Nov 2024 03:32:36 +0000
X-UUID: 133155469d8211ef9048ed6ed365623b-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FQ5zwEcgw6qdiVEtIoT8wTzF/dTbwsX8dOlMsiNZqo4=;
	b=Hb8+I+Be+uucOb2bUPrAwWv4soPDFd1tMBBwEoWiTSRLeprLW9dPSFUdWl9g/pvyKSTRJa2PkvmdOdtDfOmGhXmbzlyZbghCMUxvV25iilRe/AtT+frDvo8o6P1NiKe4fAsdC5PnBGugwHULkBoXnEgdORg9WzfVE2X6qLnpFBA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:90aed585-921b-4137-aeff-c3cced60f4b9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:e0bbd01b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 133155469d8211ef9048ed6ed365623b-20241107
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2086931287; Thu, 07 Nov 2024 20:32:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 19:32:24 -0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:32:23 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 3/5] media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M
Date: Fri, 8 Nov 2024 11:32:12 +0800
Message-ID: <20241108033219.19804-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108033219.19804-1-yunfei.dong@mediatek.com>
References: <20241108033219.19804-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_193235_298806_FB300D93 
X-CRM114-Status: GOOD (  13.26  )
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

Getting the SRC buffer from M2M will pick a different than the one
used for current decode operation when the SRC buffer is removed
from ready list.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 25 +++++++------------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 24 ++++++------------
 2 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 90217cc8e242..0e1469effeb5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1060,24 +1060,20 @@ static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
 	memcpy(remote_vsi, vsi, sizeof(*vsi));
 }
 
-static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
-						 struct vdec_av1_slice_vsi *vsi,
-						 struct vdec_lat_buf *lat_buf)
+static void vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
+						  struct vdec_av1_slice_vsi *vsi,
+						  struct mtk_vcodec_mem *bs,
+						  struct vdec_lat_buf *lat_buf)
 {
-	struct vb2_v4l2_buffer *src;
+	struct mtk_video_dec_buf *src_buf_info;
 	struct vb2_v4l2_buffer *dst;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
-		return -EINVAL;
-
-	lat_buf->vb2_v4l2_src = src;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 
 	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, dst, true);
 	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
-
-	return 0;
 }
 
 static short vdec_av1_slice_resolve_divisor_32(u32 D, short *shift)
@@ -1724,10 +1720,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1_slice_instance *instance,
 	struct vdec_av1_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_buf);
-	if (ret)
-		return ret;
-
+	vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, lat_buf);
 	ret = vdec_av1_slice_setup_pfc(instance, pfc);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 3dceb668ba1c..a56f6bb879a6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -711,21 +711,16 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *
 	return 0;
 }
 
-static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
-						 struct vdec_lat_buf *lat_buf)
+static void vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
+						  struct mtk_vcodec_mem *bs,
+						  struct vdec_lat_buf *lat_buf)
 {
-	struct vb2_v4l2_buffer *src;
-	struct vb2_v4l2_buffer *dst;
-
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
-		return -EINVAL;
+	struct mtk_video_dec_buf *src_buf_info;
 
-	lat_buf->vb2_v4l2_src = src;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 
-	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
-	return 0;
+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_info, true);
 }
 
 static void vdec_vp9_slice_setup_hdr(struct vdec_vp9_slice_instance *instance,
@@ -1154,10 +1149,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
-	if (ret)
-		goto err;
-
+	vdec_vp9_slice_setup_lat_from_src_buf(instance, bs, lat_buf);
 	ret = vdec_vp9_slice_setup_pfc(instance, pfc);
 	if (ret)
 		goto err;
-- 
2.46.0


