Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDA6EE4993
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6W5PKp+q/Ocw8P5Ng0nQeFu07ACwIl9sPjk8+sKzK4=; b=S7C6WG5Su6ilmxbrY7SQuCXMLM
	q8hcTv3fFOvXYGoq7IB6531tEUEBzqA3/ERFYvca8KK3Fazl6R1IxvstfenSruti4fz/X7Ftysr6Y
	+kg1PAHdweDBkFbFr8IK4ZvvUuHg3dwTbX7AHQd3OYb90Hik7XYwsLrTy1cWLRFgjz7Dud+uNQ2Cl
	KVu9EL3Px5KmCadEFKUiCsHmJiRnuj6n079kWY3Wi7IslFgh7GEOzOwpomx+S/zScLT4KNkLtDzYF
	f+mSD25JL0Y8yB99Wj4+/WBm5dnTx68XgzOlw0U+tb0IEFcsWztOsPuIQpnEBN3ydtTNBggh/ATn/
	aliJyrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpZJ-000wWu-2u;
	Wed, 23 Aug 2023 15:14:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpZ5-000wHH-1M;
	Wed, 23 Aug 2023 15:14:37 +0000
X-UUID: c1efba6841c711ee912e1518a6540028-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=c6W5PKp+q/Ocw8P5Ng0nQeFu07ACwIl9sPjk8+sKzK4=;
	b=VrpvoBavrBk2k8rlRrw0X9xiBK6YorzUjNpMHZs6S5DOWWr39H4uAIXQrjgjNk/5hRD4lRNRkimLC/6D1gtxzaGWc1yuBJKgcK783ZUKqKSig5G+7I6Na0Q9t17B5rlA6VJGEvcA0vg1jF1No82Si6lVW/qnMdrGHqzYTGTS4H0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:b3860eee-d9a1-41e4-8f7d-4b94519f3529,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:b3860eee-d9a1-41e4-8f7d-4b94519f3529,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:136cddee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:230823231355LFPP69YA,BulkQuantity:2,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: c1efba6841c711ee912e1518a6540028-20230823
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 512542772; Wed, 23 Aug 2023 08:14:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 23:13:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 23:13:53 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jassi
 Brar <jassisinghbrar@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH 07/15] drm/mediatek: Support alpha blending in VDOSYS1
Date: Wed, 23 Aug 2023 23:13:24 +0800
Message-ID: <20230823151332.28811-8-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230823151332.28811-1-shawn.sung@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_081435_466055_3A6D229B 
X-CRM114-Status: GOOD (  15.80  )
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

Support premultiply and coverage alpha blending modes.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 50 +++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 73dc4da3ba3b..3058c122a4c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_blend.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/of_device.h>
@@ -35,6 +36,7 @@
 #define MIX_SRC_L0_EN				BIT(0)
 #define MIX_L_SRC_CON(n)		(0x28 + 0x18 * (n))
 #define NON_PREMULTI_SOURCE			(2 << 12)
+#define PREMULTI_SOURCE				(3 << 12)
 #define MIX_L_SRC_SIZE(n)		(0x30 + 0x18 * (n))
 #define MIX_L_SRC_OFFSET(n)		(0x34 + 0x18 * (n))
 #define MIX_FUNC_DCM0			0x120
@@ -50,9 +52,7 @@
 
 #define MIXER_INX_MODE_BYPASS			0
 #define MIXER_INX_MODE_EVEN_EXTEND		1
-#define DEFAULT_9BIT_ALPHA			0x100
 #define	MIXER_ALPHA_AEN				BIT(8)
-#define	MIXER_ALPHA				0xff
 #define ETHDR_CLK_NUM				13
 
 enum mtk_ethdr_comp_id {
@@ -153,33 +153,59 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	struct mtk_plane_pending_state *pending = &state->pending;
 	unsigned int offset = (pending->x & 1) << 31 | pending->y << 16 | pending->x;
 	unsigned int align_width = ALIGN_DOWN(pending->width, 2);
-	unsigned int alpha_con = 0;
+	unsigned int mix_con = NON_PREMULTI_SOURCE;
+	bool replace_src_a = false;
+
+	union format {
+		unsigned int raw;
+		char str[5];
+	} format;
 
 	dev_dbg(dev, "%s+ idx:%d", __func__, idx);
 
 	if (idx >= 4)
 		return;
 
-	if (!pending->enable) {
+	if (!pending->enable || !pending->width || !pending->height) {
+		/*
+		 * instead of disabling layer with MIX_SRC_CON directly
+		 * set the size to 0 to avoid screen shift due to mode switch
+		 */
 		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
 		return;
 	}
 
-	if (state->base.fb && state->base.fb->format->has_alpha)
-		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
+	mix_con |= MIXER_ALPHA_AEN | (state->base.alpha & 0xff);
+
+	if (state->base.pixel_blend_mode != DRM_MODE_BLEND_COVERAGE)
+		mix_con |= PREMULTI_SOURCE;
+
+	if (state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
+	    (state->base.fb && !state->base.fb->format->has_alpha)) {
+		/*
+		 * Mixer doesn't support CONST_BLD mode,
+		 * use a trick to make the output equivalent
+		 */
+		replace_src_a = true;
+	}
+
+	format.raw = pending->format;
+
+	dev_dbg(dev, "L%d: %ux%u(%u,%u)%s: SCA=0x%x(%u), MIX=0x%x\n", idx,
+		pending->width, pending->height, pending->x, pending->y,
+		format.str, (state->base.alpha & 0xff), state->base.pixel_blend_mode,
+		mix_con);
 
-	mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx + 1, alpha_con ? false : true,
-				  DEFAULT_9BIT_ALPHA,
+	mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx + 1, replace_src_a, 0xff,
 				  pending->x & 1 ? MIXER_INX_MODE_EVEN_EXTEND :
 				  MIXER_INX_MODE_BYPASS, align_width / 2 - 1, cmdq_pkt);
 
 	mtk_ddp_write(cmdq_pkt, pending->height << 16 | align_width, &mixer->cmdq_base,
 		      mixer->regs, MIX_L_SRC_SIZE(idx));
 	mtk_ddp_write(cmdq_pkt, offset, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_OFFSET(idx));
-	mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_CON(idx),
-			   0x1ff);
-	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base, mixer->regs, MIX_SRC_CON,
-			   BIT(idx));
+	mtk_ddp_write(cmdq_pkt, mix_con, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_CON(idx));
+	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base, mixer->regs,
+			   MIX_SRC_CON, BIT(idx));
 }
 
 void mtk_ethdr_config(struct device *dev, unsigned int w,
-- 
2.18.0


