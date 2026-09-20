Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A89C982CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KogKCVIDydzzLBHYMHz25ygPrnoGlSNxk56qzP4OHdo=; b=jx8+/bYoep6SURq2+oLRPcuSSJ
	YJL/JQz9+0J3rpJxZ6OAb/X7nA2X9/QVC6OEFVnkMWVvEHrJyrk/+sj9P6z0HbI9hDA94sIuzmNdx
	fcmwtf9cAovw7G+dcTjS5pljAdwcFiRo9C4XPw3Yzf7hOz2rUxSfEANp5w4q00+UantLc98fnKgE7
	AS1JPzt5WmwuDEzYtWdhalTbB4CywKTWPTi7HznVXuIbfBxgRdT+h9oP0mk6f9mMSV57bLr8zv3mP
	mO/lKi5MsDf2gTGKqJmtylT7thkxdydHzFLDgb9vsEOXC7hPGV8BBuqIYYKyvNYoLkg1RHOEiwUaT
	40OPWPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89aE-0000000GrsT-1uWJ;
	Sun, 20 Sep 2026 04:55:22 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89aB-0000000GrrK-33r8
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:55:21 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d747ec6188so11900435ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880119; x=1790484919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KogKCVIDydzzLBHYMHz25ygPrnoGlSNxk56qzP4OHdo=;
        b=o1ZGoiD9ldV/0Jt4IPv24VaxgFQZMMT366c51wziuWSYqMGNYutF3d3IS3nhllVvbY
         oh+1b3AaN1ciWsImezQWHupj6VS+z3Yod+BBGgqGEI/H90c9ZRLPxZYnDZDemlEPUaOO
         tkjacgIrcwu096l4cWOtulZZ/9O6bhm1oHQ90BkKT4pIU/H9Xfm4kc1BQRCZQAekjvLg
         7kHGNGfYfl6Z2LG4pEjObw8D6vqB1TkRC2v8QpX3UzAYWbmZ0y34h0vW08CnN8phiyXW
         1yK80zup8MyXIXSjL6IC07oXurdOzDrfIIFYSsye6m0vOsgQ/FIenU6aOgBo4nhzo1PH
         owjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880119; x=1790484919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KogKCVIDydzzLBHYMHz25ygPrnoGlSNxk56qzP4OHdo=;
        b=ZG7xTPurCcLtWPjZXAuv50E4WKMHSvU3OaVa39eFooZMHKiuQ9in89o1pkmztGThIY
         mpii6Fmz4AyaHsV//YDA3i5RcQukVR/0Ldq+x3WjoMxHav1XYiPhBTYwS+7t5shr3wcl
         pqISdQpIbeIzqQV7U4t7nAATOmlviDBVSa3MZnKfkFGinHtndfZxb3ko8qPvIApiQQuU
         FfCf/+ASdBn9c78XiCJJMdNPAiazThm63sm5Bsyeeyy134QP5zjT9l21cMMTE3R+duDG
         ZP6VlArrJNaArcfEXt3t6SKnAU8+T9aBSB5iiua93u3R3dwBVNOtDZjo4drq9E3HIZs4
         yIkA==
X-Forwarded-Encrypted: i=1; AKwUvBz+uFVzi5/LAhGuyHzyc+j149Mt3tHY60IjZ4vr6GgG46prc4YS+zGlQaXzLsuRKYFvAtwo8cOazfGmQ48tSg==@lists.infradead.org
X-Gm-Message-State: AFuF++n03IMmFo9CxHqbYLHCYyHQ3+zck0FYylZYyWQI9oWBWuFcwRPL
	+83AjZ1s7l9HkKtTDYn4MnqYhwy0Qh7CKkMqiAhUTVaYx4sNa1Cxrrz2
X-Gm-Gg: AYBFou2l4U0JGIzxwvT0h6fof+q1LmeprpRVOed+DZAhaXdb1u7923Wz5Dpyi/dVqz5
	8CLQUI2s0Abjh3VURbmvChVU2TZhmbBFcmmYEBco9zKq9qtD7uNPRjk/ejDc2d/a0k9u4VeuvmM
	hJZ0HL5duYXwEDM/wA/D6bz9l3x2od5eEaJ2Ut6/KirafoaHFBwWaX6E3WSFhY1SyFGfsnE54r7
	PmGM7NEVbwI7tUdt9mdZuFvWf8bA76UHtSrUC3AQyfF4y+t8hbu8U7j+RMQSfCy8cx0jYknh/Dv
	tZOF1+nlO6quW/d9Z7aP18S7ZLts0pbtrPh+r3PFaObqyjgYv7S8EYPuCM4tJHYoIvDcdJCoHKl
	8uqZJpOjWtKlZ8KpmHqJfrV8DgK+r1FFLf4stTYaNe7tSOqZ+KCwiYzigkskWnvwtJ1w2vRYRH4
	R0Un7y115DeBGlXulDQQ9xiN93hxZUwQ2mFBj4gcazGtGn1oyhR6cA4elOvPGMGHJFG47s/9cKS
	9RXZw1JCP5m71qtTUaTankzmXWFx5nkJrSC3sXKARUcBzOsbQD6RvkEWBzctro0CGpQARy3YHHK
	hHnMbLIi9pNqjGqB4r5fYU+ls3zxG94uOkKoqWP/DaCP+Tg=
X-Received: by 2002:a17:903:28e:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2ddc10044f8mr51621965ad.55.1789880118819;
        Sat, 19 Sep 2026 21:55:18 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:40 +1000
Subject: [PATCH 01/28] dt-bindings: sound: Add Apple Macs sound peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7900;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RNoeFTf5GkP7c5biu82Rkx8kHDbaSest5BhJxhVEVws=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U3Vq8T/1Q9z8vgxF5Dn9eLdjy47Hzf1L30cT5Hx
 r6Dp1T2d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb6MifDf8+NNp/2Ffd5+ByRn7I7r9qXl/1c7LNftzf3rmDi+JLWfI6R4e/qJI6
 5rgt2Lei4/lPwf9xCnaqcer1lqVkiuu4m71y3MQAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215519_901369_951EB822 
X-CRM114-Status: GOOD (  15.95  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Add binding for Apple Silicon Macs machine-level integration of sound
peripherals.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/apple,macaudio.yaml   | 235 +++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..bd844c9928c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  This binding represents the overall machine-level integration of sound
+  peripherals on Apple Silicon Macs, starting with the M1 series.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - description: First-of-their-kind machines
+        items:
+          - enum:
+              - apple,j180-macaudio
+              - apple,j274-macaudio
+              - apple,j293-macaudio
+              - apple,j313-macaudio
+              - apple,j314-macaudio
+              - apple,j316-macaudio
+              - apple,j375-macaudio
+              - apple,j413-macaudio
+              - apple,j415-macaudio
+              - apple,j473-macaudio
+              - apple,j456-macaudio
+              - apple,j457-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J293
+        items:
+          - enum:
+              - apple,j493-macaudio
+          - const: apple,j293-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J314
+        items:
+          - enum:
+              - apple,j414-macaudio
+              - apple,j504-macaudio
+              - apple,j514-macaudio
+          - const: apple,j314-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J316
+        items:
+          - enum:
+              - apple,j416-macaudio
+              - apple,j516-macaudio
+          - const: apple,j316-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J375
+        items:
+          - enum:
+              - apple,j475-macaudio
+              - apple,j575-macaudio
+          - const: apple,j375-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J413
+        items:
+          - enum:
+              - apple,j613-macaudio
+          - const: apple,j413-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J415
+        items:
+          - enum:
+              - apple,j615-macaudio
+          - const: apple,j415-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J473
+        items:
+          - enum:
+              - apple,j474-macaudio
+          - const: apple,j473-macaudio
+          - const: apple,macaudio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  model:
+    description:
+      Model name for presentation to users
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^dai-link(@[0-9a-f]+)?$":
+    description: |
+      Node for each sound peripheral such as the speaker array, headphones jack,
+      or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      link-name:
+        description: |
+          Name for the peripheral, expecting 'Speaker' or 'Speakers' if this is
+          the speaker array.
+        $ref: /schemas/types.yaml#/definitions/string
+
+      cpu:
+        type: object
+
+        properties:
+          sound-dai:
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+            minItems: 1
+            maxItems: 2
+
+        required:
+          - sound-dai
+
+      codec:
+        type: object
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 8
+            description: |
+              DAI list with the CODEC-side DAIs connected to the above CPU-side
+              DAIs and involved in this sound peripheral.
+
+              The list is in left/right order if applicable. If there are more
+              than one CPU-side DAIs (there can be two), the CODECs must be
+              listed first those connected to the first CPU, then those
+              connected to the second.
+
+              In addition, on some machines with many speaker codecs, the CODECs
+              are listed in this fixed order:
+
+              Four speakers: Left Front, Left Rear, Right Front, Right Rear
+              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
+                            Right Woofer 1, Right Tweeter, Right Woofer 2
+
+        required:
+          - sound-dai
+
+    patternProperties:
+      "^dai-tdm-idle-mode-[0-9]$":
+        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
+
+      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Idle slot mask. A bit being set to 1 indicates
+          that the corresponding TDM slot is inactive/idle.
+
+    required:
+      - reg
+      - cpu
+      - codec
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    mca: mca@9b600000 {
+      compatible = "apple,t6000-mca", "apple,mca";
+      reg = <0x9b600000 0x10000>,
+            <0x9b500000 0x20000>;
+
+      clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
+      power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
+                      <&ps_mca2>, <&ps_mca3>;
+      dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
+             <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
+             <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
+             <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
+      dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
+                  "tx1a", "rx1a", "tx1b", "rx1b",
+                  "tx2a", "rx2a", "tx2b", "rx2b",
+                  "tx3a", "rx3a", "tx3b", "rx3b";
+
+      #sound-dai-cells = <1>;
+    };
+
+    sound {
+      compatible = "apple,j416-macaudio", "apple,j316-macaudio", "apple,macaudio";
+      model = "MacBook Pro J416";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dai-link@0 {
+        reg = <0>;
+        link-name = "Speakers";
+
+        dai-tdm-idle-mode-0 = "zero";
+        dai-tdm-idle-mode-3 = "zero";
+        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+      };
+
+      dai-link@1 {
+        reg = <1>;
+        link-name = "Headphones Jack";
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+      };
+    };

-- 
2.55.0


