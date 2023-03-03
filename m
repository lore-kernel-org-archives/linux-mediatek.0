Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93786C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIiEAPTO8hoNXgl/LxoqTt9NNqmG3B3Oy7Nn4t7CBLM=; b=xzJgS7BO5X7tn8
	Ww0fN9LjQh4ZuGUL3PyTFNdpqyREA09nsYcTOIHBGoKgAtu4ggWJ0v/YfyHwWbJYu6HbpDFAO/UfF
	knLrDcpzQ7yBt4NRaoc2xbsxvyBFPG4RcJpagl8oWx4hPCZVYjLTQZCP+tk3dV6J5nrf3E4hbRb6L
	S7XSiEqsNHIiValoOoj1Z9jwnNOB9sPk7fg5nJweDWLgaA4M1dk4nMYJITsQQmVqd6jGZBGwQ6Y7C
	TTt/zDv5k04yB9ss0JlVZUtaiwi3hQPWi26rwvX5C8pup2Z8dA+BhE+DipcTVVF+jvmaiQzSIhv8X
	uIY5jyNkBUWNO1f/dT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtL2-003rt5-7t; Fri, 03 Mar 2023 00:31:56 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJK-003qla-8k; Fri, 03 Mar 2023 00:30:11 +0000
Received: by mail-lj1-x22b.google.com with SMTP id a32so738459ljr.9;
        Thu, 02 Mar 2023 16:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIiEAPTO8hoNXgl/LxoqTt9NNqmG3B3Oy7Nn4t7CBLM=;
        b=TaU7EXcBXgw/CbfmBEl9ytxLFQPRgTkDzyVbFpjwbLWCgEBwdOl52Ks+nlBHfrqkjZ
         fEvmivMoWjSsuGVQhsLW+ya5OD0RyTjRdEoRZZ0oa6r4CrJFUowHsQ4Kf+mRuUnVJ/ap
         mYBFN1bT/nhAKwa7BxHpgFtd59npVD0ypQlXCMoOLHtiGzsi+phlBKWzuBD/46a9Q8tP
         rXEe51Vdn94E3YUiBxOlFyx/vXLD94TFG96/paRTIEPRt3ovawu2qNoVTu/GaQoONXWq
         k4MaIUvdUpgdURloLjXIAkdWIPyxYWuEdJtzYd79IcQV3RDz0rrsIavGskbhPYl7Rk4c
         k9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIiEAPTO8hoNXgl/LxoqTt9NNqmG3B3Oy7Nn4t7CBLM=;
        b=4T1MYhznGEuwWs+KgIsoNQJePIrBsZqesvfHsYwqc7VJjAqQd/3dyCAB5CeAzC0jMk
         oM3eg+0V+WVvWf4Ti7s+uwmKOROk4kWTmJStUrJQm+VUwXUge5aFBSdEnlc+qGZbU9Xk
         P6wxXtY8rrsPAa0tcMz3ESq292bbRvj13Jw3jI0F+h4mqpM0Riv2nGfwI8D0UdvuBojf
         HVuzYdjO+ydWIJM+dekBer/qiEqR3A8dRUVcVJvp9tpnOBzj7PAxk6W5LCfeFCZE4JOa
         Wh8KVMYcmEFyHWKdJoG94ZU61UpCbSADHsTZhvi6hYwk8VsI4FNrTiU2f3fs4+SfH8fp
         4g1w==
X-Gm-Message-State: AO0yUKUzXK3SOSIOKrpQMcx/bH9aQIIZilwNTGx57LM+LJ8dusKU2Z7A
	FWsA/oqX3J5GBggCv/SbYYw=
X-Google-Smtp-Source: AK7set9868oEKPzDAUX1PtsbLKPRyzAb9dwq8fJ9VSnzNhzN8flaCAGO3fiUcBM5qQyp+aOiAqOO/g==
X-Received: by 2002:a05:651c:516:b0:295:d385:88cd with SMTP id o22-20020a05651c051600b00295d38588cdmr3617059ljp.19.1677803408796;
        Thu, 02 Mar 2023 16:30:08 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:08 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 07/20] dt-bindings: pinctrl: ralink: improve bindings
Date: Fri,  3 Mar 2023 03:28:36 +0300
Message-Id: <20230303002850.51858-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163010_416854_AFD4A437 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Move additionalProperties to the top. It's easier to read than after a long
indented section.

Drop the quotes from the referred schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/pinctrl/ralink,mt7620-pinctrl.yaml          | 9 ++++-----
 .../bindings/pinctrl/ralink,mt7621-pinctrl.yaml          | 9 ++++-----
 .../bindings/pinctrl/ralink,rt2880-pinctrl.yaml          | 9 ++++-----
 .../bindings/pinctrl/ralink,rt305x-pinctrl.yaml          | 9 ++++-----
 .../bindings/pinctrl/ralink,rt3883-pinctrl.yaml          | 9 ++++-----
 5 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index 1e63ea34146a..cde6de77e228 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -22,11 +22,14 @@ properties:
 patternProperties:
   '-pins$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '^(.*-)?pinmux$':
         type: object
         description: node for pinctrl.
         $ref: pinmux-node.yaml#
+        additionalProperties: false
 
         properties:
           function:
@@ -632,12 +635,8 @@ patternProperties:
                 groups:
                   enum: [i2c, spi cs1, uart0]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index 1b1d37b981d9..fb8c5459ea93 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -22,11 +22,14 @@ properties:
 patternProperties:
   '-pins$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '^(.*-)?pinmux$':
         type: object
         description: node for pinctrl.
         $ref: pinmux-node.yaml#
+        additionalProperties: false
 
         properties:
           function:
@@ -236,12 +239,8 @@ patternProperties:
                 groups:
                   enum: [wdt]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index 7fd0df880a76..e51667316b2e 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
@@ -22,11 +22,14 @@ properties:
 patternProperties:
   '-pins$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '^(.*-)?pinmux$':
         type: object
         description: node for pinctrl.
         $ref: pinmux-node.yaml#
+        additionalProperties: false
 
         properties:
           function:
@@ -116,12 +119,8 @@ patternProperties:
                 groups:
                   enum: [pci]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 4d66ca752a30..8b1256af09c3 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -23,11 +23,14 @@ properties:
 patternProperties:
   '-pins$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '^(.*-)?pinmux$':
         type: object
         description: node for pinctrl.
         $ref: pinmux-node.yaml#
+        additionalProperties: false
 
         properties:
           function:
@@ -249,12 +252,8 @@ patternProperties:
                 groups:
                   enum: [spi_cs1]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
index 008d93181aea..adc4f42a175d 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
@@ -22,11 +22,14 @@ properties:
 patternProperties:
   '-pins$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '^(.*-)?pinmux$':
         type: object
         description: node for pinctrl.
         $ref: pinmux-node.yaml#
+        additionalProperties: false
 
         properties:
           function:
@@ -236,12 +239,8 @@ patternProperties:
                 groups:
                   enum: [uartlite]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
-- 
2.37.2


