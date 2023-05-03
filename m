Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C289DC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeueyH8CDgooMtutBLaT2Zvz13XZWzsV4aU7WjAbI+M=; b=MhmsXMD3aV/kdOeMoWFivA/1TP
	DFw+C108tdoL/GFU+AqoRy0ncmGPAXvyDrGVC85zotvBlHVDuaF4Oso9xplt2cTvr4+c+RkF+maO7
	yVlMU/BgS2tiAcrRzcJ900HtJHcHz1a/qsV2midUFao+mDuFtxtqeJ0J59uCapNex9uK1BZPbn/PN
	WnpZLKqSj73kA1LadpQINXsx6uhJiLlKQuoS3fnJtdwpWLDBjo6DsKRn0tj+SYBOQFJQd7+bqyKEN
	kNLYAnK0EtfUSu9lkSCEoTB864L3iDXtE9fptnNfTg3v+oNWLJMYC6Vi08vH2M08V8NOWLvZLgEIm
	qSwrfmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzJ-004R5w-09;
	Wed, 03 May 2023 11:49:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzD-004R1p-0N;
	Wed, 03 May 2023 11:49:32 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 12A3D66031E5;
	Wed,  3 May 2023 12:49:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683114569;
	bh=fWabP2S9MKC6+Yi0YWqUcPZxSafl399il5KPixyXdlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ir0h6N90I4GtDZjhRZB7pLA9qi4/Vcbu4y2HxrewPKVPBqjKObaLw64massMoCLAZ
	 dZu6bT9ol2FUZsog1BgSAhQI6Ueg9O423EYYv4XSHS4Tl+5rHD+mNCmlO6RwM7Q7Wy
	 IHtnOdzt1CiQURt8ZNzjTneTJaLWxBUg9eWEP4Eirb51GOuPbqkJeA5xr6ieUcoA8o
	 h9u5pGhJd1fL3TnLv/9VH9u34jNRvumQ+OUzd9Z7XcSSunaXRsV5AErRLhK2WisDlL
	 IAlH7pIGHpPrvjL56qxeh3vo20sp5Os2yFEPsywwJAMvUHhwr8BNJHxlsDoMOPbRyc
	 bhKRnCOGG7X8g==
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
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Subject: [PATCH v2 01/11] drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters
Date: Wed,  3 May 2023 13:49:13 +0200
Message-Id: <20230503114923.156985-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
References: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_044931_281204_B601CA7E 
X-CRM114-Status: GOOD (  13.77  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Adjust the parameters in mtk_drm_gamma_set_common()
  - add (struct device *dev) to get lut_diff from gamma's driver data
  - remove (bool lut_diff) and use false as default value in the function

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 15 +++++++++------
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 434e8a9ce8ab..8ddf7a97e583 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -67,7 +67,7 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
 
 	if (aal->data && aal->data->has_gamma)
-		mtk_gamma_set_common(aal->regs, state, false);
+		mtk_gamma_set_common(NULL, aal->regs, state);
 }
 
 void mtk_aal_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2254038519e1..75045932353e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -54,7 +54,7 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff);
+void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c844942603f7..99be515a941b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -55,14 +55,21 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff)
+void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	unsigned int i, reg;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
+	bool lut_diff;
 	u32 word;
 	u32 diff[3] = {0};
 
+	if (gamma && gamma->data)
+		lut_diff = gamma->data->lut_diff;
+	else
+		lut_diff = false;
+
 	if (state->gamma_lut) {
 		reg = readl(regs + DISP_GAMMA_CFG);
 		reg = reg | GAMMA_LUT_EN;
@@ -92,12 +99,8 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
-	bool lut_diff = false;
-
-	if (gamma->data)
-		lut_diff = gamma->data->lut_diff;
 
-	mtk_gamma_set_common(gamma->regs, state, lut_diff);
+	mtk_gamma_set_common(dev, gamma->regs, state);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
-- 
2.40.1


