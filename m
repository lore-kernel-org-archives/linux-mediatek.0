Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E92F606A31F
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oJQL9XJY;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=X4q42k32
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SBXrMA4OPvMSxgKPEkxv8IegE/u3Mj36yDglY+dCJGM=; b=oJQL9XJY2Ktloe8LQvGXM1PQMw
	Rv77xqnoCNodT/PaIGi89llk9v4sJJU++1ul5+UdqZfjR6+MbTcXmPto1oCJTRqPiqpZnXUB0Qwdk
	sXkfAQkUbA53SUrXZ66D/oJted+btxN60NUgjEyxSfLMhXCpgSbhEaji5AuPtajrru8p44KqbRHjq
	X53/dWOO5JdbxyfnrumGb+Ct7KDuwFlihkUGoBILnWKp9okRucoE4HDc4pwyxSo6QeYHFvZSRsctw
	0zAx0sOMoJKmoICxut/kbWsq0dY/8vi+AOq5pKpxQZhQgFK50jGwnfxkMEVhPzriwPCNmyeVZ5lTp
	9ngppCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF5U-00000000dat-0ti2;
	Sat, 28 Nov 2026 09:51:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF4j-00000000d6t-1Lnj;
	Sat, 28 Nov 2026 09:50:45 +0000
X-UUID: 22e865e0eb1111f1a36277631523a8d6-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SBXrMA4OPvMSxgKPEkxv8IegE/u3Mj36yDglY+dCJGM=;
	b=X4q42k32NcLBJQAhn3yAUrxQrfWZLMxuKxStU04Lz4syf1Dkdc/Rm0Cu2T5VJckzoRqiu14mujNnU3cigN+Xe5r5pLyLsKhX146irHWeY1ScWUGoSAraGYLvKRmK51Pg7ObzGum9JxMqacCNXIH+R7egnishFSWo+EkNYCEfu7U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1867cc84-8ccc-4a41-bb85-a633b253bffd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:4e16e766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 22e865e0eb1111f1a36277631523a8d6-20261128
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1047255804; Sat, 28 Nov 2026 02:50:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 17:50:22 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 17:50:21 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v13 05/10] media: mediatek: vcodec: Add VP9 Probability Size Configuration
Date: Sat, 28 Nov 2026 17:50:09 +0800
Message-ID: <20261128095014.3128536-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
References: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_015033_432807_EFEAF460 
X-CRM114-Status: GOOD (  15.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce support for using different probability buffer sizes for
different stateless decoders: in particular, the VP9 decoder can use
a different size on different SoCs because of different
hardware capabilities.

Move the hardcoded single probability buffer size value to
decoder params, introduce a new VP9_4K_PROB_BUF_SIZE and assign:
  - VP9_PROB_BUF_SIZE (2560 lines) to legacy SoCs;
  - VP9_4K_PROB_BUF_SIZE (3840 lines) to newer SoCs (MT8196, MT8189).

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h         | 2 ++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c    | 1 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 9 +++++++++
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   | 4 ++--
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index bbfa6954d..0bde1c5b5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -82,10 +82,12 @@ struct vdec_pic_info {
  * struct mtk_vcodec_dec_params - decoder supported parameters
  * @level: decoder supported vcodec level
  * @profile: decoder supported vcodec profile
+ * @prob_size: vp9 decoder probability size
  */
 struct mtk_vcodec_dec_params {
 	s64 level;
 	s64 profile;
+	size_t prob_size;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index bf3569e6b..bfa62974b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -632,5 +632,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = 2560,
 	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 5f2797971..7702c596d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -10,6 +10,9 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "vdec_drv_if.h"
 
+#define VP9_PROB_BUF_SIZE 2560
+#define VP9_4K_PROB_BUF_SIZE 3840
+
 /**
  * struct mtk_stateless_control  - CID control type
  * @cfg: control configuration
@@ -892,6 +895,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -945,6 +949,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -965,6 +970,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -985,6 +991,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -1005,6 +1012,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_4K_PROB_BUF_SIZE,
 	},
 };
 
@@ -1042,5 +1050,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index e3c768b0d..bc21935b7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -22,7 +22,6 @@
 #define VP9_RESET_FRAME_CONTEXT_ALL 3
 
 #define VP9_TILE_BUF_SIZE 4096
-#define VP9_PROB_BUF_SIZE 2560
 #define VP9_COUNTS_BUF_SIZE 16384
 
 #define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
@@ -551,6 +550,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 					       struct vdec_vp9_slice_vsi *vsi)
 {
 	struct mtk_vcodec_dec_ctx *ctx = instance->ctx;
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
 	enum vdec_vp9_slice_resolution_level level;
 	/* super blocks */
 	unsigned int max_sb_w;
@@ -621,7 +621,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 	}
 
 	if (!instance->prob.va) {
-		instance->prob.size = VP9_PROB_BUF_SIZE;
+		instance->prob.size = pdev->vdec_pdata->vp9_params.prob_size;
 		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
 			goto err;
 	}
-- 
2.51.0.windows.2


