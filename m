Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A5FC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Apr 2024 03:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DqTFUStUgUgHwhHTzA1wLZlhW+xV4wEDyDdTFLtabz0=; b=CYMsJxQJwM/+ctlePT6iFUmqGZ
	3S8Iii6dG6mgl31xnzTM+KMQJBTDZffzxtxzim+dC5DSDCnXH5nnJ6QJ/uRvUXy8YQxFbNyr6dZaB
	toYf0E4R03NGZm9jwbZGgBsyPr3lZh9yUph/8Ss2sUMyjK0N52086JD6uzR4QtQXIu5VlO6XDPoeq
	49zePJF0GTbR+nQc+78r9RwNwpaDWFQaqgKe9ws9OLEFbY2n80AqK5N/wanPuuHGXDUHICapE8PiT
	rJ+RtvH4FUMcGwWSgTfTlNilo4RAPF2ljP7v0ZG8cN3Xtl9QqSw5eMp0OYeczajEGwx18KgcEsdF4
	G3Uzpcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryNz2-00000009kfH-25Pi;
	Sun, 21 Apr 2024 03:35:16 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryNz0-00000009keS-0M9H
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Apr 2024 03:35:15 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c74c76b142so963216b6e.3
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Apr 2024 20:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713670512; x=1714275312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqTFUStUgUgHwhHTzA1wLZlhW+xV4wEDyDdTFLtabz0=;
        b=ECJLitISZWAbnPBvApepEfYIJAW26SHfNmEWtCmffXu6Tip0ZiZ5yL69litn7eR08G
         slOx4jS/fym1AeZ06fATetduiLKdTgOeIWeTOZL0w23yYkruojDgDQ6yhcO8yQOtx0EA
         Bb6gOTDYn7FxB8AqM6iDLbFeydd1TF653U9r9HNyGE7JjEKiCionWwY4XN4gKhhRK/1J
         7jq8itT4v4j4AyS1pP5dR+3QCRAX79ukTDvUY4Gb4Glz+fctIkePVfHxcHsDRAPjhzS7
         07ShBj/iE744kM373wtQ+zEhEFxtuuKc3a70mrzqJYn8tbF63CYuDCN26h0qQdXkHU9c
         FAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713670512; x=1714275312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqTFUStUgUgHwhHTzA1wLZlhW+xV4wEDyDdTFLtabz0=;
        b=PK/h1w1Ftej/VIuTyFUkdY5Cdcdu0ymH2OZLcBI2m8RAVGMMnkiuKaQgn+ZKHsrJBD
         ylU1e6SKYX3S62HZ40LUjiBEM+P7nf54c+jvpiTlxZObK2uMjhKTGBVNL7H0Ck0VuBtY
         0s2ucchblpKcHyn1vT8O2kC4xJlOZ/H/9l78qHdq8fCm3Aqw01+z6MlnF1KHtztOLZKZ
         5owpnzkVR/ZqNNvrljv9bxaAchEXnGSc+ofQhy1ap+TEWUsz+hEg1DQ7WLTUy5D94UFw
         9V8gtVeuhb84NKXpd/wlWwbu4x7jGbjoqZGeiVGDOuPtv7hqj7JqVUJEAwO//UdERkJJ
         6oDA==
X-Forwarded-Encrypted: i=1; AJvYcCWLLfYoJTnS1bjipZOTJiyp8jhQ/pmxY65QdDT2VhYrTJBtbiwAHm7oJ5cdYqnlL/SuakNuRImepMyEQgmpQIk37+5MwmhXgkAMOxKnfkzDEcD8
X-Gm-Message-State: AOJu0YylKBEHuKa9o/ea7aVutaJ77YS0Qg0TEOW4RJA2qAS958lsFWLI
	oHHHCPBvs1g+5hoiU+inkuUoqjmYQjBYBP5Shl6UXfkNAv9M7wQk
X-Google-Smtp-Source: AGHT+IEhIi5dpao0M7bfoPbGYTuQ9jJSf6VyRPSAaGoV0oTkl8Eb5w20BzCqE9x96m8tcu3YW0MIkQ==
X-Received: by 2002:a05:6808:6c1:b0:3c6:4d7:abf9 with SMTP id m1-20020a05680806c100b003c604d7abf9mr7562694oih.55.1713670511864;
        Sat, 20 Apr 2024 20:35:11 -0700 (PDT)
Received: from localhost ([117.239.226.201])
        by smtp.gmail.com with UTF8SMTPSA id b9-20020a056a00114900b006eaaaf5e0a8sm5517386pfm.71.2024.04.20.20.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 20:35:11 -0700 (PDT)
From: Kartik Agarwala <agarwala.kartik@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: Kartik Agarwala <agarwala.kartik@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoC: dt-bindings: mt2701-wm8960: Convert to dtschema
Date: Sun, 21 Apr 2024 09:01:31 +0530
Message-Id: <20240421033129.13076-1-agarwala.kartik@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_203514_220812_E6FCA0A9 
X-CRM114-Status: GOOD (  14.26  )
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

Convert mt2701-wm890 bindings from text to dtschema. This is used by
MediaTek mt7623a/n SoC.

Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
---
Changes for v2:
- Do not define pinctrl properties as they are implicitly supported.

Previous versions:
v1: https://lore.kernel.org/all/20240401043505.40972-1-agarwala.kartik@gmail.com/
---
 .../sound/mediatek,mt2701-wm8960.yaml         | 54 +++++++++++++++++++
 .../bindings/sound/mt2701-wm8960.txt          | 24 ---------
 2 files changed, 54 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt2701-wm8960.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
new file mode 100644
index 000000000..cf985461a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt2701-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT2701 with WM8960 CODEC
+
+maintainers:
+  - Kartik Agarwala <agarwala.kartik@gmail.com>
+
+properties:
+  compatible:
+    const: mediatek,mt2701-wm8960-machine
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT2701 ASoC platform.
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the WM8960 audio codec.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+  - audio-routing
+  - mediatek,audio-codec
+  - pinctrl-names
+  - pinctrl-0
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt2701-wm8960-machine";
+        mediatek,platform = <&afe>;
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+        mediatek,audio-codec = <&wm8960>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt2701-wm8960.txt b/Documentation/devicetree/bindings/sound/mt2701-wm8960.txt
deleted file mode 100644
index 809b609ea..000000000
--- a/Documentation/devicetree/bindings/sound/mt2701-wm8960.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-MT2701 with WM8960 CODEC
-
-Required properties:
-- compatible: "mediatek,mt2701-wm8960-machine"
-- mediatek,platform: the phandle of MT2701 ASoC platform
-- audio-routing: a list of the connections between audio
-- mediatek,audio-codec: the phandles of wm8960 codec
-- pinctrl-names: Should contain only one value - "default"
-- pinctrl-0: Should specify pin control groups used for this controller.
-
-Example:
-
-	sound:sound {
-		compatible = "mediatek,mt2701-wm8960-machine";
-		mediatek,platform = <&afe>;
-		audio-routing =
-			"Headphone", "HP_L",
-			"Headphone", "HP_R",
-			"LINPUT1", "AMIC",
-			"RINPUT1", "AMIC";
-		mediatek,audio-codec = <&wm8960>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&aud_pins_default>;
-	};
-- 
2.34.1


