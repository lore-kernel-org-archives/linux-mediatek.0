Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58563C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 07:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0BSMzhQxV0HjibSsjHG5IXMuBDWYtIn/i372U14mmuQ=; b=CMXB/miN/1vUOTpDKx3MT12jzc
	BiQJOSuNV+B0UbeatJYux2Jfgi1fPxUxFKw+gzWvENJW0IcuP//uQLZ+blZbOEKY9mqNAaVYrpqht
	1S1HLwpK3h6eV2c5gHVBB3E5NgxEO2pYGvd3cT8on2A3EzdUPWDMUVwyRyWKDzVBL0cq/vyLN32oE
	ZO/qFonCb7oVgXrBEoYwAn5eUFH0hFq5b047QolUWJCxlNlysCbUA5BPlXDhBwUxDtWe6phnc34Tt
	w3DZCtWz0d3DswX9UhV2f8acFvFLfsJlp7anNBdqg7fXWLpVKajctA8A1Ia4I3z5x8MJaPaBv+brg
	bLbf4eoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbz32-009M4z-Rs; Tue, 14 Mar 2023 07:26:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbz2v-009M27-6T; Tue, 14 Mar 2023 07:26:11 +0000
X-UUID: 796c1f06c23911eda5805dcd735d5b48-20230314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0BSMzhQxV0HjibSsjHG5IXMuBDWYtIn/i372U14mmuQ=;
	b=L5fz/pItbq8eqOTJPwmfa0a4j7Pr7V0rOFdt1ryyWZkCtCk1RCIj5O6SY0ZOEgMf/ak//+jDRjBIEGnL1q1JQBsRmGTNpqfK3zMND0iY6GQqL67JmIXtz46P9slbmyUcGUlOEn0Ul01mA+FHigrGQIi600WxAlrieXeJ7r/X6Rs=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.21,REQID:f8f0e5bb-9071-434e-a2d7-cb6109525573,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
	ION:quarantine,TS:120
X-CID-INFO: VERSION:1.1.21,REQID:f8f0e5bb-9071-434e-a2d7-cb6109525573,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:120
X-CID-META: VersionHash:83295aa,CLOUDID:b1a2bcf5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230314152603F5LKW9QJ,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:5,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 796c1f06c23911eda5805dcd735d5b48-20230314
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 391066232; Tue, 14 Mar 2023 00:26:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 14 Mar 2023 15:25:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 14 Mar 2023 15:25:59 +0800
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
Subject: [PATCH v3] media: mediatek: vcodec: Force capture queue format to MM21
Date: Tue, 14 Mar 2023 15:25:57 +0800
Message-ID: <20230314072557.29669-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_002609_266170_EA4BED7D 
X-CRM114-Status: GOOD (  13.69  )
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

Libyuv is one software library used to covert format. Only covert
mediatek uncompressed mode MM21 to standard yuv420 for MT21 is
compressed mode. Need to set capture queue format to MM21 in order
to use Libyuv when scp firmware support MM21 and MT21.

Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using different capture format")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
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


