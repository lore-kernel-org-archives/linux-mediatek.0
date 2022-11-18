Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE01C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 22:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m0raBjAqYekKQWPt8CeBL05C5sEHyP1ZPYbyFvxhkC0=; b=n9rBFJH0djdoc4Tb6PFoCY7ARC
	7h8DT0nSUsyQ3kRC9gv99gOmfeOWFUXa9tjizJzh9WQ9/f3GFPmb7b4I86Eg2xh0HzmDwaF3yo5Rx
	ZcPohT0MACEehpHpYdQ7rDq9tQlDJQ/DdzTJch03Q37DRPcFPotdt8SF32BSB7CtxlTNI4T1K0+co
	kH7YLJd6rJplbNIHEzEyoUWfAzEhfDn+DheesDSul19sIxuCBWfep0wSik3Q8SByCK0VytDtiW74a
	PyyJ8PzH+Dme1dmmGZM02z1KCbqKrwX0I5E3LDd7SaeAJqz4k4JyXw61JaY4Yeuaf3NOesk/qtI5S
	PMVxtl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owA01-008ocr-1f; Fri, 18 Nov 2022 22:38:17 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9zo-008oMo-Fk; Fri, 18 Nov 2022 22:38:06 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-14279410bf4so5818182fac.8;
        Fri, 18 Nov 2022 14:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0raBjAqYekKQWPt8CeBL05C5sEHyP1ZPYbyFvxhkC0=;
        b=eVqg3wIUhWNIfGK/3pC/YfgvUy1UeDcnCAj9j/6AvEyKWSlGVeyY5m40+1eOMeFgen
         gNS9N2d7cFxSmXevbXrhko6HVtl8kpu6twYyg1iGcpl7XVr1vM2ySZK79cky2sfKY00y
         tAgQ+cku+7MG/igD67a2R3KYlHoYxla30YHiuQ9+Vt8FsBTHxAq5y7D4rYZPVEdoRGQ1
         o+Dy1FhzilxAFClRPfP351ch1AWxz84xOu+W2BqeMp2mc07zZBZkE7cWqKbVZ7s1NdvT
         j82pm0ummeNSZ35se76u7EYcg4JBjhruB9DnHDIrL/IEwOKg+kwEVmIGEOtpzKTo5bis
         XOOg==
X-Gm-Message-State: ANoB5pnwJCKIJ8mdczOk7FhPKCEF5OhU3HIJ95juT1A/z0UN7YAIE+IF
	2dkTDqbkh7yIeM80ayYVaQ==
X-Google-Smtp-Source: AA0mqf4uC828wW0XMFRcw+1h9kzuiTCYIXYE5a9yh+nlTeD+x6xGbslmOI8E3ZIqUy+Kwbf6RoH4Ow==
X-Received: by 2002:a05:6870:ac0b:b0:13a:e051:7c68 with SMTP id kw11-20020a056870ac0b00b0013ae0517c68mr5202453oab.150.1668811081476;
        Fri, 18 Nov 2022 14:38:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t19-20020a9d7753000000b0066cf6a14d1asm2061199otl.23.2022.11.18.14.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:38:00 -0800 (PST)
Received: (nullmailer pid 1722360 invoked by uid 1000);
	Fri, 18 Nov 2022 22:38:02 -0000
From: Rob Herring <robh@kernel.org>
To: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: Add missing start and/or end of line regex anchors
Date: Fri, 18 Nov 2022 16:37:27 -0600
Message-Id: <20221118223728.1721589-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_143804_561988_575A420D 
X-CRM114-Status: GOOD (  13.61  )
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

json-schema patterns by default will match anywhere in a string, so
typically we want at least the start or end anchored. Fix the obvious
cases where the anchors were forgotten.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 2 +-
 Documentation/devicetree/bindings/hwmon/adt7475.yaml          | 4 ++--
 .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 ++--
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-
 .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
 Documentation/devicetree/bindings/regulator/max8660.yaml      | 2 +-
 .../devicetree/bindings/regulator/maxim,max77802.yaml         | 2 +-
 Documentation/devicetree/bindings/regulator/regulator.yaml    | 2 +-
 .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml     | 2 +-
 .../devicetree/bindings/spi/nvidia,tegra210-quad.yaml         | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index a11e1b867379..3c00ad09eeaa 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -38,7 +38,7 @@ properties:
     type: object
 
     patternProperties:
-      'cpu@[0-9a-f]+':
+      '^cpu@[0-9a-f]+$':
         type: object
 
         properties:
diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.yaml b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
index ea595102a86e..051c976ab711 100644
--- a/Documentation/devicetree/bindings/hwmon/adt7475.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
@@ -61,7 +61,7 @@ patternProperties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1]
 
-  "adi,pin(5|10)-function":
+  "^adi,pin(5|10)-function$":
     description: |
       Configures the function for pin 5 on the adi,adt7473 and adi,adt7475. Or
       pin 10 on the adi,adt7476 and adi,adt7490.
@@ -70,7 +70,7 @@ patternProperties:
       - pwm2
       - smbalert#
 
-  "adi,pin(9|14)-function":
+  "^adi,pin(9|14)-function$":
     description: |
       Configures the function for pin 9 on the adi,adt7473 and adi,adt7475. Or
       pin 14 on the adi,adt7476 and adi,adt7490
diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index 385b0692261c..51f62c3ae194 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -41,7 +41,7 @@ required:
   - nvmem-cells
 
 patternProperties:
-  "opp-[0-9]+":
+  "^opp-[0-9]+$":
     type: object
 
     properties:
@@ -49,7 +49,7 @@ patternProperties:
       clock-latency-ns: true
 
     patternProperties:
-      "opp-microvolt-.*": true
+      "^opp-microvolt-speed[0-9]$": true
 
     required:
       - opp-hz
diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index d60f43fd9c5a..e63e6458cea8 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -31,7 +31,7 @@ properties:
     maxItems: 2
 
 patternProperties:
-  'pcie@[0-2],0':
+  '^pcie@[0-2],0$':
     type: object
     $ref: /schemas/pci/pci-bus.yaml#
 
diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
index 0f18cceba3d5..5a0d64d3ae6b 100644
--- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
@@ -65,7 +65,7 @@ properties:
     maxItems: 1
 
 patternProperties:
-  'usb@[0-1],0':
+  '^usb@[0-1],0$':
     type: object
 
     description:
diff --git a/Documentation/devicetree/bindings/regulator/max8660.yaml b/Documentation/devicetree/bindings/regulator/max8660.yaml
index 9c038698f880..4d550ca396eb 100644
--- a/Documentation/devicetree/bindings/regulator/max8660.yaml
+++ b/Documentation/devicetree/bindings/regulator/max8660.yaml
@@ -24,7 +24,7 @@ properties:
     type: object
 
     patternProperties:
-      "regulator-.+":
+      "^regulator-.+$":
         $ref: "regulator.yaml#"
 
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
index 71138c611b6c..b704f05ea454 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
@@ -77,7 +77,7 @@ patternProperties:
       regulator-initial-mode: false
 
     patternProperties:
-      regulator-state-(standby|mem|disk):
+      "^regulator-state-(standby|mem|disk)$":
         type: object
         additionalProperties: true
         properties:
diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 6e8aa9eed3aa..53b81d8a2d41 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -231,7 +231,7 @@ patternProperties:
   ".*-supply$":
     description: Input supply phandle(s) for this node
 
-  regulator-state-(standby|mem|disk):
+  "^regulator-state-(standby|mem|disk)$":
     type: object
     description:
       sub-nodes for regulator state in Standby, Suspend-to-RAM, and
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
index 7cb74cc8c5d9..54be194bb244 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
@@ -21,7 +21,7 @@ description: |
   regulator-voutl1, regulator-vouts1
 
 patternProperties:
-  "regulator-.+":
+  "^regulator-.+$":
     type: object
     description:
       Properties for single regulator.
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 679a246dd666..7df40c38e865 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -115,7 +115,7 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     patternProperties:
-      port(@[0-9a-f]+)?:
+      '^port(@[0-9a-f]+)?$':
         $ref: audio-graph-port.yaml#
         unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
index 6b733e5c1163..899100e783c9 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
@@ -48,7 +48,7 @@ properties:
       - const: tx
 
 patternProperties:
-  "@[0-9a-f]+":
+  "@[0-9a-f]+$":
     type: object
 
     properties:
-- 
2.35.1


