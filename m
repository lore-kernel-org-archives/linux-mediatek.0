Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3E0C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H826kt0kQLxoUVgkxlMf0iwYK4GNnc8J2Oazq9yqCB0=; b=eS6iMKFd11Anz/K9iQcTf2v60W
	NzZ8AGUhe55mMqG0z7zcZQZCuEAkt6x4pjGOSsGhTEGvuy048uv4fs1AO2PcntepVSVA9KVPh+wm8
	GkJ/LsTT3HMb1dpkEFVxfekE4I2QQm64BGhaDIerQYMcH6e/3ODWpWGcBqmX4XMfN683ceJc9mN3w
	4v0XnoEFWSU3jTT96xAkAQ1uQDlFtRaa9syBfso0XzmB74bw2qBsIzSSrU0wmNILsbJ35M5bpe7ST
	dsQMcVT6n1NUZ7chRfwMoNp9aGzgLbOzz8VzOmt0CsfZtrKvueKpL1DsBLVqeUj5FOfoUpatkETRW
	7sGVDhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ktP-00Cyux-1H;
	Wed, 24 May 2023 09:34:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kt0-00Cyfb-1k;
	Wed, 24 May 2023 09:34:27 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ACF446605907;
	Wed, 24 May 2023 10:34:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684920864;
	bh=2Hsz2EJdS4VRyzmFM2xYr8U8SP0LYcUFtMd/nf9GRoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AwUM2x1gqbCnMltEdDDWXJkmqEpaWuDHJ9+w6dLrM2HWUxM9b7/McSlJDGk0gUk7c
	 Jbj8aYRiG388X8EhLCNpu8jRi/q7C01Kax39aLm9YxGAUlxq3X59eyp5ftLF6wpmkN
	 roYpXEIL8tf1SdPlC/2pnR87JSOTRAvX0YIrNFMAuAV4BIwIHH1C3CkjBc7R71pRjL
	 S1oMvYK6SpHtYTNFiGC3xCRuZZeygJzKRYyxSS3SgDKwwToq5RSw5WazR/fzPsX21g
	 zOWF+Af22teRcjLBhBXy/T7Sbm+S13nN5IOAPXvDEs0GwPuswuEfW0voB7nrcYH4LM
	 ApX7Kynr53w1g==
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
	kernel@collabora.com
Subject: [PATCH v1 4/4] drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
Date: Wed, 24 May 2023 11:34:12 +0200
Message-Id: <20230524093412.92211-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
References: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_023426_729370_FD51DC0C 
X-CRM114-Status: GOOD (  10.45  )
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

In mtk_dsi_phy_timconfig(), we're dividing the `data_rate` variable,
expressed in Hz to retrieve a value in MHz: instead of open-coding,
use the HZ_PER_MHZ definition, available in linux/units.h.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index fbf1c232107d..19e2b042c9d5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/units.h>
 
 #include <video/mipi_display.h>
 #include <video/videomode.h>
@@ -235,7 +236,7 @@ static void mtk_dsi_mask(struct mtk_dsi *dsi, u32 offset, u32 mask, u32 data)
 static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 {
 	u32 timcon0, timcon1, timcon2, timcon3;
-	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, 1000000);
+	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, HZ_PER_MHZ);
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
 	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
-- 
2.40.1


