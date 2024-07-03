Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABEEC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 10:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ptEvBR1HF9mFj2T67w87EZNoyGTeD+Ap0evu63Vfkpk=; b=sz1LyAORlHiCoqGpDSxTlKIfEd
	XkXyKpZQf1YlY9WwsSFqMma3/Vumm61IS60t3koJcjHHjHu1ITPnoAmo71oGdUr27dLQKtO6tw5sD
	kBg/wTnZARs9i6UPFP3k7RBrXVKCdSLMl/tZM+Rpe3ITKT7F+TONiCEZOyvzSxYiDESwweloW4myl
	Xfr9GiACLI+JVewVuLheDHpLX8P6xTaQMzuyGrVEY/LFmyAom690EvV+RwmCA5hn1U/tC58uHVPX4
	+o0eLX9xSMkR+ZVfHpsQpdRu2gKOeHnPEXpluskU90Sl2GMlxaPc7VbdBqyUxSLIVN6ar9txuVP37
	fkQWFmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwq9-00000009fRe-0O5k;
	Wed, 03 Jul 2024 10:03:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwpv-00000009fNP-3ASW;
	Wed, 03 Jul 2024 10:03:41 +0000
X-UUID: 811661c8392311ef9daba96ee3f3cc8c-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ptEvBR1HF9mFj2T67w87EZNoyGTeD+Ap0evu63Vfkpk=;
	b=D8dhmbWW/7Igg92dJ6xxyEmAkzbgmv2T1MOx3J6SxoOuAWZu3CYjiZjZ3umW4JST09lssFSs6Nz6/uC97o88UoVrXcXOsGvARe1oIDhJfHFUPyYpXQ+bxekdQFXgv/A/F49FfatS97KXXeQGo37E4YG92l8u+nHT7DzbHWkF8eE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:8e7fa8f0-ceb8-4ea6-bdc0-9bba0e94e7be,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:d7b50ad1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 811661c8392311ef9daba96ee3f3cc8c-20240703
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1093305015; Wed, 03 Jul 2024 03:03:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Jul 2024 18:02:54 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Jul 2024 18:02:53 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>
Subject: [PATCH v3] drm/mediatek: dsi: Add dsi per-frame lp code for mt8188
Date: Wed, 3 Jul 2024 18:01:05 +0800
Message-ID: <20240703100245.23188-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.974200-8.000000
X-TMASE-MatchedRID: ctAk+wls9eAwKP61E4rxu1VN8laWo90M5TpDO1WKs2mYQOVjVNfbbjSg
	hb/pcAwyjqr5io4jdQ5IT4SOZxkibrGaAH5r9EhkhK8o4aoss8oxmbT6wQT2a2ecrqZc3vabX69
	OoovGE5CjmrD+IUq29hYchAzpNtsT62xBm/uUP3ltzb3s8Aa1Zu3+iQEtoSj4bYQ/auan8FGgrk
	Hr6pdTsLLjQWZr8tDZNIi7EG8+unPaVScbiljcbKUebN0FQAbYZ/rAPfrtWC0Uta+LQgEZMLuLU
	wvApCDyUOzgM0W+iui92gLrEY12PVFttnSPGAU6FYJUGv4DL3x9LQinZ4QefJOK2Na/r7MIF70J
	Bot7Y8/3FLeZXNZS4EZLVcXaUbdiUAwFt6X7kDkJMI/FW9lXe6ynwL7YTauuN/sy1SK5OZaeqD9
	WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.974200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A800866F8F70ED76B50E553C9C65C6091D98EB762A5241ABB50E9CA98ADEE24C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_030339_807417_27472798 
X-CRM114-Status: GOOD (  16.20  )
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

Adding the per-frame lp function of mt8188, which can keep HFP in HS and
reduce the time required for each line to enter and exit low power.
Per Frame LP:
  |<----------One Active Frame-------->|
--______________________________________----___________________
  ^HSA+HBP^^RGB^^HFP^^HSA+HBP^^RGB^^HFP^    ^HSA+HBP^^RGB^^HFP^

Per Line LP:
  |<---------------One Active Frame----------->|
--______________--______________--______________----______________
  ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^    ^HSA+HBP^^RGB^

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
Changes in v3:
Use function in bitfield.h and get value from phy timing, per suggestion
from previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240424091639.22759-1-shuijing.li@mediatek.com/
Changes in v2:
Use bitfield macros and add new function for per prame lp and improve
the format, per suggestion from previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240314094238.3315-1-shuijing.li@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 220 +++++++++++++++++++++++------
 1 file changed, 173 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index c255559cc56e..129ae17347a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -88,12 +88,19 @@
 #define DSI_HSA_WC		0x50
 #define DSI_HBP_WC		0x54
 #define DSI_HFP_WC		0x58
+#define HFP_HS_EN		31
+#define HFP_HS_VB_PS_WC_SHIFT 16
+
+#define DSI_BLLP_WC		0x5C
+#define BLLP_WC				GENMASK(11, 0)
 
 #define DSI_CMDQ_SIZE		0x60
 #define CMDQ_SIZE			0x3f
 #define CMDQ_SIZE_SEL		BIT(15)
 
 #define DSI_HSTX_CKL_WC		0x64
+#define HSTX_CKL_WC				GENMASK(15, 2)
+#define HSTX_CKL_WC_SHIFT	2
 
 #define DSI_RX_DATA0		0x74
 #define DSI_RX_DATA1		0x78
@@ -187,6 +194,7 @@ struct mtk_dsi_driver_data {
 	bool has_shadow_ctl;
 	bool has_size_ctl;
 	bool cmdq_long_packet_ctl;
+	bool support_per_frame_lp;
 };
 
 struct mtk_dsi {
@@ -426,6 +434,119 @@ static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
 	writel(ps_val, dsi->regs + DSI_PSCTRL);
 }
 
+static void mtk_dsi_config_vdo_timing_per_frame_lp(struct mtk_dsi *dsi)
+{
+	u32 horizontal_sync_active_byte;
+	u32 horizontal_backporch_byte;
+	u32 horizontal_frontporch_byte;
+	u32 dsi_tmp_buf_bpp;
+	unsigned int lpx, da_hs_exit, da_hs_prep, da_hs_trail;
+	unsigned int da_hs_zero, ps_wc, hs_vb_ps_wc;
+	u32 bllp_wc, bllp_en, v_active_roundup, hstx_cklp_wc;
+	u32 hstx_cklp_wc_max, hstx_cklp_wc_min;
+	struct videomode *vm = &dsi->vm;
+
+	if (dsi->format == MIPI_DSI_FMT_RGB565)
+		dsi_tmp_buf_bpp = 2;
+	else
+		dsi_tmp_buf_bpp = 3;
+
+	da_hs_trail = dsi->phy_timing.da_hs_trail;
+	bllp_en = FIELD_GET(NULL_EN, readl(dsi->regs + DSI_TXRX_CTRL));
+	ps_wc = FIELD_GET(DSI_PS_WC, readl(dsi->regs + DSI_PSCTRL));
+
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+		horizontal_sync_active_byte =
+			vm->hsync_len * dsi_tmp_buf_bpp - 10;
+		horizontal_backporch_byte =
+			vm->hback_porch * dsi_tmp_buf_bpp - 10;
+		horizontal_frontporch_byte =
+			vm->hfront_porch * dsi_tmp_buf_bpp - 12;
+
+		v_active_roundup = (32 + horizontal_sync_active_byte +
+			horizontal_backporch_byte + ps_wc +
+			horizontal_frontporch_byte) % dsi->lanes;
+		if (v_active_roundup)
+			horizontal_backporch_byte = horizontal_backporch_byte +
+				dsi->lanes - v_active_roundup;
+		hstx_cklp_wc_min = (DIV_ROUND_UP((12 + 2 + 4 +
+			horizontal_sync_active_byte), dsi->lanes) + da_hs_trail + 1)
+			* dsi->lanes / 6 - 1;
+		hstx_cklp_wc_max = (DIV_ROUND_UP((20 + 6 + 4 +
+			horizontal_sync_active_byte + horizontal_backporch_byte +
+			ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+	} else {
+		horizontal_sync_active_byte = vm->hsync_len * dsi_tmp_buf_bpp - 4;
+
+		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+			dsi_tmp_buf_bpp - 10;
+		hstx_cklp_wc_min = (DIV_ROUND_UP(4, dsi->lanes) + da_hs_trail + 1)
+			* dsi->lanes / 6 - 1;
+
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+			bllp_wc = FIELD_GET(BLLP_WC, readl(dsi->regs + DSI_BLLP_WC));
+			horizontal_frontporch_byte = (vm->hfront_porch *
+				dsi_tmp_buf_bpp - 18);
+
+			v_active_roundup = (28 + horizontal_backporch_byte + ps_wc +
+				horizontal_frontporch_byte + bllp_wc) % dsi->lanes;
+			if (v_active_roundup)
+				horizontal_backporch_byte = horizontal_backporch_byte +
+				dsi->lanes - v_active_roundup;
+			if (bllp_en) {
+				hstx_cklp_wc_max = (DIV_ROUND_UP((16 + 6 + 4 +
+					horizontal_backporch_byte + bllp_wc + ps_wc),
+					dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+			} else {
+				hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
+					horizontal_backporch_byte + bllp_wc + ps_wc),
+					dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+			}
+		} else {
+			horizontal_frontporch_byte = (vm->hfront_porch *
+				dsi_tmp_buf_bpp - 12);
+
+			v_active_roundup = (22 + horizontal_backporch_byte + ps_wc +
+				horizontal_frontporch_byte) % dsi->lanes;
+			if (v_active_roundup)
+				horizontal_backporch_byte = horizontal_backporch_byte +
+				dsi->lanes - v_active_roundup;
+
+			hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
+				horizontal_backporch_byte + ps_wc),
+				dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+		}
+	}
+	hstx_cklp_wc = FIELD_GET(HSTX_CKL_WC, readl(dsi->regs + DSI_HSTX_CKL_WC));
+
+	if (hstx_cklp_wc <= hstx_cklp_wc_min ||
+		hstx_cklp_wc >= hstx_cklp_wc_max) {
+		hstx_cklp_wc = ((hstx_cklp_wc_min + hstx_cklp_wc_max) / 2) << HSTX_CKL_WC_SHIFT;
+		writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
+	}
+	hstx_cklp_wc = hstx_cklp_wc >> HSTX_CKL_WC_SHIFT;
+	if (hstx_cklp_wc <= hstx_cklp_wc_min ||
+		hstx_cklp_wc >= hstx_cklp_wc_max) {
+		DRM_WARN("Wrong setting of hstx_ckl_wc\n");
+	}
+
+	lpx = dsi->phy_timing.lpx;
+	da_hs_exit = dsi->phy_timing.da_hs_exit;
+	da_hs_prep = dsi->phy_timing.da_hs_prepare;
+	da_hs_zero = dsi->phy_timing.da_hs_zero;
+
+	hs_vb_ps_wc = ps_wc -
+		(lpx + da_hs_exit + da_hs_prep + da_hs_zero + 2)
+		* dsi->lanes;
+	horizontal_frontporch_byte = (1 << HFP_HS_EN)
+		| (hs_vb_ps_wc << HFP_HS_VB_PS_WC_SHIFT)
+		| (horizontal_frontporch_byte);
+
+	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
+	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
+	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
+}
+
 static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 {
 	u32 horizontal_sync_active_byte;
@@ -449,57 +570,61 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
 	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
 
-	if (dsi->driver_data->has_size_ctl)
-		writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
-		       FIELD_PREP(DSI_WIDTH, vm->hactive),
-		       dsi->regs + DSI_SIZE_CON);
-
-	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
-
-	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp - 10;
-	else
-		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
-					    dsi_tmp_buf_bpp - 10;
-
-	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
-			  timing->da_hs_zero + timing->da_hs_exit + 3;
-
-	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
-	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
+	if (dsi->driver_data->support_per_frame_lp)
+		mtk_dsi_config_vdo_timing_per_frame_lp(dsi);
+	else {
+		if (dsi->driver_data->has_size_ctl)
+			writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
+				FIELD_PREP(DSI_WIDTH, vm->hactive),
+				dsi->regs + DSI_SIZE_CON);
 
-	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
-	horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
-	data_phy_cycles_byte = data_phy_cycles * dsi->lanes + delta;
+		horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
 
-	if (horizontal_front_back_byte > data_phy_cycles_byte) {
-		horizontal_frontporch_byte -= data_phy_cycles_byte *
-					      horizontal_frontporch_byte /
-					      horizontal_front_back_byte;
-
-		horizontal_backporch_byte -= data_phy_cycles_byte *
-					     horizontal_backporch_byte /
-					     horizontal_front_back_byte;
-	} else {
-		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
-	}
-
-	if ((dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) &&
-	    (dsi->lanes == 4)) {
-		horizontal_sync_active_byte =
-			roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
-		horizontal_frontporch_byte =
-			roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
-		horizontal_backporch_byte =
-			roundup(horizontal_backporch_byte, dsi->lanes) - 2;
-		horizontal_backporch_byte -=
-			(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+			horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp - 10;
+		else
+			horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+							dsi_tmp_buf_bpp - 10;
+
+		data_phy_cycles = timing->lpx + timing->da_hs_prepare +
+				timing->da_hs_zero + timing->da_hs_exit + 3;
+
+		delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
+		delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
+
+		horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
+		horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
+		data_phy_cycles_byte = data_phy_cycles * dsi->lanes + delta;
+
+		if (horizontal_front_back_byte > data_phy_cycles_byte) {
+			horizontal_frontporch_byte -= data_phy_cycles_byte *
+							horizontal_frontporch_byte /
+							horizontal_front_back_byte;
+
+			horizontal_backporch_byte -= data_phy_cycles_byte *
+							horizontal_backporch_byte /
+							horizontal_front_back_byte;
+		} else {
+			DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
+		}
+
+		if ((dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) &&
+			(dsi->lanes == 4)) {
+			horizontal_sync_active_byte =
+				roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
+			horizontal_frontporch_byte =
+				roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
+			horizontal_backporch_byte =
+				roundup(horizontal_backporch_byte, dsi->lanes) - 2;
+			horizontal_backporch_byte -=
+				(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
+		}
+
+		writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
+		writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
+		writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
 	}
 
-	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
-	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
-	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
-
 	mtk_dsi_ps_control(dsi, false);
 }
 
@@ -1194,6 +1319,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
 	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
-- 
2.43.0


