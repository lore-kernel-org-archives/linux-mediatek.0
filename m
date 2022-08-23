Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F25DC32789
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h0CnVKrOjJedjISgP9+nhkN7E189WcSV8KiZ+ezPrBE=; b=4K/xV3ID8S9uZPlUtjUwOctky5
	tY5bKdva9ub8M+LqMWQrhKtBTieHne5h/hBXBVRD929WAG3PmovK4+be4EgXAm5lJzB3WR2NPAcPU
	8Bs6Ds2C/2Xa6Aj9lJHAb/oe9c3n4wntHux0ts3Vs7CX81IyeRp/tl5wYZI6x2aQbYE2lhd56eGY9
	H3kjty8QuHK3KFI8HNe0M5FFe29AzA/jwQwk44Yl/gY+POYShlQFQPC3viDJ2CcOrZdlV1blfVW43
	oZ2ZdIu/eHuQNK9FLhtGwFgfUSGPT1gav+Pv7vKP6iv+o/ED0/6KWbug3fUGEX3eVNtFTs9LOyuzR
	BxDg0zvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQVLs-006m3C-CC; Tue, 23 Aug 2022 14:58:00 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQVLH-006lh6-GQ; Tue, 23 Aug 2022 14:57:25 +0000
Received: by mail-oi1-f172.google.com with SMTP id o204so8830444oia.12;
        Tue, 23 Aug 2022 07:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=h0CnVKrOjJedjISgP9+nhkN7E189WcSV8KiZ+ezPrBE=;
        b=ebG6hvkWu6TQKKX/zOycmc/sgaFbV1pvq4B0g7tA4RraAM0gJJRjiw81SZL8WqZ48T
         UO6ymMlr6Llyw5opPWl55CCmxkkSWsNcP7GwasHqhY+iNxy6MAIRzWZPQW0n/38T8WIl
         ZKnCPwybsHmBOvj6OaAtk9LoczAiR16ivCjDiEDhD3h7m5/ediIwm9iwhO6grWepUnQU
         OaD0QmPNlf621FbXzmQWW/YF8lDiBL7RlCF0lDYtkRLV0vnd95/8rSmlysrylWmfWPe7
         uZu/fC1gOn/8UYZgUkDzhSejWh+K683FyQGWwnCTB8rcOr64w6v7VujsY1G0Hd6x9kEe
         eshw==
X-Gm-Message-State: ACgBeo0RPMANuaVJIWUtmlpKQi4dQ0glXzAhvjPUS0i2H1fcwT72suPV
	dfAGUgxh4itCxktk+J9+5w==
X-Google-Smtp-Source: AA6agR5OARvxdnc8BmaUXFTmBiSwYZaPHP9yws/NVD55WI4mBLuEUcY0qCEgGgE0JHMJhoGGEYBTzg==
X-Received: by 2002:aca:f054:0:b0:345:7285:1147 with SMTP id o81-20020acaf054000000b0034572851147mr1505615oih.108.1661266640082;
        Tue, 23 Aug 2022 07:57:20 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:57:19 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andy Teng <andy.teng@mediatek.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: pinctrl: Add missing (unevaluated|additional)Properties on child nodes
Date: Tue, 23 Aug 2022 09:56:37 -0500
Message-Id: <20220823145649.3118479-6-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_075723_608019_EB2F8DF7 
X-CRM114-Status: GOOD (  11.25  )
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
 .../devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml      | 1 +
 .../devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml     | 1 +
 .../devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml  | 1 +
 .../devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml       | 1 +
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml   | 2 ++
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml   | 1 +
 .../devicetree/bindings/pinctrl/renesas,rza1-ports.yaml        | 1 +
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 3 +++
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
 .../devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml  | 1 +
 10 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
index 175a992f15e1..8a9fb9b433ca 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
@@ -23,6 +23,7 @@ patternProperties:
   '-pins$':
     type: object
     $ref: pinmux-node.yaml#
+    additionalProperties: false
 
     properties:
       function:
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
index 5e99d79499b4..846651ff77c9 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
@@ -44,6 +44,7 @@ properties:
 patternProperties:
   '^gpio@[0-9a-f]*$':
     type: object
+    additionalProperties: false
 
     description:
       Child nodes can be specified to contain pin configuration information,
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
index 0ec476248f21..6f30b5337ca2 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
@@ -42,6 +42,7 @@ properties:
 patternProperties:
   '^gpio@[0-9a-f]*$':
     type: object
+    additionalProperties: false
 
     description:
       Child nodes can be specified to contain pin configuration information,
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
index a651b2744caf..491f67e7cc4f 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
@@ -24,6 +24,7 @@ patternProperties:
   '-pins$':
     type: object
     $ref: pinmux-node.yaml#
+    additionalProperties: false
 
     properties:
       marvell,function:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index e7601c0f5a69..840f649e36ce 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -76,6 +76,8 @@ required:
 patternProperties:
   '-[0-9]*$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '-pins*$':
         type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 7a11beb8f222..7b7f840ffc4c 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -30,6 +30,7 @@ patternProperties:
 
   "^gpio@[0-7]$":
     type: object
+    additionalProperties: false
 
     description:
       Eight GPIO banks (gpio@0 to gpio@7), that each contain between 14 and 18
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
index 8ed4b98a1628..9083040c996a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
@@ -41,6 +41,7 @@ required:
 patternProperties:
   "^gpio-[0-9]*$":
     type: object
+    additionalProperties: false
 
     description:
       Each port of the r7s72100 pin controller hardware is itself a GPIO
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 3a65c66ca71d..d006a940c7c6 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -97,6 +97,9 @@ patternProperties:
         additionalProperties: false
 
   "^(initial|sleep)-state$":
+    type: object
+    additionalProperties: false
+
     patternProperties:
       "^(pin-[a-z0-9-]+|[a-z0-9-]+-pin)$":
         $ref: samsung,pinctrl-pins-cfg.yaml
diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index d35dcc4f0242..53c952d93ea2 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -115,9 +115,12 @@ patternProperties:
 
   '-[0-9]*$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '^pins':
         type: object
+        additionalProperties: false
         description: |
           A pinctrl node should contain at least one subnode representing the
           pinctrl group available on the machine. Each subnode will list the
diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
index 306524885a2b..98b4663f9766 100644
--- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -36,6 +36,7 @@ patternProperties:
       pins it needs, and how they should be configured, with regard to muxer
       configuration, pullups, drive strength.
     $ref: "pinmux-node.yaml"
+    additionalProperties: false
 
     properties:
       function:
-- 
2.34.1


