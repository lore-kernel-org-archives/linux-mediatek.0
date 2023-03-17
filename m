Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF392C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 22:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRRRjQq3YR+UffmCBrvj5g0GLFd9Ga+6nn8JCLDb/LY=; b=WiFu0PebulPTDw
	Z1T1daEArCddQM3HAlTNpD6vyo9L/QSYxqjCdJaWGaRc1hQSvJZd8CXofFLJ9KQZxLmC5RlujnSWU
	T4VhFaAufOEcZpMsTEWQwsriRBa0sECyEKCJsUfSAWqfWwSQbzk2LcNr12OGndgcqLAQl9ScgQ8kR
	S20IVM4Vh1GL/KhiYTYi38fCvQTwlfib0jZQaT6Qcg2v2s8dvgRKWSIkqI59UIxqoqcVCE0deRYib
	lms6j0e2HzM0seY5V2btCkpqlH4DrE/z5bww22GFH+J8VLPF0XWdk35SNYL7LA2VMizJQhAtKKkO7
	k9QoDt0MhqkGsLOIlIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIpt-003bJu-2Q;
	Fri, 17 Mar 2023 22:46:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIpl-003bFo-1C;
	Fri, 17 Mar 2023 22:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IRRRjQq3YR+UffmCBrvj5g0GLFd9Ga+6nn8JCLDb/LY=; b=jhB6f2LTl5rHWu4wjFc683TW6q
	gPzMPzsYBNh567D5jt4cIiF2UGrNfZvYhROIHrgvTccHh9Q13G9yE1tgigo2xVyDfbhsuwYYHTXvu
	726I47o8VtPv02ComSRqxcnluHH8Dw2Yx00AL/Tihb0Aevp5arGEHz6LBWpyDw97t+8EBrQuQqIEG
	aIqeOZqzsKQngvhThnEuntx+N1w952O8Nm7JJ6v3os/4YKChh5jfPfoz3XnkMimxeCZ7Z/KJVj0a0
	ZkX14j+f0KYQqeoB7svnAi9JWu2bFAhKirZpMmf41iKoYjd/IY3D+X6bQlNl4SI2fvnJzNTwzAcr8
	YSgjXbBQ==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHfE-002vWU-26;
	Fri, 17 Mar 2023 21:31:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id cy23so25349458edb.12;
        Fri, 17 Mar 2023 14:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRRRjQq3YR+UffmCBrvj5g0GLFd9Ga+6nn8JCLDb/LY=;
        b=gd7/k2Dsv3cvSTMDoIhJiW+kYCEnvSwtq3EhasiCnlb8kdELNv3Yku+pkcoPbQW9Yv
         bWRTaXjlNaFwbdgalWz7ZwT/oqaLrgDVIpBHwAIhN+s5NZRo391aSb4g4X7xbgcELdrH
         oomojyX4lmS8BLqNcCwSHj8BzyaCXGMtFGrCtLFkhGGdwR+COApf2RVlDjLm6Pt9J2YM
         zGUO4GrFy4HvY/1jkaUvct3Mnwg4tHFVl39iy2pQGVjlXi0+xLQSQIxuBuKYncQoVoWV
         whSRoMX3RE7qckKUDUFGAW2hMgSFe3mZIQw27AuaM2Yi8bUbXHIOWLG7EVcBJ4vNaI4Q
         prIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRRRjQq3YR+UffmCBrvj5g0GLFd9Ga+6nn8JCLDb/LY=;
        b=3IqcIUfy9h1o5cN2a9su/jX6IIzC5bYc3GE+kwpJKqRnAxOmd7UxpXbas7Bp5W/Wzh
         mPgu9eDkmYuUrmNJrK6tjwkSKY8hMnLtbsCtO5DY31Nv9AmlcvItMLXJuP1OFI8/9y5v
         nN+e50t1LQM5U80tgveRsQjf/st7SfUOy9bsEHlvI4ruj87m0YHolaDniGTm3vfVxHhx
         WO9HPawbf1ghDgRMGezma2B8D2SUVuVC4Mrj+aMTCVusLSL6aqxnihl9GLw7KNwRtzaV
         cw9r2QEKtPxAySj8HSkkBKXRG3GDQlz0qFVlcrr3ZHj7dT6BMBTJe5lKATLsE7B92BMI
         Z5WQ==
X-Gm-Message-State: AO0yUKXT/eRsknYRyF7S86Kwj1O6/CSEdP/ZunyK3k4x66ivW4SB4+Zy
	ZCpIqs1myQn0DsPyVvPNyFA=
X-Google-Smtp-Source: AK7set/wLlTE2egESzRiiLAbGob9reK+bCtPzcpYCbbRURE3vgs3lFuaz+ljmGw5GJFnbMJTZoOQsA==
X-Received: by 2002:a17:906:37d4:b0:922:78e2:7680 with SMTP id o20-20020a17090637d400b0092278e27680mr797923ejc.52.1679088659557;
        Fri, 17 Mar 2023 14:30:59 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:59 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 17/21] dt-bindings: pinctrl: mediatek: drop quotes from referred schemas
Date: Sat, 18 Mar 2023 00:30:07 +0300
Message-Id: <20230317213011.13656-18-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_213105_055122_AA5EF477 
X-CRM114-Status: GOOD (  11.23  )
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

Drop the quotes from the referred schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
index 3b3d59140073..bccff08a5ba3 100644
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
index e5e7143674b5..7f0e2d6cd6d9 100644
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
index c3bf98749fa4..601d86aecdd4 100644
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
index 38dc41c735eb..bd72a326e6e0 100644
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
index 7157500a7f81..31c36689438c 100644
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
index 372a3aefa937..bf67d4672455 100644
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
index eb6a5cdecc6c..69136ddd0bbc 100644
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
index 028146fb173f..e994b0c70dbf 100644
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
index 8cca1ce40f25..c43338cafd61 100644
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
index b8ba260d74cd..33cb71775db9 100644
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
@@ -216,7 +216,7 @@ patternProperties:
           - pinmux
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
-- 
2.37.2


