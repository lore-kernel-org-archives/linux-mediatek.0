Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4447C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfqR9u3XwXlGUjQlmuP4SZo/1RksuEgMYRsxq46AWiI=; b=KriyiIku0COOuV
	Xm5KTykjw2UccKonmeYbMt0BX0QxPq7iUzVzCf9FuCp8UoElNGHHuev6eD+G5dr/W7RE3/N/boYlX
	4HhoBggdCgu46lTkdRxTnxHojoU+Z0vOnF/5Bz56wOFbQNeLPZRLc8Kn2TlYuha7Cuqh90A6xgYjq
	2K+GlEo0j4Lq4zAeW6zUfLc2AbRd5DgsoUXQnzYRe8MLQ51rJXtmKLGAjIPrcoXO7G09p0vK+t3Z6
	WEeDnz7PVM6hOCcv5w+AfDDEUghS9/VJbdiOkRpxjicvryabL3dqOIHLM74RuiENxDpy7IA0iQZ9i
	9TIpuqs6W6bGi3fpSAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8rh-000000038DL-1JD6;
	Wed, 31 Jan 2024 11:34:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8rc-0000000389T-0CB2;
	Wed, 31 Jan 2024 11:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706700882;
	bh=j/2ny5Y8DyyuhjfBUyl+Wn3ma9b5f2x2Zt+jtkjquuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxsDWFArIlHi4qwvZ6rZXoBdVYA2HN5umf1ZsoYTcohnu2NWTj+nD/Q2Z+KWy1B3P
	 wt5N/5Z9tVsIwChL/ESE+yMp+Q3GIU24g0TOHlBaFKSK/uMtrtczbDtwXXCM/Qe5eS
	 ByM1mXZKyKw+ikwKScQF7/vnGOpIf7KFA1QoqIwH/CFqx/+13jyWBToissFpOuPj2H
	 mDvwkFB23vL5v1l8mJjyjvtUhNl/eB50kgQooiDEZpi/3ZrTqFxywrBtjbNgRIwDA8
	 1Wt2E/avFg8F215I1mCKItvbtJtjwmRoaoiOM4OMOlSo+pkOx93wv1yGP4LOXspBkb
	 m4Ix63AF1wTsQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1008E3782067;
	Wed, 31 Jan 2024 11:34:42 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 2/7] drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
Date: Wed, 31 Jan 2024 12:34:29 +0100
Message-ID: <20240131113434.241929-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_033444_242368_62F6A6B8 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Function mtk_dsi_ps_control() is a subset of mtk_dsi_ps_control_vact():
merge the two in one mtk_dsi_ps_control() function by adding one
function parameter `config_vact` which, when true, writes the VACT
related registers.

Reviewed-by: Fei Shao <fshao@chromium.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 76 +++++++++---------------------
 1 file changed, 23 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b7392c03b4d..8414ce73ce9f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -351,40 +351,6 @@ static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
 	mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
 }
 
-static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
-{
-	struct videomode *vm = &dsi->vm;
-	u32 dsi_buf_bpp, ps_wc;
-	u32 ps_bpp_mode;
-
-	if (dsi->format == MIPI_DSI_FMT_RGB565)
-		dsi_buf_bpp = 2;
-	else
-		dsi_buf_bpp = 3;
-
-	ps_wc = vm->hactive * dsi_buf_bpp;
-	ps_bpp_mode = ps_wc;
-
-	switch (dsi->format) {
-	case MIPI_DSI_FMT_RGB888:
-		ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
-		break;
-	case MIPI_DSI_FMT_RGB666:
-		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
-		break;
-	case MIPI_DSI_FMT_RGB666_PACKED:
-		ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
-		break;
-	case MIPI_DSI_FMT_RGB565:
-		ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
-		break;
-	}
-
-	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
-	writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
-	writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
-}
-
 static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 {
 	u32 tmp_reg;
@@ -416,36 +382,40 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
 }
 
-static void mtk_dsi_ps_control(struct mtk_dsi *dsi)
+static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
 {
-	u32 dsi_tmp_buf_bpp;
-	u32 tmp_reg;
+	struct videomode *vm = &dsi->vm;
+	u32 dsi_buf_bpp, ps_wc;
+	u32 ps_bpp_mode;
+
+	if (dsi->format == MIPI_DSI_FMT_RGB565)
+		dsi_buf_bpp = 2;
+	else
+		dsi_buf_bpp = 3;
+
+	ps_wc = vm->hactive * dsi_buf_bpp;
+	ps_bpp_mode = ps_wc;
 
 	switch (dsi->format) {
 	case MIPI_DSI_FMT_RGB888:
-		tmp_reg = PACKED_PS_24BIT_RGB888;
-		dsi_tmp_buf_bpp = 3;
+		ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
 		break;
 	case MIPI_DSI_FMT_RGB666:
-		tmp_reg = LOOSELY_PS_18BIT_RGB666;
-		dsi_tmp_buf_bpp = 3;
+		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
-		tmp_reg = PACKED_PS_18BIT_RGB666;
-		dsi_tmp_buf_bpp = 3;
+		ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
 		break;
 	case MIPI_DSI_FMT_RGB565:
-		tmp_reg = PACKED_PS_16BIT_RGB565;
-		dsi_tmp_buf_bpp = 2;
-		break;
-	default:
-		tmp_reg = PACKED_PS_24BIT_RGB888;
-		dsi_tmp_buf_bpp = 3;
+		ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
 		break;
 	}
 
-	tmp_reg += dsi->vm.hactive * dsi_tmp_buf_bpp & DSI_PS_WC;
-	writel(tmp_reg, dsi->regs + DSI_PSCTRL);
+	if (config_vact) {
+		writel(vm->vactive, dsi->regs + DSI_VACT_NL);
+		writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
+	}
+	writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
 }
 
 static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
@@ -521,7 +491,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
 
-	mtk_dsi_ps_control(dsi);
+	mtk_dsi_ps_control(dsi, false);
 }
 
 static void mtk_dsi_start(struct mtk_dsi *dsi)
@@ -666,7 +636,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_phy_timconfig(dsi);
 
-	mtk_dsi_ps_control_vact(dsi);
+	mtk_dsi_ps_control(dsi, true);
 	mtk_dsi_set_vm_cmd(dsi);
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
-- 
2.43.0


