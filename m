Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C671FCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 03:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVpmT6FxDwJsrBSbvJyTCp9xIHxx5/4HOLtvJV6levk=; b=Iex7QI43ZpxN4ACaR9wOV7IYVm
	0418txWPHA5aH97e6g5kpODaubu7DwolYHdDcmSJUZvmlM3beUr9rxDlGjYmupWBrDidxHjKSES14
	xQ7r5mCwrUuMz3qPYjAA7o7rivKg/Yx+amPkpOb+AZL7wg+LbeDjI/Yeut7D0WRY3+qpzOF5lbl5Y
	F/6t5kzxefN/Sgpq1Q3BkR8Cz+uAFpLTT36tB3vIz+ya7GeOcGmEFTvBRY/JleLu0kFQ0lCsvZI6H
	uT8bfrr6N9+qHJo9LahLjcLfKx/slhjIeCx/tuzlTf2oJoJk2130Dm8hvq+Me7+3ALTbu9zB1i9OG
	ZzSADQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qulHf-006IVQ-20;
	Mon, 23 Oct 2023 03:07:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qulHM-006IH0-1B;
	Mon, 23 Oct 2023 03:06:57 +0000
X-UUID: 35d345b8715111ee9b7791016c24628a-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zVpmT6FxDwJsrBSbvJyTCp9xIHxx5/4HOLtvJV6levk=;
	b=XwBl793NEG3dBHQGHDmz3S6Goy+bAyVp0ynkZUqJGCepPei6ijE2BfJ71ix3D8YDeHdhzC09jRK6CacQpt4tmKDhBlUv93BIV9x5tK8czYAp13LmgyD0LMvCkSX/f2YwD6BqcAz2Q25swNS/96y6aK2Axt/01WRGWtN/Itmj/1s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6bb8f162-f428-4c92-be9f-73e4c40e1d37,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:f9ec8094-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 35d345b8715111ee9b7791016c24628a-20231022
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1502390121; Sun, 22 Oct 2023 20:06:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 11:06:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 11:06:47 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,6/7] media: mediatek: vcodec: Set the supported vp9 level for each platform
Date: Mon, 23 Oct 2023 11:06:39 +0800
Message-ID: <20231023030640.16393-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023030640.16393-1-yunfei.dong@mediatek.com>
References: <20231023030640.16393-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.983200-8.000000
X-TMASE-MatchedRID: iCbNFKe75FjnWmH8Qoh70pyBsp6+TmyGjiWciALpTNMx3z93vsEFGtvM
	SB0gigG5ThbvLLI8RvNELJsmoli+adAjTMr/wDJyFp8tduyF+iC2McZY43zJ423D6f6IpbLI2ug
	QZCK503JPN9Ds5e3i44Ay6p60ZV62fJ5/bZ6npdiujVRFkkVsmyMHa3Cnrmnvr9Qtj+WbdnoExP
	333s+6T59oJbLvgyEgl5rvPYMic2rKKOiar1G+1/VY2XWHPqpnLxQDRLNsvk2n4W5Hf9z78m1Rj
	oup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnoxXsgQSqx49gY=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.983200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D7E391B8B2E2864A25DD15FB509BE6CF248AB038746AD37B7F694E7069E1CDDD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_200656_407151_FE9E97F0 
X-CRM114-Status: GOOD (  10.72  )
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

Set the maximum VP9 codec level for each platform.
The various mediatek platforms support different levels for decoding, the
level of the codec limits among others the maximum resolution, bit rate,
frame rate and compression rate for the decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 816709fe0f18..eb8590edb579 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -113,6 +113,15 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 		},
 		.codec_type = V4L2_PIX_FMT_VP9_FRAME,
 	},
+	{
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_VP9_LEVEL,
+			.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
+			.def = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+			.max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		},
+		.codec_type = V4L2_PIX_FMT_VP9_FRAME,
+	},
 	{
 		.cfg = {
 			.id = V4L2_CID_STATELESS_HEVC_SPS,
@@ -603,6 +612,26 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 	};
 }
 
+static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
+					  struct mtk_vcodec_dec_ctx *ctx)
+{
+	switch (ctx->dev->chip_name) {
+	case MTK_VDEC_MT8192:
+	case MTK_VDEC_MT8188:
+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
+		break;
+	case MTK_VDEC_MT8195:
+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
+		break;
+	case MTK_VDEC_MT8186:
+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
+		break;
+	default:
+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
+		break;
+	};
+}
+
 static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
@@ -615,6 +644,10 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
 		mtk_vcodec_dec_fill_h265_level(cfg, ctx);
 		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported level: %lld %lld", cfg->max, cfg->def);
 		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+		mtk_vcodec_dec_fill_vp9_level(cfg, ctx);
+		mtk_v4l2_vdec_dbg(3, ctx, "vp9 supported level: %lld %lld", cfg->max, cfg->def);
+		break;
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 		mtk_vcodec_dec_fill_h264_profile(cfg, ctx);
 		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported profile: %lld %lld", cfg->max,
-- 
2.18.0


