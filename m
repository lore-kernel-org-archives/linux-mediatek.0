Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E8C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wru1VW4ElNQWwbcOi9qEWUoTt9rJrkxi91n6SS30Eys=; b=XFDZQhv0aFQU0gBvg6AQboVv/+
	PAgRmB1bR6p3gWZrqr3OAqgUzVOcSmSFgyreOw0k1894+tVMem+eQ9KSldPrUI5vKa4hkFFnrCny2
	+mU3sZjZVr8p9k/MAJ9+0m8kHN8pgIyxr/POF39QH/vRsvz0oFy+KGvXW+2S8w8F4j685d7UXovwD
	k2r/Zl6KD40u1mIFDEkd/4PGwAPf//qX61UjuPMNYUwE4EE+qICyTm4CXkgjWS3qMI1k06E/o7W+c
	yytgteD2KvU/3GpdX15eLHTLOSo29rsWpPw/xBgNeAzxVi32YBLCceBzpz1e9QJVrO9XhN8u5fgZN
	CC7myr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRK-00Enud-2t;
	Mon, 31 Jul 2023 09:43:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPR0-00Enfv-24
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c1c66876aso67195466b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796605; x=1691401405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wru1VW4ElNQWwbcOi9qEWUoTt9rJrkxi91n6SS30Eys=;
        b=cQcWGSDwLdxq6R599X8W8DBqRHuUQ8TLEqRJdVpH+ad9PFCr2UnbMtcYleek6ZoOCI
         FVRgDKR2kHfjVYGCLkcl/rAZAB22kuyPcohETwQdscluc5L9m05Jff7UIqxl5a1qyQcb
         x7uikvpX2QobNa8Vem/M/kyHaCVV0ietA89zOVLby2150vsXNHLnCqtl3Nt4cQat43Oi
         8weD//QJ47qnCd2XAIV6nxsKkjeO4rynyJnz3TYOg1INHmHjLs1+rauPrfuvxY/rdY7x
         QMSjMpmzmchtdKaS/mVJwQNk/0wMuEP7pvgeaIII9ibFlpr3OhRiz4yW/S9tJuPIuvuQ
         WDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796605; x=1691401405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wru1VW4ElNQWwbcOi9qEWUoTt9rJrkxi91n6SS30Eys=;
        b=cEkhPi56cwXc5/Ojohl6Xg6EK3XkDH/VZ6t5b99y3Q7CjLTO/86KGHabj0BAJZjaPk
         djJB+8OjwA1y50T7HM5RyYZqid4aKRVDdkdPE9IlS6upA4eHHfJAznphhPnLrOaJaCyK
         eheCZ+kxs67wDpegxEI62pCDpZdrSxciJmHvVd3/kHyVLSdoZiVV48jdy2ikHFgs7Rai
         YdargB5T6Znkc7sc8swvGzoXSqQazBx4oUwmUhawxyiDPk0n31/k07tBUWuhadGvcKkO
         s5ObhycWhA0CvM6MRRYrLl1+HUjSB7Q4NWi4VEYP8Z1Tb9WcZ9HmJ6ChDq1oceOrRBfY
         OrmA==
X-Gm-Message-State: ABy/qLYRFFs1f02Uc/Kv4hxDC+TOnwim1JFtZO7yz9+0SOBu6ornVH5H
	iHEtaEcj/6mOgCcFVsPad7lJew==
X-Google-Smtp-Source: APBJJlFAH+HzXe9+VU+AK4McGXrg3AZIuVNaeiawk99F4JSYDsrh1HQUKcYS9HIu77uxpXdoyHV5Sw==
X-Received: by 2002:a17:906:7397:b0:99b:6c47:1145 with SMTP id f23-20020a170906739700b0099b6c471145mr6069053ejl.32.1690796605096;
        Mon, 31 Jul 2023 02:43:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:24 -0700 (PDT)
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
Subject: [PATCH 05/12] ASoC: dt-bindings: samsung,midas-audio: use common sound card
Date: Mon, 31 Jul 2023 11:42:56 +0200
Message-Id: <20230731094303.185067-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024326_712657_13973513 
X-CRM114-Status: GOOD (  11.08  )
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


