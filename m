Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8264CC04E69
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ngd6Ty807KCISUZiupnEhx7DHboutfbdjWWPlaLnOlU=; b=EA6Jwu4uZHZRmPXKOFKlnJ6UfK
	EONtWqDZ6/vs41d4/0jglRsR7EnFr6DhhlyY3z6cUyV/QfuNACk+/WAN/FILGU15RG75PpwXjWJRw
	Jv9X3USPiOKytIDFic4Wkh7DRMWAztaRjR2Xy+gUPEhy5Db2hQryMbE+s+pkrkRDdDwaeQtecxcz5
	AhBhtKdg3y7PVy6M2DkMF+EQ5E1pq6qjhZMXTO2iZJJXF7j1gQ9sQ/aa3o15ul9PEpiqOSHPDB/PO
	HR9etCGgo6xFhfK4Yj2nodQoBkvqMhSEt655/oOQO5Ak4/nPBrLPDdCFuvWEcJDEaW1mUbc4szPFM
	znHgmKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEO-006fNv-2x;
	Thu, 10 Aug 2023 06:33:12 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEK-006fLn-15
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:11 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9b9f0387dso8400811fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649184; x=1692253984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ngd6Ty807KCISUZiupnEhx7DHboutfbdjWWPlaLnOlU=;
        b=x6s6BlUtchliqv3NA5bNBO+uW82+8JEcyL7h04UaYh8Dph1oXrIj9+drohWBK+Zk1/
         BrTtyIpBP72mCoYMwIhRWV4zqasu6ISW2D9+MLt1MgglJu6K8DZy0ZijtTMOtbxOAMNK
         hjtuJ5x8VzPkPdJ/2J1vtWqUK4QRujdPkct7MrnnOHDEHi2q0Cgo2kP6tU1if0c6v0cm
         y+h+Yj5zBcvKS5f0sqhe5ZMaJvOADWVvWmB/jrDF2DQ+nqRgUm0ZtFbc4JZbK/2+E2IQ
         epttvAy+jYTedANUHwXrqUOL6ldq+sx+5AuNxKw8uy/RoXdDym3EMexO7TKPI00Me5x0
         shZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649184; x=1692253984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ngd6Ty807KCISUZiupnEhx7DHboutfbdjWWPlaLnOlU=;
        b=N622rFVjVcXpeIGMCW+SA2Awp8UmrT+xo0IdRKaKBa/iuPvLe1mVnM8WQty20lykuK
         f5c7OGCaA2aDz9AkXclRHRBuUjfiEiBdFf9Mhfi8mUdyFpZj2jc4qW65UFJRTFbFvjE7
         fbKvG0QrtRNBG4IXhdPi1w0zezWuRWuhleeKp1Zg86s3llkiatICapQY0PdYeAiGCuV1
         RZvNn1JnTuCSFJWV2mXThVg06/iboUBdfiAAwsHih9MHnTxEA8KvMaaKn/wzSUndhZ7J
         lsW9g5PcCk9HBMusViFLK9y72shVxWXrOByyRcEZRXiYBQ6JiF4KS9HOTNAglqI8g+JI
         DlLg==
X-Gm-Message-State: AOJu0Yx9DzBj+1pPPqCBli2C6fR27Wo5IJd4jWBWlbswpvAxEq74xL2E
	IQp06JZ/0cfeOKtqvOMuUa20zA==
X-Google-Smtp-Source: AGHT+IFgJ5/x4ZIydWhyjGRPFPyPMjdDWjiVE2eyw8KVk4Os5ZoVtk4fh4iDjqcTGmGwMIXPDWBxmg==
X-Received: by 2002:a2e:9447:0:b0:2b6:fc80:c45f with SMTP id o7-20020a2e9447000000b002b6fc80c45fmr917555ljh.13.1691649184061;
        Wed, 09 Aug 2023 23:33:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:03 -0700 (PDT)
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
Subject: [PATCH v2 01/11] ASoC: dt-bindings: Add common sound card properties
Date: Thu, 10 Aug 2023 08:32:49 +0200
Message-Id: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233308_390267_5C484908 
X-CRM114-Status: GOOD (  16.62  )
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

Almost every board machine / sound cards has "audio-routing" and "model"
properties, so move them to common schema to have only one definition of
these properties.

For amlogic,gx-sound-card, drop the minItems: 2 from the
"audio-routing", because any limit here - lower or upper- is rather
meaningless.  This will also fix `dtbs_check` warnings like:

  meson-gxm-s912-libretech-pc.dtb: sound: audio-routing: ['AU2 INL', 'ACODEC LOLN', 'AU2 INR', 'ACODEC LORN', '7J4-14 LEFT', 'AU2 OUTL', '7J4-11 RIGHT', 'AU2 OUTR'] is too long

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Drop minItems/maxItems from amlogic,gx-sound-card
---
 .../sound/amlogic,axg-sound-card.yaml         | 15 +++--------
 .../bindings/sound/amlogic,gx-sound-card.yaml | 17 +++---------
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 17 +++---------
 .../bindings/sound/google,sc7180-trogdor.yaml | 17 +++---------
 .../sound/google,sc7280-herobrine.yaml        | 17 +++---------
 .../bindings/sound/imx-audio-card.yaml        | 18 +++----------
 .../bindings/sound/sound-card-common.yaml     | 27 +++++++++++++++++++
 7 files changed, 50 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/sound-card-common.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index bf1234550343..5db718e4d0e7 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -9,6 +9,9 @@ title: Amlogic AXG sound card
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     const: amlogic,axg-sound-card
@@ -17,23 +20,12 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: list of auxiliary devices
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
   audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     description:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
@@ -108,7 +100,6 @@ patternProperties:
       - sound-dai
 
 required:
-  - model
   - dai-link-0
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index b358fd601ed3..d4277d342e69 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -9,6 +9,9 @@ title: Amlogic GX sound card
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     items:
@@ -18,14 +21,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: list of auxiliary devices
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    minItems: 2
-    description: |-
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
   audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     minItems: 2
@@ -33,10 +28,6 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
@@ -86,7 +77,7 @@ required:
   - model
   - dai-link-0
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 6df0e03a1d4b..188f38baddec 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -17,6 +17,9 @@ description: |
   such as SAI, MICFIL, .etc through building rpmsg channels between
   Cortex-A and Cortex-M.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -27,10 +30,6 @@ properties:
       - fsl,imx8ulp-rpmsg-audio
       - fsl,imx93-rpmsg-audio
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   clocks:
     items:
       - description: Peripheral clock for register access
@@ -66,13 +65,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle to a node of audio codec
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
   fsl,enable-lpa:
     $ref: /schemas/types.yaml#/definitions/flag
     description: enable low power audio path.
@@ -101,9 +93,8 @@ properties:
 
 required:
   - compatible
-  - model
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index ba5b7728cf33..bac940553965 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -13,23 +13,15 @@ maintainers:
 description:
   This binding describes the SC7180 sound card which uses LPASS for audio.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - google,sc7180-trogdor
       - google,sc7180-coachz
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   "#address-cells":
     const: 1
 
@@ -86,11 +78,10 @@ patternProperties:
 
 required:
   - compatible
-  - model
   - "#address-cells"
   - "#size-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
 
diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
index 0b1a01a4c14e..ec4b6e547ca6 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
@@ -13,22 +13,14 @@ maintainers:
 description:
   This binding describes the SC7280 sound card which uses LPASS for audio.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - google,sc7280-herobrine
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   "#address-cells":
     const: 1
 
@@ -97,11 +89,10 @@ patternProperties:
 
 required:
   - compatible
-  - model
   - "#address-cells"
   - "#size-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
 
diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index b6f5d486600e..f7ad5ea2491e 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -9,23 +9,14 @@ title: NXP i.MX audio sound card.
 maintainers:
   - Shengjiu Wang <shengjiu.wang@nxp.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - fsl,imx-audio-card
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source. Valid names could be power supplies,
-      MicBias of codec and the jacks on the board.
-
 patternProperties:
   ".*-dai-link$":
     description:
@@ -84,9 +75,8 @@ patternProperties:
 
 required:
   - compatible
-  - model
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/sound-card-common.yaml b/Documentation/devicetree/bindings/sound/sound-card-common.yaml
new file mode 100644
index 000000000000..3a941177f684
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sound-card-common.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sound-card-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Board Sound Card Common Properties
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+properties:
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+required:
+  - model
+
+additionalProperties: true
-- 
2.34.1


