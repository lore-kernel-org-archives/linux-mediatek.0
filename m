Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B72C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 00:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MH37fWt1kKUncCdiiz6bIlRIc5bt+X1g89mXjaLpeY=; b=J+s8gsbmXeL8B6caSFi0Uln2ow
	VzCsodZMs8F39wz5XPQLeJVYskwR2u+Y9abY4xyyaUAnR64yrUfAE6x6KQpzlA9EI9/xhzpZc1Jex
	ygcC6lEbLlO5gO/NWQFbEJg6kdDjPJAMihinuyAnpapzYgoJDs5Wc4XVmqq6mk0zlshPDX0lE6mDM
	4N9wLQ7Na1VepCKOFeAsIBm1taPrxeSMCavk4gii8MwVs6gcvfWKWi7GEpWs8iJygd5zQcOINnKal
	dGzuBTHLsCxTTRVqpnFYA026nyAcWn6Ypdpi2v/f7o+RTxKOKPiN5mbcVpqpRgj0JACg9iveAOFki
	BcbMOosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obW9H-000gRg-6S; Fri, 23 Sep 2022 00:02:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obW75-000fSh-6c; Fri, 23 Sep 2022 00:00:17 +0000
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 46FD46602234;
	Fri, 23 Sep 2022 01:00:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663891201;
	bh=XLMVjc9kycY7cqA20QU1lEWGA1kBnlKNHm6oii/5Ggw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q1O6wlvkTvjYSTOhOZ6sXzT27+FaY8dolxZ3Zo1LrAkHwjsbluUsR59dmCwxoRfJv
	 dwcE/5BOq1WYgsRLV9MlutZ9fdbZ2BCKpS2z9VEw2n8Nly1UiPL+sateKf5zLWWy5O
	 nyVFbNQ7P4w7AW0cwjk8wQat1eDEF1n2QNV1AeEk2EMYbD47G+rnFN3RQ1utRm3H7D
	 voF9OnAC60YCu/1+dNca5MqTRoZEKpeY+V71SbR9TXYKwjc5Ykjqdzpvwtg4Qrjtxx
	 d+F9OduTd3hdNEaRJKwE1GupsqqeXw6EbA8vtdx1V4DYomEjW9X5/gr6swkpciMAVe
	 Gwnh/H2WyioNA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Tzung-Bi Shih <tzungbi@google.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/6] ASoC: mediatek: mt8195: Expose individual headset jack pins
Date: Thu, 22 Sep 2022 19:59:47 -0400
Message-Id: <20220922235951.252532-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922235951.252532-1-nfraprado@collabora.com>
References: <20220922235951.252532-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_170015_422347_9F5F9708 
X-CRM114-Status: GOOD (  13.18  )
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

The rt5682 codec is able to distinguish between two event types:
headphone insertion/removal and headset microphone insertion/removal.
However, currently, the mt8195 ASoC driver exposes a single kcontrol
for the headset jack, so userspace isn't able to differentiate between
the two events.

Add a definition for the headset jack pins, so that a separate jack
kcontrol is created for each one, allowing userspace to track and handle
them individually.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 961e769602d6..17d4c4108a9d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -63,6 +63,18 @@ struct mt8195_mt6359_priv {
 	struct clk *i2so1_mclk;
 };
 
+/* Headset jack detection DAPM pins */
+static struct snd_soc_jack_pin mt8195_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -563,11 +575,12 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 
 	priv->i2so1_mclk = afe_priv->clk[MT8195_CLK_TOP_APLL12_DIV2];
 
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 				    SND_JACK_BTN_3,
-				    jack);
+				    jack, mt8195_jack_pins,
+				    ARRAY_SIZE(mt8195_jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
-- 
2.37.3


