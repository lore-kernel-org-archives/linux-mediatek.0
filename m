Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27386C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=; b=l0TQCtxaAb9Egc5euTxAFj7K5q
	d5tHZ75H6+s7ZN1+JrKzjTJ9jQ5lFEHSFc7g/T7ZR1I9VhaNv1g0E3+7ZnWpaMVuvvsnX6XvkYvY4
	NanktE4oQ/h3xwmsNtBAURgs+Q0PEklloopG3IVStUM3qMdrN1QoSW4oJMsamFUDnDPYGzxlEZ1mm
	ND7oe+zhHQKKTlUOQwtWhK+MbWJBXVxDOtVilvuAIAKTyEz57eXwbYQlZrg8GSQrX7+2e+SX/2SL0
	rTSbnyjX39V1lGM/6hGqgoTjUTG8cA95pn4LaS9ASKfqjuH2SptAYsCqb99jzgj4qiedEU+xM3l7P
	Tlv9HuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o59-00000006epm-0GsC;
	Tue, 30 Apr 2024 14:03:43 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4E-00000006e7W-2qHd
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:03:02 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a58f1f36427so377262966b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485764; x=1715090564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=;
        b=tGKQIYOMpv/6Lh4X10+I6x0Z3C/RLvzxfeTwByZ82Zq4YNy8fRyYx8Q5puEORgPJ9R
         EpdqeLn6F/yTju8FzdEz0ypw1cZzL5G6Hw32+KvoM3SzJkuEzevH2gL2SX7RtThOdm1v
         PDa/j8oYzNQde29wIjgVa4li8uwOh8n9Ybbj8Y343502YXTlk3R1x8uyiAxcufdZc69z
         ZEa2kKb5s4+/vkHYjX09nUEbjCL9l9OzQ5DcMI1JdCHN1Fkiasvg5Q+sZf2bCDQ026/6
         EbputXNnwvN8Almu++ZHctsydsiT7XIZCYmugNA1TqHjwQvIJuJ7iFaqnzydM8XJmeTT
         va2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485764; x=1715090564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=;
        b=ZYzaGFM3AQ5OJ8lq+8Z0eStI2hme4GWhGKBjwzlhrzQ5y9N5xgm13UiVvvcU87OkWN
         gTricIjcwIAKDoIj1xUMLFt6YJAFx2h+6J0K7tnQUsJxiQXlQAvc79vAd6o06YiiONCK
         AGNpnI994Ll7NRAqpNo/hjdIevnPi2hT5dXxCymfkN9LB5LzBycS46F/NklDgz7bNBxo
         Qz8izL9+2HfTsbwZPMrPVeHHUlEGh4oP7UmqW4pgocb+KLz5CC/AlH8KujCU9mulFv7n
         RWSUZqMUFzooWpDVIhFS6McM7jJ24DvmIOB0DuwqnpkZukn/DobvH2nlZrRRy5NiylRU
         BOrA==
X-Forwarded-Encrypted: i=1; AJvYcCXGfdUavsYeTwNFhFKT+g5vm4Y+aLVk06PBtXv9n+58EeuYNWsqT1LWC49JlQmJ8UMwOIZnKqbFdjtFp2GYXEPXLumbcX6vmh2QPfojh0MCVnky
X-Gm-Message-State: AOJu0YwBgWoZ/ei886AVEMQX3dDVMxsKsHe1AfcUW8G3wGqdobDmQvgk
	ZHkcpiXIEy+Mn3/jiW/y2Z9c6eZ53CKRlvdb2tRKu/9k7Xorn4h28sV3aaF/xGo=
X-Google-Smtp-Source: AGHT+IEe6L8iR4uGhiIxTqGIW4asn+4q9EAd3lfdb1piiCjrm73a/9Wg4NOc67T8NvbSyWss22Ri9g==
X-Received: by 2002:a17:906:ff42:b0:a55:b345:63ec with SMTP id zo2-20020a170906ff4200b00a55b34563ecmr2134852ejb.15.1714485764472;
        Tue, 30 Apr 2024 07:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:12 +0200
Subject: [PATCH 03/13] ASoC: ti: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-3-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=704;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WaTWh6A8XvKFs+19MMAHdgA+abbpsyoPq1iDSypgs+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnvj78Se5sQ1IGtmZPj3Apt3l8lrraNbdATP
 5UZknZzzu2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD57wAKCRDBN2bmhouD
 1/rKEACNiDDDmi+VKdGySua5uR69g1WVV9N9njkaGa6BQYvqocDTXh2A5T950fbqbmHniXfNShS
 JZsCqqwu5KxhFaDGF7+cJT9d8h+f+7+N7XdkXJiLCDqED/vhEdXSK+RJxvjyb2UGCtkF2vXvq3I
 qq11t/wIu9DJwANQ/5NqaRpQUsdJGIYQrngiCXGTVr86HT4kWz6cB50Fq2Rc1Nwer1MNbFgNXPD
 EjdcTuqvqRJxRoo0qJQ1uv5PK8ANQ1WI38IhHUgC9cSPyb8BjmRNwBk/6M8bqGZXxd2GI3h0DzD
 8V7Ep+O/4i5WkC/o/RdS0k/Jvzkfl794WdVSrh5ko0yoTWBfgLKB0pDzT5Td5wsGDLH4nLzQX/V
 5FUZJy3lvXFB5nrv9g3mS+E8KOagd4bqA8hkkVqkp5amB7IyjqR87us8YZTtD99ZhtHJ8VBMkd+
 fbJwxHjx4G4Tlbdh0zvD3QybwWSvS6+wPWtlX37WjHLAiWt8YIsZU7wDGSPZJGubhB71ork6bJk
 ATYI7HLcuqJT/iIWO4n1K+oIgsMbXTSo/c+WM1q9Tc22MWyviROO784jazEoZ1HWS2txtvOqMzf
 OBzZt/XtPghj+yRRLI6/+9SDQsMxuhH//frbs22BShcGa8gdvXz3dj2VkoB0xwDtpQ8OPZ7XHdl
 o8rt6UoEwW2rmsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_070247_038094_D26FFC22 
X-CRM114-Status: GOOD (  12.76  )
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
 sound/soc/ti/omap-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 4513b527ab97..639bc83f4263 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -40,7 +40,7 @@ struct hdmi_audio_data {
 static
 struct hdmi_audio_data *card_drvdata_substream(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_card_get_drvdata(rtd->card);
 }

-- 
2.43.0


