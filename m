Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF7CC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 14:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OzBwVNVcuw97NSLMRu+l5m89xmv/7oQltEZIuBb21aY=; b=g2mzja7KiavprjXFElAIKzzIYL
	QPBCSImP6WczHAmf/xQS6NsAuWNgTGZ9+GvmRN/MUwg3yMx7bedo2m2N5lKJnjq3tNaIWiDhozGbV
	vY6QeKllPzhwEEgsrgqnraVSSdxuxMnC46LDI16qGUhaODfTbpxIAkNwuHL1KPWnyWvgryXI29X+E
	+WhQrBd5dMjlZr2tNJXWTvqnneajq8xfyHdmVuxEqSpASkP3YJdXqCwmigDuxgW4NAivtJYLFYIdN
	xqZbqOwTvfNfiWVtW1T07sf15oVsXAHkTzCGQCpdIZGLbg3t0yiuPND+/4GzprN8F9nHEYs3R2QNA
	9S61zgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQVMj-006ms7-LJ; Tue, 23 Aug 2022 14:58:53 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQVLN-006lkY-C5; Tue, 23 Aug 2022 14:57:31 +0000
Received: by mail-oi1-f177.google.com with SMTP id r124so768353oig.11;
        Tue, 23 Aug 2022 07:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=OzBwVNVcuw97NSLMRu+l5m89xmv/7oQltEZIuBb21aY=;
        b=WijYWTHpcvZN32pBsNnjUiYhFJe58Wwgv43kyr2VSO6sBzPfRJ/8BoIENQlA28horn
         +TvOWRHuoIqR/HDY46E2GVuLKel5GxM1IP6lpz6Q27TMz057GDmfNHu+b1xQhzlxfOp/
         XMxK79CtQqERZrB8EYlJLcZIIX5T/VX/k6JZn1HOxKgJ34Aw1qF5PMhnxMZTD91854fA
         tTGv88OQbgALCDby7qooHi//+k1EnIDtyXxW1HtjO+vKJ963pwIZAaYSt7zAeL3F7EdN
         L/HtGiFOYpAGiODpYyX9dLxr7VidlkGDSrAwQxZGAmJZopwVHvz9tbQUGvffvdRjUTlm
         iEEg==
X-Gm-Message-State: ACgBeo1WSHdC0jVGvrPdvLG/WsAPe4PE2KX91V7okhrmj8fozWmLpXeQ
	wj7NHdUvxdytepJjzxTvDA==
X-Google-Smtp-Source: AA6agR7y3yTCXHdaSUcb4hAB7EPibQs1k+VOqbuaUbMd2rNy9+oj283SKmIrjZMP47Ak7vTsrWijeA==
X-Received: by 2002:a05:6808:1a06:b0:343:290e:813e with SMTP id bk6-20020a0568081a0600b00343290e813emr1457530oib.256.1661266646958;
        Tue, 23 Aug 2022 07:57:26 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:57:26 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rohit kumar <rohitkr@codeaurora.org>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Shane Chien <shane.chien@mediatek.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Jonathan Bakker <xc-racer2@live.ca>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ASoC: dt-bindings: Add missing (unevaluated|additional)Properties on child nodes
Date: Tue, 23 Aug 2022 09:56:39 -0500
Message-Id: <20220823145649.3118479-8-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_075729_444850_98877805 
X-CRM114-Status: GOOD (  11.30  )
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

In order to ensure only documented properties are present, node schemas
must have unevaluatedProperties or additionalProperties set to false
(typically).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/amlogic,gx-sound-card.yaml      |  2 ++
 .../bindings/sound/audio-graph-port.yaml           |  2 ++
 .../bindings/sound/google,sc7180-trogdor.yaml      |  4 ++++
 .../devicetree/bindings/sound/imx-audio-card.yaml  |  2 ++
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |  4 ++++
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  6 ++++++
 .../devicetree/bindings/sound/renesas,rsnd.yaml    | 14 ++++++++++++--
 .../bindings/sound/samsung,aries-wm8994.yaml       |  2 ++
 .../bindings/sound/samsung,midas-audio.yaml        |  2 ++
 .../devicetree/bindings/sound/samsung,snow.yaml    |  2 ++
 .../devicetree/bindings/sound/st,stm32-sai.yaml    |  1 +
 11 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index b4b35edcb493..5b8d59245f82 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -40,6 +40,7 @@ properties:
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
+    additionalProperties: false
     description: |-
       dai-link child nodes:
         Container for dai-link level properties and the CODEC sub-nodes.
@@ -63,6 +64,7 @@ patternProperties:
     patternProperties:
       "^codec-[0-9]+$":
         type: object
+        additionalProperties: false
         description: |-
           Codecs:
           dai-link representing backend links should have at least one subnode.
diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 5c368674d11a..c54ca5eb0baa 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -27,6 +27,8 @@ properties:
 patternProperties:
   "^endpoint(@[0-9a-f]+)?":
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
+    unevaluatedProperties: false
+
     properties:
       mclk-fs:
         description: |
diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index 233caa0ade87..67ccddd44489 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -61,6 +61,8 @@ patternProperties:
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             maxItems: 1
@@ -68,6 +70,8 @@ patternProperties:
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index bb3a435722c7..b6f5d486600e 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -58,6 +58,7 @@ patternProperties:
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
+        additionalProperties: false
         properties:
           sound-dai:
             maxItems: 1
@@ -65,6 +66,7 @@ patternProperties:
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
+        additionalProperties: false
         properties:
           sound-dai:
             minItems: 1
diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 4fa179909c62..478be7e3fa29 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -30,6 +30,8 @@ properties:
 
   headset-codec:
     type: object
+    additionalProperties: false
+
     properties:
       sound-dai:
         $ref: /schemas/types.yaml#/definitions/phandle
@@ -38,6 +40,8 @@ properties:
 
   speaker-codecs:
     type: object
+    additionalProperties: false
+
     properties:
       sound-dai:
         minItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e6e27d09783e..a3a4289f713e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -71,6 +71,8 @@ patternProperties:
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             maxItems: 1
@@ -78,6 +80,8 @@ patternProperties:
       platform:
         description: Holds subnode which indicates platform dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             maxItems: 1
@@ -85,6 +89,8 @@ patternProperties:
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             minItems: 1
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index e17c0245f77a..268895c90bd5 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -129,6 +129,8 @@ properties:
     patternProperties:
       "^dvc-[0-1]$":
         type: object
+        additionalProperties: false
+
         properties:
           dmas:
             maxItems: 1
@@ -145,7 +147,7 @@ properties:
     patternProperties:
       "^mix-[0-1]$":
         type: object
-        # no properties
+        additionalProperties: false
     additionalProperties: false
 
   rcar_sound,ctu:
@@ -154,7 +156,7 @@ properties:
     patternProperties:
       "^ctu-[0-7]$":
         type: object
-        # no properties
+        additionalProperties: false
     additionalProperties: false
 
   rcar_sound,src:
@@ -163,6 +165,8 @@ properties:
     patternProperties:
       "^src-[0-9]$":
         type: object
+        additionalProperties: false
+
         properties:
           interrupts:
             maxItems: 1
@@ -186,6 +190,8 @@ properties:
     patternProperties:
       "^ssiu-[0-9]+$":
         type: object
+        additionalProperties: false
+
         properties:
           dmas:
             maxItems: 2
@@ -206,6 +212,8 @@ properties:
     patternProperties:
       "^ssi-[0-9]$":
         type: object
+        additionalProperties: false
+
         properties:
           interrupts:
             maxItems: 1
@@ -243,6 +251,8 @@ properties:
     patternProperties:
       "^dai([0-9]+)?$":
         type: object
+        additionalProperties: false
+
         properties:
           playback:
             $ref: /schemas/types.yaml#/definitions/phandle-array
diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
index a01c4ad929b8..447e013f6e17 100644
--- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
@@ -23,6 +23,7 @@ properties:
 
   cpu:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         minItems: 2
@@ -34,6 +35,7 @@ properties:
       - sound-dai
 
   codec:
+    additionalProperties: false
     type: object
     properties:
       sound-dai:
diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index ec50bcb4af5f..31095913e330 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -19,6 +19,7 @@ properties:
 
   cpu:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         maxItems: 1
@@ -28,6 +29,7 @@ properties:
 
   codec:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/samsung,snow.yaml b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
index 51a83d3c7274..3d49aa4c9be2 100644
--- a/Documentation/devicetree/bindings/sound/samsung,snow.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
@@ -19,6 +19,7 @@ properties:
 
   codec:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         description: List of phandles to the CODEC and HDMI IP nodes.
@@ -30,6 +31,7 @@ properties:
 
   cpu:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         description: Phandle to the Samsung I2S controller.
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index fe2e15504ebc..1a3abc949505 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -60,6 +60,7 @@ required:
 patternProperties:
   "^audio-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: false
     description:
       Two subnodes corresponding to SAI sub-block instances A et B
       can be defined. Subnode can be omitted for unsused sub-block.
-- 
2.34.1


