Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B52C41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=; b=KOqjSvtkb9ufK4l37lT9IK7sIB
	jfOuFIPxmizbQvFW4vMjv2hGQNpvMlUqRE0QxqHJ0DKttnkoIvR1Gmi45d0jXgkKCWVCc59tow08O
	L+JRjplTUxqRYfqXCPgXnfydbXPjI6GoXE0FMJ3AFRsmVADHLlWlESHR8SstgU35V9B8mAAPduvOD
	5e9T/LAl1bNiKNZjs3df3pSeYhEscf1s2ST8ECzT3Hrw3SHeG8A++WnfrCvbcCTCBwkRXtp8VyS2U
	kPFfktVL7AqBQjQzw4w3LsyuXkgpY73m28WB5XuNHSDtzp4OUU9i5Kj1Nfei08BDq8VY4G0VdIcz4
	xUMiQpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEa-006fXp-1a;
	Thu, 10 Aug 2023 06:33:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEV-006fSI-2E
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:21 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so8550851fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649198; x=1692253998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=;
        b=zMl0Q6Wo4VQxBOxQpo1rTcZRIWwM309TN6yCpDr/EeJrTnVpUvCkfew3iUmCwJpBBI
         MChHsatOC+ZhTfU2GaboaU02NCWtGr0R7Gbm/BTk/oo1E7nczfHfoN85tuwbxL0uJTEo
         ZaGHg4nLZ4pbZ5BbBxSkikvWi9RcizQXngjyy4DdN1wBLiBT3TIoW3brijqlQs6hlXHE
         7tuvYU4gYApdVRXh2fRnXMsZxuZb7lmL0XjHsLL+pxGon2FmmwvaKEobyZ3mXvtUv8Wv
         jsl+QYF967v94rD1iOqlmd8WDBTfo7YsOmIQLBuxdeAsQz1qI0dhUFzOtv67ghiWnKzw
         2SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649198; x=1692253998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=;
        b=aIvWwlBoCtOqqSziZ67u9Z0jmdMnRe+nHGvJ7mtR+DB3LW/p/yhEBxwML9kDnQzIYM
         0vozT7Ri7lNkv0odOBCzEEFUyxHzJNZ/V3r1/08hSFHtiFCzLt4Ri1M1F0Ucx9fU1B1y
         hVn8vebKsE+VfVLjkC66PVjg5iA9qG7DMjrUCfBI3xNyPGat7ZrI4eRgONrW2vJST+Le
         JF48lyXRyd/wvide7CJTf4aD66CrdVJ3kHY2ZgPjgFnsvRbM+0HdhtzFtA5ArvF5gb2X
         ju+VjJEAMUx3UG+iRtNYm53CJb0LZYbHB4dLgYVAb0fKTzzld6ytN4TnH+Hs9yr8fnct
         j1zA==
X-Gm-Message-State: AOJu0YyWBof6MSdNCJ2I3wYdnHEmEH72lj4Cevik4W4bEbdM90z3bWn+
	iM2rKuYesZPvMQdWwtoB/hrAfw==
X-Google-Smtp-Source: AGHT+IFqfz82dC6HvQTaxglBx3yT9S64xVlc1ywkXQiWNswPweX3dARtW7q3pPyLGsgAYz8OCa/Z+A==
X-Received: by 2002:a2e:9a84:0:b0:2b6:df71:cff1 with SMTP id p4-20020a2e9a84000000b002b6df71cff1mr1059849lji.52.1691649198267;
        Wed, 09 Aug 2023 23:33:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:17 -0700 (PDT)
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
Subject: [PATCH v2 07/11] ASoC: samsung: odroid: use of_property_present to check for property
Date: Thu, 10 Aug 2023 08:32:55 +0200
Message-Id: <20230810063300.20151-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233319_733657_44B4A196 
X-CRM114-Status: GOOD (  13.54  )
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

"samsung,audio-widgets" and "samsung,audio-routing" are not boolean
properties, thus more appropriate is to use of_property_present() to
check if they are present.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/odroid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index a5442592bde4..1743bd55ba1a 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -223,14 +223,14 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (of_property_read_bool(dev->of_node, "samsung,audio-widgets")) {
+	if (of_property_present(dev->of_node, "samsung,audio-widgets")) {
 		ret = snd_soc_of_parse_audio_simple_widgets(card,
 						"samsung,audio-widgets");
 		if (ret < 0)
 			return ret;
 	}
 
-	if (of_property_read_bool(dev->of_node, "samsung,audio-routing")) {
+	if (of_property_present(dev->of_node, "samsung,audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(card,
 						"samsung,audio-routing");
 		if (ret < 0)
-- 
2.34.1


