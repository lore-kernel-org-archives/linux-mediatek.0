Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74269EDE9AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AkDEedYxQEFtDE5N7MtqaUCCfI0XfrppvRJxOZwTIU=; b=gsfynB1+OsEWFTdfAEIocFQup/
	9kdS69bi1NW5zgHUPKYbjENu/t0y7nEW4R8b2dDAjtE7kNR8iC56LbuRP1ox4PZ/h0kyW2lIOwjbB
	9lYWKNm+Vh0Ua1ontmBIabxm7S5FsSI9GEnM8oeru10KxgMW+cWwfnlpEKsrekw3rPCdT8+Ym6gbs
	8dCf1PTXDfCs5J5KGNfizY1Z0H0F90hhlymB84Gd7U96jyYCWTWTFl+zxQNfo0KXar7BoRCjaZzBp
	2k6c0LeIi5gDVKOFiM+mrdK6jRUNpwvhH+HvMO8KajuCZYN1L+AIwoUkmdNroav3Ck1d/iTh/b5xJ
	+Jdxemqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so4ah-00000006XKP-0IV9;
	Tue, 10 Sep 2024 17:23:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so4Za-00000006WvP-0gcm;
	Tue, 10 Sep 2024 17:22:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A0BFA44AFB;
	Tue, 10 Sep 2024 17:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E0FC4CECD;
	Tue, 10 Sep 2024 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725988955;
	bh=VLg/IiS9Nf9MioR7T1yQ/8rRYU3SbZXJexeQEjfaUKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nISyI+ycVivL/fyHhi0INDez3VlIqjRgAoZE41vZix6h0xOSzWkqqRFE8qs5n1rIl
	 vDZBdfuu1PNLh8D8x0S5gU9UBrIDsQaC6VJ+oXyt1KfRwa32X2VsHiO5i+jLgUC1SW
	 FPIHNG8jn7pwxbqb7A83TxfMkjNO2UK2L+ru5m7GTAOfqIotZiFiwmhWDESJ2eZIPA
	 20C53XjnGaGU/eyayu49AMMb0nbeEaCmqZFpl8ixfHNJpgb2rac6nEqRxpyZYSfgOv
	 5v+wfRVrll/eHcr7Bjvn8N3tnfr8pYV9Uq4jhhfD3me6B89HXtr3BisF/qS4XhR5bs
	 GytWvP6hcFxQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhang Yi <zhangyi@everest-semi.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	zhourui@huaqin.corp-partner.google.com,
	claudiu.beznea@tuxon.dev,
	krzysztof.kozlowski@linaro.org,
	robh@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 08/18] ASoC: mediatek: mt8188-mt6359: Modify key
Date: Tue, 10 Sep 2024 13:21:53 -0400
Message-ID: <20240910172214.2415568-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910172214.2415568-1-sashal@kernel.org>
References: <20240910172214.2415568-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_102238_357591_A6FFFD54 
X-CRM114-Status: GOOD (  10.75  )
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

From: Zhang Yi <zhangyi@everest-semi.com>

[ Upstream commit 5325b96769a5b282e330023e1d0881018e89e266 ]

In order to get the correct keys when using the ES8326.We will associate
SND_JACK_BTN_1 to KEY_VOLUMEUP and SND_JACK_BTN_2 to KEY_VOLUMEDOWN
when the ES8326 flag is recognized.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
Link: https://patch.msgid.link/20240816114921.48913-1-zhangyi@everest-semi.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index eba6f4c445ff..08ae962afeb9 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -734,6 +734,7 @@ static int mt8188_headset_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8188_JACK_HEADSET];
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
 	int ret;
 
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_nau8825_widgets,
@@ -762,10 +763,18 @@ static int mt8188_headset_codec_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	if (card_data->flags & ES8326_HS_PRESENT) {
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);			
+	} else {
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);	
+	}
+	
 	ret = snd_soc_component_set_jack(component, jack, NULL);
 
 	if (ret) {
-- 
2.43.0


