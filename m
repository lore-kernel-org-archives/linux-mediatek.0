Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C06C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=; b=1eJ8K6oBRUh7Gq2KcSAu22Jx2d
	mjNr79eR6J/fSYXswXGBR2NGXr6u7Ndw1ZRK34ICW5FnoDU1wavwPwGkG6dKbJJ4l+2ISR+XvDGBA
	WNitBr4bnv9UNWJ9WtKIXe0tBb9mar+WSima+xZbo6W0s7eMRHaoqbOOlBv5U1NBA5L3dwkFG2sDv
	cYOYQAH7nj4HoekKv05/W/NCpYDu7oAXHdnJIWGAmFEnEUnCcF3SKdVZGDyzClWMFKdHs60JTsERU
	ukx7C6VS8F6yJ4oqnTsgLBORhIQpS0kpizOUzkJsifhO/lymXgUT2XeBEofQ0UFfyg66RYIRboVxO
	sVnkzg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUzj-00EvgD-0c;
	Fri, 08 Dec 2023 07:09:55 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUzf-00Evei-2H
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 07:09:53 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-58e256505f7so803077eaf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 23:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702019388; x=1702624188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=;
        b=aSO5ZzNs2EPNGe1YDXs74NM2Jn9WrdMXdbvLVGCOAl88hQ1bW7qpmynwkj5fk05/Hh
         GaqCeif0TSmj++rWRSyiYbZGjqXQL5OCFCtiUE8ZCTq91q15MVAOPDDQCsykLqRVWWA/
         gnCVYlRMrRKQg/ePwrHnLd9JeMQaOXYRe9cPn9ky1V3MA1/CyYQ3SNzO8XBsli4XSc6X
         7kiOJRsIL7EzARWKEeuywU5uhnhjnJJlijbqo+e73xnIm3FKOinOlpJ/f5vNmrf/1VSe
         UQu5jE4nhhuJTCd2HvF7Lu4rjrIeBea4Bv0lWYo0tlVbLgE5Suejyi9WJUozyMsLk7no
         MdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702019388; x=1702624188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=;
        b=iqV+iTLrbQAleGsttJbdbi2jR9cU5IMuBhg06k7FG9jWoWMp805G3y0y/BnWaLfmLG
         FUiPDfxGHcvcc6EUrdEp3jHjuAzuIL5yTEV06+iMrxOTSRyqjJv0ETR97amkfV8Je+Qz
         M1PpK+kMPWdtknU2orKHDlN7uBBW162lEPV8nAcwdctgfhktYnbk6MUzrfuxSUT3nVrb
         q0Zb+aLWmU8CgN20bL3BgKQ9wN/5o8dFUd2+SZjHU5xQZJpmyZvX9V9iiWpWLXtmLdUV
         R+9pplUF8qi+U0Pwn4mB2ZtGyYPMtXpyBc06U7Sv1bnOsr6Tkf0Xm7CRPJe9xxttYfp4
         9wSQ==
X-Gm-Message-State: AOJu0YzzHOSfDTbl6ct9U5xHrExli4nXZ2319XQsFXa9jFuqzuXWhQ8C
	d7RrT4lgDeucJZMg17Y9kKK4bg==
X-Google-Smtp-Source: AGHT+IFC54AX+aRqedQDrgfqtFE7wVI5+Pp1izCVsyhP4Hb2WWRnBhkK94PZ/vSG2aC53LEBwlnVog==
X-Received: by 2002:a05:6358:91b:b0:170:a325:dd2b with SMTP id r27-20020a056358091b00b00170a325dd2bmr211976rwi.12.1702019387674;
        Thu, 07 Dec 2023 23:09:47 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000cd100b006ce4b40e7desm918061pfv.90.2023.12.07.23.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:09:47 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v8 2/4] ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
Date: Fri,  8 Dec 2023 15:09:31 +0800
Message-Id: <20231208070933.720324-3-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
References: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_230951_745148_9B88CBCD 
X-CRM114-Status: UNSURE (   9.67  )
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

Reduce code duplication, unify the headset codec init/exit api.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


