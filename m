Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5DBC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkNKWuxR1Pn3DeqsJDTfmaIdFeeTW3TlI4qgET7BgSI=; b=lauy1G/Ks0rySUcCqCILNGxXdb
	Twvnl07a1OjLUofeVriqOuiiKiVQqF/2Potv68IwOiIWn0pO2ESLc9dXjFbnC2xxJ/2vI6lfs6/J9
	aSqcL4RXxOYqRES2D827DMX51us7jBX27vMaAZDVEEVUwvrywFJdzyt1m8+u++ZmAsIxTqlyYnoVn
	iMblmcWfyQ4EwQlZ0gqIJ2v4rDH0dtmAtFairfXlI39heQeklTT3ax+SqWpKYUkB5zv6P1Je+HyQC
	mYaG9kfrCh+t23OAylKpzNKI2QZ/gW/jgTGxmafqw2rOQFclwa13648M2YbVNvZZc4GDjrlzYNQSN
	YwJw0dcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdtd-00AEod-9t; Thu, 16 Feb 2023 13:01:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsJ-00AE50-6y; Thu, 16 Feb 2023 13:00:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A6A4866021AB;
	Thu, 16 Feb 2023 13:00:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676552430;
	bh=vBcYbh7VmrpwGTtIIzae2X0tf278NrdV7i8AmOYxaYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MDFOAAaOeLdOc+M5ZjmKyg0SAmLyft6TUc9wsRuD/fRRS61yabypxaPzwPGX4MYBO
	 kIndBGCWmZLzokLVSbwHG+KBvKI2a/U44whlxVAEN9vvk97AeUfvSHpJCNoh2ljVRa
	 UlzM8XSqa1U6PxE2hOg+OD36HSfgrGVJdQYbT/tKgnPXKDtb8uD+KIPdtvxAiV2HAc
	 fZPVmvL2W2vQhpJtfkPCI15zQTLgSoMxHuACsUfS07empo8RRIxQrFjDatDwpvd/Oy
	 47EQrzWi/DLGGPPxYprlN96RuEoihEdRWchawz9vQJ3noCXuLLvp1h/Noiuc5dN2r1
	 9ma1iivoP8vEg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 5/9] soc: mediatek: mtk-mutex: Compress of_device_id array entries
Date: Thu, 16 Feb 2023 14:00:17 +0100
Message-Id: <20230216130021.64875-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_050035_412223_73511874 
X-CRM114-Status: GOOD (  10.31  )
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
of lines and increase readability; this brings us to a maximum of 95
columns.

While at it, also add a sentinel comment to the last entry for the
sole purpose of consistency.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 38 +++++++++++---------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c5b1b42303ac..5c875139425c 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -921,31 +921,19 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mutex_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt2701-disp-mutex",
-	  .data = &mt2701_mutex_driver_data},
-	{ .compatible = "mediatek,mt2712-disp-mutex",
-	  .data = &mt2712_mutex_driver_data},
-	{ .compatible = "mediatek,mt6795-disp-mutex",
-	  .data = &mt6795_mutex_driver_data},
-	{ .compatible = "mediatek,mt8167-disp-mutex",
-	  .data = &mt8167_mutex_driver_data},
-	{ .compatible = "mediatek,mt8173-disp-mutex",
-	  .data = &mt8173_mutex_driver_data},
-	{ .compatible = "mediatek,mt8183-disp-mutex",
-	  .data = &mt8183_mutex_driver_data},
-	{ .compatible = "mediatek,mt8186-disp-mutex",
-	  .data = &mt8186_mutex_driver_data},
-	{ .compatible = "mediatek,mt8186-mdp3-mutex",
-	  .data = &mt8186_mdp_mutex_driver_data},
-	{ .compatible = "mediatek,mt8188-disp-mutex",
-	  .data = &mt8188_mutex_driver_data},
-	{ .compatible = "mediatek,mt8192-disp-mutex",
-	  .data = &mt8192_mutex_driver_data},
-	{ .compatible = "mediatek,mt8195-disp-mutex",
-	  .data = &mt8195_mutex_driver_data},
-	{ .compatible = "mediatek,mt8365-disp-mutex",
-	  .data = &mt8365_mutex_driver_data},
-	{},
+	{ .compatible = "mediatek,mt2701-disp-mutex", .data = &mt2701_mutex_driver_data },
+	{ .compatible = "mediatek,mt2712-disp-mutex", .data = &mt2712_mutex_driver_data },
+	{ .compatible = "mediatek,mt6795-disp-mutex", .data = &mt6795_mutex_driver_data },
+	{ .compatible = "mediatek,mt8167-disp-mutex", .data = &mt8167_mutex_driver_data },
+	{ .compatible = "mediatek,mt8173-disp-mutex", .data = &mt8173_mutex_driver_data },
+	{ .compatible = "mediatek,mt8183-disp-mutex", .data = &mt8183_mutex_driver_data },
+	{ .compatible = "mediatek,mt8186-disp-mutex", .data = &mt8186_mutex_driver_data },
+	{ .compatible = "mediatek,mt8186-mdp3-mutex", .data = &mt8186_mdp_mutex_driver_data },
+	{ .compatible = "mediatek,mt8188-disp-mutex", .data = &mt8188_mutex_driver_data },
+	{ .compatible = "mediatek,mt8192-disp-mutex", .data = &mt8192_mutex_driver_data },
+	{ .compatible = "mediatek,mt8195-disp-mutex", .data = &mt8195_mutex_driver_data },
+	{ .compatible = "mediatek,mt8365-disp-mutex", .data = &mt8365_mutex_driver_data },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
 
-- 
2.39.1


