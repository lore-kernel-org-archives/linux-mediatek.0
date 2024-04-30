Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB51C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbe9yQYz/BTDyMh+ij8kmCNBJHEOOFsTDuijF7mUMdo=; b=1KMgyLmrgAaCpjciVQITRrHVHw
	Npaon8xbreUi0G5CSOMH7nM0d3x7PoYQAg84alx2HWUSBkNekoK6JfDVDCARikC79pViVJPzAxXNh
	PtZan/FOvPvCrq0TBjegD5CE7yqkOnnkSZSce3+TfTcC0nD41wQLsTFxTuY6GR+LLtA8lrLnaFpRi
	84/0qlMl6CJgXKEae/gak8ShXGRv7XL7Dj81DgvoR6HDYdWuTdmD/yWwk9DXqVbp31WKloupIpilx
	2Fp1DpwCl3yjtqHTwiMfjC5CiDUSWqvEqXZcQgFmkpNwUBwT1ldlqqrSINtIyt/E5w78RsJYbDmQ3
	z+L+0SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1pCl-000000070kR-2WUd;
	Tue, 30 Apr 2024 15:15:39 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4A-00000006e3v-3177
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:02:49 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-571be483ccaso6996361a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485759; x=1715090559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sbe9yQYz/BTDyMh+ij8kmCNBJHEOOFsTDuijF7mUMdo=;
        b=rCvPjxUQsOWIsM2MIMm08S7Oske4pAFMTOLY6IlubfncwBMQlA0se7WcZ1uHMEh2/r
         c/xLPx+TCVHd5nTrOonDXFMGSbmj8uOpGKkmLpdgLrfm+lsnkmSO+D5r3K/17mxdHPTA
         zo6Ulq4FaMh3Fm6y4SfGTNGwngjduAH+GFUfOFln8XHJEYheZskq6hKrkByT4OK1w5A5
         LB3aT/HSjI4As9lFX74JAHSWOoEICXGJI3ETe0vnBHr7UrufAZ+YGnLV706MytpdlnMI
         xXmo3GQVcA2WBdvIFHySajInLxYFMxu238XRXb0lA58tthrgsq3d/B0Lc0pXRzvl8KBD
         EVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485759; x=1715090559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sbe9yQYz/BTDyMh+ij8kmCNBJHEOOFsTDuijF7mUMdo=;
        b=sFLjhux8fi0/Z8aIBtR5SH7nfBRj9KbVB2i/Md+YSVkHZ5Lutv/jYea7GnQUTxo3MT
         ASZ+nf+B2YxKHt9qaq2JK+n+ntPf5loEYbEH0yP60mvuD5/sfQSltyu7p+3uMybs3+CL
         UP3tiS37mFY9wsx/0W6juXPrKLTyqboAdmMO0k8+IASIdShAY9Nl9kWUg/OMwa/BFs+y
         uUHsdDiH/87xX+MUfVEKhcm2jJffk69BAon4LDsJXyObNxqWcyLPTpckPGDpJjmheVhP
         O+3ETEpIfyp9REXaDQgY/YkcGFh0afsXHAQiUH3TIek1HsHyB5s7gff7FqqjxzNf33XC
         7zKw==
X-Forwarded-Encrypted: i=1; AJvYcCVXTd7UP2/4DDbj4I4Q3bZqzESIBJjLRfu+oHltXVX/FtO3m0WZfGsS/hCssjvVUV+cKT2gt0kZ0nEhPAAOjWtZjiu50HLHMNcyqa2APFiu38xd
X-Gm-Message-State: AOJu0YzfXoSSf8pu2Fbd3WkLalAibXMq0oLdPhL7v4G1h+S6uDaKFjz+
	hkih6nHehVeqCmi8z2spibD1NIaKA80Kz142KVaOLcx5YXsUrT+jDu7+taLwRO8=
X-Google-Smtp-Source: AGHT+IHdsI/DUhcbw7hzBVg3qBc+0V12TRFrR9cHpVMwu16bSy1BMgvI9FUIj8Pm8ojhCeGhB8Fiiw==
X-Received: by 2002:a17:907:318a:b0:a58:c6b2:7885 with SMTP id xe10-20020a170907318a00b00a58c6b27885mr9202903ejb.5.1714485758809;
        Tue, 30 Apr 2024 07:02:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:10 +0200
Subject: [PATCH 01/13] ASoC: qcom: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-1-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16677;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EYOXzIuCEupt1Jy5CsKHEjSmv9410RCbwX9prH3L2HA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPntVJM7CBtiQZFjdHajiCBztuYxeWNOxPU37
 X+UX9z90+WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD57QAKCRDBN2bmhouD
 13TmD/4qXIFaAFDXeCnNH0oAhrw32XJLa2r3bqvZKguGT0+ATfy44c3d51Qq7HrO6cDzUxb5jc2
 z2B6V8dKyW4x0faVkGAgaBZLre/d1WUEqqBzctl7BwEZk23qmkKT03pbNXUwmlHeH7YPx+i9sXL
 0plZxZ3GX571+WtXFP3jm4GpC9y74ofLinuLh6dt0pozVAyZw2/Z8k/SbHHbQscrUaIoxviLt6y
 0dEgjah8Te5XYkztgH6jAqHiIvnT7Lgxt8f2cW6YwfamB4QBXRCM+AAbi1MWSVeVzAEzq9jNpE5
 XQEDgjqzWFHzCh7tKy1rIhkLD103PzDQErh7U8a9S54rbhBp9xJehRvwRLLL0IPdXC3LEZKIN/J
 AjZti7/kUkKyMqV704d95S51YRPIzcuoxttt7UZtJqRLz/uDO2zMh5sK62hnnlIvv/WnJjwgH3K
 bPgiTNn4xEpBoExU9BHkIHW2INjXwvdV9KKS/+nwijUZ9N2r0EBFvxkIejt/k1f4wDF8zTLehIS
 Y/2dD7l8r9Npn4xP+5JlitTv3jz00tQkKvBzlwLDYM7f7dG5cvKuUiVmeeYOq4Wn0Ayl0gR/kkj
 yg0bb+7TOKaiD88drOq1soPfu7t+2MSBBfqOTZeX0H5WzYZ5CfUFXb+VNXvdxjeHMFWiIze3alk
 lEtGF3oLa91efbA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_070243_213427_578A0705 
X-CRM114-Status: GOOD (  15.18  )
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
 sound/soc/qcom/apq8016_sbc.c     |  4 ++--
 sound/soc/qcom/qdsp6/q6apm-dai.c |  2 +-
 sound/soc/qcom/sc7180.c          | 10 +++++-----
 sound/soc/qcom/sc7280.c          | 12 ++++++------
 sound/soc/qcom/sc8280xp.c        |  8 ++++----
 sound/soc/qcom/sdw.c             |  8 ++++----
 sound/soc/qcom/sm8250.c          | 10 +++++-----
 sound/soc/qcom/x1e80100.c        |  8 ++++----
 8 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 4834a56eaa88..3023cf180a75 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -192,7 +192,7 @@ static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 
 static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -213,7 +213,7 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 
 static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index df19fc3376b7..db2f82e00a49 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -329,7 +329,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
+	struct snd_soc_pcm_runtime *soc_prtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
 	struct device *dev = component->dev;
 	struct q6apm_dai_data *pdata;
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 029780d6fe6d..bc030ce29680 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -200,7 +200,7 @@ static int sc7180_startup_realtek_codec(struct snd_soc_pcm_runtime *rtd)
 
 static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -234,7 +234,7 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 
 static int sc7180_qdsp_snd_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -307,7 +307,7 @@ static int dmic_set(struct snd_kcontrol *kcontrol,
 
 static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -334,7 +334,7 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 
 static void sc7180_qdsp_snd_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -389,7 +389,7 @@ static int sc7180_adau7002_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_pcm_runtime *runtime = substream->runtime;
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index d36f029b7888..207ac5da4dd4 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -205,7 +205,7 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
@@ -237,7 +237,7 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 
 static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
@@ -268,7 +268,7 @@ static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
 
 static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
@@ -287,7 +287,7 @@ static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
 
 static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
@@ -312,7 +312,7 @@ static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 
 static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -339,7 +339,7 @@ static int sc7280_snd_startup(struct snd_pcm_substream *substream)
 {
 	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret = 0;
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 878bd50ad4a7..06fd47c4178f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -50,7 +50,7 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 
 static void sc8280xp_snd_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = pdata->sruntime[cpu_dai->id];
@@ -89,7 +89,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 
@@ -98,7 +98,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
@@ -109,7 +109,7 @@ static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 
 static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 7f5089bbe022..eaa8bb016e50 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -21,7 +21,7 @@
  */
 int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
@@ -54,7 +54,7 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *sruntime,
 			 bool *stream_prepared)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
@@ -105,7 +105,7 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct sdw_stream_runtime **psruntime)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
@@ -135,7 +135,7 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_params);
 int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *sruntime, bool *stream_prepared)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index d70df72c0160..a15dafb99b33 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -50,7 +50,7 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 {
 	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
@@ -72,7 +72,7 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 
 static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
@@ -84,7 +84,7 @@ static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
 static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 
@@ -93,7 +93,7 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 
 static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
@@ -104,7 +104,7 @@ static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
 
 static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c3c8bf7ffb5b..0e0773a85809 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -31,7 +31,7 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 
 static void x1e80100_snd_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
@@ -67,7 +67,7 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 
@@ -76,7 +76,7 @@ static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
 
 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
@@ -87,7 +87,7 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 
 static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];

-- 
2.43.0


