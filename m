Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BA0C25B5C
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNgLEZpy94T5of5dDiteuT7S3SOS839FWPGD9Oz3+lU=; b=LqFQy9XMZR6BPtCVOaGYSCVC5h
	bza3lPniSvjlMDMBYdvx9HHgJwHuZOV1QusgXK3PWwMTMpvZqccBHwxUHfH10ZZlR4k8cQyHZMdlg
	UDpY5HsKzAVogQ2HIvz2I8NfCJUgmWo0xJy/Be/imf9VL1IubPEMaw+uy66DVOCpvgw1q3xYc7/T+
	czORa44ON2bRlHAJQFMS7dS00PXsHT0ApQN1bEd/5+2ogUnj2+bwohQUdYS3fuG376M51Pxt6/2Tq
	MwWPuQfm+xmTFwmwcnaCyHGMgcb4trHxDyMxym2idC2wUL0Js9850i+GQRuqqay36hyMMfhdu34RL
	egBK+Ktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o5Q-00000006f3i-1iCy;
	Tue, 30 Apr 2024 14:04:00 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4S-00000006eGW-05wa
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:03:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2def8e58471so90654771fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485778; x=1715090578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNgLEZpy94T5of5dDiteuT7S3SOS839FWPGD9Oz3+lU=;
        b=Afepo8KGaYZJCkiDESTOIP8AHU5LqEEJ4hCTbpZXLHKHH7Lue6r19CfdX4QXycyUkc
         Y47zFmCOfY2Gv8tiNxrFigF22RW0A3ykDnLU9a9JAIHVbZ547RckcY3xunQd8KgiZbBR
         w1xWVUvmaNjnV3zwdn+X3MiK3BZSeEDJajUD7l0xWtTGizKvicJU9mTmftqi8AwdKKS9
         HX/QWNNar9vO6swuOAjaAQOx2ugyekTuQ/7pJw/Ywx2l3qo8CDtYRTxHuFK3/v8uuDWX
         6ZQJXkIB8F/UhcORc6IFJk6R+3jesm8jMCnBFYlXeOQMg78aUVUpNLjfmLM8S3WCKLkD
         c5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485778; x=1715090578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNgLEZpy94T5of5dDiteuT7S3SOS839FWPGD9Oz3+lU=;
        b=vDH6IkpUJggEvBnOT1vySNdGFkV5ymr+yTlI3AtKgBbUiee41Qn3h0zSjmQG/1Jx4d
         PghLPusFUoR36ColFjilN+TfwpmYg2sd4x5dRRDoLwTjla/aH0ufqbSXuJFuV+DwAfEU
         fRos2Kq2b9TUqfcGUkvAjRTLxk+UpynkPgKBHL9abfOn6tYrHqLTfAiGw4gT7h5b3HCK
         Vc974sMIE/sgepz/uCccNf7EVin5C/2A+IRBMD01CvDtnnaG++ahckNl1Tg8SeflQ2He
         ctYxUOtBekYhe/TejIpfDGj8+meclfinOgm3YjAAQkbPxOGWtqBvICNvQGRY/sWH5UtS
         nnPw==
X-Forwarded-Encrypted: i=1; AJvYcCXuQcI2QzlbH+C8bxdcMBTXoQej/kULpUwQaaroHzGJgQVo4CzpSt6cs6ysD68wczu4AD+DWoP479W7abxtL3IvGRPpOHaNA6bjs53FzQEC02z/
X-Gm-Message-State: AOJu0YxVtp/LeRIOcmtX1FvxTzNcHwOXSwtUdfqMmErHDLasvgK9G2Px
	bpRhU55qX7lb/LAuntwChPd3dUePc53/SzpYNgd3D+sKAK+5BdOIF9sOlpykwXs=
X-Google-Smtp-Source: AGHT+IFjpnpTp49C7eNXISEFR7RNPga2jXB5JGxKI22M+Sgkavx0dXEQC64nAv94ubWY9cbPtavVlQ==
X-Received: by 2002:a2e:9d88:0:b0:2dd:da86:ee38 with SMTP id c8-20020a2e9d88000000b002ddda86ee38mr10711122ljj.8.1714485777680;
        Tue, 30 Apr 2024 07:02:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:15 +0200
Subject: [PATCH 06/13] ASoC: fsl: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-6-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5066;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ucjMMVrCkGueEU7NLLh2sAE4bDhfGS2t9ibvgfiZuqk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnyVTX4VSForeLiGua7AKa1bycRXXidVTl9D
 CaOooFdBBqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58gAKCRDBN2bmhouD
 1x+nD/9L3QfdqNvflH7gpARtP03tnjdskVjY9BZshvK55BYu/8uL8qeQ8m7grVZgtdnFSp17jzg
 psAIaY2iZ3XjkhL1Wm9i2Bco6fY+REaa9ipQVksNn10h2zoFp4l3tKiNz9T6HIW+tr9LB4YJ0ez
 95oxVwwR3mmgoGnOTgoBhBquIQotbSGxNdua1owIxI4ynwBEDk9aSuLzFvyZaK+a5pQqlk8sFHE
 1Zk4N9BanSfRWtR7ZmuLxcDMQFw+f9cLlfnQjEF7qbDegbSaNYOR4VuwuAPVTQgmhL2FDZ9ZZBZ
 VS8nH1w1VupmUXyDCQM9+Ord+ux+JRHtepLks0LWYAmaEYSn0maBsInTR79T6/Z5BTnHY5o05cb
 17XjcuRdjm0E9YceHUg/H7Cu+qPpavOo45i3peulA/Kw8Bmz/UrCoPzgKCZECARmZhBwtFfXKFi
 BFBqwmlfaJ5mO+BUYtGOK0mi8QL8IJGpqneIw6WuwxG8gcximwl6XUtbhpG9dUMulPUId44Q4Lx
 6MRqlOL82xSEpJjTLh5Q1IVtCafvXHdADF0e5NcyPGZeB3xciZX49dPUqRv/agS7rPISpGBqP+3
 2uMcyxscGa3WWW9aQmkwpKw3L4QuI/OgOw5ddiu+DS7516wv6HU8Om/sxKJq6Fm9j1OTCD6HkT0
 JghFY64qvYvldfw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_070300_345352_7228FC97 
X-CRM114-Status: GOOD (  14.25  )
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

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 sound/soc/fsl/imx-card.c      | 6 +++---
 sound/soc/fsl/imx-hdmi.c      | 2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6d2564864c6..5ddc0c2fe53f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -242,7 +242,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 
 static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct codec_priv *codec_priv = &priv->codec_priv;
 	struct device *dev = rtd->card->dev;
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index cb8723965f2f..0e18ccabe28c 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -252,7 +252,7 @@ static unsigned long akcodec_get_mclk_rate(struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params,
 					   int slots, int slot_width)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_card_data *data = snd_soc_card_get_drvdata(rtd->card);
 	const struct imx_card_plat_data *plat_data = data->plat_data;
 	struct dai_link_data *link_data = &data->link_data[rtd->num];
@@ -289,7 +289,7 @@ static unsigned long akcodec_get_mclk_rate(struct snd_pcm_substream *substream,
 static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
@@ -405,7 +405,7 @@ static int ak5558_hw_rule_rate(struct snd_pcm_hw_params *p, struct snd_pcm_hw_ru
 static int imx_aif_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
 	struct dai_link_data *link_data = &data->link_data[rtd->num];
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index e454085c6e5c..fe47b439a818 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -32,7 +32,7 @@ struct imx_hdmi_data {
 static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index b84d1dfddba2..ba491cbb9930 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -316,7 +316,7 @@ static int imx_rpmsg_pcm_prepare(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 
@@ -461,7 +461,7 @@ static int imx_rpmsg_pcm_trigger(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	int ret = 0;
@@ -515,7 +515,7 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);

-- 
2.43.0


