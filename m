Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5854C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoDrbLhexvwLOswZqw6cPYLkzDI8rkEF8WZm5oyZpNs=; b=VnyVTXJ/+BqnRW
	ACJ/N50s71qkhGmWfZfUVVaDWQCWnym+gS31PApT3/nqx2gmkgqWjWtqhYBJl05p7J5+Bv0aNAlsx
	lgZuEhlZ/W6ERAQP3GZG2IClarqPZdXK16CsFse45h1y9cPK3O3eZuo+mo+CxLWYPUwMSEF3CLC8V
	Kt297Ao0g8kr06sJsOp11RZSoNcbD/2voRiFst0y343/4TSmTX4aigCEsS6Hl5Q4Us3uIPDPrcZKw
	iEvhGdyh+EicqqxXyIFelI2HZ3MewYW8QS3bXMue92cxFWm2U1EWBxGRrgsWA/P04eUQ9nnjj5UyI
	rlr5X/osYdCfSSpB+qOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqa9R-007hYd-NG; Mon, 16 May 2022 12:48:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqa81-007gmu-Ex; Mon, 16 May 2022 12:47:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 61CCE1F42F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652705228;
 bh=xO6aHuo6qr2U+3Pw1vJl92VTpaOmj3hu2VdgDueiOp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LAVwhi5fVzB511R2xm2K0fSzYH9ARO0hXPuFthBl2c1kESQLvsYx3vUWdSjGbI41p
 7r1L0SCFCDiF8s04Ggl1ADsjZpb+cVYvfYd8heJUczYJ1jjclBVnWocymXxC/A8PMx
 Rxm3tllXWSSxBQ6lmZZ2Jg9I6sCSEQmK7zFG+WkSsh7dV0LX8iMEjc5USrCi9kdA66
 /XXpo+24TNtv5eUQow4276ox7idic3MfG5UIFC6V7wsc5kWFw+7o08GKQk8JTj90t8
 4uV/ko+iM5fq45UN6VNkoc2J5l3QvF5vef8XrOouY2eT6sMUpvSGx/ToxNXSmGbajo
 owEq5I26yn5rQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 5/5] soc: mediatek: pwrap: Compress of_device_id entries to
 one line
Date: Mon, 16 May 2022 14:46:59 +0200
Message-Id: <20220516124659.69484-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_054713_692593_0DA9BB92 
X-CRM114-Status: GOOD (  11.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Compress each entry of the of_device_id tables in this driver to one
line instead of three, as they fit just fine in a single line.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 90 ++++++++--------------------
 1 file changed, 24 insertions(+), 66 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 7d02e1d4faf4..c018092e6cbe 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1960,33 +1960,17 @@ static const struct pwrap_slv_type pmic_mt6397 = {
 };
 
 static const struct of_device_id of_slave_match_tbl[] = {
-	{
-		.compatible = "mediatek,mt6323",
-		.data = &pmic_mt6323,
-	}, {
-		.compatible = "mediatek,mt6351",
-		.data = &pmic_mt6351,
-	}, {
-		.compatible = "mediatek,mt6357",
-		.data = &pmic_mt6357,
-	}, {
-		.compatible = "mediatek,mt6358",
-		.data = &pmic_mt6358,
-	}, {
-		.compatible = "mediatek,mt6359",
-		.data = &pmic_mt6359,
-	}, {
-		/* The MT6380 PMIC only implements a regulator, so we bind it
-		 * directly instead of using a MFD.
-		 */
-		.compatible = "mediatek,mt6380-regulator",
-		.data = &pmic_mt6380,
-	}, {
-		.compatible = "mediatek,mt6397",
-		.data = &pmic_mt6397,
-	}, {
-		/* sentinel */
-	}
+	{ .compatible = "mediatek,mt6323", .data = &pmic_mt6323 },
+	{ .compatible = "mediatek,mt6351", .data = &pmic_mt6351 },
+	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
+	{ .compatible = "mediatek,mt6358", .data = &pmic_mt6358 },
+	{ .compatible = "mediatek,mt6359", .data = &pmic_mt6359 },
+	/* The MT6380 PMIC only implements a regulator, so we bind it
+	 * directly instead of using a MFD.
+	 */
+	{ .compatible = "mediatek,mt6380-regulator", .data = &pmic_mt6380 },
+	{ .compatible = "mediatek,mt6397", .data = &pmic_mt6397 },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_slave_match_tbl);
 
@@ -2145,45 +2129,19 @@ static struct pmic_wrapper_type pwrap_mt8186 = {
 };
 
 static const struct of_device_id of_pwrap_match_tbl[] = {
-	{
-		.compatible = "mediatek,mt2701-pwrap",
-		.data = &pwrap_mt2701,
-	}, {
-		.compatible = "mediatek,mt6765-pwrap",
-		.data = &pwrap_mt6765,
-	}, {
-		.compatible = "mediatek,mt6779-pwrap",
-		.data = &pwrap_mt6779,
-	}, {
-		.compatible = "mediatek,mt6797-pwrap",
-		.data = &pwrap_mt6797,
-	}, {
-		.compatible = "mediatek,mt6873-pwrap",
-		.data = &pwrap_mt6873,
-	}, {
-		.compatible = "mediatek,mt7622-pwrap",
-		.data = &pwrap_mt7622,
-	}, {
-		.compatible = "mediatek,mt8135-pwrap",
-		.data = &pwrap_mt8135,
-	}, {
-		.compatible = "mediatek,mt8173-pwrap",
-		.data = &pwrap_mt8173,
-	}, {
-		.compatible = "mediatek,mt8183-pwrap",
-		.data = &pwrap_mt8183,
-	}, {
-		.compatible = "mediatek,mt8186-pwrap",
-		.data = &pwrap_mt8186,
-	}, {
-		.compatible = "mediatek,mt8195-pwrap",
-		.data = &pwrap_mt8195,
-	}, {
-		.compatible = "mediatek,mt8516-pwrap",
-		.data = &pwrap_mt8516,
-	}, {
-		/* sentinel */
-	}
+	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
+	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
+	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
+	{ .compatible = "mediatek,mt6797-pwrap", .data = &pwrap_mt6797 },
+	{ .compatible = "mediatek,mt6873-pwrap", .data = &pwrap_mt6873 },
+	{ .compatible = "mediatek,mt7622-pwrap", .data = &pwrap_mt7622 },
+	{ .compatible = "mediatek,mt8135-pwrap", .data = &pwrap_mt8135 },
+	{ .compatible = "mediatek,mt8173-pwrap", .data = &pwrap_mt8173 },
+	{ .compatible = "mediatek,mt8183-pwrap", .data = &pwrap_mt8183 },
+	{ .compatible = "mediatek,mt8186-pwrap", .data = &pwrap_mt8186 },
+	{ .compatible = "mediatek,mt8195-pwrap", .data = &pwrap_mt8195 },
+	{ .compatible = "mediatek,mt8516-pwrap", .data = &pwrap_mt8516 },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_pwrap_match_tbl);
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
