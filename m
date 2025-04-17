Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D115C369B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lO6c9ZhHYvjwD6xvNFgLjCMDSCngrVXyFTwEON+ZDg=; b=VxAXK3A+Zkj0By4fkoXG/7Xf0W
	gKYloAfZPq7/K+FwbzX754rWiURdY/35umOyU9vG5wVllsa4qwnDwRP++36LQPCG+uErIxw52rJ6X
	AhYqdFQFt7m2UujAUfZxzPpvAvSS1izZqAaX/i24FN/XsVKlD+3YrqdubVTzWR8vlOhT1JznkrUwH
	fSJBKVytaGp8UN0cVCAVKZYn3Cs73GIHavNFYy4/q5bwhfYf/GKmcEejv35m2lO8becWsKbxpzk4q
	bXEEJxnLOZkl1DWHSY/JsWKnN81F/bIvxCPQ6wVVHUL+5QSxVW7iooUXNrbDEAW5mMdA6a5XsJfAY
	+uvqBx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5L74-0000000CMae-0TT6;
	Thu, 17 Apr 2025 09:00:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KrP-0000000CJeV-2Ms6;
	Thu, 17 Apr 2025 08:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879478;
	bh=i22aKPunjfXrA9afWCfJfAgh+B/tbdFUIUcF/NQsLWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SR0WTokFZY9+TbZfvQZfA/VvaXtct3qWXxo45Q8Qt3WoG7O3Af+qtIrXo4JACKE7I
	 bzyquzk/Al2CSCtR1Tvx2zO8bJl1f3oLvYx0m765Dbe6K+5iMQkRiSmKj9MrkZKx8A
	 mnU7WGfIgmnlwHUpClIqTZBjwLkvT7xpBmtNWKDUcIItzSU3GZFE/ZpdzIc4jN4tzT
	 n28fWAyqWF+iQs+8Xkc+29IQDSjBGHwcVGvrDoBTqaueWrO04iQFlRzy5mmWYJF6um
	 90UgiJfZ1LB3lDiVroB9bxuz7u7/lrtmecK/6XtXJs2mkokX1ZvtCS1O+rS4+bgIL7
	 SzlPE0eliuyhw==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B05117E3634;
	Thu, 17 Apr 2025 10:44:37 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:34 +0200
Subject: [PATCH 3/6] ASoC: mediatek: mt8195: Add mt8195-mt6359 card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-3-30587426e5dd@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
In-Reply-To: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014439_777026_15376800 
X-CRM114-Status: GOOD (  10.16  )
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

Other mt8195-mt6359 cards rely on external codecs,
add a card for board that only use the mt6359 codec.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index a370b8af8c282bbcafce82561312e24c515beea5..3115a098e22e53345adfa4a36a1a72ac5a16164d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1524,6 +1524,18 @@ static const struct mtk_soundcard_pdata mt8195_mt6359_max98390_rt5682_card = {
 	.soc_probe = mt8195_mt6359_soc_card_probe
 };
 
+static const struct mtk_soundcard_pdata mt8195_mt6359_card = {
+	.card_name = "mt8195_mt6359",
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8195_mt6359_soc_card,
+		.num_jacks = MT8195_JACK_MAX,
+		.pcm_constraints = mt8195_pcm_constraints,
+		.num_pcm_constraints = ARRAY_SIZE(mt8195_pcm_constraints),
+	},
+	.sof_priv = &mt8195_sof_priv,
+	.soc_probe = mt8195_mt6359_soc_card_probe
+};
+
 static const struct of_device_id mt8195_mt6359_dt_match[] = {
 	{
 		.compatible = "mediatek,mt8195_mt6359_rt1019_rt5682",
@@ -1537,6 +1549,10 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 		.compatible = "mediatek,mt8195_mt6359_max98390_rt5682",
 		.data = &mt8195_mt6359_max98390_rt5682_card,
 	},
+	{
+		.compatible = "mediatek,mt8195_mt6359",
+		.data = &mt8195_mt6359_card,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mt8195_mt6359_dt_match);

-- 
2.49.0


