Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB11C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFK1uKTUOAkzTvMlphed7epH9gF2qVFBzp5PoxItuo0=; b=LSRlEWL1NkZFZrEhfZggGCStTx
	B3BDkuiZIxxNC1mlsMgOAyrOeXCJW1DXo66IG8CRGedBokhsRfhp3V4dgNQEFrUByEItVigPdzh9a
	VyHfisN/Q3+NNR7oYeaPhEH4IIum7kd862uxbImaOsDP74mAFqyG+A38DBdpAr8PoGXhUYJY24MJQ
	+i8w0zhI24RVlE98FYh4rFUDZVVLnxzR6RBPyxDbZzqcerFnk2qtJnIPW0hf7YKXZ4pgN4S82juJB
	OClS5tQgLMXnh5D5qAYmN2dSwS83K3eVQQrEPHUXa8CGQX7dJMsnGwtUhbJZx2dQdCaebu77/uByu
	N6BRGKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOlI-001l7j-0p; Thu, 06 Oct 2022 11:09:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOl5-001l1P-S5; Thu, 06 Oct 2022 11:09:45 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A61766022F9;
	Thu,  6 Oct 2022 12:09:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665054579;
	bh=HaMjBUnn0XP2R6tqIgzWDxijRENloQ+oZZWaIxT+XMY=;
	h=From:To:Cc:Subject:Date:From;
	b=S2XPIqIl4XEBq6BBtHS99Mn2AoFFc3pEx/KdumCdajL2VmOl3rb9C3ZR2yOlk1ohK
	 sde1jTKKH/VMrsPwr6Xo87H+UMccKSW9IH9c82dF3JdDick1uv7FV7BuVesSsiYIcZ
	 yceziv4oW/eeB9RwRPCPhRu8BA8oXWQNJqU4wgz+pqlPW2SZ+hbajlc57DrTa4aE9H
	 S6Qxlc+AKDF6LMQ2OO8FkrLJiV3u0ubg0SS72pzltyAXEN047IbmT1QHSdHyN2SKdw
	 kP+SgBt3oKCPoW3Df//T/Yp3UNBNWs0EmSP1TiTgTWKaegS/7vFXQKFO82ayI6+g34
	 1YZ8DMvB7UpGw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] soc: mediatek: mtk-devapc: Switch to devm_clk_get_enabled()
Date: Thu,  6 Oct 2022 13:09:35 +0200
Message-Id: <20221006110935.59695-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_040944_066525_E827085F 
X-CRM114-Status: UNSURE (   9.64  )
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

This driver does exactly devm_clk_get() and clk_prepare_enable() right
after, which is exactly what devm_clk_get_enabled() does: clean that
up by switching to the latter.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index fc13334db1b1..bad139cb117e 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -276,19 +276,14 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	if (!devapc_irq)
 		return -EINVAL;
 
-	ctx->infra_clk = devm_clk_get(&pdev->dev, "devapc-infra-clock");
+	ctx->infra_clk = devm_clk_get_enabled(&pdev->dev, "devapc-infra-clock");
 	if (IS_ERR(ctx->infra_clk))
 		return -EINVAL;
 
-	if (clk_prepare_enable(ctx->infra_clk))
-		return -EINVAL;
-
 	ret = devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_irq,
 			       IRQF_TRIGGER_NONE, "devapc", ctx);
-	if (ret) {
-		clk_disable_unprepare(ctx->infra_clk);
+	if (ret)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -303,8 +298,6 @@ static int mtk_devapc_remove(struct platform_device *pdev)
 
 	stop_devapc(ctx);
 
-	clk_disable_unprepare(ctx->infra_clk);
-
 	return 0;
 }
 
-- 
2.37.2


