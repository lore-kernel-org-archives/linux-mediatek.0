Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA47C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 06:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TTGicmxwjVZLB/DvvyVdqc0coqlS0JlIo0rtraBxLc=; b=V32AdMs5GNMy/0
	jaUePFriUJr3TrgzIsB28snknov/qXOyHldHZ9g8h/e2BAYcOfp2v+nC8H9pvBA+DD+IQQHABlupW
	o38d15qDU0aEC2WNEHTk3hbhA7efVJ9YBrF5I+iThXvJsKCT+CCrK9nm5p7sqlGlm/XGQF8N44z9g
	hv85zN+zH+uYm+3x4WsWvzcc8oKAIzhU3WOJBWmlluWDt+KCIMDcQ018gIErU21Q8oay5rFUe8MgW
	7XC890rWN0wBSMzFq0AG4LO0yey9xJVr9tOrTgtfX9ir50Hh4ZD0qGobjHnXb3m5hMsnDWfPAS7Jd
	MNXkXNzbTocHdZts7g1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXHEC-00FrsF-It; Thu, 24 Mar 2022 06:45:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXHDz-00Frnr-0f; Thu, 24 Mar 2022 06:45:36 +0000
X-UUID: 624f3061bb92485d97762977da53b9b8-20220323
X-UUID: 624f3061bb92485d97762977da53b9b8-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1473068791; Wed, 23 Mar 2022 23:45:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 23:45:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 24 Mar 2022 14:45:17 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 14:45:15 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <tzungbi@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [v7 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of
 headset
Date: Thu, 24 Mar 2022 14:45:10 +0800
Message-ID: <20220324064511.10665-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_234535_107032_727CF754 
X-CRM114-Status: GOOD (  13.23  )
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

MT8192 platform use rt5682 codec, so through the snd_soc_of_get_dai_link_codecs()
to complete the configuration of I2S8/I2S9 dai_link's codecs.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 837c2ccd5b3d..1d2821d484ff 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -28,9 +28,6 @@
 #define RT1015_DEV0_NAME	"rt1015.1-0028"
 #define RT1015_DEV1_NAME	"rt1015.1-0029"
 
-#define RT5682_CODEC_DAI	"rt5682-aif1"
-#define RT5682_DEV0_NAME	"rt5682.1-001a"
-
 struct mt8192_mt6359_priv {
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -626,14 +623,12 @@ SND_SOC_DAILINK_DEFS(i2s7,
 
 SND_SOC_DAILINK_DEFS(i2s8,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S8")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(i2s9,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S9")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(connsys_i2s,
@@ -1114,7 +1109,7 @@ static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node, *hdmi_codec, *speaker_codec;
+	struct device_node *platform_node, *hdmi_codec, *headset_codec, *speaker_codec;
 	int ret, i;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8192_mt6359_priv *priv;
@@ -1145,6 +1140,13 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		goto err_speaker_codec;
 	}
 
+	headset_codec = of_get_child_by_name(pdev->dev.of_node, "headset-codec");
+	if (!headset_codec) {
+		ret = -EINVAL;
+		dev_err_probe(&pdev->dev, ret, "Property 'headset-codec' missing or invalid\n");
+		goto err_headset_codec;
+	}
+
 	for_each_card_prelinks(card, i, dai_link) {
 		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
 		if (ret) {
@@ -1153,6 +1155,20 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 			goto err_probe;
 		}
 
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S8");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
+		}
+
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S9");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
+		}
+
 		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
 			dai_link->codecs->of_node = hdmi_codec;
 			dai_link->ignore = 0;
@@ -1183,6 +1199,8 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
 
 err_probe:
+	of_node_put(headset_codec);
+err_headset_codec:
 	of_node_put(speaker_codec);
 err_speaker_codec:
 	of_node_put(hdmi_codec);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
