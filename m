Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158F8CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 06:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izL0i7r4B8b6sMmjWv8zm0n63Yb81PAEZ31NXGW5fxI=; b=nmsKiVnfCPm0PhtyYIhpUMe0Ym
	Xa5d+qxNuZ1Nl6QS1hjpnmYDfamJyXfss+F6gtJrZVqk0Aya6flOO2jSwOTEf+uZQqcImPsVDbLlQ
	x1qNo5uhbDc6SfMIaMy1RcfmiyT8+ltKDFdIya5GtSnlMq5G72+5ni+LRylZPEhQ1q4a1UVwV5SoI
	mZbkTDFaWOISallZzzC/qKmoB0jSpRyh+b0tMvqywsoQ9spR/ISZBjWB2KQ7dMQzqIPHmPu9ROq3Y
	r21BRqmcg1FCTB6BaF7lf0TSbWl9t8HT411LnzHQ/fTxC0gVdLvtoPpNhFdUGid/PWcEdYpNPPZUn
	pL6RGs+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHL8-008Yw0-2R;
	Mon, 16 Oct 2023 06:44:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHL2-008YsW-1V;
	Mon, 16 Oct 2023 06:44:30 +0000
X-UUID: 7192ab646bef11ee9b7791016c24628a-20231015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=izL0i7r4B8b6sMmjWv8zm0n63Yb81PAEZ31NXGW5fxI=;
	b=BBURhn7wTIUwdmtLMP/NeFIuKrWHQA3sC8uDo9zEwPg99BjofWSioJGQ5FDiAyeSnFGOPhjE9TfGVJfYoVJC5sa3Ow8OdRICs0LR71/h97KjX6M619aiV1Hk43t2Ti1O9TJSXSGzFGcomtPwaeqL+NAitlypdIiCucMSluHkVdk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:70ce2dbb-182e-4879-8d42-f4887a07bd81,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:0acff9bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7192ab646bef11ee9b7791016c24628a-20231015
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2108219393; Sun, 15 Oct 2023 23:44:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 14:43:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 14:43:52 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
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
Subject: [PATCH 6/7] media: mediatek: vcodec: Setting the supported vp9 level for each platform
Date: Mon, 16 Oct 2023 14:43:45 +0800
Message-ID: <20231016064346.31451-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231016064346.31451-1-yunfei.dong@mediatek.com>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.869200-8.000000
X-TMASE-MatchedRID: goirSfhi1invUrWD9LZntwPZZctd3P4B7f6JAS2hKPj82ks92f+GmsjS
	UFX9l+y8BMahfseAGhne6jZdTQ8bvOF/B1jEjV+6syw+ZJnFumSjkoGZwmjMNpsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNcOSTt49JLsli8QTB7bNK8qXeaYMmiHcOgZ/ms/BsbZ2ifE5dxpP0ZupGU
	555tOMdubi8v04IZuQl8YS5Wi7f5gzX049/15Qg1GzJwl/5zA182Gj2QC3yG0smXVK/H8eHzG7s
	r7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.869200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 49F8D77C444AE5B7A90658AC01732F2132199B1FAB5ED67C23492C1E3804DE542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_234428_516357_33F17E04 
X-CRM114-Status: GOOD (  10.66  )
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

The supported resolution and fps of different platforms are not the
same. Need to set the supported level according to the chip name.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index b15ed773374f..02985184fa0f 100644
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
@@ -601,6 +610,26 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 	};
 }
 
+static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
+					  struct mtk_vcodec_dec_ctx *ctx)
+{
+	switch (ctx->dev->chip_name) {
+	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8195:
+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
+		break;
+	case MTK_VDEC_MT8192:
+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_0;
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
@@ -613,6 +642,10 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
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


