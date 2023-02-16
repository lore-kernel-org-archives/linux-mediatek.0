Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE3BC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpUPPVEEvVslwOUKv9R1Ns2mobXBDbeoQRNviYajdBY=; b=mqu7mxj6WNNTiUwugX65OPL+xI
	Jikaeg2WGvx5alnWqjHKzAwKlei92xCIgjtUEdPryknFYmCbucdXvo3PaKwdMn1FilC7lmeamqWvr
	UY/idIrtIJ9yTijXS0SBos+JDRdAj+r3onlUHL0wcR7B9ECCSSEpECDP4y/2Fy0uj6KjnheQVVLBK
	w/e4KcKxHCbb0+BNFrY+1a/gfBMTn5Q3EB/HzjeZ0kRSbuxblm/wTaRkNxJGoZi/aeZcf9z+RHsl9
	UQ3xEdPtTUhCTquH/fvdfXB/uA+4fDqpdsTVffi4Wv+cugLs9xoQRQn4oDlIY/E9etdt0Iht3QSL6
	YlYcEblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdtK-00AEZg-LE; Thu, 16 Feb 2023 13:01:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsG-00AE3A-Gz; Thu, 16 Feb 2023 13:00:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 553F066021A9;
	Thu, 16 Feb 2023 13:00:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676552428;
	bh=97TMHbRWrVSAg8/uwxUMdlr+BulgmbHEjf+Gm3YMplU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CYfA3TLdoKnJtcckFUg3uj0biU48euCWvOZxYndWaQVrKErudu2jTPOVjVl5Ps5dn
	 X/xihR7FuTamwvikiQQZH090CJZD/eqTWLQl767o1dIXn915uvvuq8o0ZROgdNyN6m
	 /Cqq9o9xxy+r5bkwhkxbPIEfbgdVA6ChXEOSqdqV1jnxedUbzzgjkvhr7iCbs4LVm4
	 lenX0xMYHWgO3EEEbzwm5DeqPnfK2Yjt+cNaRLMpydNCtiKdBrouLsPn2Pp1iniaZI
	 KAxhvmnySxMzGHUmSsTbvTA5o5Kwzy+wx2RFalCGB/yDhb2mbNbjqiRcU1lhTUcgGi
	 orgcX2rretFww==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 3/9] soc: mediatek: mtk-mmsys: Compress of_device_id array entries
Date: Thu, 16 Feb 2023 14:00:15 +0100
Message-Id: <20230216130021.64875-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_050032_835849_0BB73044 
X-CRM114-Status: GOOD (  11.94  )
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

Compress entries of the of_match_mtk_mmsys array to reduce the amount
of lines and increase readability; this brings us to a maximum of 90
columns.

While at it, also add a sentinel comment to the last entry for the
sole purpose of consistency.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 83 +++++++-------------------------
 1 file changed, 18 insertions(+), 65 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1a574de9484d..fcf702fda92e 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -372,71 +372,24 @@ static int mtk_mmsys_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id of_match_mtk_mmsys[] = {
-	{
-		.compatible = "mediatek,mt2701-mmsys",
-		.data = &mt2701_mmsys_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt2712-mmsys",
-		.data = &mt2712_mmsys_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt6779-mmsys",
-		.data = &mt6779_mmsys_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt6797-mmsys",
-		.data = &mt6797_mmsys_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8167-mmsys",
-		.data = &mt8167_mmsys_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8173-mmsys",
-		.data = &mt8173_mmsys_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8183-mmsys",
-		.data = &mt8183_mmsys_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8186-mmsys",
-		.data = &mt8186_mmsys_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8188-vdosys0",
-		.data = &mt8188_vdosys0_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8192-mmsys",
-		.data = &mt8192_mmsys_driver_data,
-	},
-	{	/* deprecated compatible */
-		.compatible = "mediatek,mt8195-mmsys",
-		.data = &mt8195_vdosys0_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8195-vdosys0",
-		.data = &mt8195_vdosys0_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8195-vdosys1",
-		.data = &mt8195_vdosys1_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8195-vppsys0",
-		.data = &mt8195_vppsys0_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8195-vppsys1",
-		.data = &mt8195_vppsys1_driver_data,
-	},
-	{
-		.compatible = "mediatek,mt8365-mmsys",
-		.data = &mt8365_mmsys_driver_data,
-	},
-	{ }
+	{ .compatible = "mediatek,mt2701-mmsys", .data = &mt2701_mmsys_driver_data },
+	{ .compatible = "mediatek,mt2712-mmsys", .data = &mt2712_mmsys_driver_data },
+	{ .compatible = "mediatek,mt6779-mmsys", .data = &mt6779_mmsys_driver_data },
+	{ .compatible = "mediatek,mt6797-mmsys", .data = &mt6797_mmsys_driver_data },
+	{ .compatible = "mediatek,mt8167-mmsys", .data = &mt8167_mmsys_driver_data },
+	{ .compatible = "mediatek,mt8173-mmsys", .data = &mt8173_mmsys_driver_data },
+	{ .compatible = "mediatek,mt8183-mmsys", .data = &mt8183_mmsys_driver_data },
+	{ .compatible = "mediatek,mt8186-mmsys", .data = &mt8186_mmsys_driver_data },
+	{ .compatible = "mediatek,mt8188-vdosys0", .data = &mt8188_vdosys0_driver_data },
+	{ .compatible = "mediatek,mt8192-mmsys", .data = &mt8192_mmsys_driver_data },
+	/* "mediatek,mt8195-mmsys" compatible is deprecated */
+	{ .compatible = "mediatek,mt8195-mmsys", .data = &mt8195_vdosys0_driver_data },
+	{ .compatible = "mediatek,mt8195-vdosys0", .data = &mt8195_vdosys0_driver_data },
+	{ .compatible = "mediatek,mt8195-vdosys1", .data = &mt8195_vdosys1_driver_data },
+	{ .compatible = "mediatek,mt8195-vppsys0", .data = &mt8195_vppsys0_driver_data },
+	{ .compatible = "mediatek,mt8195-vppsys1", .data = &mt8195_vppsys1_driver_data },
+	{ .compatible = "mediatek,mt8365-mmsys", .data = &mt8365_mmsys_driver_data },
+	{ /* sentinel */ }
 };
 
 static struct platform_driver mtk_mmsys_drv = {
-- 
2.39.1


