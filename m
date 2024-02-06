Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65090C4829D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9e5E/6stmH9TAgdXBdh5tN5w0k+A0ggfgLIYiGLAIP4=; b=kEzW7QKlIrsNUK
	aFSF94fWoB5cg3h+wLC7EuDu2Cs09VUbSypA3uT/VkuumguU0qpw3oR0BNXaeim4XosoOTXc7eObn
	2MLY8Z3sUTXfowhb5jJog2AJpruf+lbzkuBzkQGXJwuDaASSMzaLK7DwXG1Lz5H5wjv67AIfejhM4
	563yapY3VZSw9rePZQeDSm5gSaJKo305h9mY45TnPIt37jbpsnLcjcfCywk4mai4eqga1qcu6wzH/
	LorZ1c6Yuvri5x8IGcvgdBy3P5lsZYbLGALSuhnSH9ehJAdRqb5xjnaBo2kpzRjxMfuMSotuMmuzs
	hRhoWktBkRcaG5JxFb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKFO-00000007UEZ-0qM2;
	Tue, 06 Feb 2024 12:08:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKF4-00000007Tv2-3bjc;
	Tue, 06 Feb 2024 12:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707221277;
	bh=mccYyS90vn45+hq6oaGnHGsB4mCj/z4kAT02aNdMkKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SHK1PNlOMVl1mXpVM4zFaFL9oQ/LgGbvtTDCS5/yt4hwbtDPOUdEicpGaGzGgVFwO
	 KdtSHY+MzWrHkV5RPGAB9VoXDDWgELLXzoTMh1q9RA+EbkKFAqbwvElpCNRhSBPmSB
	 qz/GsWHu64p89/aHJqlXt84muFf5rSVBavjj0o/bXPxb5uJE/+EkeuNrvx2tUI/BJP
	 CoMukns/Iwp4wuvPKDEIdigpZKT/rC1jO1PgUNp+06rdR/78P3Lo92aXskLrdEav2a
	 GL8xXRfa2jdrah9w2cKp8rhWspsIV1NmC7HDC1++5TF2+IucLsxI+Axb+k3KCNO1eV
	 YN0ljG2y1gWxw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D71B83782080;
	Tue,  6 Feb 2024 12:07:56 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v4 5/9] drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
Date: Tue,  6 Feb 2024 13:07:44 +0100
Message-ID: <20240206120748.136610-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_040759_053456_39243E28 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
index 26c221737387..5e383ca00ba8 100644
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


