Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D43C47071
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7jd4g4BAPIqmFAW9t1f1SgOhm1Y77cjq1ToQQmGY+E=; b=pG3MKB9ACf/CWaeyN5WcZlLkLh
	0gl9WIf2T7Z53VZ8wpg5pNosj7Ocb9hpyZrP2SRCgEtyFC7KWK5xK3hDdH65mHSrDvIuudXckiH4F
	Q9sTr5MC7zvDFIPlyvmn+P65qlM4bY0ArRxEd/LvDH2++3n5KiTDdI3RCUCQYbRJl/NqOKdC9vLIR
	/HISmuyj0uheESXM76PpMyr3ty/Y7LxoKbY5sXVCptcH/Fhal3KkSAdQEUrIXB7IVjZ0ElpcXK5+s
	K3bxDonwtJKWiFqqPzE2/X53zqwMfsnO723PHVi7aLmczjPiRQFOS5mIaPWqktCSdlprkcRwjjZHN
	lPWb5mDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3WqV-002l3e-01;
	Thu, 16 Nov 2023 07:31:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3WqS-002l1Z-35
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 07:31:26 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc9b626a96so4567475ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 23:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700119880; x=1700724680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7jd4g4BAPIqmFAW9t1f1SgOhm1Y77cjq1ToQQmGY+E=;
        b=X+iy/l8IlUDdi3Ms4wmAxr/jIzSERJVUtO2o9bAkDhROTkfImSF7Tmf6x7mWK2YJVP
         F6PIqdG4d5snUz4ZD8HSb3PXbCDKKKZMQoLbbjy5ErpB6xGa9susXIomjKTQo9W3paCe
         zbZ5ivrEg/SEZZmVNkoKLVbO1VpPVB8xzROn/ScMJ3UJL2IbHkSdyUjr+v9oQf4nMSbv
         hTKzQPPawlx1HXofz2Nf1ZThRGS1lkSgzTT0K3Q0YArMiUHki1CGybZ/sYSpMfptsi5V
         zzKIizVfLmuwq61kOJPZzf0Z8J+dOAVaOz4sesEXf4qX58UvknMULJx5+lw9/AOzDcnY
         QnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700119880; x=1700724680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7jd4g4BAPIqmFAW9t1f1SgOhm1Y77cjq1ToQQmGY+E=;
        b=jpdQgJlOoaesWHapYVc5hUDwGFyM1XysmMmOb5JZh4/GFHTBiRLsBZKZf/fmZPa3rk
         6ZZ3dw6fxsBM6SWYtM6HAJIZ1h41nMY83yHnPrpHwOnh/dEIZ15tsbWekE/q8wZvtnRV
         alwUX1h7hNcjZssYivGPWohKU+5vBLheCwfVEF47gRIZMSo7oNwSwGZWXQb9Mm8V1Qlc
         zNoLinmRe7muVgxbF1gb552/ttXv1HhOI7DhNEyd/A+7/co58CEpm1KP73wIbiu5bL9l
         n4O3XRUqUXlKVHGORaqIKim33h/3eDbMQzfLHVmpvQWRQg51rELIXJxbhTgC8osvmKn4
         4j+A==
X-Gm-Message-State: AOJu0YzTnZ3LyhIKEiGttXDatX8t/YT/DSaa4QwYbAiQSilVawouXJ0q
	BORfam/sUi1rmfRyyF8myn/Dpg==
X-Google-Smtp-Source: AGHT+IFh7yLY4Ax6Ela0GKhSJusrJ9DFUnaGw1IZljtZbZWFQBpMZdRaoEmjLzcR8kcO15RE5nDdRw==
X-Received: by 2002:a17:902:e74a:b0:1cc:e76e:f214 with SMTP id p10-20020a170902e74a00b001cce76ef214mr8713332plf.29.1700119880385;
        Wed, 15 Nov 2023 23:31:20 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db8600b001c0a414695bsm8496706pld.43.2023.11.15.23.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:31:20 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v6 2/4] ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
Date: Thu, 16 Nov 2023 15:31:04 +0800
Message-Id: <20231116073106.3757618-3-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
References: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_233124_993931_036A83C4 
X-CRM114-Status: GOOD (  10.22  )
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

Reduce code duplication, unify the headset codec init/exit api.

Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 67 ++---------------------
 1 file changed, 6 insertions(+), 61 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 33d477cc2e54..b4606a28794c 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -726,7 +726,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
+static int mt8188_headset_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
@@ -775,68 +775,13 @@ static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 };
 
-static int mt8188_rt5682s_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
-	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_jack *jack = &priv->headset_jack;
-	int ret;
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_nau8825_widgets,
-					ARRAY_SIZE(mt8188_nau8825_widgets));
-	if (ret) {
-		dev_err(rtd->dev, "unable to add rt5682s card widget, ret %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_add_card_controls(card, mt8188_nau8825_controls,
-					ARRAY_SIZE(mt8188_nau8825_controls));
-	if (ret) {
-		dev_err(rtd->dev, "unable to add rt5682s card controls, ret %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
-					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
-					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-					 SND_JACK_BTN_3,
-					 jack,
-					 nau8825_jack_pins,
-					 ARRAY_SIZE(nau8825_jack_pins));
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
-		return ret;
-	}
-
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
-	ret = snd_soc_component_set_jack(component, jack, NULL);
-
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-};
-
-static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
+static void mt8188_headset_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
 
-static void mt8188_rt5682s_codec_exit(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-
-	snd_soc_component_set_jack(component, NULL, NULL);
-}
 
 static int mt8188_nau8825_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
@@ -1407,15 +1352,15 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 			} else if (!strcmp(dai_link->codecs->dai_name, NAU8825_CODEC_DAI)) {
 				dai_link->ops = &mt8188_nau8825_ops;
 				if (!init_nau8825) {
-					dai_link->init = mt8188_nau8825_codec_init;
-					dai_link->exit = mt8188_nau8825_codec_exit;
+					dai_link->init = mt8188_headset_codec_init;
+					dai_link->exit = mt8188_headset_codec_exit;
 					init_nau8825 = true;
 				}
 			} else if (!strcmp(dai_link->codecs->dai_name, RT5682S_CODEC_DAI)) {
 				dai_link->ops = &mt8188_rt5682s_i2s_ops;
 				if (!init_rt5682s) {
-					dai_link->init = mt8188_rt5682s_codec_init;
-					dai_link->exit = mt8188_rt5682s_codec_exit;
+					dai_link->init = mt8188_headset_codec_init;
+					dai_link->exit = mt8188_headset_codec_exit;
 					init_rt5682s = true;
 				}
 			} else {
-- 
2.25.1


