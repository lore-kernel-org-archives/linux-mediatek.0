Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49FCC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAK7OFgepYzb1OPPB99RCciV8FJkq+rUyJDpQPMElR0=; b=m7t7JSALiuoWOx
	f9MOFEdJ0SftOe8g2ZgO7jtwEaE13LI41Ur4NigZF8YqWsQSyzfasoF1fgK2hAaCC85r5RWsSpVKN
	5mnQoELHyZXgUiVBk0aZFE9OqTNS8xrGInI+XaRZbyP8AtAS7vBiLjUZ0+kE4IIYyLpLlaU4Cu5+4
	6ZDv3ndPO0QS65gNJ3ivSE3oud57UFDQKgM+SO4lGkCM2QlYSwtF3kamsKHx4RCgjsKByem+fMLQD
	IYsY8DgF6kmaO1DBd7HOLIz3zyuWoQQvW26A64Kc8y+RkESzXNRWptwrGL8IM7/M3w/R8N33etp2t
	jpFAqKN6nIiyReExlcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpIi-007lf3-4Q; Mon, 13 Mar 2023 21:01:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpH6-007kiS-02; Mon, 13 Mar 2023 21:00:10 +0000
Received: by mail-ed1-x52a.google.com with SMTP id o12so54022219edb.9;
        Mon, 13 Mar 2023 14:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAK7OFgepYzb1OPPB99RCciV8FJkq+rUyJDpQPMElR0=;
        b=Dc2pqy25AaPPIl0orWAHwkaLgNJssU1xWezj39He4MzGOylxI5SGGGGxjt7Mzt/OuT
         r9V3sfNVHmt92JEFMPdwXVicmZPUlt7aMjWsBjnYGfgthNbvfOvqN20Mqq/36RM8lxXo
         bI17F4pbAHupcAIQHoOPo1m4K3IGMVr3AAe6NhC3aPGK/IyHRbrDr3kQK+tYJmeHWK/o
         vniyV/6ANT4pvrtjlETi80YzbKDTSxwOH4lvazGfDMYgo4H/jBFV/lcySDmTSYL35iZQ
         YDtFniL843wUS2T50wRU4k3TqUeDpqZlO/Fx/111DvBnTw5UdQHWisJUI2mGoC+U3acH
         7jAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAK7OFgepYzb1OPPB99RCciV8FJkq+rUyJDpQPMElR0=;
        b=7mkEPWAn4Ic7QGcYf0jQjkTK/E22Ac7aWCXYp+PVScj5zH7JA2PAwmNjtsFT4q4O3d
         dqwNxrXxDMhp4/Hk3snB+/aAEVZPdA/zZCRkG49BJsc0yScGEzRHpF3VQFT+lql+hS+u
         AvPJft+j4Zf/l25HTvzRCLZ+IFSlI27ceiDac8z1lWDB6HE1H5Px00szkHMz/G6spxcA
         Vb4klZA1jY7RpqBDmIJQyLEQ6ye6sTl97f/QqQYfygBb2dP9RX6o+aD4+1AEtNMkfqYz
         7siL0lJ4I5Wig1qs7DE1f8gbQtsJ1ZKuxAln5hZuanBhI8v2CXY6HLLNPpjTVeSKJMrI
         +FSw==
X-Gm-Message-State: AO0yUKUaJHAyUIZv4DejvhPRwJ+KrVb3tas+jZ4NuKUvm9+ZaaHm06VD
	oskcbMpB7JCtqKq8NDgFXtE=
X-Google-Smtp-Source: AK7set9VYMbr4fJOe8wWFcpq/B6PFWmcNTymZ1EDTAZN9sKvcBxSXoIPhz/uqlyY4wetxCcHhZlS0w==
X-Received: by 2002:a17:906:dfca:b0:884:37fd:bf4c with SMTP id jt10-20020a170906dfca00b0088437fdbf4cmr34231752ejc.19.1678741207365;
        Mon, 13 Mar 2023 14:00:07 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:06 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 06/21] dt-bindings: pinctrl: ralink: move additionalProperties to top
Date: Mon, 13 Mar 2023 23:59:06 +0300
Message-Id: <20230313205921.35342-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140008_094837_60438043 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Move additionalProperties to the top. It's easier to read than after a long
indented section.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
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


