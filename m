Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66648C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2nojjkshDZlMK4hU9tYl1P+c5EVo/6poZY9UvogPvM=; b=p+jCwUDZzMYEd2
	Ho9OauV/Byh/MdD9fSnXkzQgbdqWO65WsWjAvt8yBP9rzMfbEWd6ROKt033ab06UJKnChHqyfA6yK
	uenYR6m/M4rPYJEvCwnIR8pnlN6A8jm9CDsrmdjePO7LyLrjV2+3ccUy79V6KDhWYQfnd2B2uBT3I
	h9iFwj0gBHZjV1CqDcHsDk+k7Cb+QaFfyjKGPzQbl0i1IfgNfWa0HprK/GMq63EcaPH0xqWPJ4OWZ
	qDMx5he9DxSePIizrleJAUqNBs7gAiY79OmCO/GXkk54h9k+qun1stQNMIE4QaDh4v8Pa1uOWoWtX
	1NgSXRHuGEI3Sji68VkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtQT-003v1u-2C; Fri, 03 Mar 2023 00:37:33 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJh-003qkM-8m; Fri, 03 Mar 2023 00:30:35 +0000
Received: by mail-lj1-x22a.google.com with SMTP id b13so756884ljf.6;
        Thu, 02 Mar 2023 16:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2nojjkshDZlMK4hU9tYl1P+c5EVo/6poZY9UvogPvM=;
        b=Sl4IZTrjaRWrtPLv+ZDgaBDyKB/JB1SD7/+7fYzDs1PHZk/36hXPimxVcFTpXQfFq6
         SZUg0X+GL2vlQZkM6fnCxAVM5ficYxyyg4vJ2uuf3q2IG2h6xRMaLfU/MU+BxjM/CLnK
         JaQXBiTdditGAWsJNEov82XJXvrYCtDQBsgU4ihQGlb1iCZ2mS6H2NolMHOOpKktff8a
         WpqzGmgBBdKZtQFqi5bMcIJPYRHmRXmop2fibd3jsDT7+T4jE8wCYuJY/1CBNDKt0zZT
         o1itOPytQ+JR/uwRZgw2GGVLBuPw2y9cySKqgfjC6r3WBSA8bB2egW2+u2Tra0C0GkCA
         w7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2nojjkshDZlMK4hU9tYl1P+c5EVo/6poZY9UvogPvM=;
        b=UmHtxRKLQW7AAXpQN8ySPeggnbxc9vZ8+XiKhMnal44ZbGej2fLhK4gOpnIm9R+kBg
         0ZCUJkGPJJkBGP/u18dis0CTgRmaVugq6qr/aUNj0x45E2+YkeGseRkhpE4j8KETu+7j
         Zp8g6xh7YsgmUX78Rzh/376WgxADF0PRvrWQ43LVhzqoKF0XrNACAd0ant2WN3FlT356
         eg+WC2zDAXQLF5rp87qpIYaeRwUptKOwYpLfQbkhaJ+kKWraaUqQHSCuZsFYoCSnsU84
         HkQKtE9KT+u2BH6TFw4lAJN4+REtQLEAsS+yZmKRtTQWQ/lZ5xgQC6zwLCgfxeciXzdb
         36/g==
X-Gm-Message-State: AO0yUKVumNZ59AQ2Lbh5jkcXb+F6ZzjSFkizzGWuHMHoFE+E4s2Caa5Q
	1s1nq/1GIsL/fllclVc1Np0=
X-Google-Smtp-Source: AK7set/FNqqGbkfq8g6krbkN5rvlkH9FoN8KAOunoO/JZ5zzFsqjQbDqz4/uTY1dhX5ralrL+phiOg==
X-Received: by 2002:a2e:9c06:0:b0:295:b054:6809 with SMTP id s6-20020a2e9c06000000b00295b0546809mr3545934lji.8.1677803432715;
        Thu, 02 Mar 2023 16:30:32 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:32 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 16/20] dt-bindings: pinctrl: mediatek: drop quotes from referred schemas
Date: Fri,  3 Mar 2023 03:28:45 +0300
Message-Id: <20230303002850.51858-17-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163033_370252_4F26BD7E 
X-CRM114-Status: GOOD (  11.57  )
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

Drop the quotes from the referred schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml           | 4 ++--
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml           | 4 ++--
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml           | 4 ++--
 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml           | 6 +++---
 .../bindings/pinctrl/mediatek,mt7986-pinctrl.yaml           | 6 +++---
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml           | 4 ++--
 .../bindings/pinctrl/mediatek,mt8186-pinctrl.yaml           | 2 +-
 .../bindings/pinctrl/mediatek,mt8188-pinctrl.yaml           | 2 +-
 .../bindings/pinctrl/mediatek,mt8192-pinctrl.yaml           | 4 ++--
 .../bindings/pinctrl/mediatek,mt8195-pinctrl.yaml           | 4 ++--
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 3191d08ecf13..66633810f7b8 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -67,7 +67,7 @@ required:
   - "#gpio-cells"
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 patternProperties:
   'pins$':
@@ -83,7 +83,7 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input
           schmitt.
-        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+        $ref: /schemas/pinctrl/pincfg-node.yaml
 
         properties:
           pinmux:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 17046d204087..a795beec56ec 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -58,7 +58,7 @@ required:
   - "#gpio-cells"
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
   - if:
       properties:
         compatible:
@@ -124,7 +124,7 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input
           schmitt.
-        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+        $ref: /schemas/pinctrl/pincfg-node.yaml
 
         properties:
           pinmux:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 5bd78e88fea3..52f30ed1a611 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -82,7 +82,7 @@ patternProperties:
               }
             };
           };
-        $ref: "pinmux-node.yaml"
+        $ref: pinmux-node.yaml
 
         properties:
           pinmux:
@@ -156,7 +156,7 @@ patternProperties:
           - pinmux
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 740a26e1ede1..f761751251a1 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -43,7 +43,7 @@ properties:
     const: 2
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
@@ -70,7 +70,7 @@ patternProperties:
         additionalProperties: false
         description:
           pinmux configuration nodes.
-        $ref: "/schemas/pinctrl/pinmux-node.yaml"
+        $ref: /schemas/pinctrl/pinmux-node.yaml
         properties:
           function:
             description:
@@ -249,7 +249,7 @@ patternProperties:
         additionalProperties: false
         description:
           pinconf configuration nodes.
-        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+        $ref: /schemas/pinctrl/pincfg-node.yaml
 
         properties:
           groups:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 6d7dd19cad4c..46b7228920ed 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -57,7 +57,7 @@ properties:
     const: 2
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
@@ -128,7 +128,7 @@ patternProperties:
           "wf_dbdc"         "wifi"      74, 75, 76, 77, 78, 79, 80, 81, 82, 83,
                                         84, 85
 
-        $ref: "/schemas/pinctrl/pinmux-node.yaml"
+        $ref: /schemas/pinctrl/pinmux-node.yaml
         properties:
           function:
             description:
@@ -261,7 +261,7 @@ patternProperties:
         additionalProperties: false
         description:
           pinconf configuration nodes.
-        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+        $ref: /schemas/pinctrl/pincfg-node.yaml
 
         properties:
           pins:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 3b1be7949e8c..cc10a9850af5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -57,7 +57,7 @@ properties:
     const: 2
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
@@ -80,7 +80,7 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input
           schmitt.
-        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+        $ref: /schemas/pinctrl/pincfg-node.yaml
 
         properties:
           pinmux:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
index c7abc13a167d..90998f78bd07 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
@@ -94,7 +94,7 @@ patternProperties:
               }
             };
           };
-        $ref: "pinmux-node.yaml"
+        $ref: pinmux-node.yaml
 
         properties:
           pinmux:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
index 51b3d1247614..7f3828df2273 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
@@ -74,7 +74,7 @@ patternProperties:
     patternProperties:
       '^pins':
         type: object
-        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+        $ref: /schemas/pinctrl/pincfg-node.yaml
         additionalProperties: false
         description:
           A pinctrl node should contain at least one subnode representing the
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
index 88a466769938..8aaf29dd7e1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
@@ -65,7 +65,7 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input
           schmitt.
-        $ref: "pinmux-node.yaml"
+        $ref: pinmux-node.yaml
 
         properties:
           pinmux:
@@ -126,7 +126,7 @@ patternProperties:
         additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index c1c8c99ba139..bf25b8773cee 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -87,7 +87,7 @@ patternProperties:
               }
             };
           };
-        $ref: "pinmux-node.yaml"
+        $ref: pinmux-node.yaml
 
         properties:
           pinmux:
@@ -217,7 +217,7 @@ patternProperties:
           - pinmux
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
-- 
2.37.2


