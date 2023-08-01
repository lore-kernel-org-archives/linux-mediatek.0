Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF34C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 11:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pf70fvzsJsLSLLCAyU+4FIZliXpAbtyiev+VloddWXU=; b=HPR8gkA/kQJPXR9VlEJAkGEzf4
	WetbnCQq8e/U3sHKawdO7ULaBOJfL6puGFEZO2qlZL9FG6DAo3ApAMNN5VdTMcX24scvFocbd3jVQ
	Hd3NsbYz+iEhU1NXhvEFha+sMGsNjB/Nu1XfHRUqEdA4WfZxrOyksB17g2NHVVyp0fRku6LkuNSLH
	UDV9MGFlndmkit4mKS0WVqRKhJ2DCSYMioONiIqwbfHeN8bbUJHuiJjvwcbSB5ikYopKyRpxsmdXr
	5yEMLyqlWG39+qDkaPqkUZuFFS6niPiLHE0eHe2OuWsCYvuWPtkpp4ciBvcR06llwPTif4oahzljG
	PN2BEG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo21-0029g1-1U;
	Tue, 01 Aug 2023 11:59:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo1t-0029Vg-0M;
	Tue, 01 Aug 2023 11:59:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE44E660718D;
	Tue,  1 Aug 2023 12:59:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690891145;
	bh=D8JgjR51ioF8fx7m/fH4EUDsN30Yt9OdM2Jk9HpBU00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VdVADUYaWzNVJfqjtdMQqkV6N5jXNpykt3jFTjiZA0P/R6eN9GVmjB6u+Ge2cYrs9
	 yeKNF06g0qeQYiEv6YKPuIhGzp2jEJ8co0pvVic7k9NrbOyXUV324L30/eo3hK2D+m
	 HVZ3VivJg827qEps5HvJMZCoOtajdDbq+DUnJtKApVovYwYvGOFt1YlYo221JMWoeN
	 Z/mc/KiYvWJf3p46kO679aVTxRxSlJqbeceK7kGaUPbxWHEdkrrVh8PLOFwEB7RL+l
	 BCdUKBl1SHMK2jfozwkLRqMCrQkKgw7+DM1duySn1JL9xodTOaQntf4xh9LGH+cCwQ
	 q6oOGj8rxzetA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	ehristev@collabora.com,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v8 05/13] drm/mediatek: gamma: Enable the Gamma LUT table only after programming
Date: Tue,  1 Aug 2023 13:58:46 +0200
Message-ID: <20230801115854.150346-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
References: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_045909_280321_81FFE3B7 
X-CRM114-Status: GOOD (  15.77  )
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

Move the write to DISP_GAMMA_CFG to enable the Gamma LUT to after
programming the actual table to avoid potential visual glitches during
table modification.

Note:
GAMMA should get enabled in between vblanks, but this requires many
efforts in order to make this happen, as that requires migrating all
of the writes to make use of CMDQ instead of cpu writes and that's
not trivial. For this reason, this patch only moves the LUT enable.
The CMDQ rework will come at a later time.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 1e21dd92c88b..b9dc8754187d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -66,11 +66,11 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 			  struct drm_crtc_state *state, u16 lut_size)
 {
 	struct mtk_disp_gamma *gamma;
-	unsigned int i, reg;
+	unsigned int i;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
-	u32 word;
+	u32 cfg_val, word;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -84,9 +84,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 	else
 		lut_diff = false;
 
-	reg = readl(regs + DISP_GAMMA_CFG);
-	reg = reg | GAMMA_LUT_EN;
-	writel(reg, regs + DISP_GAMMA_CFG);
+	cfg_val = readl(regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 	for (i = 0; i < lut_size; i++) {
@@ -116,6 +114,11 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 		}
 		writel(word, (lut_base + i * 4));
 	}
+
+	/* Enable the gamma table */
+	cfg_val = cfg_val | GAMMA_LUT_EN;
+
+	writel(cfg_val, regs + DISP_GAMMA_CFG);
 }
 
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
-- 
2.41.0


