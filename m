Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666C5CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 06:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s43GiVflyZ0zUgGP1LD/Snp+bolRWnC8QJNjMV51hPY=; b=gXarHd5Ek6dzhW8gENKsRTGVgj
	jjTa7TGKdLtNM4hLi6UdF7r9GqwACbDwrcJuMtqtkWtif8sTQDhnTd8tLr8vqy4bVPorA1Y6JryA1
	Klo+LfxmjCRqrlXLsSkc3Rc1CK/BN5Yy9rWkgIGAw1jl5ZipJLQsSlzJftZgUX7Y4Y5zKqk4WunM5
	1VBe+0HqYcWwf5km7FbJa8FrUtDB1ywnKUXMiWSg1Ym1JVP1gce492fNHsaT79buSrmE9Nu0K69so
	xR1lNgOlyw05mxluUkcNPeeHFRbwBDFs5dTecuN9GMJcicSIYUdYxkoO6y1QTE6uXGRH8/dqsgDPx
	wBb0/kKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHKZ-008YfG-0g;
	Mon, 16 Oct 2023 06:43:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHKW-008Yeg-1q;
	Mon, 16 Oct 2023 06:43:57 +0000
X-UUID: 5def4ea06bef11ee86758d4a7c00f3a0-20231015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s43GiVflyZ0zUgGP1LD/Snp+bolRWnC8QJNjMV51hPY=;
	b=fI68lx52+grAvsC0kG6w7hVGbg6sbmp0b/t1zsW8jhjx1W93xAfsvEi0rg01GB1+SPaS57UblJ0Ll+VrasfUkWt7yQ1Gj5fUUYQucxe14Rp3gE9UtSHqst0Uk5Af94IusgW3tGQF1c8grvq1r9p7eVpmoyZw6JMuovMretmk1fk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:2d35d8fa-d6ea-46fa-8cb8-2e2f672115f0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:7a36d6f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5def4ea06bef11ee86758d4a7c00f3a0-20231015
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2044114131; Sun, 15 Oct 2023 23:43:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 14:43:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 14:43:49 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
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
Subject: [PATCH 3/7] media: mediatek: vcodec: Setting the supported h265 level for each platform
Date: Mon, 16 Oct 2023 14:43:42 +0800
Message-ID: <20231016064346.31451-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231016064346.31451-1-yunfei.dong@mediatek.com>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_234356_608775_796D652B 
X-CRM114-Status: GOOD (  11.58  )
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
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index f4af81bddc58..1fdb21dbacb8 100644
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
@@ -549,6 +559,20 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 	};
 }
 
+static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
+					   struct mtk_vcodec_dec_ctx *ctx)
+{
+	switch (ctx->dev->chip_name) {
+	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8195:
+		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
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
@@ -557,6 +581,10 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
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


