Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E1AC7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kibw5ZpY0d30sop203icQm8gKbUHX2ImQHjsbbibouE=; b=aTEbm5ZPjASL8og9fw0XKyw9ue
	fEVKfLoqZH15NWHV1iHbZwV28ynyo/QZs7V2aLXd9vqPlizms9K6n5QyzQT4sBAlEJiRdTSHbXVXg
	iqAry6dhl9K5GwFrsJdXStOzSB+IOBksNGqPOzkZiEUfACRzXOEuGwbGQ9QUbT9xk6/99zLREwcLN
	SshG4TnuGPVBbuNKHOqaxWsU1o6FMHxlTHXdp0SkJ3HGv185QrPv6uNFIAqbBQTG1ZLnuLgGSrGfg
	V2JmMjlFDRT5zI4WJNQ1xwlNWWRkJVsnr3ERRGiolQQxVb5XIpqVu2iOjd6ZAVaBCszpyRxUrjI9Q
	2nyWwdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzV-004RJP-1a;
	Wed, 03 May 2023 11:49:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzH-004R45-17;
	Wed, 03 May 2023 11:49:36 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 65DC56603137;
	Wed,  3 May 2023 12:49:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683114574;
	bh=8+9JcA6Zz4WvK9lPx0N0XFAnJhjeuRVOIbom2ZpVRzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cK9bIFvPWLv9RvvRI6m0Ab12LxF2ivx+8EVWGOTEfMcPCD19Cp8d6p2FDa7HfqYZZ
	 91p2GBRYX7/uABQDZGtnQma1JJj23ObEr2K5KftQqeD4Y2/hRQQySiUECqjKkdl1UW
	 a61hu/qcbt1G4Dwbga5gMKe6IFra8lvhvyh7a36Dj7S6ptkVGnUEIBpRScJvcKDyOA
	 zDp/8PEDVGVqAj6MXo1rOsyWvTMTe8H7umMnTZbqvE8ZUVwdBbog0oGFR4h4A0ivCh
	 tXZjhsW4QNv7XUvEm2KGpq01H12R67T+4xtPRbw+FBxCj+r+omaR8UpgnZEHS+q9g8
	 1laAnwAWBpFag==
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
	kernel@collabora.com
Subject: [PATCH v2 05/11] drm/mediatek: gamma: Enable the Gamma LUT table only after programming
Date: Wed,  3 May 2023 13:49:17 +0200
Message-Id: <20230503114923.156985-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
References: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_044935_513115_1C15C2E6 
X-CRM114-Status: GOOD (  13.51  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 89a1640c2e8f..97b34963ef73 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -71,12 +71,12 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
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
@@ -90,9 +90,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		lut_size = LUT_SIZE_DEFAULT;
 	}
 
-	reg = readl(regs + DISP_GAMMA_CFG);
-	reg = reg | GAMMA_LUT_EN;
-	writel(reg, regs + DISP_GAMMA_CFG);
+	cfg_val = readl(regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 	for (i = 0; i < lut_size; i++) {
@@ -122,6 +120,11 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
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
2.40.1


