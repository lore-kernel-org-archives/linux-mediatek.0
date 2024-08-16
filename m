Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930BDC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 11:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MpnXaWyHo1EL4mSCnQiPQOc/vi9HfMq+eF5w7xf2+lU=; b=eFBPdRnHa92OpcLrX3vlqrxvxo
	EOPQL27QmX5a8AjCN98610TGjB4K1/7mUCzg7CU1hRKdGdq8JPHz+jgSWZNCVdr+QLERxrCKFScsY
	BAkO/HeFSh5xY8mxxSOaHBN+heoGxqElELnAv/SATLX7fNOLJn67uFXpyrXivXZ2FP3301+YkBtSe
	XnI4WzWJgCAsgIa56AavhyHvl5Qv3s82mgU9om8VGIRDQazxcaSjippdqHpl+b+S3lq+rgZ5b8200
	wTale067EaQvdIDlwPZBuqlBN7lijVM7vV3sQOciD9jeqvxxaNAQtmziyaTlTHJ+T4OwK2lt8mj25
	Lt2p9nGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevSi-0000000CnbT-30A3;
	Fri, 16 Aug 2024 11:49:44 +0000
Received: from mail78-37.sinamail.sina.com.cn ([219.142.78.37])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevSd-0000000CnaA-304Y
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 11:49:42 +0000
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.31) with ESMTP
	id 66BF3CC200006906; Fri, 16 Aug 2024 19:49:23 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: DF4C84A618314BC380BB6DD67516E836
X-SMAIL-UIID: DF4C84A618314BC380BB6DD67516E836-20240816-194923
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	angelogioacchino.delregno@collabora.com
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	linux-mediatek@lists.infradead.org,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: Modify key
Date: Fri, 16 Aug 2024 19:49:21 +0800
Message-Id: <20240816114921.48913-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_044940_073640_1D2ADAF0 
X-CRM114-Status: UNSURE (   6.95  )
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

In order to get the correct keys when using the ES8326.We will associate
SND_JACK_BTN_1 to KEY_VOLUMEUP and SND_JACK_BTN_2 to KEY_VOLUMEDOWN
when the ES8326 flag is recognized.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
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
2.17.1


