Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF52C001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYTzTb8UrxRc66FImFP9rRfhwslszsfgsuSxr/7YLlU=; b=mpDrZulp0yNMbN9mxkxO++4SxN
	f2tWbbngrsK+w+7Ns9X54wYJD2drIPEXQjoDTjB8f+Msm3yWFVPE6dGdLbz7qAGBzOpozyGESRjc0
	ftv8qYS6rhNU+KLgdP8iePfgcu6BCSW2M1aYHxmqe1LpJxSzlbGD1C2E65nWP4MfiLJwCw2RmeYen
	qs0WDXwG1H9Gud9Gfgqd3cg1X3K0+6dK/jUdljcykXmT/bI8LjFCmhpDFDVVc+Pl3fM5Aflqx9t/T
	ThatRaRNkwHLBzEmAt54q/WwltinDB1eBg9KUdOE/M1tVhtj6vL2rsuUd7E9snl4pMXmrRCQpIcZL
	rKoEyqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEV-006fSj-0f;
	Thu, 10 Aug 2023 06:33:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEO-006fN3-1h
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe2ba3e260so4693125e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649191; x=1692253991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYTzTb8UrxRc66FImFP9rRfhwslszsfgsuSxr/7YLlU=;
        b=XVBoF8/yUIY8PYBHbJ0Z7j3ZbEFoK9XkPKGih+mU3xS6CHBVaV+E0rs9k7VHhJNUqY
         woMLWZioH8QrrAqWcuFhR9m5Vu0Iq8ia7WIu7aVeqrcjYHU2WD48Hz4jAjqaHVTBvejV
         gpaUjTWl2Fnuyq4TyzmmTDFvks/qHg6YwnFTwFmuQLKbLhwrkf5EUQ9F5chIaUg5yj4G
         LdyaY3nW5radp2afOmQ388Arp2Km9PsKOFERYVJcnhs6gccUF7rMee8rqyenPJ4yiOnU
         3MWV60QVUcPvc4ieNtbGjzC8Ga6jPurlMbqxkTSkixHbUqV75zBWK+bc7IN4+fcp4Q72
         S1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649191; x=1692253991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYTzTb8UrxRc66FImFP9rRfhwslszsfgsuSxr/7YLlU=;
        b=iZfLOeYGIoVurt1ao1tqW9h2MuS3JweK84+4qv0dTd+rU9BVXmSZ0r8Njz3EU3VuMR
         lvEytM6x1cHz6qtiP/x/N5I9gr7/4avBzSC9KA+vm+9vkpGrRdr5+JF4fvhbrhfD1Jdn
         T3+oUbve4UuxsARUfZGHOHdfzyXLfx3w3CY8aLW0fO4JKPP7xjrWO7iA0DFNVqsQ4dzL
         bKxCJpyc/5mzPo2su8XOJUIJfWzJcn6VfBKy2mSg5ahLl36qg6V4U08AjRCTsgZbjLC3
         Vy9mkxHtvpPk4miitA2Rlx158BIKeX/+BTvnQmYxGTer+fku+Ozh3xnsnG1fidR9w90B
         +y0A==
X-Gm-Message-State: AOJu0YyyheZKb6G0t3/fydkf72V/UDv288akFoDd4yuVqhvLeRyEMicg
	95EBZCpnBvCJynJPc61x87LbJA==
X-Google-Smtp-Source: AGHT+IEqJ1GJ3dbmjoju3DRXle+Ph5P/SXAKqQihojhMe01unHEJ1z2+BYJ7yRiSfY0mY+2UQE9aOA==
X-Received: by 2002:a05:600c:213:b0:3fa:934c:8356 with SMTP id 19-20020a05600c021300b003fa934c8356mr1122754wmi.10.1691649191009;
        Wed, 09 Aug 2023 23:33:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:10 -0700 (PDT)
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
Subject: [PATCH v2 04/11] ASoC: dt-bindings: samsung,midas-audio: use common sound card
Date: Thu, 10 Aug 2023 08:32:52 +0200
Message-Id: <20230810063300.20151-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233312_564153_311B9588 
X-CRM114-Status: GOOD (  10.80  )
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
 .../bindings/sound/samsung,midas-audio.yaml      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 31095913e330..6ec80f529d84 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -9,14 +9,13 @@ title: Samsung Midas audio complex with WM1811 codec
 maintainers:
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     const: samsung,midas-audio
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: The user-visible name of this sound complex.
-
   cpu:
     type: object
     additionalProperties: false
@@ -38,6 +37,7 @@ properties:
       - sound-dai
 
   samsung,audio-routing:
+    deprecated: true
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     description: |
       List of the connections between audio components; each entry is
@@ -45,6 +45,7 @@ properties:
       being the connection's source; valid names for sources and sinks are
       the WM1811's pins (as documented in its binding), and the jacks
       on the board: HP, SPK, Main Mic, Sub Mic, Headset Mic.
+      Deprecated, use audio-routing.
 
   mic-bias-supply:
     description: Supply for the micbias on the Main microphone
@@ -62,14 +63,13 @@ properties:
 
 required:
   - compatible
-  - model
   - cpu
   - codec
-  - samsung,audio-routing
+  - audio-routing
   - mic-bias-supply
   - submic-bias-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -84,7 +84,7 @@ examples:
         mic-bias-supply = <&mic_bias_reg>;
         submic-bias-supply = <&submic_bias_reg>;
 
-        samsung,audio-routing =
+        audio-routing =
                 "HP", "HPOUT1L",
                 "HP", "HPOUT1R",
 
-- 
2.34.1


