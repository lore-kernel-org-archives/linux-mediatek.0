Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CABCD6E49
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2026 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r32fsRHaMPradn/MupXc1NKlCK5+0PUCZmgy8fvmlC0=; b=0u2w50hSWh0tN59HC3TGi8nqO6
	T9epaIkHx8DGC22GV7WoWzHgwB3xdBaARp5z3Wuu+JnCUywvgS2S+bxovT+qEjXS3pbowVT/yGM1c
	Z71MI+D21ACZ3WyWL+q3jWeDJJLMPeHCNxV9QeQ102zDVNQ0V2InjBfdKAKG9yVtcIBrxjffNIUpS
	lnAgHRBlI5RMSrERZxUduF/sJLv+xlR8ZeSO5QgNh4mVYHxkAhmfusPlY9rPrmo0MSZPYFRyenHp+
	mutRWw2xO3Wr2JtaM55sCPhmsjZ8gfcDMyUKXzbJpuqGOx77jafHDRyw2UPcD2GFs3/O8aN8xDfgO
	2bbAiQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8f-00000008qvM-2ZBm;
	Sat, 30 May 2026 14:58:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8d-00000008qu5-0EMn
	for linux-mediatek@lists.infradead.org;
	Sat, 30 May 2026 14:58:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45ef5146b56so817282f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 May 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153089; x=1780757889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r32fsRHaMPradn/MupXc1NKlCK5+0PUCZmgy8fvmlC0=;
        b=mTVyT2W6NAPdnESZOOKFh7MdRJSeZppMTtP4W7yRbQUOhk3hfx6kENkKhxYgy6tZM9
         sE7AMZmrLVSt31JTiK7RMdofotHteQhsCap7mQgEf2zwjqJyfy2ITVgANn9DbeF2SNOp
         fTKF9LwZHDoPJFV6RmcIMUTQKo3UkA0X5HXyf+xP5QsLZGbowfeUQI/I25mb24PtjRKs
         g7PFpR97CosRCLNnfYbNn1k0gOIb/JboqRTILdfo1e2xqOeBkE8wYuyYl2J8c6PCAqgj
         3v8aokcP3XRJ3sY9gr3yk8hkDsI5schpa72PyfxqGqbWru316FVmNx4VskPLxq30XlGM
         KLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153089; x=1780757889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r32fsRHaMPradn/MupXc1NKlCK5+0PUCZmgy8fvmlC0=;
        b=WSEiFyfhsOefuBX0UFfs/11vpkukTxTwFlrtfy5n+vVhzHYglO3+evpxHQ57XRXjwH
         skWuRuTf+xK694Ax7Rqfw8ZmVQ0vH7h/x8SJzE8i5cTLzppzn28Oqt+wLFLjCYkR/1dO
         wTNw7Xi7ZjmgemrPn/kplLwuvR5o9OnOQcf33/MubRVB0B7Jypzl7kyHCliqdn2QcCVr
         yjGaLvmDtS+QODxRm7Djxfiyuh5nVidKuQ+Fw6LRFtft2mA0/CMPfNBn4rcPIGMz9izW
         V4B9vLfov3mHTW29dfn3QZ1KgXgc4j+ujJaFFNvTwZpxisj/vbQTubTZfNy1tm7V8LWw
         JZxg==
X-Forwarded-Encrypted: i=1; AFNElJ/9hvUYGF/D06IQ1CN9d7hBh3NFpyF2/x2ZV3JNY7jTXfHDREyFtNliEmbAqd3Fdx1+cY9rq2cFd0hh5u3ppg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB2MgOvXNKgiLRpHOijctfMr1EyBrraL8rOBoz36b8Ax4sBW30
	oU8m77LVCmti9qC7Fqn2kBm8QhG52MF5MfaXDj6eGsHn8NvrO5kgtUxV
X-Gm-Gg: Acq92OHS0VccusQhkpVW5uHWL+9Rw/54MrdCJOlMnH6HF+cOUA4bts9eHsr23TsdU1C
	qX1CxWw11f1K6urnEExUPonk1CwWay0O8uvBuAv0+YmBwHYPLb8aJxnQdNylLBPm/TXUfM0Jy5R
	WAOh+ei4JemQlGZPZvy1dlrB0gdFB9XvskAbJ59Puic/1Uq2Hb/2aB5Y/V1pQy6XcueK3JWIeZN
	fWsCan5VhfYgDiAMZU5BR5YTQn/yZdmKA95sd+qySvGL3sLbr3GZZgVTkZejpA0VoJt5o8R0oeD
	xv7YbZrvljOAS/AhVxEYgg8T+hA+fwUgiF2XCP+wyeUuorzGbhs1GmlVia0uBEuFkqRk5/KzVzE
	l7/k9fpijLfXIDEqVgd4defOFFcgK6/NJi1P4/Xj/O0S40x47g2VbdxHH6BXGMTZniY2pXRh25m
	aHowfjp0x+3LwqS1xJQewAfnXf5hwYTCw=
X-Received: by 2002:a05:6000:40c5:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-45ef13794fcmr12535168f8f.16.1780153089159;
        Sat, 30 May 2026 07:58:09 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:08 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 1/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Date: Sat, 30 May 2026 16:57:53 +0200
Message-ID: <20260530145800.1029920-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_075811_119566_E8E0F0BD 
X-CRM114-Status: GOOD (  11.71  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

mediatek,pinctrl-mt6795.yaml has different node name patterns which match
bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
has a description of the pinmux property, as well as some additional
descriptions for some pin configuration properties. Pull those changes
into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
preparation to combine the MT6795 document into it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index f4bab7a132d3..0dcbca5ca8f9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
 
 patternProperties:
-  '-[0-9]*$':
+  '-pins$':
     type: object
     additionalProperties: false
 
     patternProperties:
-      '-pins*$':
+      '^pins':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing the
@@ -124,7 +124,9 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input
           schmitt.
-        $ref: /schemas/pinctrl/pincfg-node.yaml
+        allOf:
+          - $ref: pinmux-node.yaml
+          - $ref: pincfg-node.yaml
 
         properties:
           pinmux:
@@ -135,9 +137,25 @@ patternProperties:
 
           bias-disable: true
 
-          bias-pull-up: true
-
-          bias-pull-down: true
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up PUPD/R0/R1 type define value.
+            description: |
+              For normal pull up type, it is not necessary to specify R1R0
+              values; When pull up type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down PUPD/R0/R1 type define value.
+            description: |
+              For normal pull down type, it is not necessary to specify R1R0
+              values; When pull down type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
 
           input-enable: true
 
@@ -221,8 +239,8 @@ examples:
             #interrupt-cells = <2>;
             interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
 
-            mmc0_pins_default: mmc0-0 {
-                cmd-dat-pins {
+            mmc0_pins_default: mmc0-pins {
+                pins-cmd-dat {
                     pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
                         <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
                         <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
@@ -235,11 +253,11 @@ examples:
                     input-enable;
                     mediatek,pull-up-adv = <1>;
                 };
-                clk-pins {
+                pins-clk {
                     pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
                     mediatek,pull-down-adv = <2>;
                 };
-                rst-pins {
+                pins-rst {
                     pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
                     mediatek,pull-up-adv = <0>;
                 };
-- 
2.54.0


