Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAD5C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Bg95vTG7i5qmcG2L2s281WoQBxWPUoLiqODwtHlxWM=; b=mf8bGX7mp3BA3A
	ZGhqrIhULCop6v6kYHE3cn5898Lk2EYhAYHrwEDIKxeclMIJozjl3QdcAzltt8BpiGQcuxBHMIa/w
	69UVK5BeSwhq4q1s2+pjj96jV1nkAJfHU9CmbTZixohAWrEccYx+mGbI3AAR5yE4r+5dnHiK6f0J9
	F+8rhP+5QYt3xuvDH7CyDwCaG6fUkPn6oVEC+kk4UKz7BIQYRbQA4Z5fSY4+FbP9TPl26GoTuryQm
	y+Ff5so3jKcl16yOBsh7OkacoXvXbxqsyV8f2u6bsVGSgfRef+GsGjeQlfIY78pgiS9gKT0lpxrGR
	iEHmtv0SbUUBMxqKp9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1PTf-009xtD-2N;
	Tue, 23 May 2023 10:42:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1PTc-009xq9-0t;
	Tue, 23 May 2023 10:42:49 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 55C266606E75;
	Tue, 23 May 2023 11:42:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684838559;
	bh=k5mp+NPuC3+C8fsMCLAcwWhJ5WFcu3o02Q0hZe0dwhM=;
	h=From:To:Cc:Subject:Date:From;
	b=kh9Nd6T/8k3VroYVDmlTaX9A4m+npPH+O9zAx3WHJpRFbk+pgK0L0UUpGM3/Fs4Kn
	 OTjzxp0TjpGa0DEVfUchWsh+VDDnBlpQoTHdufvsnfQLl8MaRs/cSywPTY067VrSwe
	 GeFKVBhciJSweTohL+O2FGr8iZYTziU0eqXZPZoPl0DqH2+vTTKEf9/EyTCbQ8SA1X
	 6NPgp4cGiXEiivriAE7wy6TuQTLRzw1hFpf55St20SMQvlFwbfB6aR2BUu1bqEpMkp
	 /FNhW68+w8IHtHpiYTEI37DjUfqtpA8k4smcp820azJ9sKU/YSNIr52QYtwiTTBvE+
	 ZWpAw39yMbftQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling
Date: Tue, 23 May 2023 12:42:34 +0200
Message-Id: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_034248_472014_13466464 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: jitao.shi@mediatek.com, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, shaoming.chen@mediatek.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
later calculation for horizontal sync-active (HSA), back (HBP) and
front (HFP) porches got incorrect due to the logic being inverted.

This means that a number of settings were wrong because....:
 - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
   set in order to disable the End of Transmission packet;
 - Horizontal Sync and Back/Front porches: The delta used to
   calculate all of HSA, HBP and HFP should account for the
   additional EOT packet.

Before this change...
 - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
 - For HSA/HBP/HFP delta... all three were wrong, as words were
   added when EOT disabled, instead of when EOT packet enabled!

Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
MediaTek DSI driver to fix the aforementioned issues.

Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet control")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..b0ab38e59db9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
 		tmp_reg |= HSTX_CKLP_EN;
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		tmp_reg |= DIS_EOT;
 
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
@@ -484,7 +484,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 			  timing->da_hs_zero + timing->da_hs_exit + 3;
 
 	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
-	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
+	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
 
 	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
 	horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
-- 
2.40.1


