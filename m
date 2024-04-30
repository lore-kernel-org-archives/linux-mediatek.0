Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6A5C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPEO0RWAvqMjT0IhuA0J9gOKQsCIQYXZsdev+OBW9Pk=; b=EpX5oKKOfv5tBcgV+qJA4iPnz0
	Y2elkHNIFkTctv/IBPHkvHWdA756biv0Km9p9V6fzmpBQ11wP8AG4u59edoYasFbpBQbrNY2rVYza
	bbLxEdskswIn8kPZxb8ksfWMzaN91V+fQSWjcRbRJEocoGRm7G9HDt7atDv9+Rtm8FUoADCPPBidS
	BU09Iir2idmJnMw03v3dl2PBVC7mBsiQVhA4WvpwoyM6cDCQfJar0yLmwmTdYJsSI/T0Yhv26k93w
	dPPJGccppw56Ucop91Zg7iLrR2HbCH02/Ljze+yA+Gih4NzarJKVln5AC30WvnnuJdXZwEZEC4L/P
	D3RTr+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o6m-00000006g61-2Jgm;
	Tue, 30 Apr 2024 14:05:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4o-00000006eaA-02iv
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:03:36 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2db6f5977e1so67359811fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485800; x=1715090600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPEO0RWAvqMjT0IhuA0J9gOKQsCIQYXZsdev+OBW9Pk=;
        b=YkhOzj7tEnQAwLEADmjszD8kn5YyImE0fzlVZ7oa72MPIcfMKeOk3NjT4gC2mqCi2i
         PhCogVbTGTW5ceEIhg+4CRugOuYtc8emPRlIJpw3LjHWszZ2WiV3r1VonqOepnkjkvFj
         bzcJQQHBIYPksU1VnlXAf/v9TV+XX9g4smMx5Cx5/7rJMANLBhEDVSKmpueKVb3Z/GL0
         DcD9JeDQb/PwLlxmbT4LyL3akZ38Fu/XpvxuNuFXmxnN1BzMhqTNku0UjnNmaP9mf5D6
         LVSwp0RpRnV74s3NF1BVI0VvMuU8ds5Nbe7pCV0z93d8+RJ3OC4JiVDKVE3cDj7J3NKi
         ODdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485800; x=1715090600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPEO0RWAvqMjT0IhuA0J9gOKQsCIQYXZsdev+OBW9Pk=;
        b=CajDncC9sWyFHmnjhdK5fYQwP9Q2+VRv0K7+YQWNOt6F3sI83bpljLwUGVGDSYpg3P
         NHxKWwyLu9aGoleRauVdqfGsevfFLHm2C4sX3SdTkbsh9bWgb23cHbIiFRct9oKBOSzr
         7x2wVY7LaPusCkfsaVQARr9lLFjQZaxt21//HTcLV1RfCSbL19Ek3VZGguvTASniv33D
         +bRsoikiFcDZLJnQ+97omI/3/vfbDy46Deq6Y6A6hEyQdPsScCeaG8AAaFvrsxSXtil6
         Kxbp9XSgrbdrqawhbbn+gf2VSa9MolWAd+NSAHsIUInZ5eppDAOnLJEBa+5Aquy3ORZF
         RCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0mzFlIcZBgUE+lhl0pqZa912PBYBGNXQIvdxY9in/QOHgGVCEFaenrwxZlgMmWYlssKcYPwxuG7JWxTlnJrCGOmSEItJ3sunE4TiNQO7VdUYx
X-Gm-Message-State: AOJu0YxSR1Zw5rEZDeZAXYJNmhDE5M8qV/rq3fHYgJhojD9xbARfRfDs
	vMfU2zynX08/wX7wttOlOIOh2kqOMSfD/VjZqfYZfkE6ysduUI7JhgK3aL0kdWw=
X-Google-Smtp-Source: AGHT+IGh5m+2saezt4d4/Xj30jwjHn2HaB5/1wzlPXeDMAywvUMwy38mdPMQn/OqpOvF0tN4moRDWA==
X-Received: by 2002:ac2:4342:0:b0:516:d0c2:755 with SMTP id o2-20020ac24342000000b00516d0c20755mr1936131lfl.63.1714485799614;
        Tue, 30 Apr 2024 07:03:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:21 +0200
Subject: [PATCH 12/13] ASoC: samsung: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-12-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=s6T6qKBmGyM2bmAZfxmnWfBAOCON5ixd+eIprC5zOI4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn3jE3Jqd/FGkciqXRI8lqVudz+blh1rLunh
 DAPo4JfRZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59wAKCRDBN2bmhouD
 167MD/9WOiPSu4HFniDht9/iDlJgx4fouuoHImJ/CM8XXopNUpo7cqRR15JqKSLsDj6vLCZnDjI
 XJH4l92Ge2WRJcz0/XCKWm3Oj9AtC7ODuCsB3t2mfhBJxD0iuojyzEbOdRvzU55KzY/Jm2DElBe
 AVz2VKMPgF1zFr4pkhx3dxiMHbLe6UGPzibytjl5whdT2xAoImo+S2NZTWCKOe4+N7Zrs5X4MKN
 nksx0kWoenkduh9GxKCpr++Kokx/YYpvDE8obQfhLY80Z4tPSY6cX4vv9sfrzB9vGeLAU9yTvAc
 Wxh0WUV5cT2zuYc4pUkyqV+EX/Y3tPEE5xSP136C9a7FWO+Rd52ezaWXED2BY3hXspNrTrKXXTD
 nFQfKJ3M0bszW7Tctw01tKYZUa9Qf0bz/0oVbI6rpDgM3+PPLaVWT1D47FaKzfKQ9jnjaZWzOoF
 1F53c9Pv5Cdt+RLqjXfD1JfrGJRJ7hUbPzMQ/arruJidb9QiloV9Dp70EuGD0VudxXWXtwRzztI
 eIzKDw49c8QYUITfwxYEr1QsvBeQMeOGj/PlXQl1p6vj/Y4oFGW1SjDTITGrfjGFfmKEABGvYP6
 yK41SS5+akvGSPouciQ7r2EIqpAZMYxIFkaCVPRLm6VL/jKT9HDivO012DCh8z7Q3NuvimCGlwg
 o5bO2V6wsqvDkUQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_070322_494040_D61C372C 
X-CRM114-Status: GOOD (  13.46  )
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
 sound/soc/samsung/midas_wm1811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index f31244156ff6..0841e2e6f8ce 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -127,7 +127,7 @@ static int midas_stop_fll1(struct snd_soc_pcm_runtime *rtd)
 static int midas_aif1_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd	= substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int pll_out;
 
 	/* AIF1CLK should be at least 3MHz for "optimal performance" */

-- 
2.43.0


