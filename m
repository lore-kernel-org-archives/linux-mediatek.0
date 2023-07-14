Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A783EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 09:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdyadZRWvTu8+ggDo9V2420WyUO1/XgpBs1YHBnH5aE=; b=HHDGH7PBBW3S3qRRZDzKTSUwEz
	JUsoSevt5X9Jp0RXBPpVrAs+Bet07LDEAuYCKpm3wJiD8llLVHirDGGoa57p2RyWiv5zorTiJPiEI
	4LRyrNSY7ODI1vk707H+7j3d2OrS2nP1sko5s/l7k/Ux+oD9AF7xqDeJ+VYKSadZKlmYEvap9CxVl
	c7CtYABFErAaf+G83EFhvULpyYtmw1ugLCN0d4IoPZeCD13sEmRLGOmTJKhQBBnkRDCrYJ4getlPU
	chfi6a18ofywqeqJZSnSnhvR2gfU5yPs7jefXSfMNKE3fk9NWVBkAGT2rRJSKA9dvcAJco4tA6Toa
	152IQOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKFa3-005k5f-10;
	Fri, 14 Jul 2023 09:59:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKFZz-005k4O-2I;
	Fri, 14 Jul 2023 09:59:17 +0000
X-UUID: 161565c6222d11ee83ed1395ce914268-20230714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TdyadZRWvTu8+ggDo9V2420WyUO1/XgpBs1YHBnH5aE=;
	b=lmidLV+1uGepNS2I70PHmkiTED6x6PuNbT246T4Af0L+KXs0Fu3Toj82I/UAhXwiM0H8G6sujwn19Z+44NmpGeT4Ajeu6ZTfGZ5A2Cna3aXtcm0geJ6GLldYNaRTzKebRhx5xLskm4OrPkMO9pjNx5QTNWHlb/tyjl/MffWaMIM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:547a0850-19b4-4b46-a713-b4268b28bb31,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:a467b54c-06c1-468b-847d-5b62d44dbb9b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 161565c6222d11ee83ed1395ce914268-20230714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 939817449; Fri, 14 Jul 2023 02:59:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jul 2023 17:49:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jul 2023 17:49:10 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 3/4] drm/mediatek: Fix unintentional integer overflow in multiplying different types
Date: Fri, 14 Jul 2023 17:49:07 +0800
Message-ID: <20230714094908.13087-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230714094908.13087-1-jason-jh.lin@mediatek.com>
References: <20230714094908.13087-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_025915_762278_2AB62718 
X-CRM114-Status: GOOD (  11.91  )
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

1. Instead of multiplying 2 variable of different types. Change to
assign a value of one variable and then multiply the other variable.

2. Add a int variable for multiplier calculation instead of calculating
different types multiplier with dma_addr_t variable directly.

Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  3 ++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 22 +++++++++++++---------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index a25b28d3ee90..da087d74612d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -121,7 +121,8 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	int ret;
 
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	args->size = args->pitch;
+	args->size *= args->height;
 
 	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
 	if (IS_ERR(mtk_gem))
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 31f9420aff6f..1cd41454d545 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -145,6 +145,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	dma_addr_t addr;
 	dma_addr_t hdr_addr = 0;
 	unsigned int hdr_pitch = 0;
+	int offset;
 
 	gem = fb->obj[0];
 	mtk_gem = to_mtk_gem_obj(gem);
@@ -154,8 +155,10 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	modifier = fb->modifier;
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR) {
-		addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
-		addr += (new_state->src.y1 >> 16) * pitch;
+		offset = (new_state->src.x1 >> 16) * fb->format->cpp[0];
+		addr += offset;
+		offset = (new_state->src.y1 >> 16) * pitch;
+		addr += offset;
 	} else {
 		int width_in_blocks = ALIGN(fb->width, AFBC_DATA_BLOCK_WIDTH)
 				      / AFBC_DATA_BLOCK_WIDTH;
@@ -163,21 +166,22 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 				       / AFBC_DATA_BLOCK_HEIGHT;
 		int x_offset_in_blocks = (new_state->src.x1 >> 16) / AFBC_DATA_BLOCK_WIDTH;
 		int y_offset_in_blocks = (new_state->src.y1 >> 16) / AFBC_DATA_BLOCK_HEIGHT;
-		int hdr_size;
+		int hdr_size, hdr_offset;
 
 		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
 		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
 			AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
 
 		hdr_size = ALIGN(hdr_pitch * height_in_blocks, AFBC_HEADER_ALIGNMENT);
+		hdr_offset = hdr_pitch * y_offset_in_blocks +
+			AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
+		hdr_addr = addr + hdr_offset;
 
-		hdr_addr = addr + hdr_pitch * y_offset_in_blocks +
-			   AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
 		/* The data plane is offset by 1 additional block. */
-		addr = addr + hdr_size +
-		       pitch * y_offset_in_blocks +
-		       AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
-		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
+		offset = pitch * y_offset_in_blocks +
+			 AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
+			 fb->format->cpp[0] * (x_offset_in_blocks + 1);
+		addr = addr + hdr_size + offset;
 	}
 
 	mtk_plane_state->pending.enable = true;
-- 
2.18.0


