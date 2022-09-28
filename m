Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7378C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7Y7ubOP9FTedbapAvTc7/l6vU1usENQA8Rcs9qB+z0=; b=NGeEkVpdYeg7TNIicFGawMcKC9
	G76yYC67gvNsMPWlr2E+SfASrn5oXafyV4j/CtvF5aIIFqT9edj8uLx71xTErPVapeLGKpF+xFxV3
	pHk+I2TaIHcEKjSmi0SkMitRH5aTEMX03pDapu43VoHPMQvfBDNZlgNR0gGnCC7mcLWF+zRNHRIrL
	04ZGyZn4eFMNiMTkQ/NiZ8TXgzz82H9bQS+8E/9yyM+BC7Eb9Mmww8d8xy21q0c5u41uxzvGXkgLp
	Y7RZHnH/w2IKHEPCDIShOOQ3MhNpNIQGh+xbChjAFD7hfim5KlnKqp0aSU5wnp7K68rkGS4Wrr9Qk
	e/ylvofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZQT-00GzsB-81; Wed, 28 Sep 2022 15:56:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPN-00GzHe-RW; Wed, 28 Sep 2022 15:55:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 34162B8211C;
	Wed, 28 Sep 2022 15:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136FEC433C1;
	Wed, 28 Sep 2022 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664380535;
	bh=a1LAVlDHkces/5MDyjvZevj2YKY09OrPDHZaF2N9pnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjSVvQHG6b9D4itNHwL1SG4xfd79oh//JrtvpPK1D3kaUsuXKvEQurdibHWlezXB8
	 LBlRnzdmzrQ1OhrvK7xmRIGoADyLNdbwSWP83T/p6Siy7Tdq+i+K88yB9vJV+C/fCy
	 v4d94YYSn+VI3i3nCiIpIi/MSW791yjNUVr97BX/2iq4xoCewz+4knHzmxQxlxsGt1
	 zIxvZrUPWZ3TN0sgZ/Ojv52KiF4aPvkorkdiFcFc2p4SlPlOwA44HuDOZsqZdXyQw1
	 FU8fGA5G3S2gyvTOXem8BS3XpySetdvePLMdV81VfqD17xEGfv4x4Upa+01bW4RJeL
	 FE2UwX/8guwVQ==
From: matthias.bgg@kernel.org
To: roger.lu@mediatek.com,
	jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/8] soc: mediatek: mtk-svs: move svs_platform_probe into probe
Date: Wed, 28 Sep 2022 17:55:14 +0200
Message-Id: <20220928155519.31977-4-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928155519.31977-1-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_085538_076623_FAFBD7B9 
X-CRM114-Status: GOOD (  13.34  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Moving svs_platform_probe into driver probe function will allow us to
reduce svs_platform members. This will be done in a follow-up patch.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 drivers/soc/mediatek/mtk-svs.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 52bb4f8bbe6d..8342627f8dea 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2325,17 +2325,17 @@ static const struct of_device_id svs_of_match[] = {
 	},
 };
 
-static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
+static int svs_probe(struct platform_device *pdev)
 {
 	struct svs_platform *svsp;
 	const struct svs_platform_data *svsp_data;
-	int ret;
+	int ret, svsp_irq;
 
 	svsp_data = of_device_get_match_data(&pdev->dev);
 
 	svsp = devm_kzalloc(&pdev->dev, sizeof(*svsp), GFP_KERNEL);
 	if (!svsp)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	svsp->dev = &pdev->dev;
 	svsp->name = svsp_data->name;
@@ -2346,19 +2346,7 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 
 	ret = svsp_data->probe(svsp);
 	if (ret)
-		return ERR_PTR(ret);
-
-	return svsp;
-}
-
-static int svs_probe(struct platform_device *pdev)
-{
-	struct svs_platform *svsp;
-	int svsp_irq, ret;
-
-	svsp = svs_platform_probe(pdev);
-	if (IS_ERR(svsp))
-		return PTR_ERR(svsp);
+		return ret;
 
 	if (!svs_is_efuse_data_correct(svsp)) {
 		dev_notice(svsp->dev, "efuse data isn't correct\n");
-- 
2.37.3


