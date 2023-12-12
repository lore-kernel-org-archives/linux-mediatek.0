Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D055CC35278
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=; b=ThK9NAU8aczexj8gsY94if8QT/
	jeLY7KTc1+IzlDYl4Aw3mxftBcoDyt2Q4nphicOedHdIrFtmjJw+JUjFSMVp4mT2MpzbVkDx9maWc
	4KqS0bo+2fweaBObSsk0v+iVO+5eSl8uffc2oBCmvF4RmilF78xGocd60u4lituSmtoGhGqNBDMvB
	mYx4o0fi+W8GgF5o9mzYBbSJOBBLGFVIhjVhk5v8dJpFUGlqKzwd471NToaJT3e3wRq5gnbX4tICm
	p1OfiqECBRrudhxZZw6Okdchd4e7+B7NLlKw51iiVnh4fbzBlLaNA29xOvIoaYb/1wCROe9nZOjuW
	7Y6R8qhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1vF-00Bfl2-2T;
	Tue, 12 Dec 2023 12:31:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1v7-00BfaY-0c
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 12:31:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d098b87eeeso49033055ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Dec 2023 04:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702384267; x=1702989067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=;
        b=VuqW6FxI9yIWGPJYQ03icaJPhu0EiWzzCKDK7Ws4EnqzLHGFDbbSn+LgBPnIcKVU38
         Yc1MC0WfWbVf8QZ+IPJtY3XkmlfbCwgjQdO/QqtHK4T5xdS33tGIJZDm5N7LuOgL7iG2
         2R0oHSBxkEYhSP0pBvJ2nTHXpBspgHjJCSLuvcND+Y9cpr0iLAv6bYDz/NO0ZAwqV2Rw
         PqJ+TjrnbUtdDqtXEvbesgK+8B+EwccVcSyTIXlBYMc/h+ok0YNzda+dZqUdU3OeaI0K
         QOf/pDKFjkEv+LOFQIYNeBJv/e/ulKW3EwcXBeGmEvYT5/rYCQeCKwDY0WUDImsVkoKs
         sIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384267; x=1702989067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=;
        b=j3p/KDKJvwEzwG3INIxw4RFDKxcy8IHEGHIGoXyYDqzSQT2oityLQEqsAtfIACYE1r
         U2uU4KuDkfiVqCy/BFZ/VN9gV+9Z38zKh86lH5pJUtedMObjh7Jn+eWbDsm8isboPZVC
         aVtFyVFntCDooajrNb6o3kbZB91aZqLMZs9KGAhl8XgykUYJ1/Z0PuUlpdbffqRDCbNH
         ZFTFQoCdlP6/KZ9V5EiLwzh7xjXlMdDeAXZDa+gskg/t9DgeTEgMtjWji5xtPGcmORtq
         y3H8XiBpvZk/+g7NRRezL0sGLTWoP/anJTJiLxB7qrOypxp4thOaKAywWJQ+CeSabC8M
         wmtA==
X-Gm-Message-State: AOJu0Yzg2G28RJp42IkdpcvoHtVE6Ic8cMGXWkwhtwTXqgV5c7RCVCi/
	n1ULYMU6sz1+E2s7w/in5VSxnA==
X-Google-Smtp-Source: AGHT+IHDfsN7Ne0nmsmSIjI4M26xGYC7KY6/l9+TG80dEePJd/XtyEOwNxSZXhUn7ZicekBnSZ5Vow==
X-Received: by 2002:a17:902:eb84:b0:1cf:b190:ea07 with SMTP id q4-20020a170902eb8400b001cfb190ea07mr5834870plg.21.1702384267044;
        Tue, 12 Dec 2023 04:31:07 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id z5-20020a170903018500b001cf65844874sm8517471plg.45.2023.12.12.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:31:06 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v9 2/4] ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
Date: Tue, 12 Dec 2023 20:30:48 +0800
Message-Id: <20231212123050.4080083-3-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
References: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_043129_239318_44E6A734 
X-CRM114-Status: GOOD (  10.67  )
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


