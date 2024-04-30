Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65815C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=; b=CUn6Sfd4MI/vqIYsNH0AqfyqVT
	DWA9TOwxTl/0MBwQ1Uo9+olm7GhFgkVF1lAYai6ZcFG9uvoqnBVQgrJGy/sNeQFALiZ2GJcWggTgf
	bZJiK6zdjQN6/5TTac1o2sEzdEJtc2iQG4ZOkNGVNtbOVfWgMCl9x+q4MhNalg3aB3CgvGLkBEU2W
	Ibf1ltY1rddgL8LHfBxHdYyROwESizesyBjgMuvNJ6wSgGpdUaibQMZ4M+GIYHHcYwgsIjDx92gpc
	9i0ECa4l8tGh57L7ZwGBx2r8m7nXe6tIAKXmz1bck4xOxFeikr+6R4oPgjqBMYfm1HGoEgj5de7Pj
	KjLWLVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o6L-00000006fi4-29iI;
	Tue, 30 Apr 2024 14:04:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4v-00000006efv-2sBd
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Apr 2024 14:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=; b=DvSj7i0RbnT4yzKh0dMiaK1hIj
	ZdfPB5/AUbfvsW6SL5o/pWvbmvGVJ+kl7VUxPZDFlWvfgvTv7UvjaiOSZ5Ra8KNTzQXSr76du5sjj
	005MJW3KQ5yBCYCsQpDymPThaJou9c9a3tfTW/CAtxSOzQIcclELoUTE5UgD+XOD9BvZ/svwXq51e
	KGGK/ESgBZ/GR+sNmVkxfvINBhCh0CcmE1f9K1Wjf8yG1w33OnTw3wC3aDUlWYMEwjGCzXEGrbQ5o
	SjdpDGnFa+kSqKLu/WVsrqZhFDRGnOzExZ1GHnKroRbS/1wo/s3fneLzirD/9X7xORs9gtazgBg8l
	1TsflVFQ==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4q-0000000GyiJ-21AB
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:03:28 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5726716a006so4642146a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485802; x=1715090602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=;
        b=ouYixkxWvUUG2RrzCW2TJS6IbUziPFGfVOOlN/++CGs1ML+beWrIuvdKphgaY77oDp
         0eMcE+lt90Cu/FoXn2170i00bHnciVXp01FMtIg2K5bQ0YCpjXYBouBVjKPD+Ni+ykV2
         jsnI7AhFQcZ6KwLyr0Mg0o3NHHwwlTKUIKWaG65V18BR2fawZAfroBU5wTr2iYjqx1oG
         hJOa8fFE/sfsdNJDTiDVfbmYG2F6xme1nQ8ZcNf1d1PbPIAMUa3UwGb+UPSZijy9gd58
         6tBaW2lxJTm5ERpCrqjHdGtIVHlmujiDuQex+89Sy1KQ2DzjrCd1wPXDTPV/oA5QRSWI
         wSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485802; x=1715090602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=;
        b=jCiA5JWzPk3cAWShRxeXxOenk/pswSC0Tvi0iK1fLHNvvjs6PItsjZ5o/JXNKFAMZ+
         lAojZsg0HE/WRRkpSmmv0KaNRF3PkcwfNUx1ahoSX4+XGAwbXt88CtxWZ0q6ewR8lGR+
         +kwGBPIBpSVHj7o8ipuNHU75T31pj2275/YDMmi+c+Pt4gnZui9hA/ZT49dCGfnmmh6p
         J75jipHbe4jwpdoSQ6jYdIFjlJQLoPlmZTOOEQP2Sul2UuMobyAggH77YzCnGvBr0ZJ7
         imqt1VZ31uQWCVwsLSN04MluPpo29lB8S3fB6ywMKFjixKQnBpwAd9M2+wk7645DKguE
         ASyg==
X-Forwarded-Encrypted: i=1; AJvYcCUrOKdRSrjUXPAaT3pXMdLwM4pHeO7UHvHnFrgs9kUHL2vRroQKWe5mZIF6KjA68nrnX8m5U1BZhSBe9EY24SXfjCNGMlVREn0LeirkGgXAp49h
X-Gm-Message-State: AOJu0YwUZyFTKwKRim2IWeQpg8rDFmSrO4HK3Fi/dq1dv7mNrLucbBxx
	TL+6q2WHB3D16JYDMvBbnBfr7CFh8mvyofeP26OYopNyVLcljCWqtwAJPe7hXxo=
X-Google-Smtp-Source: AGHT+IHSymzbs0C8MGLs3EVai6AvWaGt9IGpYcAnz/QtQsZ0owRN86WOYk4l43txKHjNaleFCNL96Q==
X-Received: by 2002:a17:906:b78c:b0:a58:ff19:1bd7 with SMTP id dt12-20020a170906b78c00b00a58ff191bd7mr4814671ejb.24.1714485802359;
        Tue, 30 Apr 2024 07:03:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:22 +0200
Subject: [PATCH 13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=skJQwkduJ0UqVILLbpIVR8oru+2QUc2pKBYrAAVKHLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn42nKdNBa2rMr1pgKaAGhX7w0XUyPtyKW9V
 bUEsOjG4LCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD5+AAKCRDBN2bmhouD
 147DD/4ieg9gyFCb0g9PJBqL29gkEXs/qxtb2TaodG03VYLhq+fFzv2vOzJZhszAb1VOkS8eI0F
 KlbKY9lyGbdzA1h6zSNA0p/UgvlOtsdv4xC+0KT0yy7TXAza83A9DSl1qDnkNTdOFgc42e1+9FU
 eaGGfDloUavMXd6rNB7SRZMQRcm41b47P/mRzEa2cA1bjkAlrlBm6NwPeVLP5A/Kcr3Tb3EZ2pI
 HgLvCY5h27fuJYugwmxUMfqOjXMdWLx9SSAQ5yfhuYZZBgKU100MiFOvcW2nlDlhncmjU0WcU5t
 H7ySW9GYOdqAqEkELNGxb97j0Ov7StcHdE1uz4YmdansE+m8dNQTp3CaZ4LdH2+2TFF/sP4aynu
 H2GUeJKaC1N/Ng+cEI1h0gMDXKbR8qyTg+SjoM6i7+5UP1I2coCVMYrneh2dpEyJOp9MNFOvj5d
 UzzEQMRQeFilQTHwB3xynjKLIUqJbjhqfafH5A0FECh/lb7OoM+PTU7VciDC4L/s1Xl/NOiJCnq
 69WLOXnti2pJsaGzvUMsSHAlokIA+7NRIpUewkiHs/lN9zgB7QfsX/zvrQTookURZBTMehAN/cd
 yW7Vl73L2bSpn6CppvaD8hpkm5+NhqYeNWbMxnKsVdyQiMo84C2YNgI+3cBxRRpVQUYuh98RXgk
 h6j6UQIf5KNOdKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_150324_765060_45185F30 
X-CRM114-Status: GOOD (  13.03  )
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
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index c76628bc86c6..fedfa4fc95fb 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -74,7 +74,7 @@ static const struct dmic_rate dmic_rate_s[] = {
 static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	/* only support capture */

-- 
2.43.0


