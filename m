Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCBAC001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMM3/oOp03VQdiM5UtFP36bUtHvT73/cLwCpo+QdiIw=; b=SkHY8hLMeD1QJ/BWpMJRvomuM1
	JYH9jVpAOaiKip718NT3b/FZF7HqSU0mlbsLs4ihKqYUmgjrxU1wuy17BFPCIs9Yg8cVpjtBjFKIC
	N9wlK7CbumoKOoFWlF+cNSTGOncx6lAbfbX9TTbPYy1EUSSgGAzz9sDQiG8o5tY9j+cR5QwpyV12f
	sYCRnpZ3e6YhzzhNEAjIuZ9ehoZO2dhPvwFQrdC1BikPiowaYdXSwSb5FYcIz3eZXFDMNJ/C5Mxa6
	bNjJsuPtFSnS+aVAbh//1+DTrjeAM4IL32NNtgx3PCIP2m5LWbOVr2HLQ2BqgmDpDQWERSMwipvst
	BNbXIIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEv-006foY-0k;
	Thu, 10 Aug 2023 06:33:45 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEg-006fZl-0I
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:31 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso8875391fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649206; x=1692254006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMM3/oOp03VQdiM5UtFP36bUtHvT73/cLwCpo+QdiIw=;
        b=mZi34UfdwwcDjlmRaN1sPV1Che6maw8DFhkpB5rlbV0q8J/t0iDdS/XpmNucnylJ3O
         vyE0k7yv6OQFCEw9vAiWkjStNiV4ON3E3/xElpQ7NEq0kSZ1ViuYVDnrkY8Scyj/jCmb
         jMOEwrRNdGsT2TIXKhvOODWDSAvMvm54g8VBCVAnvSeidAP/qalWZRgxGeNBuPJ92nw9
         OAweLoETqOOEX40mYzOkfOWLZce93VOvyJteawZl7vUCJVilbW5cz/YIXuaEECihqyoU
         sFSj748PEHeleeu7icxX4GlevJXwiCncCPSznc59NSRYeOwUMNOAXHaAgPqVO9/sqGF7
         pR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649206; x=1692254006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMM3/oOp03VQdiM5UtFP36bUtHvT73/cLwCpo+QdiIw=;
        b=UeoUG+dFH5r90NmTLeQJRHEhOopdeCnM3Bo7PjSqRofG6QuY4vn0/lTyrF01ipLuVs
         M2ku33+MFODZ/rl+iQ+4PXbQKT18UplO7fPsbL95IYAsj4AyXN6xbdU3t2BxMjfF51/F
         WbasPRtYnxt7RBOgx/R1+6sx1s5JA3Rzs5SiVdJAKv3+c6NjGRRyt+ADnLcj1ZsAcPoH
         sdZZM1F0EVMV0eNmBB5kzKRZsJYJowngg/o4yWKna7KutLkF97KqlrQjhzwAsiGrLLX4
         soqm++H2TSU8lwjo5BnK4XIUh9NyH/3qks7ST+HiPWdKgPt5GqHmpVqS8TzjGorS1qe4
         vn/w==
X-Gm-Message-State: AOJu0YwNuUE/DIP+FzrMhs2re476y+B65DL6cv6SaJG7E3tOp2SOPORD
	9Y5IENv4JHnvCQVaeYUCDch6gg==
X-Google-Smtp-Source: AGHT+IHJTabwknAAKRbDkyzBHhTtyG9imru5J2ltmZDPIQ9zQT0DI6lytWnPcjQ+HDIYznE8ecpa4w==
X-Received: by 2002:a2e:3203:0:b0:2b6:e3d5:76a7 with SMTP id y3-20020a2e3203000000b002b6e3d576a7mr974468ljy.24.1691649206283;
        Wed, 09 Aug 2023 23:33:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:25 -0700 (PDT)
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
Subject: [PATCH v2 10/11] ASoC: samsung: odroid: parse audio-routing
Date: Thu, 10 Aug 2023 08:32:58 +0200
Message-Id: <20230810063300.20151-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233330_152292_70D59860 
X-CRM114-Status: GOOD (  14.05  )
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
 sound/soc/samsung/odroid.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 1743bd55ba1a..c93cb5a86426 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -230,12 +230,13 @@ static int odroid_audio_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	if (of_property_present(dev->of_node, "samsung,audio-routing")) {
-		ret = snd_soc_of_parse_audio_routing(card,
-						"samsung,audio-routing");
-		if (ret < 0)
-			return ret;
-	}
+	ret = 0;
+	if (of_property_present(dev->of_node, "audio-routing"))
+		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+	else if (of_property_present(dev->of_node, "samsung,audio-routing"))
+		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	if (ret < 0)
+		return ret;
 
 	card->dai_link = odroid_card_dais;
 	card->num_links = ARRAY_SIZE(odroid_card_dais);
-- 
2.34.1


