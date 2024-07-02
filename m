Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40852C3064D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQScXcZF71HJsNRq99/ymNdr46r/DkQ4jURaGLM+JYA=; b=CPVZCtvhHQSEfBkQk69afESg0F
	apu4u+pEqLaHWti846stBh2WUD8JPc5x4Srhp0O2/+zeAQ3qqGlpRN6vVKEmGHBENKDMFZnb+Aeii
	rMaIy0+meAwNAdCQ8xM2m9zesZjSR1dS61n9X2YazHxIRKyCLPwO6naRw10b7DEMvAd5kOAenh5GV
	cA4RSFbNVgt3XJuyJBy4PzFDEmHfrSzHLs9cVOOducOlIJq1YS3NsV94xLzHvmfticICH3UO/muSG
	8HqC5i27yCg/YOOfLDdLyqEUMiOYMC3F1inQDaCeenf/ybAyPlkWz3VWif+5il+XGsbFMLVptEo/P
	Gjteo5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcMp-00000006cuM-2pLf;
	Tue, 02 Jul 2024 12:12:15 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139] helo=cmccmta2.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcMb-00000006ctN-3KKR;
	Tue, 02 Jul 2024 12:12:04 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56683ec4adc0-b9686;
	Tue, 02 Jul 2024 20:02:20 +0800 (CST)
X-RM-TRANSID: 2ee56683ec4adc0-b9686
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.99])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6683ec4be50-965e6;
	Tue, 02 Jul 2024 20:02:20 +0800 (CST)
X-RM-TRANSID: 2eea6683ec4be50-965e6
From: Liu Jing <liujing@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kuninori.morimoto.gx@renesas.com,
	bartosz.golaszewski@linaro.org,
	linus.walleij@linaro.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	liujing@cmss.chinamobile.com
Subject: [PATCH] ASoC: mediatek: mt2701-cs42448: Optimize redundant code in mt2701_cs42448_machine_probe
Date: Tue,  2 Jul 2024 12:36:56 +0800
Message-Id: <20240702043656.11278-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_051203_101973_B035D217 
X-CRM114-Status: GOOD (  10.13  )
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

Utilize the defined parameter 'dev' to make the code cleaner.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 1262e8a1bc9a..4974b0536b7b 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -329,10 +329,10 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 	struct device_node *platform_node, *codec_node, *codec_node_bt_mrg;
+	struct device *dev = &pdev->dev;
 	struct mt2701_cs42448_private *priv =
-		devm_kzalloc(&pdev->dev, sizeof(struct mt2701_cs42448_private),
+		devm_kzalloc(dev, sizeof(struct mt2701_cs42448_private),
 			     GFP_KERNEL);
-	struct device *dev = &pdev->dev;
 	struct snd_soc_dai_link *dai_link;
 
 	if (!priv)
@@ -341,7 +341,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 	platform_node = of_parse_phandle(pdev->dev.of_node,
 					 "mediatek,platform", 0);
 	if (!platform_node) {
-		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+		dev_err(dev, "Property 'platform' missing or invalid\n");
 		return -EINVAL;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
@@ -355,7 +355,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 	codec_node = of_parse_phandle(pdev->dev.of_node,
 				      "mediatek,audio-codec", 0);
 	if (!codec_node) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"Property 'audio-codec' missing or invalid\n");
 		return -EINVAL;
 	}
@@ -368,7 +368,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 	codec_node_bt_mrg = of_parse_phandle(pdev->dev.of_node,
 					     "mediatek,audio-codec-bt-mrg", 0);
 	if (!codec_node_bt_mrg) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"Property 'audio-codec-bt-mrg' missing or invalid\n");
 		return -EINVAL;
 	}
@@ -377,7 +377,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret) {
-		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
+		dev_err(dev, "failed to parse audio-routing: %d\n", ret);
 		return ret;
 	}
 
@@ -395,10 +395,10 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	ret = devm_snd_soc_register_card(dev, card);
 
 	if (ret)
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
+		dev_err(dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 	return ret;
 }
-- 
2.33.0




