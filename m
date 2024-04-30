Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D450C25B4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=; b=GEEzqJC/UmC7p8F4t8nXFYIIzo
	aoQjXTdgD6ILVhFrpzB5iFoAc/cjrsTb5OHRFvNb1b3jQtw6c3UyHfzXNiMPkvO8Stt0t+9XwN3s3
	2SJoDvaJE5wY8pqWKfgMZ6Ag1tKbO4N4UobrPpV5gRq5OyaB6jdVwcktUleeC+wmIvVYBL0doS+DB
	5Sxia/qBbtfs15pUsqeyrXoLpEHIkTwRnCU2aX4T2NjYhpeOhEnDtvkqOEYduv5y31XditItF9uIN
	0ht8NYuZMiMR969v9xs+VyrVah6yzBrvQ3EbGjj1mL2iElbROi1M0DCiT2J6QTkuKvdTcDeQQpoZE
	aoDT+Ltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o5b-00000006fAh-3NRv;
	Tue, 30 Apr 2024 14:04:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4i-00000006eUn-0jBo
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Apr 2024 14:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=; b=UeCAuI/Y0BC0LKwYX9UizX6SOV
	ZL77D8AMt2wsOMIPllAYCOvAUV6/2Y66KTM4cM2BiKJakdIQjY1a8Q7oMuGtE1VndOdP0BtgueQtn
	GI136cfNMPRV5XxjhgneKlJzy2NLpcAmUhfjq+nMFc2y9ilbEE1wKfq1YSNIRfZsu1dl5wa2dDPdw
	5kcjFB31A7UHNBxD5cw90N3DGSdGJzVd36f5wlHKwPXQrFzpRPq3zRZNfJYeMLmbmoHfY5WxAVh6U
	F07o4HN8xKBSNg71ducXsoyxeuTCzoRtdnzxS8Cyc0yKbWlXS/BWh9rd9+g49iXcuHgrQuBIv/m2B
	xxrCKAPQ==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4b-0000000Evn5-3ovw
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:03:15 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a55911bff66so702904166b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485787; x=1715090587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=;
        b=S8hc6iVHI4H+pXgIRg6uzHU5WVTUbQc/+mpet/hsEfWkMqLmAXuIKgOXOq401I27b+
         eDon+zWCGL8+AisNqHMY/BT4DuDw7q4XiRaoVEPdJKSyYopGWCs488osQoJphoU5vati
         sqoYppa/rSyFpjId3SES/Yk4w7/g5AniTxWfcR6Aj7AzmHWIMVMryOnbeqHm3Hs+yN9c
         p67/NC9ZMxKi2GMYK4H6FsK+RDbX2bMnLKoR2491CXQxF8IpodVtbPLx+I+UyOn7ObEW
         wVw31Vg10KjsxLCvpafCbdiDsqRbJz0Z851+RDddO2Ibttdky4uGa3bwcNITiTMr5/UD
         DWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485787; x=1715090587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=;
        b=BZbA0rTxNEchvGK/IzmXsnj8UqR7Om2gVKwRTK7WU1N1L0ZxUoSRmGCEYmky5/eWuz
         9Xz7cGY3RAePuazVhmkQZBp3VHs28GvF/iHhNVNHXSQaDFtRsgL41yAtgSSQTTVPcbm/
         DLEnOsQFIBnzKEaOyCFpsWMf3003MLjdlW2FZ7pSu7BlMdLkVP/LdpMBvi/VJWQ0bgYp
         FI5f0jToDATYbYFGIYwttPF346/2ordm9w53MUVDrpENrqgWum8vOwvDzKSM+ZNUGE4B
         4jLvMrz/g1FPZIrSJ2YVqY06CRfmnEIlrQXOam4m2oZuF6WPOaHwK9lSld872t8TBqLo
         Ofbg==
X-Forwarded-Encrypted: i=1; AJvYcCUYSxFpyNh+Fc8+PLgvTk1u29vzuNUwl6VSrAqsZGn/MoNly6dU2cRTN+EwJtJsV+ncCkPryDY/bGP64ua/TXJLZawmWV4FfIR9k75Jr0ljChkB
X-Gm-Message-State: AOJu0YzBowjaJqFsFSTxJSrLGAQHGNcwd2kKfyFt8KUy2gcY48kDtnGD
	qqDLe8gb5CXoSNXvc8WGX8RReYUcr6CMendDdjk4Zsb48/0JZOV6UaNjkSpkMr4=
X-Google-Smtp-Source: AGHT+IGuEd/p4bNUH8qGU+eaFSK8VAtxB3CIFoT6x1kpuMcKSCXiGNBYxe9tpKOFHZ0t3goA5+TDFQ==
X-Received: by 2002:a17:906:5d1:b0:a52:5460:a1c6 with SMTP id t17-20020a17090605d100b00a525460a1c6mr8141356ejt.48.1714485786717;
        Tue, 30 Apr 2024 07:03:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:17 +0200
Subject: [PATCH 08/13] ASoC: kirkwood: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-8-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=764;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XOQ3D1Q+qL3SzysXsYcm80LUwBWHBaXzmlHz6/Wj4iY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn0JcifyNVMar6zygwpR2fCs5/vlSNdY5zrU
 P/gTARf59qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59AAKCRDBN2bmhouD
 1zGnD/4/+HNhnrisX+IxTCcgOIYVGlhMNGY5vKejxjMo983A81khcr7uNg3V39Ut/IpxeMUDDM2
 Rk6W37xxCNkLbnV8wmT6q0+6JYwo8P4avbWhlcyWX4f/X54F3DagobrxkUqSfNm3z/Ohm2iMNsI
 5ugz6Ay/15M8khl/LqKWzwuHNFkFgmxkcWkPSduL9KTHrRilAIDNLYrHPm02HPDdxNLtZNU+BHW
 HTvM9E0VR5hTDhkw7zVMnhr+YV3QpwCclGbZOhu0Cp0nBuhuyLS6jviuYyHCMCY6GkcreN+twHB
 cXmh7Xs1u91x/WYnyYmDtSjzvRIkkxVrWxw/QN9qTHQ1RYB/Xx60ra0zeLmBEmOfRz9SMfyGoUn
 vRlI/JhDNPgNBYSjjkyIBwajOY5i3uiToFIm6XjRwuDnhvfIY1W7C/uwA0GMStEoF+JFVDyw8pW
 XIHJD1hjJyGYX0RH/SbX84Zx3pQWMS27eL7z7lzWdJWctPFRnKSWOGotjeOgM72adhckEHzGgIF
 QJDjo4+G5LVVPbCJwrxnbN0CSfbzPMsVVru2jraEYMcMNH7CzrolNQXfdPgbEj/6nlHJvhm8a5t
 qifBptWPRDKql5mFD1fojt0Pdiv7EWmzeVOR/7d4Fw5AkjTCjcEbUzTHSDxxQlJZ3JQ4G9+PKsH
 o8NVxPN16vhnqFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_150310_030188_F925F811 
X-CRM114-Status: GOOD (  10.91  )
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
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index ef00792e1d49..036b42058272 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -19,7 +19,7 @@
 
 static struct kirkwood_dma_data *kirkwood_priv(struct snd_pcm_substream *subs)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = subs->private_data;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(subs);
 	return snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(soc_runtime, 0));
 }
 

-- 
2.43.0


