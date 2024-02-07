Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9972C4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELCSrMTC+6R9mP9c7xyf0kHK7dpZlmjrq/e2HJGHPjE=; b=wAAUgq9Stv/Ht0
	7p9eJ8l/cMD8MfiTmoPg3/AvholVz1mOg9ijBqSx+/3yNO9NYouf8Co1tPp9ICwNIotgrIj8ocgXE
	asw41UaFSgMzWlurblRQNXy7le3O98gGE0kkFQeHrtDIsoaBwB80m8gH5w49qsiue5p31B4jOFRun
	8sumE/LgiPXOwt0pnduzLsQTaP6TFkKJkRCTZH1TsgT5pFdZO8fk4llJyQvpThV9VFP2cWbE7fOW+
	4TjXHtr3E3VN+ZmhLfjjkxGQhcb2UDQVctEHxnkdFI8D7c3udZ3IBf3v4T+L59ne2UR3wAbTjaTxc
	eiPDQ2tu/IPxyF6fp3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjIj-0000000Ayog-1nr6;
	Wed, 07 Feb 2024 14:53:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjIc-0000000Ayis-3ErG;
	Wed, 07 Feb 2024 14:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707317597;
	bh=jGk/KNxt01mLk7K8ftidsFFvgZjFPmjzURhw+205rOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h1vJn5adtIQgUiJTXALxWctWQYA23NNfNQasSD9P+BAt94eWCdLeE1kvP+NnG7E6k
	 FP4AAkZF+K57imDYePkOiH1c8dmtoYFjOalaSKTHFKE+8BHd21ENCLhEUOkQRBBdin
	 STnPebQFCEf+uNV/SXMbQj9fLVgmmqnM5fStUGgdujLvxQXlNww8Nwe9B+7LMsC4an
	 1J/YhYC9RoAPegTYsAyreWvtpiEJ9fgytLlvrMr98/+I05zHFyCkIOnD853s8rCt8+
	 F2+VWNIk/4l9zvZ4IQuf2iE5RUOm+jDnrvuIQohVQEBPV17rA/lKZ/Ifq+QxKKy2Y/
	 lASxIT3Bca8gg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B34A23782076;
	Wed,  7 Feb 2024 14:53:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 3/9] drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
Date: Wed,  7 Feb 2024 15:53:01 +0100
Message-ID: <20240207145307.1626009-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
References: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_065318_967868_82B4D87A 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: p.zabel@pengutronix.de, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Function mtk_dsi_ps_control() is a subset of mtk_dsi_ps_control_vact():
merge the two in one mtk_dsi_ps_control() function by adding one
function parameter `config_vact` which, when true, writes the VACT
related registers.

Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 76 +++++++++---------------------
 1 file changed, 23 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 8af0afbe9e3d..7d38e9500700 100644
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
-		ps_bpp_mode |= LOOSELY_PS_24BIT_RGB666;
-		break;
-	case MIPI_DSI_FMT_RGB666_PACKED:
-		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
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
-		tmp_reg = LOOSELY_PS_24BIT_RGB666;
-		dsi_tmp_buf_bpp = 3;
+		ps_bpp_mode |= LOOSELY_PS_24BIT_RGB666;
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
-		tmp_reg = PACKED_PS_18BIT_RGB666;
-		dsi_tmp_buf_bpp = 3;
+		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
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


