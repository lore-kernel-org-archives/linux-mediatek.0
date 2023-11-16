Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC41C54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=; b=ZYD8dhWsAeFZclwVsR8FQpAtPI
	0xtcq99x0SJyr87qoQFem3w9ErcHKrz0FKRlHy0Lgib4swpAgPcNV5JTNReeAxSM/nZLJQWxPkOoj
	jz7A0Aq0Be1Z+vq3ZkhUdZ3hhsn96PqJMCU0cpoUEzJzuo/nDB8VUNtIlfWDhBp4PadD3bSFFRHp6
	2Yx67VTFnZjCatNpMuyrLrWJ1TR+Ms2K/6Wi0Fb1ilzXbiiOVMj3O3MGlerSbuRz8ryB/M1JQiemO
	jlx1sgZwdgFMXTn0F51XcAQVyGxCeSc9WlG0BjgvzuLdBrYhQjXZv1PE7lfl/ymqGd9pD7mCOmBq8
	TJSQWTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ymd-002zBP-2I;
	Thu, 16 Nov 2023 09:35:35 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Yma-002z7o-1O
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 09:35:33 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5bdf5a025c1so423645a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Nov 2023 01:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700127325; x=1700732125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=;
        b=scWDiSfBvD74CD1/zGospxbfHVnddFyZOkdFOX0+bGWDpPwJQZHGrdct1dKIKCq9Mq
         WIEUK6SxFniW1LhIjg51Lr43JqjwOySkRhqeyMV46PkN/X+GtjznASS5Ghk/7RQiHmBj
         pJB8hNo30pv/h4YzVVKkq5IugPwM67GQHCnH2rvkq/ZYsz1UdPLihdAS52AZyVmdyWE4
         WCeHLZmdhFFf8db/1EApySXX5SZcU3FgvE4jzNPDKE9pN8YQaxMLRnBGOiRpNp/pgpxX
         xyhRp8ojxeG3JvJo9zKpDmpFrGsNZ5XS8zWOs2xu5waqejL1q61X+WveTvWqMzik5joq
         r88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700127325; x=1700732125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lpd6C9NI3pbwTLe6pctih7tPOV6DJdooeIM997kH/ks=;
        b=dlGlBnpFBMCaS4EDm/IqaNTOl0tn+7YwRQNUPGVcWpa7FluP5s3xd+bgjpLklBXbIi
         F88PbX6Ng9RGpNULJG0Di41g/h96xnW8SdKHXuE0SEK9UhDrndVI88hMiQG1grPM6WOe
         VLsEeKBsm/ek/YhJ6j80B4JYsuhlah2ii3dZWKcUxw7Wr2EXpnFl2DDTzfCP2J1XnNCZ
         e/+4hxouPXlyM9uNcqRSP3EZOL9dDnmUIYfjntCfhG/r7q02nFR0SirzFTVkbzZ0BRo8
         VOmdM2Yot7jXPM6vQX1Ov5JaY4QPwmh4Wnc5Gy9NB0Oxk87WZcd4ijO6k+Sl4xDwajXj
         46Aw==
X-Gm-Message-State: AOJu0YzVU7CXolQ7sQulej1ffV0hDjdQMXuFuvXW9dYOQZ6PABnEc2R2
	YSNmvi0YEaXkz3fbCEuw5OjSkw==
X-Google-Smtp-Source: AGHT+IF2Ncdcg3VdUgyh/hUz1Ls+HI2d8tU/ped852Q4FNjsr/SOJgoNJlUsTHWSZgPySFwwSRrsOA==
X-Received: by 2002:a17:90b:3808:b0:283:2805:7c7a with SMTP id mq8-20020a17090b380800b0028328057c7amr12732469pjb.43.1700127324939;
        Thu, 16 Nov 2023 01:35:24 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090aac0a00b00280fcbbe774sm1175214pjq.10.2023.11.16.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 01:35:24 -0800 (PST)
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
Subject: [PATCH v7 2/4] ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
Date: Thu, 16 Nov 2023 17:35:10 +0800
Message-Id: <20231116093512.4180240-3-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_013532_472458_734D1AEA 
X-CRM114-Status: GOOD (  10.01  )
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


