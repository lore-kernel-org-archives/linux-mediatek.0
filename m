Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B9DC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CqBqiRprnnxm3FLF4n9WrdC03hxzKq3NK5b3D+4vxQ=; b=GFSrTFm4XQvuPU/J3tEiEUGnw2
	3Z26/GHCmIX916hrR/Y2uZ/OMpf9JfY9sRTn/o729goWwxZw2Y0F2KtUkcXXdNLzLLZk0Ie5Xce7b
	Akx8X45XneGpcoVv4gMzbc16OF3AkqxEqerFVrAH3C5CNqpFLQTNHj/WA0T+xqwPjAGlJNX0uzBPL
	fO87SZN3i9h6xhAQ50In5kp7ojYXWXXZJBIm66+rYy6hOqbDSJVmHR2lWh8dZCOknmEQXDQf3Cjdg
	xDYPhYw1LPZM9XtbyFY1Zc7YVIpI1YrZLrTad4Ja7R7Yo4O+fUkRg+Dr3oXAZJMrxrC+0N/rp+CUq
	9ISWHK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfJy-0000000FZsk-2xZe;
	Thu, 13 Jun 2024 07:56:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfJv-0000000FZrT-3w1h;
	Thu, 13 Jun 2024 07:56:33 +0000
X-UUID: 70a8752a295a11efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/CqBqiRprnnxm3FLF4n9WrdC03hxzKq3NK5b3D+4vxQ=;
	b=m3FYuNG1PdC+htCUhAetZZmYbcgTgAj1tQr3fuEE4DUxHAPNgDexXPqwiCHs3xWdNyQ+wmc8fQ4R1L7UnD7RfHcax5o0WaU2lGXcvOBJS4fA6sqgb/UEkDlPeocWtBSPZ3NGn7x/QdktwkY8L3+YC2lgy0svNiEe5CYxGAIfUvQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:eb9fcdc2-7613-4cda-85dd-2b560ea751c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:29088744-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70a8752a295a11efaf04eb0598667787-20240613
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 321465477; Thu, 13 Jun 2024 00:56:28 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 15:55:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 15:55:47 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 2/7] media: mediatek: vcodec: change flush decode from capture to output when stream off
Date: Thu, 13 Jun 2024 15:55:27 +0800
Message-ID: <20240613075532.32128-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613075532.32128-1-yunfei.dong@mediatek.com>
References: <20240613075532.32128-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.281600-8.000000
X-TMASE-MatchedRID: OptG/nEbT2tq+Lkur34drZ7tR0mnRAg1YQ3TTmGSkBbI9BHsOEzeNssM
	7AnHhwCP9t03FccVflZ7nZmSglxg9qjC6/MNUxOoTVa+L3Zgqc4hmbYg1ZcOnivhXWbzMGmSWYF
	jags77eHOH4XDH3WaNlzzIJrqcl2Qcc8G9KynN+O4jAucHcCqnQKdh+kSDJQ4myiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ19+9ZqEp9FTiONziJpE1nHhBweW+iTy3Oi60oCDMjDCnoYKj6RoOsDtMs8
	g637rbSPPJiNS88b5RAg+CujsLaJyk1wKxCOuAnqLaJN0gf/OBpp55fZDlsr34cY/B7JqXaYZ1R
	7NXn0MdBmmCXcKyFFJ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.281600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0829DC14DB3FC1CFA4E64649EF28BEC5C600CE4290EC3E14B94A76C2CA76C5862000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_005632_007901_8F327459 
X-CRM114-Status: GOOD (  11.86  )
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

The buffer remove and buffer done of output queue is separated into
two works, the value of owned_by_drv_count isn't zero when output
queue stream off, need to change flush decode from capture to output
when stream off.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 2b787e60a1f9..3b278892f1d3 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -893,32 +893,32 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
 			}
 		}
-		return;
-	}
-
-	if (ctx->state >= MTK_STATE_HEADER) {
-
-		/* Until STREAMOFF is called on the CAPTURE queue
-		 * (acknowledging the event), the driver operates
-		 * as if the resolution hasn't changed yet, i.e.
-		 * VIDIOC_G_FMT< etc. return previous resolution.
-		 * So we update picinfo here
-		 */
-		ctx->picinfo = ctx->last_decoded_picinfo;
 
-		mtk_v4l2_vdec_dbg(2, ctx,
-				  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
-				  ctx->id, ctx->last_decoded_picinfo.pic_w,
-				  ctx->last_decoded_picinfo.pic_h,
-				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-				  ctx->last_decoded_picinfo.buf_w,
-				  ctx->last_decoded_picinfo.buf_h);
+		if (ctx->state >= MTK_STATE_HEADER) {
+			/* Until STREAMOFF is called on the CAPTURE queue
+			 * (acknowledging the event), the driver operates
+			 * as if the resolution hasn't changed yet, i.e.
+			 * VIDIOC_G_FMT< etc. return previous resolution.
+			 * So we update picinfo here
+			 */
+			ctx->picinfo = ctx->last_decoded_picinfo;
+
+			mtk_v4l2_vdec_dbg(2, ctx,
+					  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
+					  ctx->id, ctx->last_decoded_picinfo.pic_w,
+					  ctx->last_decoded_picinfo.pic_h,
+					  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+					  ctx->last_decoded_picinfo.buf_w,
+					  ctx->last_decoded_picinfo.buf_h);
+
+			ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
+			if (ret)
+				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
+		}
 
-		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
-		if (ret)
-			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
+		ctx->state = MTK_STATE_FLUSH;
+		return;
 	}
-	ctx->state = MTK_STATE_FLUSH;
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-- 
2.18.0


