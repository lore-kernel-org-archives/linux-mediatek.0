Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2975C04E69
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+hlC8d67YmntwV4mHtT3ZdGF2DLfbF3GgSUytsMD/g=; b=M0tbn2NiXLj+2U3PwhsnkeEMGw
	znMGOMvZRSw6vyxXsC7xyBwxQxeaXt4xW1RvMjvqr2aseo30DPcPFAtiBj/y6NOJ3fhq0uCv9nynr
	VotGc6e0Ys1syh32Di69N5gJ9SxNhP80vo2MZTymRMPnUo332kqvXARezwIkF6SZYiP3Cwefctt20
	aVUdsc7fOy3shl8DFpH37eSmNNGiTO2kihFz6mnOPpt1RhEtcLmlTvSZ/XWSWAWW/jdRqREz6Yu/g
	B3JudCJiaEzRy7cSfUjSw0K+rtOGpL1+rdRH+TW6I8YtoPKteWZYFpYPH251Jk/QrapTuIj84Uzyy
	8jYliO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEV-006fSw-1p;
	Thu, 10 Aug 2023 06:33:19 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEO-006fMM-2M
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe7e1ef45dso775791e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649189; x=1692253989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+hlC8d67YmntwV4mHtT3ZdGF2DLfbF3GgSUytsMD/g=;
        b=crE5DJCi/45bcCANTTjlEfON6RKdtpo+VtOBUUEQ1imOZ4MoBn4AbHHCxCSY789Gqy
         DaG1wpNWkKHV6Efqw2W1gFB9RwoWWWTKWi8EVK8SBE6ZCOlfsFh0SL4mO8NI1xkk/Vbr
         jPaiBQpcwxcSRqZXjBgVF0X1LnGlyiIEKYKywgwrrnKacEu4eee23jO8es1PsxhqnbjS
         VBiknW8jM8bc2Xf8KPRZtiztqMQuBa9cAo7+1l9qdMH/mFnC3OgPhe5Y/a7jatebr/TA
         JY2V16taZADsBWs8Jcqm7u0z5Tl32sHkP4OetKecvumukU3dvjuJl0UoFBdDPhx/m/mN
         YWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649189; x=1692253989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+hlC8d67YmntwV4mHtT3ZdGF2DLfbF3GgSUytsMD/g=;
        b=CtBNiP9tmN3YvPtBuIhnkjzkurc45T7KaDqv7aFbgsycR2I/lSu0hK8BCr7ghEYnmr
         DKfO2N9YXh7NaTDshS8hdte8gT7oHTKPZaVZw/9B8RW0xXPOEWBKb8SdYt0tA68+5jMv
         kjBc6uebTN5Rm6yz+zqo+PlTaVPkrlf1HAqeftDfsAm5YEgqOeKRP6E3DaSdtidd9ypK
         FfbeJvehePY69XlhDZJjPwZBe3RDmyt+j2e0LfbVNGRrh5fc7iSZzXYTbW8x6UwFq6lM
         uwNqaN+BxzTqcQMKfYgeq4Wc+o6dmrGpOEofJKFk+lFyfT/4t3noeUXomxdb7AadDK2k
         ZxtA==
X-Gm-Message-State: AOJu0YwXFcq623LVjkk9gHJkIrFLlMo/4WPlY6LCKfeRKQL3BXZJ9NfA
	DS/hPI9j0krh9yVZMrr7uN79hw==
X-Google-Smtp-Source: AGHT+IErGy790Xkb6/KzdX9Bvv40e18+/V59YRvZrbqtUlAQog8GWO8fIcwIyb/Yl5HGLGY7G2ICtw==
X-Received: by 2002:a05:6512:3483:b0:4fe:347c:874b with SMTP id v3-20020a056512348300b004fe347c874bmr907453lfr.8.1691649188761;
        Wed, 09 Aug 2023 23:33:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:08 -0700 (PDT)
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
Subject: [PATCH v2 03/11] ASoC: dt-bindings: samsung,aries-wm8994: use common sound card
Date: Thu, 10 Aug 2023 08:32:51 +0200
Message-Id: <20230810063300.20151-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233312_786655_A66C97BC 
X-CRM114-Status: GOOD (  11.00  )
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
 .../bindings/sound/samsung,aries-wm8994.yaml     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
index 447e013f6e17..5ea0819a261a 100644
--- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
@@ -9,6 +9,9 @@ title: Samsung Aries audio complex with WM8994 codec
 maintainers:
   - Jonathan Bakker <xc-racer2@live.ca>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -17,10 +20,6 @@ properties:
       # Without FM radio and modem slave
       - samsung,fascinate4g-wm8994
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: The user-visible name of this sound complex.
-
   cpu:
     type: object
     additionalProperties: false
@@ -46,6 +45,7 @@ properties:
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    deprecated: true
     description: |
       List of the connections between audio
       components;  each entry is a pair of strings, the first being the
@@ -56,6 +56,7 @@ properties:
       or FM In
       For samsung,fascinate4g-wm8994: HP, SPK, RCV, LINE, Main Mic,
       or HeadsetMic
+      Deprecated, use audio-routing.
 
   extcon:
     description: Extcon phandle for dock detection
@@ -87,10 +88,9 @@ properties:
 
 required:
   - compatible
-  - model
   - cpu
   - codec
-  - samsung,audio-routing
+  - audio-routing
   - extcon
   - main-micbias-supply
   - headset-micbias-supply
@@ -98,7 +98,7 @@ required:
   - headset-detect-gpios
   - headset-key-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -121,7 +121,7 @@ examples:
         headset-detect-gpios = <&gph0 6 GPIO_ACTIVE_HIGH>;
         headset-key-gpios = <&gph3 6 GPIO_ACTIVE_HIGH>;
 
-        samsung,audio-routing =
+        audio-routing =
             "HP", "HPOUT1L",
             "HP", "HPOUT1R",
 
-- 
2.34.1


