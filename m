Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11689C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gD7N/DSSbp1mar+/nG/ZYQKwg+fZQKRkhDobou7t55w=; b=L16Jpf62QD6P7V4i/WyrLGzI8i
	y7Kjv+dKcVEGfITkD97bLRzXZvvU8v/KezcTt/VJF82FJN3XqHCyShewq9tugjSz6eulfaPQ2VoAA
	zvbs1Uve6wmapYp0FPzLP0AFOb+WSzWfeYVDTWsh01V/3Q+hngg9MOnQ1YUjpVLBi3iHDTaDbuiSP
	KVsVFw1ex9mJgROVxkkgChoE0/rTKmvgig8MHh4wJCycVIYSI9yT5JSBXFJmZ484ifphtpMAreIvJ
	5FQfqDCBfkSy7HlaQYK6fV03bLGP7KknP/IpCI20LQG6A3wkH5LL9iPGLrudUKtZ59jV5G0tRAAsz
	Ifr+Gzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMMD-009g77-Kx; Mon, 17 Oct 2022 09:24:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMLE-009fgJ-Tz; Mon, 17 Oct 2022 09:23:26 +0000
X-UUID: 8875f9a868bc469d8e7f1651b54c958e-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gD7N/DSSbp1mar+/nG/ZYQKwg+fZQKRkhDobou7t55w=;
	b=i3x8AG2rgTxMncYCZkjdDDrPgOnhj1V7F17eFql8FdFiujyWPTd+cNmUixs7KrGXG1oYRsnpAFDqFwGyJmsfXHswiwfar5C7LUYzI4SFsUjj8yyms2XwnyG5+vv4x4BpuhhhAwFLCizYrWaLL0OkaGI9WwqNzv8F4WrfFJerhxA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9558b718-b560-45b0-a75e-dfe590e70c2d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:e87653b6-a023-44ff-92b1-76c504f71c7a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8875f9a868bc469d8e7f1651b54c958e-20221017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 666226713; Mon, 17 Oct 2022 02:23:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 17 Oct 2022 17:02:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 17 Oct 2022 17:02:40 +0800
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
Subject: [PATCH] media: mediatek: vcodec: fix h264 cavlc bitstream fail
Date: Mon, 17 Oct 2022 17:02:08 +0800
Message-ID: <20221017090208.19041-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_022325_022087_44BF52B5 
X-CRM114-Status: GOOD (  14.63  )
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

Some cavlc bistream will decode fail when the frame size is small than
20 bytes. Need to add pending data at the end of the bitstream.

For the size of mapped memory is at least one page, adding four bytes data
won't lead to access unknown virtual memory.

Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless H.264 decoding for mt8192")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
index 4cc92700692b..c1583dddcb04 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
@@ -539,6 +539,24 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	return 0;
 }
 
+static void vdec_h264_insert_startcode(struct mtk_vcodec_dev *vcodec_dev, unsigned char *buf,
+				       size_t *bs_size, struct mtk_h264_pps_param *pps)
+{
+	struct device *dev = &vcodec_dev->plat_dev->dev;
+
+	/* cavlc bitstream when entropy_coding_mode_flag is false. */
+	if (pps->entropy_coding_mode_flag || *bs_size > 20 ||
+	    !(of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec") ||
+	    of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec")))
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
@@ -582,9 +600,6 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	inst->vsi->dec.nal_info = buf[nal_start_idx];
-	inst->vsi->dec.bs_buf_addr = (u64)bs->dma_addr;
-	inst->vsi->dec.bs_buf_size = bs->size;
-
 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
@@ -592,6 +607,12 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (err)
 		goto err_free_fb_out;
 
+	vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
+				   &share_info->h264_slice_params.pps);
+
+	inst->vsi->dec.bs_buf_addr = (uint64_t)bs->dma_addr;
+	inst->vsi->dec.bs_buf_size = bs->size;
+
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
 		mtk_vcodec_debug(inst, "- resolution changed -");
-- 
2.25.1


