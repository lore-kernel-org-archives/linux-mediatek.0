Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69029CFD35C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15ufGLidV7xTiVLYKe1LISm2ma4BRCQCw+nEybyGtSw=; b=i1T1ZVbKob7w5p8fGBgt0o/5ns
	fzVddTSQDOfToRghOe/dXtLfX6+0V5euKB3DAiGkuWK/qMMWks23R3xLgpM9GKPdQ1aPYYuVuXGct
	6dbPcxf2GjGIWAB7oCrbrQxKsyJJ0VyLFbPKr4W/rE7V9Wzgzg0wswc0xpsC/k7LLbqJriTCztr/4
	mAjOWDGTbYzYFLiEJdNp/3dQfHBqc3KfBrgG9omfu92X7AbShyGKfUHQ79WSk95H5kXmSHKqTJUPB
	570q9F+F1fZjqBtzqSFN8xisMvKDLt0P8oPY9tPf83SJnCDVhGpccWs79e0tPf/Xg8YD+d/s/jUix
	GGPRmoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEQK-0000000GECk-1XJl;
	Fri, 11 Oct 2024 12:07:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEP2-0000000GDm4-1XUN;
	Fri, 11 Oct 2024 12:05:53 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c5cf26b95aso2480058a12.3;
        Fri, 11 Oct 2024 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648350; x=1729253150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15ufGLidV7xTiVLYKe1LISm2ma4BRCQCw+nEybyGtSw=;
        b=Y3qqJ5DQ5xYD9nCL5S8SosTcVq9gUYEAiSd1ks4CNtWFY8CrHgkrqEKfO5MhbyLxa9
         R2sljmUUVo8oEoor3Y09lGWuyfJCwD8PwU497633NF9G38z4+owLRmrAmo6To4Qj8i6d
         LrRzrzIS0VxagNfKLza7v7fdR7fCUzReX29dtKh6QN/Vzb9HsTEY9s+3fZoKhZFC2W7R
         XJsaMev7xCV1RWLN1K7AUwe10F+hqGmS+6CuhcNaOD2UKamYDFJA3MCSBMgZnrzxC3Oe
         MP2l/6zExkI/8OCuSDG28rKSyPjALb1ctRBRDOihFZaTiTeIiiSnxl7dLmVZFhnvS8Vt
         eYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648350; x=1729253150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15ufGLidV7xTiVLYKe1LISm2ma4BRCQCw+nEybyGtSw=;
        b=SEvnf2EAyg2CDsitJY8ztfX7usBb2wP0J20i+YQkwMVjAyP2RT48JQ/PxRgTz6xbzJ
         K1Iq9pdrsPeV28boNgdVn6ZJWEWVxcWAAInYQ1EF3RchO0XSV+xpUfXNPn0wNpmwtj2P
         g+rQY7jTHaE+6fcqeRcykThQgfHqHuelxGX/KlJbopsjSomrhhC7GRc8T/qEHYY32hrs
         DEXN060/qm6fiDlTEx7xqkPt8RHIH/S81cT4ZlScdmkl9TTBePuGo53CIVPBuOGZ/OXU
         2oh1Z4SgQsbQv1s0JSD4/azNJ+uQje/aZM9qtihfQGOFdGdVPtGuAPvWxrMJ4Fz15dWL
         cMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHbWOaZDccXBCDUliW8ngsJE8Qnk94KOdaIBKUOskeMxxlD5yRolBciLmSyS4lZYIJSsvpKW+mdIZs6pIbBp0=@lists.infradead.org, AJvYcCXWfrQtItSiaCpYEm6hguxXf5gHSrmc4YHNmti4yo3dREpP+NKU/y2rbBUm76XnOHwzoc/vJwk6JW/+H8Q9wUiZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6sNQbFgkY6D5ZnKWF2JgrcEYymmVVGX93dYVyy9TXcutoaC8V
	gswXJbeQDl/ccWhV+zIBD/FupngeaPnS70sDdgoEAv+5iwbhQ38H
X-Google-Smtp-Source: AGHT+IGU01REcE+AzBfyT1Sdcj1nLZWea1CrUM9PMpiXxRg88PV/hwQ3aNdUFMouigZi3GHmsTSiww==
X-Received: by 2002:a17:907:f183:b0:a99:4d04:32b0 with SMTP id a640c23a62f3a-a99b95dba6dmr199405066b.31.1728648350015;
        Fri, 11 Oct 2024 05:05:50 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:05:49 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Date: Fri, 11 Oct 2024 15:03:46 +0300
Message-ID: <20241011120520.140318-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050552_450136_4D3028D1 
X-CRM114-Status: GOOD (  12.02  )
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
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 3bbc00df5548d..352a88d7b135e 100644
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
2.46.2


