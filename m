Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2227CD1294
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wn/76pYQR540CZbFJPHpX8ZPYvd3JaV3IggNNQ6u4qw=; b=QFdKSuwqXHAfvkkgtDZpmZnDf9
	owPuquUyOTf87IEqjMUeDC22w4iOISaptne8ew9KfhO2DqFKNWxcTns1z8eiQrilZ/AoJK62edQ4w
	o4O2H2IsDpIGKHO3gmADpvKHdSlOGuPO6pOLJXB4wqPNGB0Oj2aXBy+W/rPBPqvHCNGzfiEbsqPNO
	0TMVKSCvIXw95KLUv9+mWhSQJxQJGje6i0SlC7IzBmCmFVOGpsbop8xZSwbkFRUCAx//XQQJoiGEa
	j+lf/mNG4GkZy+on3UJdgwDUtmjx4aV6UKzMpOZWWhjoKnu+9Lm3qV4Q02EfrK/kL0t6Q7WPfxMs/
	TE1sDmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrx6d-0000000FFs0-2PTs;
	Wed, 03 Apr 2024 09:40:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrx6a-0000000FFqv-381z;
	Wed, 03 Apr 2024 09:40:30 +0000
X-UUID: 31c16ff4f19e11eeac1957ae9f99f617-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Wn/76pYQR540CZbFJPHpX8ZPYvd3JaV3IggNNQ6u4qw=;
	b=eiJRGOy+/8Mz8jPvvzIxhYx2dZpUfwldR3fDlu+oumJoPi2yFxcmEr2i2/xC8IZBakAETPUzz6hQgW9GXlDPvOjZbxLbz90ggRFgrWIw9XSGh0iDpI3YLYwI5I+ko7MuhkhVgWVEuEbIDZccWGi+K7qcXIDDrODg/ncKijOcm0U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c12630e7-a6de-48fd-97c3-ad17ecab62a4,IP:0,U
	RL:0,TC:0,Content:43,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:43
X-CID-META: VersionHash:6f543d0,CLOUDID:9ae54482-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 31c16ff4f19e11eeac1957ae9f99f617-20240403
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1707717442; Wed, 03 Apr 2024 02:40:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 17:30:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 17:30:19 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] media: mediatek: vcodec: fix the error sizeimage for 10bit bitstream
Date: Wed, 3 Apr 2024 17:30:18 +0800
Message-ID: <20240403093018.13168-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_024028_955530_DBA45F35 
X-CRM114-Status: GOOD (  12.19  )
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

The sizeimage of each plane are calculated the same way for 8bit and
10bit bitstream. Need to enlarge the sizeimage with simeimage*5/4 for
10bit bitstream when try and set fmt.

Fixes: 9d86be9bda6c ("media: mediatek: vcodec: Add driver to support 10bit")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 47 ++++++++++++++-----
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 9107707de6c4..45209894f1fe 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -259,6 +259,7 @@ static int vidioc_try_fmt(struct mtk_vcodec_dec_ctx *ctx, struct v4l2_format *f,
 		pix_fmt_mp->num_planes = 1;
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		unsigned int dram_y, dram_c, dram_y_10bit, dram_c_10bit;
 		int tmp_w, tmp_h;
 
 		/*
@@ -280,22 +281,42 @@ static int vidioc_try_fmt(struct mtk_vcodec_dec_ctx *ctx, struct v4l2_format *f,
 		    (pix_fmt_mp->height + 64) <= frmsize->max_height)
 			pix_fmt_mp->height += 64;
 
-		mtk_v4l2_vdec_dbg(0, ctx,
-				  "before resize wxh=%dx%d, after resize wxh=%dx%d, sizeimage=%d",
-				  tmp_w, tmp_h, pix_fmt_mp->width, pix_fmt_mp->height,
-				  pix_fmt_mp->width * pix_fmt_mp->height);
+		dram_y = pix_fmt_mp->width * pix_fmt_mp->height;
+		dram_c = dram_y / 2;
+
+		dram_y_10bit = dram_y * 5 / 4;
+		dram_c_10bit = dram_y_10bit / 2;
 
 		pix_fmt_mp->num_planes = fmt->num_planes;
-		pix_fmt_mp->plane_fmt[0].sizeimage =
-				pix_fmt_mp->width * pix_fmt_mp->height;
-		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
-
-		if (pix_fmt_mp->num_planes == 2) {
-			pix_fmt_mp->plane_fmt[1].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 2;
-			pix_fmt_mp->plane_fmt[1].bytesperline =
-				pix_fmt_mp->width;
+		if (pix_fmt_mp->num_planes == 1) {
+			if (ctx->is_10bit_bitstream) {
+				pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width * 5 / 4;
+				pix_fmt_mp->plane_fmt[0].sizeimage = dram_y_10bit + dram_c_10bit;
+			} else {
+				pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
+				pix_fmt_mp->plane_fmt[0].sizeimage = dram_y + dram_c;
+			}
+		} else {
+			if (ctx->is_10bit_bitstream) {
+				pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width * 5 / 4;
+				pix_fmt_mp->plane_fmt[1].bytesperline = pix_fmt_mp->width * 5 / 4;
+
+				pix_fmt_mp->plane_fmt[0].sizeimage = dram_y_10bit;
+				pix_fmt_mp->plane_fmt[1].sizeimage = dram_c_10bit;
+			} else {
+				pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
+				pix_fmt_mp->plane_fmt[1].bytesperline = pix_fmt_mp->width;
+
+				pix_fmt_mp->plane_fmt[0].sizeimage = dram_y;
+				pix_fmt_mp->plane_fmt[1].sizeimage = dram_c;
+			}
 		}
+
+		mtk_v4l2_vdec_dbg(0, ctx,
+				  "before resize:%dx%d, after resize:%dx%d, sizeimage=0x%x_0x%x",
+				  tmp_w, tmp_h, pix_fmt_mp->width, pix_fmt_mp->height,
+				  pix_fmt_mp->plane_fmt[0].sizeimage,
+				  pix_fmt_mp->plane_fmt[1].sizeimage);
 	}
 
 	pix_fmt_mp->flags = 0;
-- 
2.25.1


