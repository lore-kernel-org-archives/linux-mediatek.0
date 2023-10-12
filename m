Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F16CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEAe/Lv2c2CBSNljT1Dh/BDQx27kgNBvj7a/gt32TaE=; b=0mIlEwGEAXUV+95II47Er2sb9h
	3qfrY1IYa2wyr2QhAuRh48PYRWjkXWtMNYK2c4r/FQI2PQ6BETiG4RCs+qunoCOTykDoCuGZgYcAL
	nIYV0PCOVq15bZslh+NQnMebRcoIpl7dL9LZAvpzlS8Ws4lWrxA8HPdE73b900mCZHQ/0aT1N1XAF
	lHbHJvi1FWqDN8WOtEFNKhvpKIZYFh7L5oODoNpOjUJ+sLN1/AwQbB0EtIHY2ZDFSQ7prqgBPlR/Y
	1NH0hMaLA/+K8DyA1puOEOfxoLN4xzfanQsq8/q2RFcQsGiQA0Rjc8EeBhyFYdxE0+CIFwddv5U0A
	EbYPmufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS8-000TFt-2E;
	Thu, 12 Oct 2023 09:58:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsRx-000T3A-0H;
	Thu, 12 Oct 2023 09:57:51 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DC1936607348;
	Thu, 12 Oct 2023 10:57:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104667;
	bh=KlnYZ3Z57VDCZfFhh+UwghQixUf4esaXMSIcKtMmbP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eKp2dFfcKA81iQpEHXop2fX8jb8z7V6zWCI/pxHB1i+MPu7aZDpZQsMmPRIxBKNIY
	 BMRf93lxL4E8SlXyWN/Zdskdm6LoPIPzNll1PvMmc0/k3R53YAHDUhh9n+QLEmQpEJ
	 Blu5Hd4YrBFU/ZThera+ThxnzCaHsmOHhG5itg2D/yxV4ekJaXljmLPzZT8HE2icJ3
	 SR2QubIkiNf9LAHV1vEL7lFWA6xbV+G3bb7lBdwna1+xLuyYzZK+5J9lxK+AXCLE4R
	 P1VT3doy57/Im7owYFfhR+0umDDTCf3W9wDDFZ1pVEH7wWMIjO8IPN6o/FBGd2CAAz
	 sluN5SOMzNOCQ==
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
	nfraprado@collabora.com,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v11 05/16] drm/mediatek: gamma: Enable the Gamma LUT table only after programming
Date: Thu, 12 Oct 2023 11:57:25 +0200
Message-ID: <20231012095736.100784-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025749_255801_4B6C6D7E 
X-CRM114-Status: GOOD (  14.59  )
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

Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 8506b9a0a811..d35eaf6dbc2d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -65,12 +65,12 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma;
-	unsigned int i, reg;
+	unsigned int i;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
 	u16 lut_size;
-	u32 word;
+	u32 cfg_val, word;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -87,9 +87,6 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		lut_size = 512;
 	}
 
-	reg = readl(regs + DISP_GAMMA_CFG);
-	reg = reg | GAMMA_LUT_EN;
-	writel(reg, regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 	for (i = 0; i < lut_size; i++) {
@@ -119,6 +116,13 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		}
 		writel(word, (lut_base + i * 4));
 	}
+
+	cfg_val = readl(regs + DISP_GAMMA_CFG);
+
+	/* Enable the gamma table */
+	cfg_val |= GAMMA_LUT_EN;
+
+	writel(cfg_val, regs + DISP_GAMMA_CFG);
 }
 
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
-- 
2.42.0


