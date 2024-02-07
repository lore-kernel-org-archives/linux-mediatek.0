Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA187C4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4dA93jvf0KlgcvF+UQHWZ0AHav2xg8zQh8AZYfaEm4=; b=bpM1LyXYjgnLzP
	ssZfxBk9P9KYEtjMbgrdMzGT4KiUcZx9gzyWE2wQFc62BmllqQvXBLL3vW1PPOt8PWw7D/dhOS4zb
	wjq4xm3XQU+aRtuVho6SHaY7BbgoYkpJZ+m7sn8BH0rndJYSrv4mriIV4I6peqX0xo2mUeRUf8cUj
	VddVEyJXspcY6QphtV8QtOnEgXpiwK5qGh6KoS5WVfEC6/mSLyk/aYqELv4HU+qdV3iQz5er56iMy
	QjcugAPTmgiBIpw3FzlB1nLjzKFGdB2nYZWEbCxp2e8k2Lxb6hPPeDEod5S3n4rSJl/v7hpO+h8Wz
	tzkqb4HmhINYriU5naNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjJU-0000000AzSk-3fes;
	Wed, 07 Feb 2024 14:54:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjIj-0000000Aynu-1pJZ;
	Wed, 07 Feb 2024 14:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707317604;
	bh=t314JYLEkG/5o9HpK7I9qR3Mx0x17vEhEBxIxc/bWK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oF4PmVlLOMnmfRKhI8wyvjtZ3sH/fa/3SrHXuaP6e3Mt4yv/Q3OKS1J9GSOuywgM0
	 vlsP197c+IMOPSCPdiQZGi+othum7S8Y+zr/jzNt+mc6SIYlp7LMCAFHrk4Uy72alm
	 JNVaOwzNowWBeE4RtrbJ8MMMZl9ugfOBdLrh+USCt+AqLSk5DDw7OcZOBa80SuZeqQ
	 m1oHMSMmts2NOcg+w5/igadWrpU/Wyt9JUnOrz6kve0ctieqPYyppGkvEqIICeG/T4
	 sihnDa35bP8mRMYrRaCFF8b+AiP+ELenXwq5YKo4l0rNFPuMpZYVYZLSlIIOACS8rW
	 OGAc9ncs4fqHA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4A925378207B;
	Wed,  7 Feb 2024 14:53:23 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 9/9] drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp() helper function
Date: Wed,  7 Feb 2024 15:53:07 +0100
Message-ID: <20240207145307.1626009-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
References: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_065325_787528_9EAC130E 
X-CRM114-Status: GOOD (  14.92  )
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

Instead of open coding, use the mipi_dsi_pixel_format_to_bpp() helper
function from drm_mipi_dsi.h in mtk_dsi_poweron() and for validation
in mtk_dsi_bridge_mode_valid().

Note that this function changes the behavior of this driver: previously,
in case of unknown formats, it would (wrongly) assume that it should
account for a 24-bits format - now it will return an error and refuse
to set clocks and/or enable the DSI.

This is done because setting the wrong data rate will only produce a
garbage output that the display will misinterpret both because this
driver doesn't actually provide any extra-spec format support and/or
because the data rate (hence, the HS clock) will be wrong.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b644505de98a..9501f4019199 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -598,19 +598,12 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	if (++dsi->refcount != 1)
 		return 0;
 
-	switch (dsi->format) {
-	case MIPI_DSI_FMT_RGB565:
-		bit_per_pixel = 16;
-		break;
-	case MIPI_DSI_FMT_RGB666_PACKED:
-		bit_per_pixel = 18;
-		break;
-	case MIPI_DSI_FMT_RGB666:
-	case MIPI_DSI_FMT_RGB888:
-	default:
-		bit_per_pixel = 24;
-		break;
+	ret = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (ret < 0) {
+		dev_err(dev, "Unknown MIPI DSI format %d\n", dsi->format);
+		return ret;
 	}
+	bit_per_pixel = ret;
 
 	dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
 					  dsi->lanes);
@@ -793,12 +786,11 @@ mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_mode *mode)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-	u32 bpp;
+	int bpp;
 
-	if (dsi->format == MIPI_DSI_FMT_RGB565)
-		bpp = 16;
-	else
-		bpp = 24;
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (bpp < 0)
+		return MODE_ERROR;
 
 	if (mode->clock * bpp / dsi->lanes > 1500000)
 		return MODE_CLOCK_HIGH;
-- 
2.43.0


