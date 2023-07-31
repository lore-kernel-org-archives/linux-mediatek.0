Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAD1C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDlAiDCsa5OyQV1o1rM++WZe4Dne9dcJk7rWwMzlcwg=; b=QkCRXuHwf+vCS0CGNXT5xAWnfz
	M5ZBDgkHcN4kyY7pzI/Tz2hKKdA3C2TtFaRL3mjpqrJOTtIUxCfcu6MXk58/GZ3sm5876dVgvZ+3G
	xwDg8uvQP7AIKzRs9XWreuMbBPcR3rAtbrTotBPUQV2EnKDpJwvfuOGvMNe0qFX/2aJBm9kPVgvCM
	ZbJVSOBC52FEVm5oIfStRdjR7cP0Mwteu8HDGYHmDHwIKsxol/+10TvtkN/TQqlVz+G+JflyJn0eS
	2zqv4wXSxgoNgMA5MfWIqT9sAHl3xFfQ2p8BDuMOnv+SF+aakHdOhFE5ubCRw/uqXvTXOXihcBbxU
	U+8/B/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRV-00Eo0c-19;
	Mon, 31 Jul 2023 09:43:57 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPR6-00Enko-0X
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:33 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98377c5d53eso610443566b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796611; x=1691401411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDlAiDCsa5OyQV1o1rM++WZe4Dne9dcJk7rWwMzlcwg=;
        b=uoOLAF+GuBMic8HTce18DnIFS64ebzdbM2EqcooL5fF8d9NfvcCA2EsZ9DH2ZW+2vq
         JAp06pifF/KwIrU7D2KX8hkW4YFSelrfKCthdZrMTpunL77cpbWyXm7pOLULH0GbcxsX
         xiGijdmOXAIqny29Ln1PeOYEQvyoBdFfNos/61um7aaWB8N4/9CaNnAQ+vDzK86Ca0+i
         8xVL7FLjTyEhrNWZ6/XSYwCLys8HXLJzXe9pUTeonmVyQjCleDAUC2I8tt4UfyKx/WJh
         RPgBvG90IsjMLgdDH68+yzCieqA443GpBQOUDy+dJbCx0b2NhnHhyMdTyccm7P4UxJRt
         7VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796611; x=1691401411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDlAiDCsa5OyQV1o1rM++WZe4Dne9dcJk7rWwMzlcwg=;
        b=hKXJRHppjhwrKYSxomDqnQBNDHEZpUpmNF6OnYk84RBbOGXiLvAs60FCTy7jQaQi72
         Jl5kpp7suXFOnXB50J7KCZdE2ShG9rg+rWp+a+sTJ/NwQMoPVahIi+2As5La6FrKBDcC
         LYH7E932fKw1KudTZY5FgNIvYTYQZ0nTPQro85PZlaPDB8dppCw9c5Bqf4xHgkhkc50j
         bVvbAT5dkmubHN1kDNkVIcNYWrEfTA7G/cN/G/29JIp0AX1nsiYFzaurhzuM+1aARBZ5
         jYhbqKMDYdTXuPa0/Nv6ZK9i0tM+x4+T14DijLwIVlb9nnpVV59oThjtUh50oDuAIGZw
         4+wA==
X-Gm-Message-State: ABy/qLabBExbVVeH1s5/9msLAsmc5PZP4OJLChIXrXbg/YIiDtsEo7fu
	9Xpnjd/Z+vfg0FtX5SZBuRmpkg==
X-Google-Smtp-Source: APBJJlHPZE8l2UiavjYohAlal1BncG7+low027lOhN5gE0MMRSv0AOJLmfRkvZE/XcvYn+EHfGTb/A==
X-Received: by 2002:a17:907:2c77:b0:993:d75b:63ea with SMTP id ib23-20020a1709072c7700b00993d75b63eamr5408717ejc.16.1690796610988;
        Mon, 31 Jul 2023 02:43:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:30 -0700 (PDT)
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
Subject: [PATCH 07/12] ASoC: dt-bindings: samsung,tm2: use common sound card
Date: Mon, 31 Jul 2023 11:42:58 +0200
Message-Id: <20230731094303.185067-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024332_203775_203C090E 
X-CRM114-Status: GOOD (  11.60  )
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

Reference the common sound card properties and deprecate the
custom "samsung,audio-routing" in favor of generic one.  This allows to
remove "model" property and make the binding closer to other sounds
cards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/samsung,tm2.yaml   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
index 491e08019c04..760592599143 100644
--- a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     const: samsung,tm2-audio
@@ -32,6 +35,8 @@ properties:
       being the connection's source; valid names for sources and sinks are the
       WM5110's and MAX98504's pins and the jacks on the board: HP, SPK, Main
       Mic, Sub Mic, Third Mic, Headset Mic.
+      Deprecated, use audio-routing.
+    deprecated: true
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
 
   i2s-controller:
@@ -44,20 +49,15 @@ properties:
   mic-bias-gpios:
     description: GPIO pin that enables the Main Mic bias regulator.
 
-  model:
-    description: The user-visible name of this sound complex.
-    $ref: /schemas/types.yaml#/definitions/string
-
 required:
   - compatible
   - audio-amplifier
   - audio-codec
-  - samsung,audio-routing
+  - audio-routing
   - i2s-controller
   - mic-bias-gpios
-  - model
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -70,7 +70,7 @@ examples:
         audio-amplifier = <&max98504>;
         mic-bias-gpios = <&gpr3 2 GPIO_ACTIVE_HIGH>;
         model = "wm5110";
-        samsung,audio-routing = "HP", "HPOUT1L",
+        audio-routing = "HP", "HPOUT1L",
                                 "HP", "HPOUT1R",
                                 "SPK", "SPKOUT",
                                 "SPKOUT", "HPOUT2L",
-- 
2.34.1


