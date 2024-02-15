Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ADCC48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kI8E+cewE1wmo1HyE8GagdZvG0aogrlH+zFWOM03gFY=; b=4NOY311RPtona2
	y6SKM2RY9xkl8NUln8T4khlRvNHyUBYZoWQ6cnhKeoyUCncwhWnXH9ChF5hGv9UICxGv0U9QLb2rM
	s4xSRP1tdJ2ml5LrVIVQUF3sztuebQ3C/oUU0NqazUcVxq+UCc4oViIBXEyf1emg33xqC1//iTPk5
	bhCEbJ8sjq7e6tPFEVXEBQdvdfyD9f/mbof4l4Ets88MIOTPt9Fer6xglcXYnhXFQisWzP7lAyA4c
	Pk8iY/LkSeJs2dFC/VahfEMHku1Kff5OTv7Fn70L06C+gAfLWmbx6Amr97m49w+LsYZiup+Ep4g5c
	JpztKQpyR0Uk+unnw7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXV9-0000000FPEk-2HpS;
	Thu, 15 Feb 2024 08:53:51 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXUl-0000000FOrQ-1Rg8;
	Thu, 15 Feb 2024 08:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707987206;
	bh=2zkji/ritVm9wuEz/banneCsWweoQ6s31HP8aLRF9xQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B3FPVJBTawSqDJcWvLw3Q8kBp2OJipJE9pJrhvYWXDAVyXNw/KezuIWCgwtSQ7ZH6
	 4hAzH9bVJ250wXNp0pWYGMxmi6SferqVOVNitib53vZKrjPzZSMBrZ72zE4I1ji/rH
	 AG5Inyi1ay/fNhKqDSM3e+CGXsdHKRwQq0bPwFb52jdyfBLdIC+w7oD+JEUV3jyPkB
	 wE4SotuZP2J+wE/pP2vff941VT6ToKR3bVNsQkFjfky5soMr9tHvyU6vGjcrpJ2saR
	 d1v+gU8fIvnmWRn9ysVsxZLhtgY3FTv5RU47BvznyDda4+trjaHMIwKXQolVbEEVRF
	 W1ij0e325/AQg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 235D737820AD;
	Thu, 15 Feb 2024 08:53:25 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v6 5/9] drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
Date: Thu, 15 Feb 2024 09:53:12 +0100
Message-ID: <20240215085316.56835-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
References: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_005327_577707_761E2E8F 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: p.zabel@pengutronix.de, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mtk_dsi_phy_timconfig(), we're dividing the `data_rate` variable,
expressed in Hz to retrieve a value in MHz: instead of open-coding,
use the HZ_PER_MHZ definition, available in linux/units.h.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index a330bb94c44a..52758cab0abf 100644
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


