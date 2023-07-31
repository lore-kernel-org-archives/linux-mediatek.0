Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B89FC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vd2V8E3DB7z7kEvHV823551js9h9Apx/nKUpTAbbk0=; b=Q8fFNH69zEqQ4DjXcJNoGBM0Y4
	fI2KEAUjXAjw3qg94+vVQWZeuqagj+sUB6V7mHXRC5M2r4IZTVkzbWOQGj85QEXaTeJf9nS3o4/Op
	Z/rRbsZU6X6F77SvhnaTYMJGXMd6ixRp0ppDoVIR6DbyA6DKm9Wh6hbnP428NbNElObQ7GDGz77kX
	1RnH/aCumRrAziNgL34xmCQZ3bsnVOYpfRW6xdG9rRsR10GC8KGvHb+vO4Fr+q3xsWVn78rSNizFb
	4oxQsqeVIyCi0Icv671fdjc7mxYbhnQ8KDBBcr3tDDJFaPJhNQYSImWB60CMXlogwH4ZvVPwZ/MY/
	FszEYk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRL-00Enuu-0c;
	Mon, 31 Jul 2023 09:43:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPR0-00Endz-24
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:29 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bcc0adab4so686070366b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796602; x=1691401402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vd2V8E3DB7z7kEvHV823551js9h9Apx/nKUpTAbbk0=;
        b=cVfLolvoYQFivQtun6RFjLWCxlxVEXn4VFabZs/4FJ357EbhrsHgVX9Sxi6T9gMYYS
         eyn/2o6gLXNpLk7pu0Hyc+kiXAA/1WqneNKhJo3fTb2QJ48tykBm3CEJygbTAAtyOJpO
         LKaNyPtg/44/gJJ/pgQVxajd4jDKTqOUeOtV/oR13z2aQ6jQl/VFTR+o99HNg/7nqZqI
         ASN5wVEIJGYtbU8l799jjI/+q1y7WcxjAi1iKiCB/oRHa75zbfwpS+W3iWxZ2qv7/1yx
         iuEiJsyHYWnf43/269BrkcDjxyReyKVi+YpxnCvwQqlwDwwuzO/WhTATgrXB4UmN81BK
         eOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796602; x=1691401402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Vd2V8E3DB7z7kEvHV823551js9h9Apx/nKUpTAbbk0=;
        b=bjA2RjXdYogyQMwrPQY3W01vzhPZuDA9cyT07VFQGAQelaB3xIhyDnYn9IsxgVEnSI
         MJNM8TTeX2wRAaXOjwzqYKV/aRDid41eoKCFcgWG1cmblzhRx6HKm58B0Eg7HNbAsL+j
         EqInw15bq7wbeWLqFIkvfqm3Fl/clqOO39SRje9MhAXmb2ir3fsiVooQS+7+/HAanOca
         RIu2FGLyNiVXPYaZY3y6nmPXuVsyqQvo0/nr/2oPLSxTCCEr8C/84Mtkz2HHrf2hMZ0y
         M1iS0FoYFjJNOmG1AoEOgX2lL0cBmVkEZBzkFlgBf7a+jHZmCicSumuBkOuUaJywDqjr
         SIpg==
X-Gm-Message-State: ABy/qLbIiIizJIBN7O3XxMBdYoOONMtBXNaj1mNZA+5dZg33VZPybwap
	dtyvWSdDEw4iGDmHysGUOpEzjA==
X-Google-Smtp-Source: APBJJlHDwXOgJtQLI73QXcvqo/WffZBIS9gmKGKdfzbOS8PNioPjtmvyx8qIi4hFsHUaY2kjvho8ig==
X-Received: by 2002:a17:906:8a63:b0:993:da87:1c7b with SMTP id hy3-20020a1709068a6300b00993da871c7bmr6154064ejc.10.1690796602231;
        Mon, 31 Jul 2023 02:43:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:21 -0700 (PDT)
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
Subject: [PATCH 04/12] ASoC: dt-bindings: samsung,aries-wm8994: use common sound card
Date: Mon, 31 Jul 2023 11:42:55 +0200
Message-Id: <20230731094303.185067-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024326_734622_0B3B37B7 
X-CRM114-Status: GOOD (  11.18  )
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


