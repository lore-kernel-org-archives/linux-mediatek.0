Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BE6C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 03:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PfXejbSJ+gESzqPGGzxv/i7SYXG7tkTWKaOyZexlqSg=; b=49VY6h4sN8+OPHVOV6UnZ5mSij
	6ocrFrk4DcalYq147sgFs6G818En9sr12BDkDgRfmut+OwU04KjK1gQolesaJOoRstYIylJL3M7uB
	ewhfA26W1aRDiximhHEkghIT7oHqrSBaX5UgrDCXFQ7m9/FsiPVMTqIZxhH37QSmvj7GdW6Cb7hO6
	6g0kS6EcV2PctrB0pQfPTrU8H9pVHZTYXT2/ioXMey1u1DiJvyIRV5IB2yYZuzjx/VR841ZeCjPdS
	xjSCUFyA6FxVBFvjFFW3LJaCVoElthDjappL5U94PjQiTqv0XeLN1xfREz79SnZFjTK7h1Ta+E/1Z
	RMSvirBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0ck-000lmH-0G;
	Fri, 17 Mar 2023 03:19:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0ch-000llg-2h;
	Fri, 17 Mar 2023 03:19:21 +0000
X-UUID: 7c9d19e2c47211edb5598346aad47b14-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PfXejbSJ+gESzqPGGzxv/i7SYXG7tkTWKaOyZexlqSg=;
	b=EqgsDojpIPBRC7w8bLKpdnG/8WHPUn607318amHvYk8p30G5hzP/TsB1VMqjcUPdVyxTNp1YsI8TE6+GKaHR4wNzV63GBJsZT1rgT/SYI09WElt5tz5kU5qiRkmVcPzl8xUfIg+4C7bwWBCxhJRrFis1AJmqTjGipbZ9vwN4r4M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:062629f5-75bc-4f6a-8b09-07f5fa3a17c0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:070aa328-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 7c9d19e2c47211edb5598346aad47b14-20230316
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 169099893; Thu, 16 Mar 2023 20:19:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 11:08:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 11:08:34 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,1/2] media: mediatek: vcodec: Force capture queue format to MM21
Date: Fri, 17 Mar 2023 11:08:32 +0800
Message-ID: <20230317030833.16836-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_201919_879397_237C26C0 
X-CRM114-Status: GOOD (  15.46  )
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

While the decoder can produce frames in both MM21 and MT21C formats, only MM21
is currently supported by userspace tools (like gstreamer and libyuv). In order
to ensure userspace keeps working after the SCP firmware is updated to support
both MM21 and MT21C formats, force the MM21 format for the capture queue.

This is meant as a stopgap solution while dynamic format switching between
MM21 and MT21C isn't implemented in the driver.

Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using different capture format")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changed with v3:
- re-write commit message.
- add one new patch to fix v4l2-compliance fail.
changed with v2:
- re-write commit message.
- change the driver flow.
changed with v1:
- add Fixes tag.
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 24 +++----------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 641f533c417f..c99705681a03 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -39,10 +39,9 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
 {
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 	const struct mtk_video_fmt *fmt;
-	struct mtk_q_data *q_data;
 	int num_frame_count = 0, i;
-	bool ret = true;
 
+	fmt = &dec_pdata->vdec_formats[format_index];
 	for (i = 0; i < *dec_pdata->num_formats; i++) {
 		if (dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
 			continue;
@@ -50,27 +49,10 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
 		num_frame_count++;
 	}
 
-	if (num_frame_count == 1)
+	if (num_frame_count == 1 || fmt->fourcc == V4L2_PIX_FMT_MM21)
 		return true;
 
-	fmt = &dec_pdata->vdec_formats[format_index];
-	q_data = &ctx->q_data[MTK_Q_DATA_SRC];
-	switch (q_data->fmt->fourcc) {
-	case V4L2_PIX_FMT_VP8_FRAME:
-		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
-			ret = true;
-		break;
-	case V4L2_PIX_FMT_H264_SLICE:
-	case V4L2_PIX_FMT_VP9_FRAME:
-		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
-			ret = false;
-		break;
-	default:
-		ret = true;
-		break;
-	}
-
-	return ret;
+	return false;
 }
 
 static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
-- 
2.25.1


