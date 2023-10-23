Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD524C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 03:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWD/0C1R8GP7QSgH+H1V2Hdqamu8Yrw8EeQW94hFmqE=; b=ZsNTe2a8vHYvzeCDn1B/8T3h2I
	vazc66S2B1QtsmrM9fD17vsGdCM8Ov4Q4WjdtLXuOPhmTi7+MKcadEXINNjn9qU+t1zFsASi9K6W9
	ElMjX+FsPJQE7w5VqMXnkUNglcyRH8yh0r/DvBZ9jE2GfHtU+VdNYgD1MvvHYeF5F4GUu3rnkRYHV
	M0kmAYuqNWRM0fIa0xibcXHvcUyLdATPoXXa7pYoqJsVWex8Xa8PhptsbzNAKpSQefp/kui01JYaB
	dhBFV/1D2WCQuPCtqimU4eErCi/kl6oUZbGQ7Gi8LAzdpek6tPNaDdGq2LMi/DMKeiD0b+eTcZmVq
	Hv9u24Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qulR8-006JVz-1r;
	Mon, 23 Oct 2023 03:17:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qulR1-006JTd-2T;
	Mon, 23 Oct 2023 03:16:57 +0000
X-UUID: 9cdd451e715211ee9b7791016c24628a-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zWD/0C1R8GP7QSgH+H1V2Hdqamu8Yrw8EeQW94hFmqE=;
	b=mD0vwbMwEx1kj58LGntT2Jdsc+WbcUhZpukwXTC4N1KGTiXm3D6OBF54Rg/FYUJ1Yuw9YCyb6GrMZdImMRWAKwR3pi8uOH3OtF5mg9idy2c1gBhfCRqUcuCnkocJDvSdytIeYboAhp/aTIV8jnuPDC9aZnt6Z37GLMP9pmXqQF0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:2fc8279b-bf7c-4657-9531-4a0662444bd4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:688730d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9cdd451e715211ee9b7791016c24628a-20231022
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 611658888; Sun, 22 Oct 2023 20:16:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 11:06:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 11:06:48 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,7/7] media: mediatek: vcodec: Set the supported vp9 profile for each platform
Date: Mon, 23 Oct 2023 11:06:40 +0800
Message-ID: <20231023030640.16393-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023030640.16393-1-yunfei.dong@mediatek.com>
References: <20231023030640.16393-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_201655_808930_62AD2EA5 
X-CRM114-Status: GOOD (  11.22  )
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

Set the maximum VP9 codec profile for each platform.
The various mediatek platforms support different profiles for decoding,
the profile of the codec limits the capabilities for decoding.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index eb8590edb579..d54b3833790d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -109,7 +109,8 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 			.id = V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 			.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
 			.def = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-			.max = V4L2_MPEG_VIDEO_VP9_PROFILE_3,
+			.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_1),
 		},
 		.codec_type = V4L2_PIX_FMT_VP9_FRAME,
 	},
@@ -632,6 +633,20 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 	};
 }
 
+static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
+					    struct mtk_vcodec_dec_ctx *ctx)
+{
+	switch (ctx->dev->chip_name) {
+	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8195:
+		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
+		break;
+	default:
+		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_1;
+		break;
+	};
+}
+
 static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
@@ -658,6 +673,11 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
 		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported profile: %lld %lld", cfg->max,
 				  cfg->menu_skip_mask);
 		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+		mtk_vcodec_dec_fill_vp9_profile(cfg, ctx);
+		mtk_v4l2_vdec_dbg(3, ctx, "vp9 supported profile: %lld %lld", cfg->max,
+				  cfg->menu_skip_mask);
+		break;
 	default:
 		break;
 	};
-- 
2.18.0


