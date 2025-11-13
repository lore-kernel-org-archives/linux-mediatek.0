Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E61CD6E45
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfoYzyAiHqlT95hK6Ci4cSsppvY2FcvmiRjaWC8MTUo=; b=o66di632Qdt4USQ8mxbDxhJxQ5
	zmKdzRQdMk6geMGepBzNswUDvPMciuADDzvMmG0gvUdtWkfdVtbCqzwCu6G4fJRUbXsMeRxbvoWgG
	1Z+u1eNEV4x4YwJy1DUT418LpeklBcGiSdMkBj5mYekUz+sPDgISxKSmczi2onfUvbg/LJwYrb0/V
	4sPZkuKiRitHa9Kbuo0G752qxiYqqRbDieAtXh+qEAcNPbd9j/TyZkEJUI7ojTHELP66axi5N9Hdy
	UO226D4EMXinVPuD9FoAq+G3W4kgZ2X/sWXhxT/ghfF4NypKixIA0/NH43LTIgeoUOSuRaF6ZTuof
	scKgldIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLs-0000000ARq6-0tmR;
	Thu, 13 Nov 2025 12:23:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLf-0000000ARbS-0uZF;
	Thu, 13 Nov 2025 12:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036563;
	bh=JFgZElGuW7huMLg5IeTiiaMe7V7hDDxmcenUv8VvhSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jdaT2YM10QNyrQb4uPfRepfG9a90LnHiYl+WClEpOpiN6E9jWAfbDQDLzds2Zi17p
	 yGHOxASDgHDbrC3kxt/4vD9Y64iTUUQIeQaWg19rUwUSob9YPgrzc+I3xYEf56lb8F
	 FpDFx1y6A7scsOWlNlSmePFPtFPj2iWln7E/BnHX3gZZZO5pydt4zPRviDs2BzmSGa
	 soHqTzBQ6388YsykB6RBOJND7kejaY2MLrxwoKiATdqb4bDgFNLDtc3WoCUX+K74GP
	 XZUNnfEiIW0K2fc512pBlEFtRfnAVBa0NAdFfRNR5zgCb6hkOhDKOCkqQEihBiAqpt
	 rqfylKbOkCWmQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E40017E151F;
	Thu, 13 Nov 2025 13:22:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmaengine@vger.kernel.org
Cc: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 8/8] dmaengine: mediatek: mtk-uart-apdma: Add support for Dimensity 9200
Date: Thu, 13 Nov 2025 13:22:29 +0100
Message-ID: <20251113122229.23998-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042248_021265_586957BF 
X-CRM114-Status: UNSURE (   9.94  )
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

Add a compatible string and match data for the APDMA IP version
found in the MediaTek Dimensity 9200 MT6985 SoC; this supports
extended addressing with up to 35 bits.

Other SoCs with this IP version also include the Dimensity 9400
MT6991 and Kompanio Ultra MT8196 (which don't need a specific
compatible in this driver and can reuse the mt6985 one).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index dfcfc618bb8c..ead00636b048 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -471,6 +471,7 @@ static const struct of_device_id mtk_uart_apdma_match[] = {
 	{ .compatible = "mediatek,mt6577-uart-dma", .data = (void *)32 },
 	{ .compatible = "mediatek,mt6795-uart-dma", .data = (void *)33 },
 	{ .compatible = "mediatek,mt6835-uart-dma", .data = (void *)34 },
+	{ .compatible = "mediatek,mt6985-uart-dma", .data = (void *)35 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_uart_apdma_match);
-- 
2.51.1


