Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E97C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 06:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZ37W9OSn/D1U5UFhTl3GS1/1Rs+rsZ86abCpxFX95M=; b=ELrUoVC9pIc0jBb/homNJHqZUv
	uTJXac0cKonPXRhLiJN5IIsx9f5au/IWMyxMbwxXL9rksCXkwRFe8LiP7iFN3K1ZGuTf6nKlKVM39
	V/fkM10rlJcXKjmjbf0z+CH5TBdqk2RZSmK3vYjbyEBuFQiamfuzdhsfZuk22n8nW8yZD1k9/IIvv
	7HO2Es8pFemLb0Ora/Efxxm3gGIR6RCSv9DS3cWh4fY+OR4nCJNwqjqF04m+vgIUNoZq3ecWpXf7Y
	y7PnOR0/y7lmSbf/Y/R/I6LC7UfpiqQjYtqdgYlMGTCTdr+0pO+HgFowg21eUA1D++Lu9h0VyXa1H
	mKDGfnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfsU-009J5S-0d;
	Fri, 07 Apr 2023 06:47:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfsM-009J1E-14;
	Fri, 07 Apr 2023 06:47:11 +0000
X-UUID: 00727d4ad51011ed8687db9d93187ff1-20230406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QZ37W9OSn/D1U5UFhTl3GS1/1Rs+rsZ86abCpxFX95M=;
	b=W+7sCR7RHN0QSPFoId1OKO77tdoJXMTW6PeAbDPbIP0ahCHVg8jBJyPfu7G7iRNht/aXVmztqnLecCGCQ+ePpeRwHxqNzL72puYnVXa0aa91tDa5row4coUBGKjXAv6g9W2H+Yb7hD/9E247r0tjFTuXnJCNOi6J65J22dOf0Os=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:34db6bf8-5a1f-4c6f-b812-075509734524,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:5fa87db5-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 00727d4ad51011ed8687db9d93187ff1-20230406
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 390932695; Thu, 06 Apr 2023 23:47:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 14:46:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 14:46:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 4/5] drm/mediatek: Add casting before assign
Date: Fri, 7 Apr 2023 14:46:56 +0800
Message-ID: <20230407064657.12350-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
References: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234710_374612_BA1EF7E5 
X-CRM114-Status: GOOD (  12.58  )
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

Add casting before assign to avoid the unintentional integer overflow
or unintended sign extension.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9b8f72ed12e4..537e83b95001 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -121,7 +121,7 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	int ret;
 
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	args->size = (unsigned long)args->pitch * args->height;
 
 	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
 	if (IS_ERR(mtk_gem))
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 31f9420aff6f..a1337f386bbf 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -140,7 +140,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_object *gem;
 	struct mtk_drm_gem_obj *mtk_gem;
-	unsigned int pitch, format;
+	unsigned int pitch, format, cpp;
 	u64 modifier;
 	dma_addr_t addr;
 	dma_addr_t hdr_addr = 0;
@@ -151,11 +151,12 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	addr = mtk_gem->dma_addr;
 	pitch = fb->pitches[0];
 	format = fb->format->format;
+	cpp = (unsigned int)fb->format->cpp[0];
 	modifier = fb->modifier;
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR) {
-		addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
-		addr += (new_state->src.y1 >> 16) * pitch;
+		addr += (dma_addr_t)(new_state->src.x1 >> 16) * cpp;
+		addr += (dma_addr_t)(new_state->src.y1 >> 16) * pitch;
 	} else {
 		int width_in_blocks = ALIGN(fb->width, AFBC_DATA_BLOCK_WIDTH)
 				      / AFBC_DATA_BLOCK_WIDTH;
@@ -167,17 +168,18 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 
 		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
 		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
-			AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
+			AFBC_DATA_BLOCK_HEIGHT * cpp;
 
 		hdr_size = ALIGN(hdr_pitch * height_in_blocks, AFBC_HEADER_ALIGNMENT);
 
-		hdr_addr = addr + hdr_pitch * y_offset_in_blocks +
-			   AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
+		hdr_addr = addr +
+			   (dma_addr_t)hdr_pitch * y_offset_in_blocks +
+			   (dma_addr_t)AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
 		/* The data plane is offset by 1 additional block. */
 		addr = addr + hdr_size +
-		       pitch * y_offset_in_blocks +
-		       AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
-		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
+		       (dma_addr_t)pitch * y_offset_in_blocks +
+		       (dma_addr_t)AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
+		       (dma_addr_t)cpp * (x_offset_in_blocks + 1);
 	}
 
 	mtk_plane_state->pending.enable = true;
-- 
2.18.0


