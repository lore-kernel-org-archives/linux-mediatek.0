Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9592EC001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxtRWSpYyOj5LmE/Q+Bsip++G5zdnJCcTZ/on+0LwCA=; b=oo2k00MAK2O3E7xOqBIr+xoVdg
	zdR2DjA+Q32tu08oaoksM4UDqyvzY7unzGaiQjNwgJe6pz+pJCt5TbkNrufZFh+FbFvp7U1YwMDU+
	a7I9sU2SIaUIf56+RTH6AP6/KVnyp/8dmCmDWdBJ5pyp8cZV0559+LmCpVGDHh/k2m5hOje/HX3Uy
	ONUqeoXt0dh64h7+XlT7mNhS152DxT4ibiCTdgjbb5nbph5urwHXfRY7GN2K8LAvlXgnu2WaYXMww
	lqGuXlihlGMRSfKjOlb660cwuTlxaP+/N8A3CfUn+br9XgqGEFOMcIQxszc5mPwltiQjCN2JBLEjJ
	RvIvc/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSa7-00FfqN-1I;
	Mon, 31 Jul 2023 13:05:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSZt-00Fff0-2D;
	Mon, 31 Jul 2023 13:04:51 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E11856606FD9;
	Mon, 31 Jul 2023 14:04:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690808687;
	bh=kYeyT6HbEedO1YRPTVJsJxzagOYrnms3xwsfF+B40oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l8c1y3zC/lWm5krDtOFSjzYWODsuXyoNNopnvjbO7aBCMCugzrO995ZfSXjAjNhlF
	 pl0YV5ygpXOzlu/PDQ8V6uUzPYS+zsHjfETwH17XzNI26oTpX8+fK+x0ZRKoFgAeVU
	 yNX83VBuJiBYji/nN4D01cBhIQMNGxKeWZQBLoHnPVnsAdGuMQSRHtC1OiYNtEKDMR
	 jN3qSLPiYV5c+fz/iw8yC3/g4WnhIhJXGfY/vxkZtvZ0EESlL/12dsUL89jA2trBo0
	 QgYQSr3m4ER4WiGvjFH2MLPgeLPa3nAsEBtkNRiWbiLkYOXL53Gn5iiq8pcZ+oOvh5
	 0KkP4TMVa1XhA==
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
Subject: [PATCH v7 02/13] drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
Date: Mon, 31 Jul 2023 15:04:30 +0200
Message-ID: <20230731130441.173960-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
References: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_060449_854704_36B95CF2 
X-CRM114-Status: GOOD (  14.48  )
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
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 45 ++++++++++++-----------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index d42cc0698d83..47751864bd5c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -64,6 +64,10 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	u32 word;
 	u32 diff[3] = {0};
 
+	/* If there's no gamma lut there's nothing to do here. */
+	if (!state->gamma_lut)
+		return;
+
 	/* If we're called from AAL, dev is NULL */
 	gamma = dev ? dev_get_drvdata(dev) : NULL;
 
@@ -72,29 +76,26 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
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
2.41.0


