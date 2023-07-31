Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A356FC001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=; b=VRYUcB18k8WzgAZxe4Nz955K8Y
	hdT59xqiaIfhePqK6kdaXtHcBSc4vrCJewo9KjLT2CiekaJy/dMuqERQwKNw50pIGun/95Xn1esQd
	dN7E1X8MtixWZjPberEQ2Oi189eSZBvjt8Ig3KsA4FNe2IcgfLj31JyNIbCGL6C1fIAurVmmj71jr
	7/QoV7GRMRg91fOOdOi83g64OTn/XYHFJVZkGlJLAnl9FijUASAmaAJkHcoG5PJfcJO7/CBtQdiID
	H9FA6ce735WPhGLdNdshgaxOa75l9FGeeHqn0pk2JsHsFA1GPzpQeHDj9V5in5kNp4c31eRGjtXiZ
	VfvVGCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPSY-00EoR2-27;
	Mon, 31 Jul 2023 09:45:02 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRM-00EntD-0T
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:49 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-991da766865so683990166b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796625; x=1691401425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=;
        b=IqwvSfnbNwyimbDjB6LihmC2Gx61tK+naB8QvwHsvXO0AagHSPzWbJRjaS2O7lbNTS
         uKHpeI8ENVUlZNRnDzoAFPLNU3WruTMI9ZxeHtzJ7g+Sn+eDliooYYCqXXpQDwHnf+Vx
         O7zTBYGCz6v48/D4pyTbpPaKFrSLQi3kVi6IxhcF/uRSp7Vw01eHsF2IgPUt+YlBU7Sl
         aCP7bNORn2LuJEnVpcO66BiixqFuMFSKjtmJ4LuMYuhaA9a+bAm5eZq3nhk8AQ1A9gT+
         vm8xlf/Bek/HsVv5bZgvjDupHFPhLOIx6ZAVd3EpcNTdx/7l/Ix904GX8IT2gN15vj5s
         eb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796625; x=1691401425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=;
        b=fRNZ1PEmdBukzuSBlaSrYU76t7PzAzt2jjnwfQxmGtXGA1SYDpG6Vgd6hG7Y6fYT/7
         OhaMHpkkvNfYHsGN2ziWyR9qji5b+W+60QSlrqM4t+OX4Re3pGXevgjR3BNl5DuRD1k3
         ryvpOUgLrpSTHMEhaktVTld8syY2ez2jpAmQ+6m7YyELX5E+iTE1rT+r2YBUg7cTVnRZ
         +CpghP0+bDKcMixKEpIU8nyBzSJZadGMLLAu97Bi0XFNk6BQ34nRW4wuCLvY0jzVXC91
         206GxZQB+d1EZxhFhRHG9AGSt1qm9O2Hg49i97flnBWl/UrwzjxMb83GUsFEimTGul83
         i9Vg==
X-Gm-Message-State: ABy/qLZjWvLu5OJpU922mtQbcPv0Qbu+q9CaAMCWcyn9r8ZQ2Pj21Ki1
	B0ziV+if6QVydwG6t159/3j25w==
X-Google-Smtp-Source: APBJJlEzcZhVwa+DwMhnuY0DXZuVupN88Qe/elc0l1P9fP7li1a276oj6YH6VCXWzAUfClUX6fMbBw==
X-Received: by 2002:a17:906:1d7:b0:992:3897:1985 with SMTP id 23-20020a17090601d700b0099238971985mr6746185ejj.43.1690796625086;
        Mon, 31 Jul 2023 02:43:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/12] ASoC: samsung: tm2_wm5110: parse audio-routing
Date: Mon, 31 Jul 2023 11:43:03 +0200
Message-Id: <20230731094303.185067-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024348_203907_8D730591 
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

Parse generic sound card "audio-routing" property and fallback to
"samsung,audio-routing" if it is missing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index d611ec9e5325..5ebf17f3de1e 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -523,10 +523,14 @@ static int tm2_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret < 0) {
-		dev_err(dev, "Audio routing is not specified or invalid\n");
-		return ret;
+		/* Backwards compatible way */
+		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+		if (ret < 0) {
+			dev_err(dev, "Audio routing is not specified or invalid\n");
+			return ret;
+		}
 	}
 
 	card->aux_dev[0].dlc.of_node = of_parse_phandle(dev->of_node,
-- 
2.34.1


