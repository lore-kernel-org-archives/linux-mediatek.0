Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3489CC04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=; b=0GmLTlpsV49ZuxWGeSVH2Ybrm1
	DolQ1MC2P2RWnHFlZCNI2QUR2egFc8dXWd+Dtp06BrmPrmqYDvY7zZYLHzTAOCpZXWPjsFDmKhwvx
	BrGCZ6JSjV5r3gbJfXyYatjxlPxVU5WjZS/4bhF5q5gRTc6/7FQOYV7VP58XfRF86pfkUlqIWq/G1
	SS/MDVdjt/nqfMIq/I+fDZFescA+38Q1uqcjyEAz3G0/JpQTWjMvaN7U4SudaMpinvF2vKlLsJeQx
	nriwLly0k4y1lLTksXrDKoUXZQQcwLTdu7oBNlRsumkEW/uQln0l5c2Z3ehGTIqqAJ84jIClkfm8V
	f2HfKU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzF6-006fw1-0E;
	Thu, 10 Aug 2023 06:33:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEi-006fbj-0f
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so4684385e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649208; x=1692254008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=;
        b=WsW7N5hH568pRQc1HRO3Dph5sZBjMP7VCQ9PCz17RKguEShZUyFktuqumSMowNXnNL
         eZS7dxaBqYwAANnxZaDYAmepUMVya8yW7kPjBBApwlk7OvvMjJEZO7H+FbP07j4yW/Q9
         v+OQWgdu1hwGASwjeScs1jrTLWsV+ZWk6T7EU3sxTyt8AmDwR3GSouEMghCxR7wTB4+l
         QyKQhIQUJpsbbZm1bTH7OH4EwIzoF2l1A+au4POCQyT1uXwMkgZcMkz5b1mxwoyN3S41
         HQkoW65jAh72hsl2jei/YeCfL+DOSWqvIbvOk1YayxqYBkf7jfR67GAuRMcFIDR1qauT
         ezqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649208; x=1692254008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=;
        b=STfCqbIl36+zpCMUn/Dz1lBzNzumk7/02TkzvSfmjo5N50Z+vbiu0Ip/SwwGT14h+a
         nwt2HuWt9TnntmVCeUy/jcaTc+MDWBvV1KGdNKM+VcWCoVRPVIIIaUEBb3mni86oqDR7
         35eVkIp6v6U0Yk3g/ff+Jip5RNwSKUZSSVZX7LPqWEXivl+4vkj9x/vaQb6Hs0iHtZnI
         SufEgcLKsJALAtzA49T6opgm4UWcbAYuBf3Z6rrIzeMU+d4rV/q/8GR4/eWFvbI7WTUQ
         IVVaFPSp33AEtxSVsDoRuThDEu3cblgQISA0HuuPmnXo7bbXAUKuD7XjaHh/3EtzRlFK
         VLRg==
X-Gm-Message-State: AOJu0Yypov9w+txRu1+HMMi82DkjVwhv9U8co8Q37bmf1iZHwdfrxaKr
	J3LwvPyLM7f/7MUuUAN4BRIvJw==
X-Google-Smtp-Source: AGHT+IEXV/tZ+ldWvHaqx8+19PGg8/1xO8IsS1t83BnY9Nx8oyuLOskgHlviUqUGSPNbI+PEAFXAUg==
X-Received: by 2002:a7b:ce8e:0:b0:3fe:2109:b9ff with SMTP id q14-20020a7bce8e000000b003fe2109b9ffmr1127175wmj.0.1691649208491;
        Wed, 09 Aug 2023 23:33:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:28 -0700 (PDT)
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
Subject: [PATCH v2 11/11] ASoC: samsung: tm2_wm5110: parse audio-routing
Date: Thu, 10 Aug 2023 08:32:59 +0200
Message-Id: <20230810063300.20151-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233332_261292_87DB4D56 
X-CRM114-Status: GOOD (  13.29  )
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


