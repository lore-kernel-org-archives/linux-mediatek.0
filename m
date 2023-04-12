Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1D8C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOQuPk/av2zRv+4/K+COaXtvwXdAcd7QBfG2wRELcbE=; b=zfZ/x+8F/0IFodznV15ygCDU0T
	wqaZercjcBO3yF+zJquogBpL0FM1jVAgqb8xwDTJ4eWZMLQWlzPJikcm4vzrtFuNbWAox/fJ12h33
	vZx8L3GEDOt+h5KUC1ICnFmAexPPMij1rFGOSw7nCH0RiItr0GSiQwTt47v9oYPGTZoHjUkuqJfMy
	kfo5G2AjAnT7bDVbJWDhj8Cg1V0Fv0jgQ/Fj4pTJyHucGkcDjtD58RgV8xg3FvR96fBWGdshXMWX9
	dNHAs2HLxpPLneBJUlt+vcvM552ySRU9LOdVZybzt/WsIGapZjSVcciL1AsuqLB+AO4iLFJympUfB
	DaRML3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ2J-002xYX-0g;
	Wed, 12 Apr 2023 11:53:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ23-002xIs-14;
	Wed, 12 Apr 2023 11:53:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C3746603255;
	Wed, 12 Apr 2023 12:52:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681300378;
	bh=vgCzOfsjHqzxe3JGHPEHxks0hGKSfmPemepHaQkMDtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpXmWnzd7n6i6f8IL8PsTjmmrcY+PxcIlozvsyLlO/nXiUoAiHOT7hrz5UxEIXlTy
	 BK7p1M7If7Z1qv+9SnxnR8kBT/4JPGKFkPxGUDPE4u5BWkJBNz700V3/VTE6bIaosU
	 x8ybm+BOw1k5P5nJO8ycE+/7xpDYRBFTx+Dwb+CSSOv7H1znWtEZxz82ZJhWjG3v1S
	 goFaCI6im7cJ/RR3/UiAIswySZFnRftqFEmxnqQl4edQYYk5e/lMwYJfNZLXfPHUmJ
	 qNIPMD12PwyO2c331b8V1gr0SIwB7tTbrLopgwI8CuqzjpnuoIym6vKW429R7QcNLG
	 4TgxMu5iIuHMQ==
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
Subject: [PATCH 4/4] drm/mediatek: mtk_dpi: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 12 Apr 2023 13:52:50 +0200
Message-Id: <20230412115250.164899-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_045259_498106_E1BE2AF9 
X-CRM114-Status: GOOD (  10.53  )
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

Instead of the open-coded platform_get_resource, devm_ioremap_resource
switch to devm_platform_get_and_ioremap_resource(), doing exactly the
same.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 9025111013d3..45535dc7970f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1038,8 +1038,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 			dev_dbg(&pdev->dev, "Cannot find pinctrl active!\n");
 		}
 	}
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dpi->regs = devm_ioremap_resource(dev, mem);
+	dpi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(dpi->regs))
 		return dev_err_probe(dev, PTR_ERR(dpi->regs),
 				     "Failed to ioremap mem resource\n");
-- 
2.40.0


