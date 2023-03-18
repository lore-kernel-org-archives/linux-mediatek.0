Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEB3C74A5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 03:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmAJCU4vEFZ4NeWXnt6p2mWQtYOq1ViTVxlUuDegioA=; b=BQLrkYQVvCV0fTEly749ouH6Dq
	elP0DPAG/CUNFqr3jtBPM3pNEzhQhrMN7c2f3LIgsF4+SQ3lCQdNo9DUBRvGJtHfFwrHeltqkHQWz
	/6PUEKUIapcPrtPN5mjCeXhNrFhg//WiaSLRCRVvIXVm26GJbMEr3EPUHsD7RwQrvLChUBwjA1+e8
	IAtG9PguCiz44KQGc5IvU8msWX49g+BaQ6WOdw+0d8oXoH+MovM2t6scQWz/k8/D5SPvoEnrB8uw+
	7TtD5HMeikdSwlStj0a7GxksKdtCvX0Ii7dyhA5sq/LAAVQnP0AYgH0E2pkhgtvW1AXuGp/OW4RWC
	SdTdjAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdNgq-0043AV-2g;
	Sat, 18 Mar 2023 03:57:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdNgn-00438y-1g;
	Sat, 18 Mar 2023 03:57:06 +0000
X-UUID: ee1335a6c54011ed86fbcd8805c7ac66-20230317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nmAJCU4vEFZ4NeWXnt6p2mWQtYOq1ViTVxlUuDegioA=;
	b=mUnXwjIHecHwq0H64ZqLKaszh2gy0bEjtDM6kj3uvV26/ZO2K8QfZAijBqdqptI12QDZuO5ETr0RFHaMd7qZsf4vPNNJJtctMDGMqv4nLMo3GQ5Ym9AX+Wm4tKJ5AbnMmTsw8HfWOQjwCfm++VblH47Zj1/A8TbVfyY0bQ900II=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:ecbaac9d-9a97-40db-bf67-9328a19025ca,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:135e9cb3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ee1335a6c54011ed86fbcd8805c7ac66-20230317
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1888947711; Fri, 17 Mar 2023 20:56:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Sat, 18 Mar 2023 11:56:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sat, 18 Mar 2023 11:56:54 +0800
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
Subject: [PATCH v5,2/2] media: mediatek: vcodec: Force capture queue format to MM21
Date: Sat, 18 Mar 2023 11:56:51 +0800
Message-ID: <20230318035651.27454-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230318035651.27454-1-yunfei.dong@mediatek.com>
References: <20230318035651.27454-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_205705_567336_7D18CBC7 
X-CRM114-Status: GOOD (  15.25  )
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
Reviewed-by: Nicolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nicolas F. R. A. Prado <nfraprado@collabora.com>
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


