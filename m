Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453E7C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 22:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hanRZ+so1ArYmepo5CCKfRMoCoks9bBU/s/2qIAgcfA=; b=i1kPqlSDrEDmvJ
	a7TLa3gOZDgVTeMxNRIOyV23KyMmI5c0Yvxuf0qAziFIhNtawjeEfsQBZfy3H9lIeqTAqvE0p3Ib7
	zN23Z3ayNrVpGOnKTuDAgWE5FhollZ4m3s0NDvXBLKvvBE17gNlDxLYOqhkAVeEkgbf1823oMa9rv
	ZnzyoJcJz0TqRHx0y14IyrVqQ0wfiTyBLcrPWIVcD45IYp3jV3XqpKtvnU8gCgzr7cXDoGc2Od7I1
	KdELmMOmQEpjH+rzQToafdrNEgQKw2qr2dQw3xK6Zf9tp0y8EwYp96mT7DxwvVUj3lV8D0m/E/iY1
	wWi5pOkNqJkp03q+iV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIbX-003Zrh-0R;
	Fri, 17 Mar 2023 22:31:19 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHel-003Rzy-2L;
	Fri, 17 Mar 2023 21:30:37 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x3so25365233edb.10;
        Fri, 17 Mar 2023 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hanRZ+so1ArYmepo5CCKfRMoCoks9bBU/s/2qIAgcfA=;
        b=ROtgY41T1mOUeAcWsz3h2hwpWmqmsiAYvHi8MtcsIKwe9n1jmGo5bS4Ztw1lJ5GSuo
         wt7WpnMJZNM8bht2BbO28u2/ck60OCTwmy1UEQg3ZmsHu74i/fEWwO5RAAcNurb6xgSe
         G3wahpAR4MrUMoEmlwNtW+7KOMdYey9JnJkI2pdILB71svg6WvEom+Ive++MLl2VHwGs
         uyz9CY3+FWgTj4SjLn0jW4WHONkK3X7GhHP1ZcWxHnySP5dIi/kDeg2pt+Ls5Cf+wV62
         +NxAXlkNs370AvC6NdOpayuUruHNaqQHPGpnDXoqtPVUsnYRUX458Vc7M4TBzPFKPiqu
         km4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hanRZ+so1ArYmepo5CCKfRMoCoks9bBU/s/2qIAgcfA=;
        b=ITFmqME5gM9XC/0DWnFPD5DDePFC+9rbggS042EMrkS+3xsXu4G+GWPzMNgFgIgWcd
         YHeNDpDckOvsrdMYd8oKZMWqhjYGElFYSFwcZqjzt+mM8oI4KtCavUXRKMXjck082+FM
         skWDn6R98wcQWw/Tv1M+QnBTWzTwQ9+6qhnXeAVUanr/T5ZkmxdQgMjFQirzDmkDwPbI
         tdFW/P63J/gHgfUhcioZvzs/f1Zs0LAiLgx8JZD6KVXhq96vTAN7CP5c9G2uLiIU4CFE
         rwCKWGihup4OBBCj/oat7gd6gdxfsyJUIlcCLCYb5suV2NJyTKo1z5AEauDePHLt5wGH
         LdKQ==
X-Gm-Message-State: AO0yUKUvmzIUn1A9FSVgbBQ/4N2jKWTaj+9CSmn5jLKZjrU5h59Iawt0
	8qpISjtbnnUZHRhvuXYyHcA=
X-Google-Smtp-Source: AK7set9DUcJ6esYQL+HblhXNZcVXi9BWwPw82pZ6p5dHNh8f5Q2liYaFJQnTMyg1nF/Hika2gJc5jg==
X-Received: by 2002:aa7:d4d6:0:b0:4ea:a9b0:a511 with SMTP id t22-20020aa7d4d6000000b004eaa9b0a511mr4986552edr.37.1679088631693;
        Fri, 17 Mar 2023 14:30:31 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:31 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 06/21] dt-bindings: pinctrl: ralink: move additionalProperties to top
Date: Sat, 18 Mar 2023 00:29:56 +0300
Message-Id: <20230317213011.13656-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143035_828319_9F6E3472 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Move additionalProperties to the top. It's easier to read than after a long
indented section.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++----
 .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 7 +++----
 .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml | 7 +++----
 .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 7 +++----
 .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 7 +++----
 5 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index 1e63ea34146a..b25e0db77cb3 100644
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
@@ -632,10 +635,6 @@ patternProperties:
                 groups:
                   enum: [i2c, spi cs1, uart0]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
   - $ref: "pinctrl.yaml#"
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index 1b1d37b981d9..60f6273930f5 100644
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
@@ -236,10 +239,6 @@ patternProperties:
                 groups:
                   enum: [wdt]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
   - $ref: "pinctrl.yaml#"
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index 7fd0df880a76..4f3e0af7d18f 100644
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
@@ -116,10 +119,6 @@ patternProperties:
                 groups:
                   enum: [pci]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
   - $ref: "pinctrl.yaml#"
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 4d66ca752a30..9e45d851def6 100644
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
@@ -249,10 +252,6 @@ patternProperties:
                 groups:
                   enum: [spi_cs1]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
   - $ref: "pinctrl.yaml#"
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
index 008d93181aea..4bea19d4ad7b 100644
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
@@ -236,10 +239,6 @@ patternProperties:
                 groups:
                   enum: [uartlite]
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 allOf:
   - $ref: "pinctrl.yaml#"
 
-- 
2.37.2


