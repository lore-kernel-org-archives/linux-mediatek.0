Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BB0C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNOB2kSBm/ZCjLUQLsGBk0BsOPSn2yUKgs+5rBFTqgc=; b=DBBIT3ymYu+UzHGMZ0cwMdqiOL
	mxI/Xef+3ukjXlSHwCNn+iFH6P6vdqhTbwpoCNBpKLuGcFKjhrS6AcYs9HjrCPIHmo5qRk8KogoHm
	KLYSLoaxmTok3j9AVyhQaR2wpaOAufqA8Vv7G0eZl6SnyTzTo4YtLFaskKIILK7MEgvTtFlLYxfY8
	Nip9Uv4bZiwZxzmovTvu+/dAGnMAU5LGcyUISTa6rPaqMybPBAmqp1L7uJulXf0/p5XXucOggYElc
	OGcbMWbI6OCDnAExXVJh/Ux+pTtzWZQYjcwPkh/hfL/43xFhFL8QBk1xTLJWf4dFVaqj5e/xeCUJM
	TpC0yqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPSB-00EoJ1-2r;
	Mon, 31 Jul 2023 09:44:39 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRE-00Enoe-28
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:42 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe0e23a4b1so6674208e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796619; x=1691401419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNOB2kSBm/ZCjLUQLsGBk0BsOPSn2yUKgs+5rBFTqgc=;
        b=LgrtHAn8W1mb6NgZSkoC+C4XQ/ZBnO1uEiaiKTL8DKFKHDeC2LZpSFbn4E9HESJuOX
         wtQvq6CPBGraalzdEhsqtFduGAoTKPw26h3xmyDpI8J8Hkz5Vtz2bdCl0lWoXX/1i7nQ
         NBde1edHABSYrssn3oiVsleLFqamU8mdBqjYmLXSmJQRGrsUtAyy5a2WAdXef8ep801N
         b/o/w0nztUFglzRm+cSQwkV93z2rOscLvoD7DvH/Y7vghgrJ+0h/7PAr5/I0xW236veH
         LbgYesDWnFHe+IbRzwkE/mPWChTAj/TBq/UFZRkzjDZxtWlzN9cqij+YHrvUxlusXiup
         VK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796619; x=1691401419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNOB2kSBm/ZCjLUQLsGBk0BsOPSn2yUKgs+5rBFTqgc=;
        b=geGQ3vMWj76LCBdnQXPrpQEMyW9IBsC+64qC54z/hWpfbXUk52/SAZIuCNOyty06wY
         IILtNeBCTR59F3SU4rnQhoiUIWxra3X7EwNt27cmxYW5psHo/bp67uT9VLr1PpQkJrxg
         gOz1IMk8/CGzwfvOe0lC6LdEKjCMWTbOqF1q+esoItinm3P6qW2tXO3/kgZkzi8DB3at
         4LwTWg0wsPfloDkwrOR26+0y7KLM3kzb5sluD+H8VRx2cpHHiR39/ml/Un6PNkA/x78i
         OOAkBvcQOGydmvx9076eo8q9jfvUltMJxdtXxrsy1ruvpCCVIsMmmYKQPCmUEXhvrt8P
         C3LA==
X-Gm-Message-State: ABy/qLYBVR9a/4wkvxH4Aoi5v7S+47jxyeefnKPP3nHqlGJLNgua70zQ
	k8PYYrA/4LMZckoil2p/fJYDrA==
X-Google-Smtp-Source: APBJJlHUrPvgQI+LUCrK+fMQO4ZN6R1lD9qdc/qBN0woqpQl49xLOblAvsdV3IiwHKgyrdrveuwFBA==
X-Received: by 2002:a2e:9557:0:b0:2b9:eeaa:1072 with SMTP id t23-20020a2e9557000000b002b9eeaa1072mr1013157ljh.18.1690796619353;
        Mon, 31 Jul 2023 02:43:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:38 -0700 (PDT)
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
Subject: [PATCH 10/12] ASoC: samsung: midas_wm1811: parse audio-routing
Date: Mon, 31 Jul 2023 11:43:01 +0200
Message-Id: <20230731094303.185067-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024340_701479_5C395A58 
X-CRM114-Status: GOOD (  13.32  )
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
 sound/soc/samsung/midas_wm1811.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 6931b9a45b3e..9e83ed071f39 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -462,10 +462,14 @@ static int midas_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret < 0) {
-		dev_err(dev, "Audio routing invalid/unspecified\n");
-		return ret;
+		/* Backwards compatible way */
+		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+		if (ret < 0) {
+			dev_err(dev, "Audio routing invalid/unspecified\n");
+			return ret;
+		}
 	}
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
-- 
2.34.1


