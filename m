Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D94C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=; b=XVKzwBdh2RyqqX4bqu/znU9qPa
	gZ8EBNLlmZvbLygFz+VdfMVPmVlgCP3CD7HOsBjgwC/s5UywUEKbGdMTlLNkUs5vqAgL4h7lzKF9O
	BH4aP54LKeuq8/QxLlHlmFtzYjjpgOMh/LLbIomOUbVPTNcJbpvRlXqWmhFPMpla7oI7j6KekEvWn
	LDD7qZN+t9r86BJ5XX1sN0AJD9tFcuZgjzxEKLmV1KLG4L/WLzKC4TS0qYUkYrpmw4ojE4hsywA79
	JTQh0nK2da5+T2864eqtz0xMrYBF7BEPoxvZ1H6pZzNpwz/QuXU7KGcEUblHbpdkIukryu+byFpgm
	EZLPJ45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o5x-00000006fQt-0V3Y;
	Tue, 30 Apr 2024 14:04:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4p-00000006ebm-0otG
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Apr 2024 14:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=; b=dp+/eJ9l/Klw5Sa/R7bmc0YhrN
	O0ruOQdNGv0s45ENsw0ymSbbVZrqRJekC+4dMD+Gb86zu12Jg2b3+LyuyMr0MwCm3MCmyE+kPPkBE
	m75w4aGghu5klXVaM/wRjE/jOYSsi4FBC6ZAVH9wd/ZV49O8Nre+TXo3sKp6MZDDYwa2xJtWfdOKk
	kNYtnMslb5QKL7EL5P2qcZid+fO2nhW2SQhUONGiK9RbNHt1s9L36dsn/aivNbC7zKwcPgcHMRnv2
	9XBr4KPdsMBd9eYbpXuTTjOv3iNkNiVCQ4xyytRI4UWxHakhzv/5EgQi9kjCs4IJh9H+as7IwZ5nm
	bqPXyRlA==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4l-0000000GygH-0mZC
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:03:21 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a55911bff66so702927966b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485797; x=1715090597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=;
        b=e6iSRFZuMRRfbarog7gyeab5r2SkiYUQHtIIXkNotMKOjTvxU6W/I70T0/Hm0FnP2n
         M1igqmqZRCsT3jshHAuyaFXv+fqlejcAyDlJvTzBAeWmPmEsMANlWJuslfx7TiYb4jJT
         0VArDa7O1VixDHOedvSQMY5cwk06+zuZ3ssDo7NkHnZgdVDsFISppdtc+mhWDMlryAq2
         qZ5splLCCAkn5b8Ur5Vi6R7oM84K2P+FBqbSubF2+A3gK7QAys/wLuN3/9H2SJOYTlnX
         QIzE6WjMWIcsZ15OC79+8ytc7GaHJCNOK+7gUYgdKVO3UPpPGIc3fCwdHCjelBmvd6T1
         3WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485797; x=1715090597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=;
        b=jeF+3oPhB1bSKrkEPXlcvov/xYfbkJ0qEobKbKKTRkgRNQnY2ji93D7PO2EYBTHCye
         FfEv/QY/tQw3754CAoLzu1qoNVoSVkLCOfGJNT/IaJ3xJZIkkzeXM/aM5LGKs1RzmjRC
         3Y/FyDbbmUvlj9tY4RAEI/4HOcrgfFY0ItK2WWMKCDhQWtyOL3IzJXHMiiSyV+SxPgA6
         LdHv6C4ww4dyltHEqviUOyl1xSaYZ3DKyDDxdvhSWd3TFLAe8R+P8de0oIHHy6Kc8iub
         F9fJS8iXPwRlC4e7HTOwf7WpT8ImfrdQgvswAFGHWE+u9UCvLMQU0xFg4PCC3Cu6aLi6
         BJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCX4x8+tnIJmkCj0tkqiYit/DWxZhOXVpo5T4Jab/sz2CKdcFa24avvqlHj4Df+diegjKAl1pnfpMQwSgITnJ2MaQ37zhBlYa+u3mRkw+nAl0OB2
X-Gm-Message-State: AOJu0Yxni25ONj/jJOEAws3ttIjqJN5bm6UnzpsOcqUX9TKU39tVp/d7
	TCAusazfepgUPMtKiFI9HZBJTSUmft00qFVmRGSKVBcQMFQWP77x2masnTjLU20=
X-Google-Smtp-Source: AGHT+IGzpv19AvraaJONqek/5WZ+vpK0ygTzaKpESURpr1fKUPncz+rrCHoTLxWTmS70O2gF9usxBg==
X-Received: by 2002:a17:906:fb19:b0:a46:cef3:4aba with SMTP id lz25-20020a170906fb1900b00a46cef34abamr6908081ejb.75.1714485797197;
        Tue, 30 Apr 2024 07:03:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:20 +0200
Subject: [PATCH 11/13] ASoC: meson: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-11-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2L2Sd/bZA9DPmGMKb1blU4asO9ABeFUMOyqlFuFMjDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn2JvN54IaqcYA5GLEuMvhDQe+mNVTJTI3Tr
 QdG3HJ5mpaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59gAKCRDBN2bmhouD
 197sD/4lVw4vRS0TaJQoEqN1/VKp4Q9D5lysYmYFjuJDSklcrh+mHGjmHyG95rjuMpfUp5WdZ9F
 iytvncSSC/Cuz5v/Jf8fvm3m9JjwXFFBP5Lc4SMyVJAeiWnSKjzxXSJpUg4BiTtCWCFACQ+V2Bb
 YGk8kFBRlLhu+hIsRVvO7YExMVKSyWC+LUviOI2MtzsH1IZm+J1MJ32ygUWTM2XfMun8P6JaMaS
 zdUyUnJjZrzCI9/u7V7zlNe7qD1tuI5xufOqCOiAa6z0lCBNjRJeSVaVzniiHsE9d/ko9UTugjE
 fj2ylpg5b6Vgg5XqItpdB+YsDKsAIWOpQw+4DM9EyACs1+eZoj3ODueF18BqqnON9iBFHyQC+PS
 tFWPcxkNUPvKTgBAo35M7FSPkECi12I5S4WqPZrRjoTs1lUtOhRGq3DjzGjtxPPe1fgDGvsk4Mf
 4VM/tTJWrMOhnmX9/Vm3iZWKyJcLwmff0kZYETc6VVP4YKbsUIvlZbkhmLuh4EY05gpbzW/i98e
 2SqiRpAD6/3HhVAbX7RcNsQAFGYv0XBd6/7ewRdKkn2ly0KIqT3t5dloWm1fn8iCmzLrSnDN+mR
 h9asUnfi+hgioFVTE27PhDIzW+cxFlTOVreYfN8Fh5JIFmJW8FNL9xUzP6zwTdjGwt18Z9Ey1s3
 y25Qq5uL4jC7B2Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_150319_809948_6A6A37CF 
X-CRM114-Status: GOOD (  12.71  )
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
 sound/soc/meson/aiu-fifo.c | 2 +-
 sound/soc/meson/axg-fifo.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 4041ff8e437f..b222bde1f61b 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -25,7 +25,7 @@
 
 static struct snd_soc_dai *aiu_fifo_dai(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..1ead5ebc84c4 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -46,7 +46,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 
 static struct snd_soc_dai *axg_fifo_dai(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }

-- 
2.43.0


