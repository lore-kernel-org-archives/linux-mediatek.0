Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EC4C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 16:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHrvh/r28bxPvENTwwV0jJghC1Cy47uky/Lb1Le6zvE=; b=Xk3azmf9sHSGyC4tgYGa0c0yw+
	2GYHk8QaLYJQJoNqvkQ6Jz829qLGWtSCyRmkYS4Fb3V3T02RzZUC7vm8KKFDliz7BhSatQVPl7a8P
	P6bmZjZpUQLKumstwZ9ckXrQHScEF6974xbi/yDnFBaCoErwHNScoZwPxiZsaXhsMeUddyBDxoAC/
	jcQ98pYkXr1lA6/MhVHieadNVrjT5D1aZjupjYXqyhMYH45JXydVTFMT1/hRsBakekLglWSgfu8O4
	TBZvIdqS4WvD3ezsns6cAWVkGMQatPTL3XqfD2rNUp4cR0aTq0ofGidqK+nKR4by0+9QG5FffeSOc
	wNWUFxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK9V-005bno-Lb; Thu, 08 Sep 2022 16:13:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK8Q-005b2y-MK; Thu, 08 Sep 2022 16:12:12 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 658A76601FAD;
	Thu,  8 Sep 2022 17:12:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662653523;
	bh=+qFGD7EsVOMCHijee7Bbkw5A9Fp6Xf4TG9HqiOy8lhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PDpRlUWLVoFYCjUTw/P9R7WVugq9T61WXY9RVX4vlizt15qERlivqMLWgQsnW6NY8
	 pKtTFtppDYxFp2eeezxwdG03Sz3MBHeJWTMOgFTCmIHGZTlnvIEwF1bCB6L56OakUo
	 4dRwWXnUrnFK6Z5KlSdFo7b8ix8L6D5HphKMHk9cbvGQqmbDRuWRH+mo8+Vll87Qgw
	 1BdFVnNgFDixyD7dnb2UuwdNrxiHctyYUCWriOJDig5Pxtf9+T+gWKG5chPvrK+XCD
	 wVP7b6OBlo/qbL87N1ekcjCyOW5Cdm8WVPgKmFl5IsL7+NatxY645uVf2b8IOtsKMw
	 YkoZ91NDnau1A==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@google.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 02/10] ASoC: mediatek: mt8192-mt6359: Make i2s9 share the clock from i2s8
Date: Thu,  8 Sep 2022 12:11:46 -0400
Message-Id: <20220908161154.648557-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_091210_888957_BCACAC46 
X-CRM114-Status: GOOD (  11.60  )
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

Both i2s8 and i2s9 are connected to the rt5682 codec and should share
the same clock to work in a full-duplex manner. Set the clock sharing
during the initialization for rt5682.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index d0f9d66627b1..044d6ab71f0a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -311,12 +311,21 @@ static int mt8192_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 
 static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
 	struct mt8192_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	int ret;
 
+	ret = mt8192_dai_i2s_set_share(afe, "I2S8", "I2S9");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+
 	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-- 
2.37.3


