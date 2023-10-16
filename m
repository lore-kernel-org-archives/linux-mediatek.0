Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D001CDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5aM8sFb4ziRT3i8+nsxtAwkPMB7kU8rOqtGJ9Tjbo8=; b=wa5sx742GWKvJ29wz1UyLEBl46
	Qkw2uBptHPHDcJYrTJ+3ljC1zQC70od4ZkJjdG8V0HgF52xH4E1laV5VRLyEYQnC4r7w8CnKpFEXe
	fskdIWQjRP0l9xZwND+rM8SD/4EQk5OnC4/E4ECSINlEot7CEzc7xockumGYfFfcr5jXI8U86Ad8f
	itufgNQp+u9fQp3wh0lhs+biC5wOAvnb9074jTbotfurKpgU/xdp+gh1zFpG8MvqPm7wt+iQe11cn
	7NF3FHhsYggf4Ta6WMoiaacBny4rBQ+CTokkQMQMiMfTDAGULSSwzUl/j2oDqZlNLldjxG3b0z7Yq
	7sc2otbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHL4-008YtC-1J;
	Mon, 16 Oct 2023 06:44:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHL2-008Yrh-0L;
	Mon, 16 Oct 2023 06:44:29 +0000
X-UUID: 712fe90c6bef11ee9b7791016c24628a-20231015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l5aM8sFb4ziRT3i8+nsxtAwkPMB7kU8rOqtGJ9Tjbo8=;
	b=M68LJhn/5rRvqCArDp+lDcCLB0VsvqXOteXQGN7dWge8GQOTp2YDnDwaN6h4MJ5t/yddbX7hQjYfvlEoOT95LzBJ2Bf+aJBXV9BUJzP9EByRvTgQ2f2pOwrJ2BTLTynbD2OxZ4uhyA/SbL+2csp3hXoh/emaiLKqg5NXN8duprI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:055176fc-12c7-4675-a26d-9deb687f7e36,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:d037d6f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 712fe90c6bef11ee9b7791016c24628a-20231015
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1118826386; Sun, 15 Oct 2023 23:44:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 14:43:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 14:43:48 +0800
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
Subject: [PATCH 2/7] media: mediatek: vcodec: Setting the supported h264 level for each platform
Date: Mon, 16 Oct 2023 14:43:41 +0800
Message-ID: <20231016064346.31451-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231016064346.31451-1-yunfei.dong@mediatek.com>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.675400-8.000000
X-TMASE-MatchedRID: euolJ7spD+zvUrWD9LZntwPZZctd3P4B7f6JAS2hKPjkOOZ1bT6psSDK
	FcWyFnhcbepE8pItMVXe6jZdTQ8bvOF/B1jEjV+6syw+ZJnFumRo3Yq5PCwLAr5FKKSYetLBa2B
	yQZcfaSdCXhKT0oge7Ofo7EA45Dz2H4YwklDneDOeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8ifEz
	J5hPndGX0D7D9htnOAoELY81VdjJOoGhs8h8oAHDtr6bhjE0PmLe0VvD0yNpgw4kK7XsFkGQPRH
	SBIZXygHSxSR2sIiMdFlM7aUeu/9xz+PhojlLUuev0YPTN868QBqq+/+aGCsQhzL04Or2eZVlxr
	1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.675400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1C9801218AF1C33F753B086EFCEF9CE9171D70D905D1759DA8826BDFB552FEBA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_234428_146432_1B9737EF 
X-CRM114-Status: GOOD (  11.98  )
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
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index e29c9c58f3da..f4af81bddc58 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -56,6 +56,15 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 		},
 		.codec_type = V4L2_PIX_FMT_H264_SLICE,
 	},
+	{
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+			.def = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
+			.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
 	{
 		.cfg = {
 			.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
@@ -519,6 +528,40 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
 	.s_ctrl = mtk_vdec_s_ctrl,
 };
 
+static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
+					   struct mtk_vcodec_dec_ctx *ctx)
+{
+	switch (ctx->dev->chip_name) {
+	case MTK_VDEC_MT8192:
+		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1;
+		break;
+	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8195:
+		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
+		break;
+	case MTK_VDEC_MT8183:
+	case MTK_VDEC_MT8186:
+		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
+		break;
+	default:
+		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
+		break;
+	};
+}
+
+static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
+					  struct mtk_vcodec_dec_ctx *ctx)
+{
+	switch (cfg->id) {
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		mtk_vcodec_dec_fill_h264_level(cfg, ctx);
+		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported level: %lld %lld", cfg->max, cfg->def);
+		break;
+	default:
+		break;
+	};
+}
+
 static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
 {
 	unsigned int i;
@@ -532,6 +575,8 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
 	for (i = 0; i < NUM_CTRLS; i++) {
 		struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
 		cfg.ops = &mtk_vcodec_dec_ctrl_ops;
+
+		mtk_vcodec_dec_reset_controls(&cfg, ctx);
 		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
 		if (ctx->ctrl_hdl.error) {
 			mtk_v4l2_vdec_err(ctx, "Adding control %d failed %d", i,
-- 
2.18.0


