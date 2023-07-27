Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F219C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDZdjfx700FCXUnExZA7N92qMxI3xpd6M2geNmql5YU=; b=GJ8JMXvRFYXkc7v2wmtArvtH1h
	rYeEEXqZRsnXpwJKJjrj10/Vu9Z+PVSMjf2foyt9mUSitHKR25JwMChURncGFJyFD5BPpnoXOcZ0X
	fj7KaaQLO9QqokE3incng4ILTXJ0dHKNr63w6JPqY8o6iy6kBgmdjpQkVh+msr/NEkfkQNAhzwmj0
	IYDfZ2fdBGF5f359jZS8YulMFA3NPWU8xQU/nsOTEXAmjYi8aU/69NTr4pU5xCV2uHVxdQMejNVaB
	Ln9R54prUlbrj5lD+a5kJE6hbO2eLclgo+Jj2ijzhadBYq0WjXiFzpJfrNdyDoQd3/CX2/3Nurncd
	elStmZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxaN-00CsCh-0b;
	Thu, 27 Jul 2023 09:47:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxZx-00CrwB-0o;
	Thu, 27 Jul 2023 09:46:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5991E6607057;
	Thu, 27 Jul 2023 10:46:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690451200;
	bh=H1IjE6ks2/tQ62I5k+mdDy0LWtBtFX34NVlBCrVhdQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aumiDINWE/mIxdJk1DTgk4SLGv+BszfClZcERHZVc+nt3BdTW97eeGMypqLtNCJ1/
	 05vDeuxGAJNjhL55T9oeHBHolo7wFdB7ktjZjOpRhfLQA+XHD9fq0n9EPQRMTplYM1
	 +rHTBvrWtU9Bl+YdsqGOtLk5mp7eRRkuT2fEjdTP7kXuyD4XxSx4uFacRDxK4GncJF
	 1X+Zf42jfrlWAmnpEA/f251Y4NETu0R/wQGCPeRUQJ0AH8gC4AqbXFIto2wR/U2mf3
	 8aOqbb8l7G/Q2PTosg9D7LGnro6RLnrUrYu93tColvkiewlbZHigIEH75HwojPCCoX
	 CmSzuFdOECRYw==
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
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: [PATCH RESEND v6 02/11] drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
Date: Thu, 27 Jul 2023 11:46:24 +0200
Message-ID: <20230727094633.22505-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_024641_602533_91AD9D51 
X-CRM114-Status: GOOD (  13.71  )
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

Invert the check for state->gamma_lut and move it at the beginning
of the function to reduce indentation: this prepares the code for
keeping readability on later additions.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 45 ++++++++++++-----------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 99be515a941b..ce6f2499b891 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -65,34 +65,35 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	u32 word;
 	u32 diff[3] = {0};
 
+	/* If there's no gamma lut there's nothing to do here. */
+	if (!state->gamma_lut)
+		return;
+
 	if (gamma && gamma->data)
 		lut_diff = gamma->data->lut_diff;
 	else
 		lut_diff = false;
 
-	if (state->gamma_lut) {
-		reg = readl(regs + DISP_GAMMA_CFG);
-		reg = reg | GAMMA_LUT_EN;
-		writel(reg, regs + DISP_GAMMA_CFG);
-		lut_base = regs + DISP_GAMMA_LUT;
-		lut = (struct drm_color_lut *)state->gamma_lut->data;
-		for (i = 0; i < MTK_LUT_SIZE; i++) {
-
-			if (!lut_diff || (i % 2 == 0)) {
-				word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-					(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-					((lut[i].blue >> 6) & LUT_10BIT_MASK);
-			} else {
-				diff[0] = (lut[i].red >> 6) - (lut[i - 1].red >> 6);
-				diff[1] = (lut[i].green >> 6) - (lut[i - 1].green >> 6);
-				diff[2] = (lut[i].blue >> 6) - (lut[i - 1].blue >> 6);
-
-				word = ((diff[0] & LUT_10BIT_MASK) << 20) +
-					((diff[1] & LUT_10BIT_MASK) << 10) +
-					(diff[2] & LUT_10BIT_MASK);
-			}
-			writel(word, (lut_base + i * 4));
+	reg = readl(regs + DISP_GAMMA_CFG);
+	reg = reg | GAMMA_LUT_EN;
+	writel(reg, regs + DISP_GAMMA_CFG);
+	lut_base = regs + DISP_GAMMA_LUT;
+	lut = (struct drm_color_lut *)state->gamma_lut->data;
+	for (i = 0; i < MTK_LUT_SIZE; i++) {
+		if (!lut_diff || (i % 2 == 0)) {
+			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
+				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
+				((lut[i].blue >> 6) & LUT_10BIT_MASK);
+		} else {
+			diff[0] = (lut[i].red >> 6) - (lut[i - 1].red >> 6);
+			diff[1] = (lut[i].green >> 6) - (lut[i - 1].green >> 6);
+			diff[2] = (lut[i].blue >> 6) - (lut[i - 1].blue >> 6);
+
+			word = ((diff[0] & LUT_10BIT_MASK) << 20) +
+				((diff[1] & LUT_10BIT_MASK) << 10) +
+				(diff[2] & LUT_10BIT_MASK);
 		}
+		writel(word, (lut_base + i * 4));
 	}
 }
 
-- 
2.40.1


