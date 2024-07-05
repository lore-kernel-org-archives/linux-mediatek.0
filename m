Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEB7C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LG/4CrXAqptFfEbMYtGXqzKFaFf7btwysdnKxl9qum8=; b=EO5pJdOV0vFIeShb36JfyPdhs4
	dJEpIT8x5ElAhb1U4ckOZlsWVPXulAs6xPw4mNGV67hb1PdzRkpWu+qliaFInYfV4IpGACh5blKPG
	iJJY+fj1Z4MgTulA3+5KiCWs0mITsER1WfdjlEXtLwY3N2YGz1nf4lmD490qsrHSMuYi5PnJX0dmb
	jiXsNVvPpTI6pc4E+KtDkVvid9o8fCeeEQAaAZQ44FLlVXopHHrUBw4jz2Ut2viq32duj/0ECFr67
	3asNeN6CWDwBpZGLuEvotNxTUt1JqAj3CfO7uDee/0MLZan032zVbGEbilskxNvUeb0UJeRvuWTT1
	/Jwwvl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfhz-0000000FZpK-07dB;
	Fri, 05 Jul 2024 09:58:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcJ-0000000FWUl-37rX
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso87645e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173154; x=1720777954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LG/4CrXAqptFfEbMYtGXqzKFaFf7btwysdnKxl9qum8=;
        b=NM2eCSF16NzaVaARJ0Oe17Rryw7olKMa7/KIvFhJoni2VbqDWJ6a9o8BkiPLRhPEp8
         mtI/8SVNuMBWcISI7unaYwL/05kAoCat4BYjngrXNuMQqS86HaOL56HAAwVHEt3QVVdg
         AtLnB97I+4HqYu0y27XYqco8bBHOAdLVVdYKSF2ao0oguP4MeljqQO+Uu750LDdn7pzj
         mhTkeOGjHJa0eHuLy9QV+jh9jIjWm08rIAzbqS4O4tefNEreVnLMyegeajaH6kVqj8kx
         oQYjX/bnhMLvWxRIYqKiBkxhuNTsVPON9MMNAL6b1Cxg1fM03PxwvemCVGRNdV9dR6x8
         j3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173154; x=1720777954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LG/4CrXAqptFfEbMYtGXqzKFaFf7btwysdnKxl9qum8=;
        b=I+REhUVOwNoyKte3y9nZUs7BcZee/0pJSmm4qPgRVyiR/UsbHNuWDtbQLb9iM2Akq1
         GSFNdvWWNEgmRFHwEK1KyDeGDV3jHOsRevoe3CHujnzcjMQdnA+Tb29vw6Qnbh9Z1Prw
         LqOfvLNE28f+KJOSwo5wv/Op6QpOUQ9/PCCUd7tgSQH2+QSUzLZFKU/6IntNWv/P7Rjo
         FuWmLY/hM2SqIEcgDowUlrEZ8uNydVlANoaxU9hVK1y+LuHOwNEhI9w2hRgU0dCFUout
         q5L+iDChxF3hC24v3xavSVbsiFhCwWp9sHZLG4DMQD82R/JEASZvfIZ6KznidEwXUR7I
         SaHA==
X-Forwarded-Encrypted: i=1; AJvYcCWP7kcs3EOk+NlJ1xtFANYaIW4DQN6ND+0x7xZJb3OlTjq+u9BQ5UalnAEfQ3J2XZfG0cob41sFYd0YiG0RQLNoRHzk6c2uYAqFtoDPvMHUQLYy
X-Gm-Message-State: AOJu0Ywq168LA+zpx+JgULOxzCWXPmtc02oOf+QXKCzg8P5kEu6UKh+4
	mfSg33JQ0gNJE3wGQVFJosDsKbnrOFEtSDDu9zc+X7Khn+yYjVxnlTaUvGTKOvw=
X-Google-Smtp-Source: AGHT+IEvcyctBw9s7z1yzwNzhKPTOdYB5wBXpkTjIqVgkLrTSK+XCUaUI+wUWDgZyRBoOJfeGDCZdw==
X-Received: by 2002:a05:600c:54e6:b0:424:ac5a:fc38 with SMTP id 5b1f17b1804b1-4264b161646mr38383395e9.13.1720173154161;
        Fri, 05 Jul 2024 02:52:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:41 +0200
Subject: [PATCH RESEND 22/22] dt-bindings: thermal: cleanup examples
 indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-22-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21322;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H6+ILgi/j/YqzVvmiz8JSiOJwoMUpOHpLCtc3/i93XA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8I3KWNyjKUf6Omk6AZm7Ylgqw4Wej0VBP0Q/
 dfW4TPk90mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCNwAKCRDBN2bmhouD
 1y/eD/9hz+J9T+3Z9JNwdjgkBSteuKRo2tZtK+Y+nIPKxk38RUIAjoLSIEpHW2305PRXQL/iWJT
 tPKk4pA8jBpY036K/0Q2mUVJcMRQqq9CCD/A+btrsYo7gyQMNWrDUemRB8RFXcWC/vPHhHNwh3M
 ruSoHurBL16z3Qgye18xAmkPj/8JFDrgIxCLd3iau1Ow1IB0703+TiS8scRumqXyWsfbjk1rCIw
 svHGBzHRhzmNKQ94uEEVMXiaORIqxV+udqAAp/cZ0B3DBlJN6HfrXP+OxA0o6SQBe2d2fhlIZBj
 bS2Q8q1wmgKI2Lfes3FjLdiPhHi9YBaPh814SOPhl6Pr82/8/XX+XVndpCgxNfp0WeTyqR4dZ+1
 nX2SK44yMzQD3vW1GScfvlCJh01BnKuw3tIZ0xhkmVu2JtjstvHRdjJAJmTyT93ythxNkgYc9YY
 +pv+4Qm3KUbterflF80nCwUwScwrHO1SijiGaV1CWoLrmkEFmSUyF+vMgj+NcaajuZ+NkHz4zSj
 lui42bIU1vS7eTNLCMpYmcDzl8+1vczVzMPu9s+Hajk6tcP8v4YXVHR4IkfeGy50PL+EaCMVmf3
 IXVcDMzNrk83IodG9775AdoGYzImrJR0MQouys+NglEUF0vjJtm4jWFglAodEHBS8s8I93mqGIk
 2oJwJMZN9+UrwwA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025236_155695_8671179F 
X-CRM114-Status: GOOD (  11.04  )
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

Preferred indentation for DTS examples in the bindings is 4-space.  It
is also preferred not to have redundant/unused labels. No functional
change

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/thermal/amlogic,thermal.yaml          | 18 ++---
 .../bindings/thermal/brcm,avs-ro-thermal.yaml      | 16 ++--
 .../devicetree/bindings/thermal/brcm,avs-tmon.yaml | 16 ++--
 .../devicetree/bindings/thermal/qcom-tsens.yaml    | 88 ++++++++++------------
 .../bindings/thermal/rcar-gen3-thermal.yaml        | 64 ++++++++--------
 .../devicetree/bindings/thermal/rcar-thermal.yaml  | 60 +++++++--------
 .../devicetree/bindings/thermal/rzg2l-thermal.yaml | 36 ++++-----
 .../devicetree/bindings/thermal/sprd-thermal.yaml  | 42 +++++------
 .../bindings/thermal/ti,am654-thermal.yaml         | 10 +--
 9 files changed, 172 insertions(+), 178 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index e52fc40e215d..725303e1a364 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -50,13 +50,13 @@ unevaluatedProperties: false
 
 examples:
   - |
-        cpu_temp: temperature-sensor@ff634800 {
-                compatible = "amlogic,g12a-cpu-thermal",
-                             "amlogic,g12a-thermal";
-                reg = <0xff634800 0x50>;
-                interrupts = <0x0 0x24 0x0>;
-                clocks = <&clk 164>;
-                #thermal-sensor-cells = <0>;
-                amlogic,ao-secure = <&sec_AO>;
-        };
+    temperature-sensor@ff634800 {
+        compatible = "amlogic,g12a-cpu-thermal",
+                     "amlogic,g12a-thermal";
+        reg = <0xff634800 0x50>;
+        interrupts = <0x0 0x24 0x0>;
+        clocks = <&clk 164>;
+        #thermal-sensor-cells = <0>;
+        amlogic,ao-secure = <&sec_AO>;
+    };
 ...
diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
index 0271a0bc1843..29a9844e8b48 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
@@ -35,14 +35,14 @@ unevaluatedProperties: false
 
 examples:
   - |
-        avs-monitor@7d5d2000 {
-                compatible = "brcm,bcm2711-avs-monitor",
-                             "syscon", "simple-mfd";
-                reg = <0x7d5d2000 0xf00>;
+    avs-monitor@7d5d2000 {
+        compatible = "brcm,bcm2711-avs-monitor",
+                     "syscon", "simple-mfd";
+        reg = <0x7d5d2000 0xf00>;
 
-                thermal: thermal {
-                        compatible = "brcm,bcm2711-thermal";
-                        #thermal-sensor-cells = <0>;
-                };
+        thermal: thermal {
+            compatible = "brcm,bcm2711-thermal";
+            #thermal-sensor-cells = <0>;
         };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
index 32730211e15b..081486b44382 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
@@ -45,11 +45,11 @@ required:
 
 examples:
   - |
-     thermal@f04d1500 {
-          compatible = "brcm,avs-tmon-bcm7445", "brcm,avs-tmon";
-          reg = <0xf04d1500 0x28>;
-          interrupts = <0x6>;
-          interrupt-names = "tmon";
-          interrupt-parent = <&avs_host_l2_intc>;
-          #thermal-sensor-cells = <0>;
-     };
+    thermal@f04d1500 {
+        compatible = "brcm,avs-tmon-bcm7445", "brcm,avs-tmon";
+        reg = <0xf04d1500 0x28>;
+        interrupts = <0x6>;
+        interrupt-names = "tmon";
+        interrupt-parent = <&avs_host_l2_intc>;
+        #thermal-sensor-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index cce6624228c7..01f9f45b94c2 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -295,22 +295,16 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    // Example msm9860 based SoC (ipq8064):
-    gcc: clock-controller {
+    thermal-sensor {
+        compatible = "qcom,ipq8064-tsens";
 
-           /* ... */
+        nvmem-cells = <&tsens_calib>, <&tsens_calib_backup>;
+        nvmem-cell-names = "calib", "calib_backup";
+        interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "uplow";
 
-           tsens: thermal-sensor {
-                compatible = "qcom,ipq8064-tsens";
-
-                 nvmem-cells = <&tsens_calib>, <&tsens_calib_backup>;
-                 nvmem-cell-names = "calib", "calib_backup";
-                 interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
-                 interrupt-names = "uplow";
-
-                 #qcom,sensors = <11>;
-                 #thermal-sensor-cells = <1>;
-          };
+        #qcom,sensors = <11>;
+        #thermal-sensor-cells = <1>;
     };
 
   - |
@@ -347,66 +341,66 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     // Example 1 (legacy: for pre v1 IP):
     tsens1: thermal-sensor@4a9000 {
-           compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
-           reg = <0x4a9000 0x1000>, /* TM */
-                 <0x4a8000 0x1000>; /* SROT */
+        compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
+        reg = <0x4a9000 0x1000>, /* TM */
+              <0x4a8000 0x1000>; /* SROT */
 
-           nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
-           nvmem-cell-names = "calib", "calib_sel";
+        nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
+        nvmem-cell-names = "calib", "calib_sel";
 
-           interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-           interrupt-names = "uplow";
+        interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "uplow";
 
-           #qcom,sensors = <5>;
-           #thermal-sensor-cells = <1>;
+        #qcom,sensors = <5>;
+        #thermal-sensor-cells = <1>;
     };
 
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     // Example 2 (for any platform containing v1 of the TSENS IP):
     tsens2: thermal-sensor@4a9000 {
-          compatible = "qcom,qcs404-tsens", "qcom,tsens-v1";
-          reg = <0x004a9000 0x1000>, /* TM */
-                <0x004a8000 0x1000>; /* SROT */
+        compatible = "qcom,qcs404-tsens", "qcom,tsens-v1";
+        reg = <0x004a9000 0x1000>, /* TM */
+              <0x004a8000 0x1000>; /* SROT */
 
-          nvmem-cells = <&tsens_caldata>;
-          nvmem-cell-names = "calib";
+        nvmem-cells = <&tsens_caldata>;
+        nvmem-cell-names = "calib";
 
-          interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
-          interrupt-names = "uplow";
+        interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "uplow";
 
-          #qcom,sensors = <10>;
-          #thermal-sensor-cells = <1>;
+        #qcom,sensors = <10>;
+        #thermal-sensor-cells = <1>;
     };
 
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     // Example 3 (for any platform containing v2 of the TSENS IP):
     tsens3: thermal-sensor@c263000 {
-           compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
-           reg = <0xc263000 0x1ff>,
-                 <0xc222000 0x1ff>;
+        compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
+        reg = <0xc263000 0x1ff>,
+              <0xc222000 0x1ff>;
 
-           interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
-                        <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
-           interrupt-names = "uplow", "critical";
+        interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "uplow", "critical";
 
-           #qcom,sensors = <13>;
-           #thermal-sensor-cells = <1>;
+        #qcom,sensors = <13>;
+        #thermal-sensor-cells = <1>;
     };
 
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     // Example 4 (for any IPQ8074 based SoC-s):
     tsens4: thermal-sensor@4a9000 {
-           compatible = "qcom,ipq8074-tsens";
-           reg = <0x4a9000 0x1000>,
-                 <0x4a8000 0x1000>;
+        compatible = "qcom,ipq8074-tsens";
+        reg = <0x4a9000 0x1000>,
+              <0x4a8000 0x1000>;
 
-           interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-           interrupt-names = "combined";
+        interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "combined";
 
-           #qcom,sensors = <16>;
-           #thermal-sensor-cells = <1>;
+        #qcom,sensors = <16>;
+        #thermal-sensor-cells = <1>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
index d92e882c9e8d..b6657d64cf3d 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
@@ -106,33 +106,33 @@ examples:
     #include <dt-bindings/power/r8a7795-sysc.h>
 
     tsc: thermal@e6198000 {
-            compatible = "renesas,r8a7795-thermal";
-            reg = <0xe6198000 0x100>,
-                  <0xe61a0000 0x100>,
-                  <0xe61a8000 0x100>;
-            interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 522>;
-            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-            resets = <&cpg 522>;
-            #thermal-sensor-cells = <1>;
+        compatible = "renesas,r8a7795-thermal";
+        reg = <0xe6198000 0x100>,
+              <0xe61a0000 0x100>,
+              <0xe61a8000 0x100>;
+        interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 522>;
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 522>;
+        #thermal-sensor-cells = <1>;
     };
 
     thermal-zones {
-            sensor_thermal: sensor-thermal {
-                    polling-delay-passive = <250>;
-                    polling-delay = <1000>;
-                    thermal-sensors = <&tsc 0>;
+        sensor_thermal: sensor-thermal {
+            polling-delay-passive = <250>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tsc 0>;
 
-                    trips {
-                            sensor1_crit: sensor1-crit {
-                                    temperature = <90000>;
-                                    hysteresis = <2000>;
-                                    type = "critical";
-                            };
-                    };
+            trips {
+                sensor1_crit: sensor1-crit {
+                    temperature = <90000>;
+                    hysteresis = <2000>;
+                    type = "critical";
+                };
             };
+        };
     };
   - |
     #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
@@ -140,14 +140,14 @@ examples:
     #include <dt-bindings/power/r8a779a0-sysc.h>
 
     tsc_r8a779a0: thermal@e6190000 {
-            compatible = "renesas,r8a779a0-thermal";
-            reg = <0xe6190000 0x200>,
-                  <0xe6198000 0x200>,
-                  <0xe61a0000 0x200>,
-                  <0xe61a8000 0x200>,
-                  <0xe61b0000 0x200>;
-            clocks = <&cpg CPG_MOD 919>;
-            power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-            resets = <&cpg 919>;
-            #thermal-sensor-cells = <1>;
+        compatible = "renesas,r8a779a0-thermal";
+        reg = <0xe6190000 0x200>,
+              <0xe6198000 0x200>,
+              <0xe61a0000 0x200>,
+              <0xe61a8000 0x200>,
+              <0xe61b0000 0x200>;
+        clocks = <&cpg CPG_MOD 919>;
+        power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+        resets = <&cpg 919>;
+        #thermal-sensor-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
index 119998d10ff4..221a58d18cad 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
@@ -98,8 +98,8 @@ examples:
   # Example (non interrupt support)
   - |
     thermal@ffc48000 {
-            compatible = "renesas,thermal-r8a7779", "renesas,rcar-thermal";
-            reg = <0xffc48000 0x38>;
+        compatible = "renesas,thermal-r8a7779", "renesas,rcar-thermal";
+        reg = <0xffc48000 0x38>;
     };
 
   # Example (interrupt support)
@@ -109,12 +109,12 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     thermal@e61f0000 {
-            compatible = "renesas,thermal-r8a73a4", "renesas,rcar-thermal";
-            reg = <0xe61f0000 0x14>, <0xe61f0100 0x38>,
-                  <0xe61f0200 0x38>, <0xe61f0300 0x38>;
-            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&mstp5_clks R8A73A4_CLK_THERMAL>;
-            power-domains = <&pd_c5>;
+        compatible = "renesas,thermal-r8a73a4", "renesas,rcar-thermal";
+        reg = <0xe61f0000 0x14>, <0xe61f0100 0x38>,
+              <0xe61f0200 0x38>, <0xe61f0300 0x38>;
+        interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&mstp5_clks R8A73A4_CLK_THERMAL>;
+        power-domains = <&pd_c5>;
     };
 
   # Example (with thermal-zone)
@@ -124,32 +124,32 @@ examples:
     #include <dt-bindings/power/r8a7790-sysc.h>
 
     thermal: thermal@e61f0000 {
-      compatible = "renesas,thermal-r8a7790",
-                   "renesas,rcar-gen2-thermal",
-                   "renesas,rcar-thermal";
-            reg = <0xe61f0000 0x10>, <0xe61f0100 0x38>;
-            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 522>;
-            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-            resets = <&cpg 522>;
-            #thermal-sensor-cells = <0>;
+        compatible = "renesas,thermal-r8a7790",
+                     "renesas,rcar-gen2-thermal",
+                     "renesas,rcar-thermal";
+        reg = <0xe61f0000 0x10>, <0xe61f0100 0x38>;
+        interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 522>;
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 522>;
+        #thermal-sensor-cells = <0>;
     };
 
     thermal-zones {
-            cpu_thermal: cpu-thermal {
-                    polling-delay-passive = <1000>;
-                    polling-delay = <5000>;
+        cpu_thermal: cpu-thermal {
+            polling-delay-passive = <1000>;
+            polling-delay = <5000>;
 
-                    thermal-sensors = <&thermal>;
+            thermal-sensors = <&thermal>;
 
-                    trips {
-                            cpu-crit {
-                                    temperature = <115000>;
-                                    hysteresis = <0>;
-                                    type = "critical";
-                            };
-                    };
-                    cooling-maps {
-                    };
+            trips {
+                cpu-crit {
+                    temperature = <115000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
             };
+            cooling-maps {
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
index 2f96c0fe0f75..136589f5adee 100644
--- a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
@@ -53,27 +53,27 @@ examples:
     #include <dt-bindings/clock/r9a07g044-cpg.h>
 
     tsu: thermal@10059400 {
-            compatible = "renesas,r9a07g044-tsu",
-                         "renesas,rzg2l-tsu";
-            reg = <0x10059400 0x400>;
-            clocks = <&cpg CPG_MOD R9A07G044_TSU_PCLK>;
-            resets = <&cpg R9A07G044_TSU_PRESETN>;
-            power-domains = <&cpg>;
-            #thermal-sensor-cells = <1>;
+        compatible = "renesas,r9a07g044-tsu",
+                     "renesas,rzg2l-tsu";
+        reg = <0x10059400 0x400>;
+        clocks = <&cpg CPG_MOD R9A07G044_TSU_PCLK>;
+        resets = <&cpg R9A07G044_TSU_PRESETN>;
+        power-domains = <&cpg>;
+        #thermal-sensor-cells = <1>;
     };
 
     thermal-zones {
-            cpu-thermal {
-                    polling-delay-passive = <250>;
-                    polling-delay = <1000>;
-                    thermal-sensors = <&tsu 0>;
+        cpu-thermal {
+            polling-delay-passive = <250>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tsu 0>;
 
-                    trips {
-                            sensor_crit: sensor-crit {
-                                    temperature = <125000>;
-                                    hysteresis = <1000>;
-                                    type = "critical";
-                            };
-                    };
+            trips {
+                sensor_crit: sensor-crit {
+                    temperature = <125000>;
+                    hysteresis = <1000>;
+                    type = "critical";
+                };
             };
+        };
     };
diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
index f65076fc68f9..afa551f6185f 100644
--- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
@@ -86,27 +86,27 @@ unevaluatedProperties: false
 
 examples:
   - |
-        ap_thm0: thermal@32200000 {
-                compatible = "sprd,ums512-thermal";
-                reg = <0x32200000 0x10000>;
-                clock-names = "enable";
-                clocks = <&aonapb_gate 32>;
-                #thermal-sensor-cells = <1>;
-                nvmem-cells = <&thm0_sign>, <&thm0_ratio>;
-                nvmem-cell-names = "thm_sign_cal", "thm_ratio_cal";
-                #address-cells = <1>;
-                #size-cells = <0>;
+    thermal@32200000 {
+        compatible = "sprd,ums512-thermal";
+        reg = <0x32200000 0x10000>;
+        clock-names = "enable";
+        clocks = <&aonapb_gate 32>;
+        #thermal-sensor-cells = <1>;
+        nvmem-cells = <&thm0_sign>, <&thm0_ratio>;
+        nvmem-cell-names = "thm_sign_cal", "thm_ratio_cal";
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-                prometheus-sensor@0 {
-                        reg = <0>;
-                        nvmem-cells = <&thm0_sen0>;
-                        nvmem-cell-names = "sen_delta_cal";
-                };
-
-                ank-sensor@1 {
-                        reg = <1>;
-                        nvmem-cells = <&thm0_sen1>;
-                        nvmem-cell-names = "sen_delta_cal";
-                };
+        prometheus-sensor@0 {
+            reg = <0>;
+            nvmem-cells = <&thm0_sen0>;
+            nvmem-cell-names = "sen_delta_cal";
         };
+
+        ank-sensor@1 {
+            reg = <1>;
+            nvmem-cells = <&thm0_sen1>;
+            nvmem-cell-names = "sen_delta_cal";
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
index 16801aa78bc2..c123d9070525 100644
--- a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
@@ -47,11 +47,11 @@ examples:
         thermal-sensors = <&vtm0 0>;
 
         trips {
-                mpu0_crit: mpu0_crit {
-                        temperature = <125000>; /* milliCelsius */
-                        hysteresis = <2000>; /* milliCelsius */
-                        type = "critical";
-                };
+            mpu0_crit: mpu0_crit {
+                temperature = <125000>; /* milliCelsius */
+                hysteresis = <2000>; /* milliCelsius */
+                type = "critical";
+            };
         };
     };
 ...

-- 
2.43.0


