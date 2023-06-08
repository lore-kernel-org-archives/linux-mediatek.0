Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199EEC83003
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwhICBhS5Sp4vCH4aoWJH2vUy6+vWxt799LocrRRTY8=; b=tX9bPLSy6+8awrIVFlkhTi2Zo4
	4gEZG62xQBoIiXGb847J8Am0bXeH/qw0R35/BW5w37cNU5WW+7fkCes9mEU6yt3WGrWSxj1C2+xlu
	b+3EqjBzwcW2+aqaCiEwSQmY9Ae68Rndu43bkloEufIR9Fufiuk8MXXQpX3fOGD6UCua2w2lsvrhn
	V8h0uDtUw7BXx6wrFLeJvpP/r6uwncw1b9OY1YHmv6JYA6Bw/8kdMS1HzqbAJKtIVbx2ckyUuVO50
	LbklQkvN/1UtRDwxU8Ln0ziUxHcEd3o8kaWARSXd7nM4wQUf7uPZbJHwFty1AddP0g55h1b3vcmED
	2VjzeBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BJB-008a7J-0z;
	Thu, 08 Jun 2023 08:47:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BIz-008ZvW-0v;
	Thu, 08 Jun 2023 08:47:43 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 721426606F15;
	Thu,  8 Jun 2023 09:47:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214057;
	bh=yBFpvdyvUdE5L7ZiJ3JX8I1dNCEtgPqdfEZ9UKzm1JQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A4qXIgXsrpU31WLaN06EJ3R+3Ki8sEYa9S8k+I1SUzdew5myZPLJdRoxVXDXhhj/a
	 zdVaKQurrls3rwKU6T6iSS3ba2OobbSkRLpCimGp0W33yR7pAmHr/WDWa7HWQmYAMS
	 kRLXc8xmG4gX9QK0SVYx4KNsBT6sgP42c2U0uAxnvisUph+WKoija26PuqsvNBdaSn
	 Znpb/soYutHbHxYydHmylK2eo70onW/yUDf0JRFt2D7pGjQ+5TojVktq962WH0ry1Y
	 MEpeIO3fz95zylk0EXsO3XUxWkd2yL2NkldQzTWw4vLXzrSLMf9iHGJ/D7CuINUDDi
	 kMXp9Cl+Nsf1Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	amergnat@baylibre.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/5] ASoC: mediatek: mt8188-mt6359: Compress of_device_id entries
Date: Thu,  8 Jun 2023 10:47:23 +0200
Message-Id: <20230608084727.74403-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_014741_464661_811CFD46 
X-CRM114-Status: GOOD (  10.07  )
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

Those entries fit in one line: compress them to reduce line count.
While at it, also add the sentinel comment to the last entry.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index bc4b74970a46..643a7a12a96b 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1117,15 +1117,9 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 };
 
 static const struct of_device_id mt8188_mt6359_dt_match[] = {
-	{
-		.compatible = "mediatek,mt8188-mt6359-evb",
-		.data = &mt8188_evb_card,
-	},
-	{
-		.compatible = "mediatek,mt8188-nau8825",
-		.data = &mt8188_nau8825_card,
-	},
-	{},
+	{ .compatible = "mediatek,mt8188-mt6359-evb", .data = &mt8188_evb_card, },
+	{ .compatible = "mediatek,mt8188-nau8825", .data = &mt8188_nau8825_card, },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mt8188_mt6359_dt_match);
 
-- 
2.40.1


