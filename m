Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCE2C07545
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 03:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIWgFfwZkXtrdo0suZm6RwbWtR40DfaE3rAe5GWMwLk=; b=WHr/CX3ELvhEfWtyusNS6YraXY
	vgtC7qUMYpR0UpU0nR/ysVaInKTAhtna4HmRz1yO6FWdQSLd6Fi680sC4XXtZJ7C5NfAWJ4WuvsBs
	2awrXpkHOQyErxQUZ48MhFTLpmERQNr57NB9AqtSyO7Y4wHBdb83MybGbDatVc28YUQvTm+Pofz1o
	vuZP7wGopIHNIvO7cLp5FFc0oZfQG/Ltll/A+NklhC9b63XGgYBOhHzRc5ugmFe5eGUIeF/8Tg4mg
	BNqhILnCpLDzpfeMdxO0ItcDNzrLbLrTyJBI1KXASOxgNWH632iD6tep7iaN2w5C9CCFWQ39WKqjM
	a1XdlP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qulHt-006Iav-0J;
	Mon, 23 Oct 2023 03:07:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qulHa-006IRP-1S;
	Mon, 23 Oct 2023 03:07:11 +0000
X-UUID: 3ea36bdc715111ee86758d4a7c00f3a0-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iIWgFfwZkXtrdo0suZm6RwbWtR40DfaE3rAe5GWMwLk=;
	b=bp12lJpk1dMEo/7WYiJaB11rJ84tkf28Fg+Y0MTHZHchKkumxOVzHofHKgPxI++j5KqBVU8hNCDU8AvaN7YrNVTxl6slSTs0tHWWb4dAIi81+zhLXFqnFaYCtZKKIfqzPQnrGs1pp8HjOrtn8qZ40QippIGwTYKhVshFfCCTYlE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:81e41043-c2ed-4781-8e09-885195f6a750,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:b9ed8094-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ea36bdc715111ee86758d4a7c00f3a0-20231022
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2005148593; Sun, 22 Oct 2023 20:07:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 11:06:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 11:06:44 +0800
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
Subject: [PATCH v2,3/7] media: mediatek: vcodec: Set the supported h265 level for each platform
Date: Mon, 23 Oct 2023 11:06:36 +0800
Message-ID: <20231023030640.16393-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023030640.16393-1-yunfei.dong@mediatek.com>
References: <20231023030640.16393-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.086800-8.000000
X-TMASE-MatchedRID: AGyNPhznEz/nWmH8Qoh70pyBsp6+TmyGjiWciALpTNMx3z93vsEFGtvM
	SB0gigG5ThbvLLI8RvNELJsmoli+adAjTMr/wDJy7spMO3HwKCDaoFJAcCHymC8zQZ2rR/Op8bf
	335SL+11yLoBTJinK3+uLFZZYlisfHxPMjOKY7A8LbigRnpKlKZvjAepGmdoO4aFwAALy/uKyKQ
	DJPZx2Hu+zvpLmmWkv/rGGU8AhgWiSEv7qwpBbmFM7o8d4416lSwv4nSP4/VL1yE6GKuGBsClAL
	GFiDaFp8jae4OD13tAV7Mc+rowcVKtX/F0pBwVJjSV5hDFby7ZnIxZyJs78kg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.086800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C9D0983908FB3F416092D1C7DDD89FE71C8C5EE95D5EDE13A6ACA2322155D1882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_200710_505407_20713891 
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

Set the maximum H265 codec level for each platform.
The various mediatek platforms support different levels for decoding, the
level of the codec limits among others the maximum resolution, bit rate
and frame rate for the decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 7aaf0db13a76..f68518ba57c5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -147,6 +147,16 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 		},
 		.codec_type = V4L2_PIX_FMT_HEVC_SLICE,
 	},
+	{
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+			.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+			.def = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+			.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		},
+		.codec_type = V4L2_PIX_FMT_HEVC_SLICE,
+	},
+
 	{
 		.cfg = {
 			.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
@@ -549,6 +559,22 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 	};
 }
 
+static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
+					   struct mtk_vcodec_dec_ctx *ctx)
+{
+	switch (ctx->dev->chip_name) {
+	case MTK_VDEC_MT8188:
+		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
+		break;
+	case MTK_VDEC_MT8195:
+		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
+		break;
+	default:
+		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
+		break;
+	};
+}
+
 static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
@@ -557,6 +583,10 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
 		mtk_vcodec_dec_fill_h264_level(cfg, ctx);
 		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported level: %lld %lld", cfg->max, cfg->def);
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+		mtk_vcodec_dec_fill_h265_level(cfg, ctx);
+		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported level: %lld %lld", cfg->max, cfg->def);
+		break;
 	default:
 		break;
 	};
-- 
2.18.0


