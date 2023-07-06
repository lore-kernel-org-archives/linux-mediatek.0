Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A6CEB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkQrDbz11AsGHgXVO6Q2KjnrgpobXN/3E+qjgYSqTpI=; b=RY8RkxNH8vrmFNJSG885bCtscv
	yd1q+7gLAshzDX+VDiZHdO+uTtw+KGledtj8Y172lejByQfMAHvwyb1Y1P7Z6/z1zOPDghg6Ih1T8
	bF358AuJsnTIL7mlSGiM51iZXpVFv1792boloEOgj1TQS2xL5rWG8uJTl8Pd0meTSubUBS7/TDIsz
	Yhnb7hiQ8eSLC8eU9oBcIajchun7Mvkoe2BhnQse+/cGqp7RynoGvCYQwYEACFo/UJVkNgsJ+7pma
	Eamv/u61NhstYjee69PYbbG0LtBvJIL51lFiaywn6kYqhIjZygSyHFpV5fWOc2VOb8Q3BewCVbNo4
	K/vTlBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO89-001cp4-2h;
	Thu, 06 Jul 2023 12:30:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO83-001cgh-0I;
	Thu, 06 Jul 2023 12:30:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 265726606FC6;
	Thu,  6 Jul 2023 13:30:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688646633;
	bh=yC6E/mBM/67sUzeZV3Il3wBBzCtdEOHPS+iJkXdky+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GgT/1lsWIVlTK/HPW/RWvCKuOXCXF14NVBF7ybqd8Ohqh6bjDOlSBJEXZOJk3G/9c
	 JrVyaPTWeGT9kpcletskQGZpKvWpEATDYQ/vTcYc0sXBxaO2vH/Df1ZElhNxv37IBV
	 NyGKvX9xbHkePJ+fnu4nakM8B30WZEjwyqrUAOmYEwyBlBf8hxq/v2qKzeZ97g1FjA
	 IzTFX5jqv1IVizB3MQAcy9d9f3SqisJPDgK+j3H1/AZMa8R94sqQyK6qZEpquaia4c
	 LpO8cU+TT1Feqyg928pAuxkDTWQnw+/Z9bQOU5pmZDBkwYua2r8ZDM7erYgdeqPeVP
	 bNYJ4LCvTGijQ==
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
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com
Subject: [PATCH v4 4/9] drm/mediatek: dp: Always set cable_plugged_in at resume for eDP panel
Date: Thu,  6 Jul 2023 14:30:20 +0200
Message-Id: <20230706123025.208408-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_053035_280990_23D3BBB2 
X-CRM114-Status: UNSURE (   9.47  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

eDP panels are not removable: at PM resume, the cable will obviously
still be plugged in.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 5b35a2e23896..35f3549d258e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2606,6 +2606,9 @@ static int mtk_dp_resume(struct device *dev)
 	mtk_dp_hwirq_enable(mtk_dp, true);
 	mtk_dp_power_enable(mtk_dp);
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		mtk_dp->train_info.cable_plugged_in = true;
+
 	return 0;
 }
 #endif
-- 
2.40.1


