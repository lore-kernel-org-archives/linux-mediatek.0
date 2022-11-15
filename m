Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDD6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 03:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpYq70iArNS2pxebGHEfValI4udhqvfJfL86oolgszo=; b=U/E1juCu0c196cxaJxyG9W3DRv
	JvjrVduvoEbkPLPWvIEbfHHMlRwHAe+kBLHj5L1CMgg+QSL/Lzl27vTuNl40UYIgVfykL7+pY1vxd
	8lTDS0VS1jzQts/0p+rajPwpeM5/jGpW7cthC+iwZfwnMMyl3TE92iybq7xmckEc+TSGQ1OwoakLB
	kArSJheW5Paxfzl/uwE244ki0TCj0t22ymmZPNszpMuhn3Ke/+b1R3UUtrj/UWpFlrCA6H92sxkMW
	E/T9AvjXjCYY3fDAksK2yBjrmByneU8mraoPr4GTkAxYftgUw2YxkZFpBS3kvrv8isRZYymuntizh
	bHq4yImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumdN-007Bbg-5O; Tue, 15 Nov 2022 03:29:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumdA-007BHK-Nf
	for linux-mediatek@bombadil.infradead.org; Tue, 15 Nov 2022 03:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DpYq70iArNS2pxebGHEfValI4udhqvfJfL86oolgszo=; b=Znmhgpu/Lkprst6osQa0DI0rqZ
	mKzK4wYrOAI+L/Fg4Pr1zVfUmfVZswc5M+ssgyknZ/FPbyNNcUpUzA0X/J3MLUl8q47ZZ7gaATZ26
	d4brr4JcWp/1j/y/dD99IRyAv1dhMHfLHyJEolnvV6CyDO55y+SdsFuz5aMTgrmd4NzfsyhFR4yfv
	BtkFXKhJGQDTdBp08C/S7Wp40czkVm0gIKF3Po8eDztSrzhu3hwKdTqU7UJtSv2q3cFrcAyS0Ofun
	hMC7lr8tW/gSVovLxNiDAMYWPaRXb4yhX3hnugdWnB/vgEhUJX/pjSK0Vmd9v/ZT6yL5IAlRa1h5S
	lu03zLCg==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5y-000wvc-RI
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id bj12so32827430ejb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpYq70iArNS2pxebGHEfValI4udhqvfJfL86oolgszo=;
        b=jZpzIPCLwPszGkCTsJ4tZgikx63gFYR2GVtD0suFaV5Pfwh0wMVVIVaJc0b8n0ItKL
         YzPg3hQ/gSTUF8ZPCX4DJr9BEqwPUbV/hrlnbiFhg+HE5LRZYPKuCzGBqwgR4pgZB+49
         dlcW4GU8+PJm+PhuTgVWwFu2hYvHDg//vUAjB/pSxW/g2O9rL1Fy+vw9G3UzNIQJHi/P
         RsDu0Z/SEI2Cz1qiTwUIkF4Lq+kEGUgSlq5UFSAJ0ET0tHg68E8IlWRK7gYBCHJZgc4x
         m+C7pVLeakd7IWfv+SIwWh/gG0q9hxzxrLljILfL38AyK94D1/zD2k1jUWVqOVXriKLa
         kk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpYq70iArNS2pxebGHEfValI4udhqvfJfL86oolgszo=;
        b=jL57S2lfuuGHb/x1OubtdFWjqOmkMd1Ji0Rmnb+wnCd7dMTirMr3zV8A312k6R9PhY
         tn8qDhJkMobQxdtoji/dRS4gut+TUm7jX2m5csOyN2U/iUy6XYEydAO2YjdsctvS923l
         CSf8H3t18Ukb2lP6Prc2M0hSj8B2EkMynbQ55HyatWU0GqXsEvroZm4XHZNu99gLHJ04
         C55eqz5okJMcPebfrw+UbEqntGY3yoXVypj7EAjS2GHkIN3sUgVXt9k2haa4yPLxTkCV
         uLQufWRJhv+JqZIyc+FMfDxnlSWBHLbLlEgaI6Tl+FhzHKc58Kw37zvhCZiTO9MCy5oA
         b3MQ==
X-Gm-Message-State: ANoB5pkUr0pULoTkX+sW5b83xbm3gx+hv3Zi9l59bRsgD16WVKZX7h4y
	bNZN7iWP+O5e/IOAuk5lfm573y5nPtn1rrQs
X-Google-Smtp-Source: AA0mqf5co/shIzu1tV3Gc8w2nV8igZulLE0lo7boLZ4yVocD3uz2+SF8U4mnwVOaMN12ZfEgaw1UAw==
X-Received: by 2002:a17:906:b855:b0:7ac:f8e3:d547 with SMTP id ga21-20020a170906b85500b007acf8e3d547mr12211614ejb.53.1668480877956;
        Mon, 14 Nov 2022 18:54:37 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:37 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 11/15] dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC
Date: Tue, 15 Nov 2022 03:54:17 +0100
Message-Id: <20221115025421.59847-12-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_025443_810323_89DEAFDC 
X-CRM114-Status: GOOD (  13.07  )
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

Add devicetree bindings for Mediatek MT8365 pinctrl driver.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
new file mode 100644
index 0000000000000..bddff8c2fd382
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8365-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8365 Pin Controller
+
+maintainers:
+  - Bernhard Rosenkränzer <bero@baylibre.com>
+
+description: |+
+  The MediaTek's MT8365 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-pinctrl
+
+  reg:
+    minItems: 1
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pio: pinctrl@1000b000 {
+          compatible = "mediatek,mt8365-pinctrl";
+          reg = <0 0x1000b000 0 0x1000>;
+          mediatek,pctl-regmap = <&syscfg_pctl>;
+          pins-are-numbered;
+          gpio-controller;
+          #gpio-cells = <2>;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+          interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.38.1


