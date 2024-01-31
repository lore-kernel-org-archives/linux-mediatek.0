Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7ADC47DDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdWfbaioGYtrLXt4q9whTZECZW+rVOFh54QnV0U1+K4=; b=JeR/sqYmU6x8sq
	UMPYhrS6PSIpGF+Dltfu++GaSRJdRhohzJag68heif0DIOLb96jThLn05lwfHhHwKsWLHUY8e2YQS
	9BxyxcXTNxfuDB4VlcOgZt87qX0BUgVmxjfSy6AieD4THnN+PQ3M+PrLtONvAGi9lNSbMqj+aLhP+
	BPMj4F84zCSPLZQ/pNs9GYC1C8sNi9a3xXyAxYlrwANrum33TFFvtcUYWStJ4gk9lJU5id4NfpaFr
	pVyqlo6+suaghflND8YMont7SnRYjmNWFjj7Mc22pYfhRY3eo3R7OMHue8g2dgTJeDqZRF/S91jAV
	X01iKhbyHBMabt2rZ2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8s9-000000038Vc-0KrE;
	Wed, 31 Jan 2024 11:35:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8re-000000038AS-0ECL;
	Wed, 31 Jan 2024 11:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706700884;
	bh=zbzMnTpoZSIYlb8jiO31bv5oIKyPpIebAKdElYE+AVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=5dr1dfI92989qfXEE0vyDLv888ezBDSodGehkNXNu0kz/KOLNI2QAPbV94iem1CV7
	 1vb+GpQyeTrowvnxj+NHPGxupHSIFm9halBaUDvBp+FjeD4AiKxwk1yFbm1dlWIIas
	 3qUGHF7gp5zBt7P1ubh4rZ4YI5FISupAKiOIYlW4H7KpKp2huSfWFrCsXRHFtTi/WL
	 oCIopRbWxre6xzV5+CPcruTcOSPt1ezSlcARcAYaUnQL0gAUbfe09BU1mSJ+0ViV1z
	 bFfUCRJXYpMlcRFQ2MiwVynywKnp8KsUxzo2Zbd6NqXORJOwCij/MZgeoPmGmCpN5n
	 SVEoPacPM0w9Q==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 17D033782084;
	Wed, 31 Jan 2024 11:34:44 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 4/7] drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
Date: Wed, 31 Jan 2024 12:34:31 +0100
Message-ID: <20240131113434.241929-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_033446_250231_BDA26938 
X-CRM114-Status: GOOD (  10.70  )
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

In mtk_dsi_phy_timconfig(), we're dividing the `data_rate` variable,
expressed in Hz to retrieve a value in MHz: instead of open-coding,
use the HZ_PER_MHZ definition, available in linux/units.h.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index cba63de5092d..cc625febe6c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -13,6 +13,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/units.h>
 
 #include <video/mipi_display.h>
 #include <video/videomode.h>
@@ -238,7 +239,7 @@ static void mtk_dsi_mask(struct mtk_dsi *dsi, u32 offset, u32 mask, u32 data)
 static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 {
 	u32 timcon0, timcon1, timcon2, timcon3;
-	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, 1000000);
+	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, HZ_PER_MHZ);
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
 	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
-- 
2.43.0


