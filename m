Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD84C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHSUX4KHPWpMJlFuo0eszFkppjd3x/GSxlVUJ4bY8gE=; b=vddHzrhMk+dVgM
	Zqb+D15iTzl23iZTHk3+FR2vzn9Yn5ZW4IPYMZAi6RVBcsrH8w/tqOC7dHF7dmFRhs4Lkywufi5CN
	3lvqOaKYd0szJIKGn4nXDYdcgAFxbvhEBHs5zXSY6Culh+ZrrnT0yfih1bEpKcJMblTPd2EKFtTlM
	706eeSu0iU6IvvsUMxBKqIr9Hgcvi0voNFzEAipu2Vk1d9i3W6kArNiRyOm/OiJkBMztgOm9a5gaP
	KjASwHP/8OxNAyCAle1P1daPuQ8mal+Br8u5oqzar/hr1lKupShe6VBaubiXAO3L4rQjcBc/Qq2V7
	xOzaWeLg2C2v++rlzMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8rv-000000038Ni-0MFh;
	Wed, 31 Jan 2024 11:35:03 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8rd-000000038A0-0aZt;
	Wed, 31 Jan 2024 11:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706700883;
	bh=JY1iMd8qOfsdbrHbfu30Unsdv6pQvJsZX6iF7UtrCEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MviYUze4wBFc3uSP+ufe2apG6Ydm/2PuHwte2EKSmXbuRRo8rw4VlUGlOWl8z1VHF
	 QN437ye6zDvRpWC45xzzYXm8tG3Nlii8mmvP9IWxJTFCZ5av3/PXhArLSVVLTmHLfd
	 bPhfvgL2OGEGXg7BpLsOjaatxszSDm+14dv/MoCJXKnUOUjmQI7x4LSMHNV5Vnsuan
	 MsQqQtjwIIHS7A+gkIfAbO4bCdStKKP+VhOMjAtp0RzNmij/vgNSpZxnPG/W0izLCl
	 07le++ei+yVLd/st0tPU86AQ78kINc3wmRdpZBK1zKM+m6mNtU0bYFveApWCFC66xF
	 8Ucjn2blKKYCw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 172FE3782079;
	Wed, 31 Jan 2024 11:34:43 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 3/7] drm/mediatek: dsi: Use bitfield macros where useful
Date: Wed, 31 Jan 2024 12:34:30 +0100
Message-ID: <20240131113434.241929-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_033445_362449_423A8DAE 
X-CRM114-Status: GOOD (  14.83  )
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

Instead of open coding bitshifting for various register fields,
use the bitfield macro FIELD_PREP(): this allows to enhance the
human readability, decrease likeliness of mistakes (and register
field overflowing) and also to simplify the code.
The latter is especially seen in mtk_dsi_rxtx_control(), where
it was possible to change a switch to a short for loop and to
also remove the need to check for maximum DSI lanes == 4 thanks
to the FIELD_PREP macro masking the value.

While at it, also add the missing DA_HS_SYNC bitmask, used in
mtk_dsi_phy_timconfig().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 97 ++++++++++++++++--------------
 1 file changed, 52 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 8414ce73ce9f..cba63de5092d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/iopoll.h>
@@ -70,16 +71,19 @@
 #define DSI_PSCTRL		0x1c
 #define DSI_PS_WC			GENMASK(14, 0)
 #define DSI_PS_SEL			GENMASK(19, 16)
-#define PACKED_PS_16BIT_RGB565		(0 << 16)
-#define LOOSELY_PS_18BIT_RGB666		(1 << 16)
-#define PACKED_PS_18BIT_RGB666		(2 << 16)
-#define PACKED_PS_24BIT_RGB888		(3 << 16)
+#define PACKED_PS_16BIT_RGB565		0
+#define LOOSELY_PS_18BIT_RGB666		1
+#define PACKED_PS_18BIT_RGB666		2
+#define PACKED_PS_24BIT_RGB888		3
 
 #define DSI_VSA_NL		0x20
 #define DSI_VBP_NL		0x24
 #define DSI_VFP_NL		0x28
 #define DSI_VACT_NL		0x2C
+#define VACT_NL				GENMASK(14, 0)
 #define DSI_SIZE_CON		0x38
+#define DSI_HEIGHT				GENMASK(30, 16)
+#define DSI_WIDTH				GENMASK(14, 0)
 #define DSI_HSA_WC		0x50
 #define DSI_HBP_WC		0x54
 #define DSI_HFP_WC		0x58
@@ -122,6 +126,7 @@
 
 #define DSI_PHY_TIMECON2	0x118
 #define CONT_DET			GENMASK(7, 0)
+#define DA_HS_SYNC			GENMASK(15, 8)
 #define CLK_ZERO			GENMASK(23, 16)
 #define CLK_TRAIL			GENMASK(31, 24)
 
@@ -253,14 +258,23 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 	timing->clk_hs_zero = timing->clk_hs_trail * 4;
 	timing->clk_hs_exit = 2 * timing->clk_hs_trail;
 
-	timcon0 = timing->lpx | timing->da_hs_prepare << 8 |
-		  timing->da_hs_zero << 16 | timing->da_hs_trail << 24;
-	timcon1 = timing->ta_go | timing->ta_sure << 8 |
-		  timing->ta_get << 16 | timing->da_hs_exit << 24;
-	timcon2 = 1 << 8 | timing->clk_hs_zero << 16 |
-		  timing->clk_hs_trail << 24;
-	timcon3 = timing->clk_hs_prepare | timing->clk_hs_post << 8 |
-		  timing->clk_hs_exit << 16;
+	timcon0 = FIELD_PREP(LPX, timing->lpx) |
+		  FIELD_PREP(HS_PREP, timing->da_hs_prepare) |
+		  FIELD_PREP(HS_ZERO, timing->da_hs_zero) |
+		  FIELD_PREP(HS_TRAIL, timing->da_hs_trail);
+
+	timcon1 = FIELD_PREP(TA_GO, timing->ta_go) |
+		  FIELD_PREP(TA_SURE, timing->ta_sure) |
+		  FIELD_PREP(TA_GET, timing->ta_get) |
+		  FIELD_PREP(DA_HS_EXIT, timing->da_hs_exit);
+
+	timcon2 = FIELD_PREP(DA_HS_SYNC, 1) |
+		  FIELD_PREP(CLK_ZERO, timing->clk_hs_zero) |
+		  FIELD_PREP(CLK_TRAIL, timing->clk_hs_trail);
+
+	timcon3 = FIELD_PREP(CLK_HS_PREP, timing->clk_hs_prepare) |
+		  FIELD_PREP(CLK_HS_POST, timing->clk_hs_post) |
+		  FIELD_PREP(CLK_HS_EXIT, timing->clk_hs_exit);
 
 	writel(timcon0, dsi->regs + DSI_PHY_TIMECON0);
 	writel(timcon1, dsi->regs + DSI_PHY_TIMECON1);
@@ -353,69 +367,61 @@ static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
 
 static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 {
-	u32 tmp_reg;
+	u32 regval, tmp_reg = 0;
+	u8 i;
 
-	switch (dsi->lanes) {
-	case 1:
-		tmp_reg = 1 << 2;
-		break;
-	case 2:
-		tmp_reg = 3 << 2;
-		break;
-	case 3:
-		tmp_reg = 7 << 2;
-		break;
-	case 4:
-		tmp_reg = 0xf << 2;
-		break;
-	default:
-		tmp_reg = 0xf << 2;
-		break;
-	}
+	/* Number of DSI lanes (max 4 lanes), each bit enables one DSI lane. */
+	for (i = 0; i < dsi->lanes; i++)
+		tmp_reg |= BIT(i);
+
+	regval = FIELD_PREP(LANE_NUM, tmp_reg);
 
 	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
-		tmp_reg |= HSTX_CKLP_EN;
+		regval |= HSTX_CKLP_EN;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
-		tmp_reg |= DIS_EOT;
+		regval |= DIS_EOT;
 
-	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
+	writel(regval, dsi->regs + DSI_TXRX_CTRL);
 }
 
 static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
 {
-	struct videomode *vm = &dsi->vm;
-	u32 dsi_buf_bpp, ps_wc;
-	u32 ps_bpp_mode;
+	u32 dsi_buf_bpp, ps_val, ps_wc, vact_nl;
 
 	if (dsi->format == MIPI_DSI_FMT_RGB565)
 		dsi_buf_bpp = 2;
 	else
 		dsi_buf_bpp = 3;
 
-	ps_wc = vm->hactive * dsi_buf_bpp;
-	ps_bpp_mode = ps_wc;
+	/* Word count */
+	ps_wc = FIELD_PREP(DSI_PS_WC, dsi->vm.hactive * dsi_buf_bpp);
+	ps_val = ps_wc;
 
+	/* Pixel Stream type */
 	switch (dsi->format) {
+	default:
+		fallthrough;
 	case MIPI_DSI_FMT_RGB888:
-		ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
+		ps_val |= FIELD_PREP(DSI_PS_SEL, PACKED_PS_24BIT_RGB888);
 		break;
 	case MIPI_DSI_FMT_RGB666:
-		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
+		ps_val |= FIELD_PREP(DSI_PS_SEL, PACKED_PS_18BIT_RGB666);
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
-		ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
+		ps_val |= FIELD_PREP(DSI_PS_SEL, LOOSELY_PS_18BIT_RGB666);
 		break;
 	case MIPI_DSI_FMT_RGB565:
-		ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
+		ps_val |= FIELD_PREP(DSI_PS_SEL, PACKED_PS_16BIT_RGB565);
 		break;
 	}
 
 	if (config_vact) {
-		writel(vm->vactive, dsi->regs + DSI_VACT_NL);
+		vact_nl = FIELD_PREP(VACT_NL, dsi->vm.vactive);
+		writel(vact_nl, dsi->regs + DSI_VACT_NL);
 		writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
 	}
-	writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
+	writel(ps_val, dsi->regs + DSI_PSCTRL);
 }
 
 static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
@@ -442,7 +448,8 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
 
 	if (dsi->driver_data->has_size_ctl)
-		writel(vm->vactive << 16 | vm->hactive,
+		writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
+		       FIELD_PREP(DSI_WIDTH, vm->hactive),
 		       dsi->regs + DSI_SIZE_CON);
 
 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
-- 
2.43.0


