Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35664C001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cim3JxghJDKsHICkdR0v/dbNBqJFqIm0rE5byICyyUQ=; b=ABuz8foQlvlR1t
	2Wyua5bJH8x1yRF6hXYY8viQXIhnCppk7WQsHJKu1wyQ5XZhfdmFz824hJ9qVKho/uvOdo2IHexfJ
	Q3OA/BzLCGYQzWr15+rJCFtN2hEzyG+BRapp+pa/zw1gRSsCCkn553NXfXd6OKlAn9rve6aEW5pzV
	lRvxU3zKpUfw8sFiWD/6jCxwQSpApL0Xgi9kSsiVtu5u1QuCasuF/dhnW0v4gNomqRa1UYcvY2z2s
	gu7w+KpDxAduCgfLyqf3X5TuNSElV3gD6dsBwyYAiudawf56FnBSJT9FEiEdbKhVqqCYscHMthgOL
	xJEyU0LkIOJIlaGyOBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZo2-009Zmu-2x;
	Wed, 26 Jul 2023 08:23:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnQ-009ZTu-1c;
	Wed, 26 Jul 2023 08:23:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC4AC660711C;
	Wed, 26 Jul 2023 09:22:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690359778;
	bh=2/PCXo0o2BSjM747Os2fuQqIWoXzN5M2Qfn+tk7CDoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sl/qY5ETet3lsta3lwGrihco2MTuUXNJFHMfdAd6t64adYuvMGLwhfCT8hS2sTzY1
	 LpCd+3aJCSSC7fhCBMuvR9oyGqCfW2yPVrHzatw2G8Ksb1Qf9I7CdPD0//M0fn1MUY
	 ybUOHwSmnAcUyTy3/ghEhTC2+2fpxExhD6ZP6LcWdD/5qQ/4iL7OajKYYDPC4wKBdy
	 cG+2vgs+eeGtON8oKy/5uE9zAwxqCbLH2/amKG/DO69kS6YA3Ai+7Web2zReisjvUk
	 le8Gsyz1X1sUgBBCBvAAug9h5Cv2n2fBDi9MVqbGOP7E7A8L7R6etZf65xF6vDwV7y
	 DzaIbEQWHobyg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 5/6] drm/mediatek: mtk_dpi: Use devm_platform_ioremap_resource()
Date: Wed, 26 Jul 2023 10:22:44 +0200
Message-ID: <20230726082245.550929-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_012300_696350_C4B2543C 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Instead of the open-coded platform_get_resource, devm_ioremap_resource
switch to devm_platform_ioremap_resource(), also dropping the useless
struct resource pointer, which becomes unused.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 2c95de5539fd..a6fa26301a58 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1006,7 +1006,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_dpi *dpi;
-	struct resource *mem;
 	int ret;
 
 	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
@@ -1037,8 +1036,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 			dev_dbg(&pdev->dev, "Cannot find pinctrl active!\n");
 		}
 	}
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dpi->regs = devm_ioremap_resource(dev, mem);
+	dpi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dpi->regs))
 		return dev_err_probe(dev, PTR_ERR(dpi->regs),
 				     "Failed to ioremap mem resource\n");
-- 
2.41.0


