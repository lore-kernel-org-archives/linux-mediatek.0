Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C840EC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIQoT27GcYuuJ+QhfUoHjqOEFRPYloQJzRhu1bfSFyk=; b=sfg2T+N90fTNl+Hky317PDQxo0
	0D3jKbEphbH6sKEAQV2RwptgUSsVA9B2Dq68sy8DnX4rFF1FsvVq9PDzYEoMgt6lXNqGlIJYBEXXP
	Jl3p0IFK1qDAdlrrV1P0uzbRT4AH8CuRjj1HmAK4oWQQiApPJ4Gwlq6Sl4Xr1gOE0ok19Fw8+R5RC
	2hS9/pqX9ND+BTG73ISPFn5qI8vkVy/6PM1b2ZZwccBIDwkiDUKtP8iElXeYnBZLSWjLTWgI6gXn0
	RbKxcOUycQK9gjOCOUwudOU1qg4gFSifsZsI11Aa9+9496R4WInRlKqzZ4XEqANfuOkOnjp+iTO3N
	EoCl7jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnJu-009Qla-1X;
	Wed, 06 Dec 2023 08:31:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnJq-009QkY-2r;
	Wed, 06 Dec 2023 08:31:48 +0000
X-UUID: bcdde852940f11ee9b09ad09c76753c8-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RIQoT27GcYuuJ+QhfUoHjqOEFRPYloQJzRhu1bfSFyk=;
	b=oxr1C9atSLG/729/pZTsXF5qDsniUcJlNeW60CFm0iEYho/uixPsrXysjZTChaOL2Fn3NsNKtZcKk/1vUVmveNZfFoHCVTNcOEoXxmCUlqEmHWAHRfoPRyJgMHOc7LOYbKLE/Jzll8ECGaKZC85KGFHk3sB4A38ENMUcLXgEaB4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:645a1eb6-9653-4cc6-8994-7ae609deb662,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:1b2e59fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bcdde852940f11ee9b09ad09c76753c8-20231206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1174559168; Wed, 06 Dec 2023 01:16:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:15:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:15:58 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,15/21] media: mediatek: vcodec: Add one plane format
Date: Wed, 6 Dec 2023 16:15:32 +0800
Message-ID: <20231206081538.17056-16-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_003146_940050_55C819F6 
X-CRM114-Status: GOOD (  13.09  )
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

Adding capture formats to support V4L2_PIX_FMT_MS21. This format has
one plane and only be used for secure video playback at current period.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c    | 4 +++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index ba742f0e391d..604fdc8ee3ce 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -49,7 +49,9 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_dec_ctx *ctx, int format_inde
 		num_frame_count++;
 	}
 
-	if (num_frame_count == 1 || (!ctx->is_10bit_bitstream && fmt->fourcc == V4L2_PIX_FMT_MM21))
+	if ((!ctx->is_10bit_bitstream && fmt->fourcc == V4L2_PIX_FMT_MM21) ||
+	    (ctx->is_secure_playback && fmt->fourcc == V4L2_PIX_FMT_MS21) ||
+	    num_frame_count == 1)
 		return true;
 
 	q_data = &ctx->q_data[MTK_Q_DATA_SRC];
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index d54b3833790d..cc42c942eb8a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -229,7 +229,7 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 
 #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
 
-static struct mtk_video_fmt mtk_video_formats[9];
+static struct mtk_video_fmt mtk_video_formats[10];
 
 static struct mtk_video_fmt default_out_format;
 static struct mtk_video_fmt default_cap_format;
@@ -770,6 +770,11 @@ static void mtk_vcodec_add_formats(unsigned int fourcc,
 		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
 		mtk_video_formats[count_formats].num_planes = 2;
 		break;
+	case V4L2_PIX_FMT_MS21:
+		mtk_video_formats[count_formats].fourcc = fourcc;
+		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
+		mtk_video_formats[count_formats].num_planes = 1;
+		break;
 	default:
 		mtk_v4l2_vdec_err(ctx, "Can not add unsupported format type");
 		return;
@@ -798,6 +803,8 @@ static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_dec_ctx *ctx)
 		cap_format_count++;
 	}
 	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MS21, ctx);
+		cap_format_count++;
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
 		cap_format_count++;
 	}
-- 
2.18.0


