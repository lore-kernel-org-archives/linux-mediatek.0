Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C99EC2BB85
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 17:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHPBkRB0Upd3vSzC0e8iv43S9B9pG6NJRfrxRpLgS90=; b=jcIGpvh7s3xrJgAgK9j2RWfmcZ
	rzhNLdOjlJYXBa+pdVb0L9uHzXtY1WWHbfaI/S0nnqS3BEUsIiV5r6Y8i7TgS/io6vwlUforGMw5B
	rcyA77X3OCrv3WOECw3eQIS6KalWE7kXd1S9+zYFsHTzHj9IVz/XrsmwvEhRu2Id5eI/0H3xO7ser
	tS0gR/ui4/S8wpLnn4ZWGtFvcmiRGG4oWtOIMnJ88IPliTJvR5GvhJKNOESNJu05YPNaJD84EvISZ
	zq002AouGnn8EqE3qTHnH/XUTtawxB/rlSayr/MZ4rpP+B3A3vQ+I+CKu+Bxsp1P0PCMI3+WMGeL1
	f/i3dolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz5a-00000002Czs-2ST1;
	Wed, 19 Jun 2024 17:27:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz5V-00000002CwP-0svC;
	Wed, 19 Jun 2024 17:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9330261E9C;
	Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 446FEC4AF09;
	Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818032;
	bh=T183k9By1cvXGXNo8Ecq6kS7PKcoWpDlkYqloTYrQ3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ins7qqBt/DF7pMus+7lz95yNRa9Nm7P93w9+CbiItBQGGzokNtqy3edzb4jv6fWod
	 /n3sv0Dc8ShZTypIwOrdbkIkWPlxCIr06WbB375XSPoDwcjIuLDxBYjLPBPBXzPVpo
	 HwWLjDSCVRUwQlsphYsA/9QK+uhgJW3Omfwo15Rf9fsu47QzNd/WngzRREi6EPH6AQ
	 KOq/AN4pTiYefvnTD4DNT/TpQawqy7aHHoU3LuWw49S/3/ibh4KfL+PUa+L1gW8pvN
	 hOn/XqMgRklWWbtVcgM0sLYqU2A9XB0eT+8Kw3GuDMocn3qajH77nQf0+Pt4aEj7GY
	 OULTfRadlLwvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED40C2BD05;
	Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 01:27:07 +0800
Subject: [PATCH 2/5] drm/mediatek: Support "None" blending in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-blend-v1-2-72670072ca20@mediatek.com>
References: <20240620-blend-v1-0-72670072ca20@mediatek.com>
In-Reply-To: <20240620-blend-v1-0-72670072ca20@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718818030; l=2177;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=Qozngh9H3WmkloftvXdtunQipRtPsqe5newy6O92Wn0=;
 b=onITXPFDRbXvFOUQC6q/s0ZYmrTMNr/VTBfUMFTM8PVjvt3LEXLMJVJ1tQvXAYnnrP614Ft2U
 SW7HRNJeZHSBskThxsR8JQiuhTvHA/Oib/BjprnnG6EPZq3+7D8XJlz
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_102713_545918_83B4AB3D 
X-CRM114-Status: GOOD (  11.49  )
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support "None" alpha blending mode on MediaTek's chips.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 36021cb8df62..48b714994492 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2021 MediaTek Inc.
  */
 
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <linux/clk.h>
@@ -35,6 +36,7 @@
 #define MIX_SRC_L0_EN				BIT(0)
 #define MIX_L_SRC_CON(n)		(0x28 + 0x18 * (n))
 #define NON_PREMULTI_SOURCE			(2 << 12)
+#define PREMULTI_SOURCE				(3 << 12)
 #define MIX_L_SRC_SIZE(n)		(0x30 + 0x18 * (n))
 #define MIX_L_SRC_OFFSET(n)		(0x34 + 0x18 * (n))
 #define MIX_FUNC_DCM0			0x120
@@ -175,7 +177,13 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 		alpha_con |= state->base.alpha & MIXER_ALPHA;
 	}
 
-	if (state->base.fb && !state->base.fb->format->has_alpha) {
+	if (state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
+		alpha_con |= PREMULTI_SOURCE;
+	else
+		alpha_con |= NON_PREMULTI_SOURCE;
+
+	if ((state->base.fb && !state->base.fb->format->has_alpha) ||
+	    state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
 		/*
 		 * Mixer doesn't support CONST_BLD mode,
 		 * use a trick to make the output equivalent
@@ -191,8 +199,7 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	mtk_ddp_write(cmdq_pkt, pending->height << 16 | align_width, &mixer->cmdq_base,
 		      mixer->regs, MIX_L_SRC_SIZE(idx));
 	mtk_ddp_write(cmdq_pkt, offset, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_OFFSET(idx));
-	mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_CON(idx),
-			   0x1ff);
+	mtk_ddp_write(cmdq_pkt, alpha_con, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_CON(idx));
 	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base, mixer->regs, MIX_SRC_CON,
 			   BIT(idx));
 }

-- 
Git-146)



