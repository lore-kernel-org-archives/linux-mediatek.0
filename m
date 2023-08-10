Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE2EC04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSd9+dSCMBHcEUNxg9MGXggi9cWLvGAB+LtJE315jeE=; b=dMGZ/Qpk8aGKWwOr4fMhpAPnCR
	yZUF+twC1Qah8zwt5LMZRc4xf3bFsfPtduJykVpoSSw7E9pvp7yfGFxu2iVUlpT4fO3zZ1cv62pgZ
	KF4QZuMNzA7KC2+d2ziHS7ZxSUeIBurXB80XIfrUSAulwrAWoiG5KNpASAUmHDCF+YAv4/x4Qw4Vt
	oUPDTUsiUoato83Wh30VqajBu8EKl0iIwwn4kweUNiPRZ6eGM2Uc1zKnpqN7cGAhXp1UnAMy+pomM
	2lgoWifeBFutGEcv+z8auHNYnUIjHbf5CYM4M+9MfueJV78BmEL6UOtw3PNuP2oX0HnifW13xRemX
	2xL1vrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEa-006fXA-0N;
	Thu, 10 Aug 2023 06:33:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzET-006fOf-0D
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe4b45a336so4506975e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649193; x=1692253993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSd9+dSCMBHcEUNxg9MGXggi9cWLvGAB+LtJE315jeE=;
        b=mRr+gxVpp7pg8jiFsl0EUQi5k0c8YNKWhwr6kNOBuPuxwnKM5eZyhgXsxqDAbhRuoA
         PTWTEzAVio/vIkXOYyPEdBPSDhIgUOcWOeoZWEizWD16j9Ab7f6v3priEedUhIdxLxY0
         dukP7frX7T5QWOyLE6qZRj74zajXX9XcaRvpNY2gGNCJv69kWiQG8FAglIq1J0ovIaCW
         3WrUgKDYi7t9i+rceE/UMbW9R9MzrzADAIVpM73fHvDZiSVDHTx6Nt9xr1yG8A25FIgh
         1zj+Quf8e/cz4H6+Fv0UtOrSTXcqmfQlOrCUIwG/BQl4xzGvqT4K7AoasOrss9AoIHPo
         DwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649193; x=1692253993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSd9+dSCMBHcEUNxg9MGXggi9cWLvGAB+LtJE315jeE=;
        b=TRaU0NFu6dIwk9r7E1Nykb5Huv1Rko6epVpW5WG9p/9h/9zha/hRWP6Pz9Ap+uHIaG
         4oI06W6Jgsooq/k7w29pc33GTNKUPtOQX33jrgyVYsvRa6wkEojAtkeEfriWolSEKv+3
         A7eLw8lbLQty00JLwamH1AtfPfhdG3cqCwUcHlsrMiOK5PqZA6yActnPlMPlMKufffDB
         8BH8FaHbe7OYlKjXMYAcGbyXbnu4+nRb2e+OVrMy8Zf+m8MZEWfLYSnNFkKYY5vqRkUa
         CpLMVtI3y48XgIlNXAOBVSb2cIYH+2RZmkkjDd6htEaP+5vsPMT1pCpj4m9C4D8Lfgbl
         pheA==
X-Gm-Message-State: AOJu0YxuLOy/gA0CLExLceut/Q8gTWItjRrBA/un1i8G8jcmcFok5U7M
	I5dwiecckfYgJYgx0rV/WGO3/A==
X-Google-Smtp-Source: AGHT+IEZxYb1FxIKEtJBlNcisBGSSmO94qeg2OhCBYD6jauaU1qMUChlV2aymQyGQ4CtlQKgGbb+cg==
X-Received: by 2002:a05:600c:3654:b0:3fb:403d:90c0 with SMTP id y20-20020a05600c365400b003fb403d90c0mr1018356wmq.39.1691649193448;
        Wed, 09 Aug 2023 23:33:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:12 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 05/11] ASoC: dt-bindings: samsung,odroid: use common sound card
Date: Thu, 10 Aug 2023 08:32:53 +0200
Message-Id: <20230810063300.20151-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233317_129857_E7F2950E 
X-CRM114-Status: GOOD (  10.01  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/samsung,odroid.yaml  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
index c6751c40e63f..b77284e3e26a 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -24,10 +27,6 @@ properties:
       - const: samsung,odroid-xu4-audio
         deprecated: true
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: The user-visible name of this sound complex.
-
   assigned-clock-parents: true
   assigned-clock-rates: true
   assigned-clocks: true
@@ -52,6 +51,7 @@ properties:
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    deprecated: true
     description: |
       List of the connections between audio
       components;  each entry is a pair of strings, the first being the
@@ -61,6 +61,7 @@ properties:
       For Odroid X2: "Headphone Jack", "Mic Jack", "DMIC"
       For Odroid U3, XU3: "Headphone Jack", "Speakers"
       For Odroid XU4: no entries
+      Deprecated, use audio-routing.
 
   samsung,audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -70,18 +71,17 @@ properties:
 
 required:
   - compatible
-  - model
   - cpu
   - codec
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sound {
         compatible = "hardkernel,odroid-xu3-audio";
         model = "Odroid-XU3";
-        samsung,audio-routing =
+        audio-routing =
                 "Headphone Jack", "HPL",
                 "Headphone Jack", "HPR",
                 "IN1", "Mic Jack",
-- 
2.34.1


