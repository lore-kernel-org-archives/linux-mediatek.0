Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28B3C19F53
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ziKPpXLYR2zn3+NU5Pk66H9ism9mr6GLdkSFbxKAZ4=; b=K6Gb/tdbyYyhxu
	ONIiMcBZpIV0Ki8eqawBt7zC0ERVM50xRhFihZ4TG0/eSjFltBoUq+0Z2Gqy2457R34DBY2KacdbM
	isVNEYen/FduacZ+N1ctsDXCDfm17Ap0ko1++FrCLa0IW2qCrnwr8jBSVPjtFfTeOQxy1B1KblWSo
	GTf7OsF+wgqQTuwI7HJkYpN5RyFojsGS8gJHCqY1/Gy+Ttn5p4tBaFpmzgJ878o6EkNDGllX+J54g
	hrbwmK3ziFnj4veAN8k5V6oZNlXFyMP3SWvJe/ydTetb2RCjpcSl0e+50uasBDgclTS/6WYFTFT/X
	CltMvDAUB9B7fQqJZORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4F-00000006e8n-0fQ7;
	Tue, 30 Apr 2024 14:02:47 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o46-00000006e1l-309U
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:02:44 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-51d62b0ecb7so4567511e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485756; x=1715090556; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ziKPpXLYR2zn3+NU5Pk66H9ism9mr6GLdkSFbxKAZ4=;
        b=A+vKjuHr0fFXGuMeUNDT/E5XgxQ9DQOUZ97bwP23VB7q5xkl/iAZi4W3hVdW9MJfJU
         quZDlwmE1W5XqhFYqbmKdSof6+lK0aC+aocM+60myjvOON9hjU0GUUppG2vPW3xeYmV6
         MmQHSsaI0F+N6t3lu1ftLWxxC2/wkG6Y91LlHyZWQG5+bC6fF765dQMv1Vg8VrAxz2rO
         KMNnQaOFwPmG5iI5ug2Q9QnqQ20JhK1hR4B5BQgXZdO4Brsd4r26n6YMYetzE22InuKL
         9Ci0mz7lvKYqbOxQO/PH6j2rlgU7g+86adyHspQYjh0EMKZd8j1obSh2bAeKnxZQ47cK
         8lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485756; x=1715090556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ziKPpXLYR2zn3+NU5Pk66H9ism9mr6GLdkSFbxKAZ4=;
        b=Fx//R+dG5eitpSH6ibe5GwRtr3PMGe2pxBXhLQ4EHscYNBA2Uu8cVYH4VHv54J0EE+
         rTtRwcePdw1/hXlUNDndNal6CTMtD8BqiueFX1bzHkuEJj1WkpETHcL0+U3c5hxvwH+y
         QhYi6sStyQHBRmCcUREZHN1E+y75K17d0uvvBQkDAx89JY5C0uuEDuZUoAAD1RTjvsdP
         9hiZm0dmMH/NdQKLRPTbwYEOZ5ExohrYwadqpRGab7BVHEFQlqa44WqqE8E7Zfuhj7GF
         +LkJjfJMCNMwlP2kgmpttMGBhHHtVumv9ywEvqnwNbLUOXMfxltMMKUvs05m3LMlVzkz
         QTNg==
X-Forwarded-Encrypted: i=1; AJvYcCVfh8J0YPR2mmKLQFx2shrDlVcxeTPBsF6FZSBKPni7OrbQ/uRMSamTqqdQApO3CJs3h9K0RM/KynwBxcQ9xmSHqYqa0Abj2PIShfFbBROaYB4r
X-Gm-Message-State: AOJu0YwSYLizIkN7HqtWAMc13PPp1OEFOR3YqcB8P6joiMrod9PuAJeM
	e0FYWu8/AL9SxMOwRJc/m1F4JH4gZ3++ETsN0GO0FyvGZZERweLEVgLH/YViGjQ=
X-Google-Smtp-Source: AGHT+IFxX6RMrPFkE+iKjGFWGX6uNErIhwrc6ioCbIidZRB0tmw4GxAmrC5NZWl96iLeoUrVLfRGvw==
X-Received: by 2002:ac2:47f0:0:b0:51d:70d9:f844 with SMTP id b16-20020ac247f0000000b0051d70d9f844mr5882908lfp.22.1714485756019;
        Tue, 30 Apr 2024 07:02:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/13] ASoC: Use snd_soc_substream_to_rtd() for accessing
 private_data
Date: Tue, 30 Apr 2024 16:02:09 +0200
Message-Id: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOL5MGYC/x3MTQrCMBBA4auUWTuQxEhqryIu8jPRgZqUTBWh5
 O4Gl9/ivQOEGpPAMh3Q6MPCtQzo0wTx6cuDkNMwGGWssmeFXmpEKQnlHWRv5F8YV/IFr8YGp12
 a88XCyLdGmb//9e3e+w9CANGvagAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3547;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nmVD9KKu0onQCo4+scSWvtThsneJsuva2ZwAC2itQ+Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnp5GgNlhBx+/I3aG9tNIg/czLIulpjsgqB+
 gIo9+t++USJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD56QAKCRDBN2bmhouD
 1/7LEACEfk8kijEA2LTMQcsqwb/zKSF+KUnI8xKuCriVzrabC5ANnLec53cOfXlJiZr0ORRQZu1
 470KfeDgCK0rPa+5rmHArn0RjNORLJGv3UY9o33TRjgnRKnhemsjjVBOY2q2aSGa12PGCdgZZ2W
 9lYT6gbghyhPF8NwejTYWU67cXXHzw57qZrigi06wTI2UMEzGCAPqjVhM2lDMHiEyCTYsFh5fZC
 rR2QeMZ5pK1z03KZd5SaMByAHa4DJKQOESKs+zVprbQfv5lzpQpn0EVjmxu4IuLRoQxBzfNJhPt
 36FgoerUfQRcpNoGC21+oBlav8jvX4KPs07WDOuNAmbmOtgXCpWnMgFcFwHmF3waXKQHwzOjK+/
 2KrHGzOUV9Xbz/fFxxDvcrJ9KdrqfbWpHM0xl7iwulLPWb1KsQr+/NFKNg6MfijGBKz4sC0Zqt8
 vQP4on/GzYRbye0DENyAmvUZGrWaBcF6ARh875j/Wtbgf4akwjlz1IziblIY+5XW/H1pl10EmuK
 rZVUZawHpK9VaDDe13ybwYLFC6jLwchoLTS52Pq2adjWzHJ+DAX0kMA60ACfugVQyPnugr0zBEz
 B7kqe01ESwCaFe3059W+GzYuXFpqQpOOJOqIoNfu7R23l0QqyopaR9hd/2Y62EwfsI/mkovGRET
 HqyQWjcO1YItmKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_070238_986272_F791D37B 
X-CRM114-Status: GOOD (  10.71  )
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

Hi,

Do not open-code snd_soc_substream_to_rtd() when accessing
snd_pcm_substream->private_data.  This makes code more consistent with
rest of ASoC and allows in the future to move the field to any other
place or add additional checks in snd_soc_substream_to_rtd().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      ASoC: qcom: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: tegra: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: ti: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: arm: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: amd: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: fsl: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: img: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: kirkwood: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: loongson: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: mediatek: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: meson: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: samsung: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing private_data

 sound/arm/pxa2xx-pcm-lib.c                 |  4 ++--
 sound/soc/amd/acp/acp-mach-common.c        |  2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c       |  2 +-
 sound/soc/amd/ps/ps-sdw-dma.c              |  2 +-
 sound/soc/fsl/fsl-asoc-card.c              |  2 +-
 sound/soc/fsl/imx-card.c                   |  6 +++---
 sound/soc/fsl/imx-hdmi.c                   |  2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c              |  6 +++---
 sound/soc/img/img-i2s-in.c                 |  2 +-
 sound/soc/img/img-i2s-out.c                |  2 +-
 sound/soc/kirkwood/kirkwood-dma.c          |  2 +-
 sound/soc/loongson/loongson_card.c         |  2 +-
 sound/soc/loongson/loongson_dma.c          |  2 +-
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 14 +++++++-------
 sound/soc/mediatek/mt8186/mt8186-mt6366.c  |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  8 ++++----
 sound/soc/mediatek/mt8188/mt8188-mt6359.c  |  6 +++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 10 +++++-----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c  |  4 ++--
 sound/soc/meson/aiu-fifo.c                 |  2 +-
 sound/soc/meson/axg-fifo.c                 |  2 +-
 sound/soc/qcom/apq8016_sbc.c               |  4 ++--
 sound/soc/qcom/qdsp6/q6apm-dai.c           |  2 +-
 sound/soc/qcom/sc7180.c                    | 10 +++++-----
 sound/soc/qcom/sc7280.c                    | 12 ++++++------
 sound/soc/qcom/sc8280xp.c                  |  8 ++++----
 sound/soc/qcom/sdw.c                       |  8 ++++----
 sound/soc/qcom/sm8250.c                    | 10 +++++-----
 sound/soc/qcom/x1e80100.c                  |  8 ++++----
 sound/soc/samsung/midas_wm1811.c           |  2 +-
 sound/soc/sunxi/sun50i-dmic.c              |  2 +-
 sound/soc/tegra/tegra_asoc_machine.c       |  2 +-
 sound/soc/tegra/tegra_pcm.c                |  6 +++---
 sound/soc/ti/omap-hdmi.c                   |  2 +-
 35 files changed, 82 insertions(+), 82 deletions(-)
---
base-commit: 82415cf72c7e224be7a6496f3a53c0b365c2fe9d
change-id: 20240430-asoc-snd-substream-clean-924b717d8f54

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


