Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8FFC04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNF4mo6j/sr2H/XkAsr/xbNiamMSN0ztDQJtRgYEuS4=; b=nlPD6aWwYl0dsfPjAtmzHBs9nU
	YE3+PcGRA1SsOWf0cfbo/EjjhBs3uGiMLcjPnKJRmtmOdvdFXgrg7wivQwZNoNJvb8+QnPbmGJcTS
	mTU6AzDapSJWAFqqxx23ook9KLUmOKHltrnEKS0vSAxxkOG/CsZxnF2fbgrBOkAg8S6k+u2QXoWhw
	MxN+9mdAbiq1X01Dsf1lrnJjRM0aOeV/CS611HS6xTxnzpx+lwKw4vJgTWBQu102gYNjWuDCayiyD
	BBNRf3Fw/Jk2Og6PCvpauqkZYL58KjB5JtTsd2/8SN03vovMHLad6cevT/lbFOeboNf1Lba5qcuq6
	O95VE5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFF-00BmTo-2h;
	Fri, 04 Aug 2023 07:29:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpF7-00BmMT-35;
	Fri, 04 Aug 2023 07:29:04 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66C7A66071BA;
	Fri,  4 Aug 2023 08:28:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691134138;
	bh=yEFNmriytfzFlnNR03nQnEhTvtOxc2/EEUJg2NG5628=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f9ioAsocMMQMJlAWukV5oFwbeEBSz6Hq/4lBQkiaAfOHyeqcnhOCgU1OgvshwsQuL
	 P6YpwrqDRtaqvkXAZehl4vLg6Td6GwF0YKQF6ZzwmcULNYyvRYgX5pwJjUnZKIPihe
	 vDXeDq0B6ITXqfYmNe0x7ZpS1XFsXvyUIlTMAY3YEjo6SAJFBAU+egiv9mS0Ma/BKR
	 x+aq+TLIluOES8ZTQhhlX0h9HhcBTDLh9hdAzCuR58DOg+FqdLOdUVvsbxMRaAYvvo
	 DZPCLU8svq6we7RM7+JMnJoX5jHY8JjqybKi/onI/60mvhqoAwRPHkOOa2wHm2YnDW
	 wyj36ecMD9JEw==
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
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v10 01/16] drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters
Date: Fri,  4 Aug 2023 09:28:35 +0200
Message-ID: <20230804072850.89365-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_002902_142193_61984E40 
X-CRM114-Status: GOOD (  13.26  )
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
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 18 ++++++++++++------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index cdbec79474d1..2f602f1f1c49 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
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
index 7746dceadb20..d42cc0698d83 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -54,14 +54,24 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff)
+void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
+	struct mtk_disp_gamma *gamma;
 	unsigned int i, reg;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
+	bool lut_diff;
 	u32 word;
 	u32 diff[3] = {0};
 
+	/* If we're called from AAL, dev is NULL */
+	gamma = dev ? dev_get_drvdata(dev) : NULL;
+
+	if (gamma && gamma->data)
+		lut_diff = gamma->data->lut_diff;
+	else
+		lut_diff = false;
+
 	if (state->gamma_lut) {
 		reg = readl(regs + DISP_GAMMA_CFG);
 		reg = reg | GAMMA_LUT_EN;
@@ -91,12 +101,8 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool
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
2.41.0


