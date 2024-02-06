Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B034C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Um1sopQ7fOU6XRvtNpoglyC+v7Db23IRAatLBbJKBc=; b=jul1tlNuaMR3a6
	5bRnwrY1Nxa9yuhV9Hhmco8M3kNGQaLl8lemRm9XgspksuH9Ulf24EXZplr34WUbpuGbhjfcp3n1P
	+B5hqJiCQI9ATbTaQMghlLY11aXRUNtBpd7/O8yW28A6L9iGE2XKhsVwFWPBeBJL3TihIcYQFkny7
	xpc9EHYPwkETwtX/zk1LMqgUyjERrmZ6r+zTG3bpHXE+BG5+Oiimn2U5Xfw8P5TYME2E8rgA+Vl61
	V54IYVNEYuvZD8q1nC0EMDnP4dAfw16IZjqFVWqLngnHT0BKCyPnLlRkxnTmjXttATDZuRdn7g7dp
	1K4JYLNlW3SprD4P60YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKF9-00000007Tza-2McT;
	Tue, 06 Feb 2024 12:08:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKF1-00000007Tsx-3XlN;
	Tue, 06 Feb 2024 12:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707221274;
	bh=yL5B8N6E81+j3ROUqp66U9vkQ3wYW8h9lFRA+1sZxDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZAJ7ATombfarBAlVMMwEeKRK5mDRLVmnMnRXdzCMZW+IG/2FkSFRvE1aFfgKNyOO
	 IjKAFp0g4jnfEiMAOmgBx7gItpwS0Hegq1lJzYvkRL68cwA5d8GZ8EgZrzjWJFKiYe
	 Rwpxf9Nv3BDbNN9XlvJYvBxqL2hUCr9vK/lZqUiU6uJbpDyze3JgxzIaaafprSG3N2
	 IMdrnVqMnTcVo/NVmj7UcewDwjqb5ALajTLKJHb21dC68cBOTjy80aJKWoOsl2sCfb
	 NmX+SpMOSdHXbHOOSNEbWaXly7Agt2c7mKMeDFHc/uyGpBmQx0kSWE/TZko5xMzrUM
	 Msx0mAAqZGg0g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C74943782077;
	Tue,  6 Feb 2024 12:07:53 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v4 2/9] drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
Date: Tue,  6 Feb 2024 13:07:41 +0100
Message-ID: <20240206120748.136610-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_040756_081712_F5067432 
X-CRM114-Status: GOOD (  12.89  )
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

The register bits definitions for RGB666 formats are wrong in multiple
ways: first, in the DSI_PS_SEL bits region, the Packed 18-bits RGB666
format is selected with bit 1, while the Loosely Packed one is bit 2,
and second - the definition name "LOOSELY_PS_18BIT_RGB666" is wrong
because the loosely packed format is 24 bits instead!

Either way, functions mtk_dsi_ps_control_vact() and mtk_dsi_ps_control()
do not even agree on the DSI_PS_SEL bit to set in DSI_PSCTRL: one sets
loosely packed (24) on RGB666, the other sets packed (18), and the other
way around for RGB666_PACKED.

Fixing this entire stack of issues is done in one go:
 - Use the correct bit for the Loosely Packed RGB666 definition
 - Rename LOOSELY_PS_18BIT_RGB666 to LOOSELY_PS_24BIT_RGB666
 - Change ps_bpp_mode in mtk_dsi_ps_control_vact() to set:
    - Loosely Packed, 24-bits for MIPI_DSI_FMT_RGB666
    - Packed, 18-bits for MIPI_DSI_FMT_RGB666_PACKED

Fixes: 2e54c14e310f ("drm/mediatek: Add DSI sub driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b7392c03b4d..9fbf293db1c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -71,8 +71,8 @@
 #define DSI_PS_WC			GENMASK(14, 0)
 #define DSI_PS_SEL			GENMASK(19, 16)
 #define PACKED_PS_16BIT_RGB565		(0 << 16)
-#define LOOSELY_PS_18BIT_RGB666		(1 << 16)
-#define PACKED_PS_18BIT_RGB666		(2 << 16)
+#define PACKED_PS_18BIT_RGB666		(1 << 16)
+#define LOOSELY_PS_24BIT_RGB666		(2 << 16)
 #define PACKED_PS_24BIT_RGB888		(3 << 16)
 
 #define DSI_VSA_NL		0x20
@@ -370,10 +370,10 @@ static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
 		ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
 		break;
 	case MIPI_DSI_FMT_RGB666:
-		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
+		ps_bpp_mode |= LOOSELY_PS_24BIT_RGB666;
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
-		ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
+		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
 		break;
 	case MIPI_DSI_FMT_RGB565:
 		ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
@@ -427,7 +427,7 @@ static void mtk_dsi_ps_control(struct mtk_dsi *dsi)
 		dsi_tmp_buf_bpp = 3;
 		break;
 	case MIPI_DSI_FMT_RGB666:
-		tmp_reg = LOOSELY_PS_18BIT_RGB666;
+		tmp_reg = LOOSELY_PS_24BIT_RGB666;
 		dsi_tmp_buf_bpp = 3;
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
-- 
2.43.0


