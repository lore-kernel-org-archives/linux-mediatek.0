Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18287C48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 21:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=; b=1xMqeN+7Xqr9wVN2ZMbjWT+GsV
	4xMZHxl/sh++L09BUXrMqjaXmki0088mSJkvLudlYzTxnaIzdJpeVtoH33rZ1vOgPqSIjJ0WwqWMM
	oFJPybZwHr9mqOW8EXHNE6a8BUqn/bv3ZsHopkG7l4Js15zsuypLZnneTZuqFotorwNVNcMIPiqmc
	C7Xm+6VODacGvyhL7gPorDQRxRIVDt7sRo+YcIhc53tKhHpKN1JpCujzxOt8B3bru292+Am8jN/Ba
	StAIN5VFPf7grgE6CJF9FZEBg0pEMG2rXpMm223tYBSiBY6Rz6B/y7wrV0+mNHldZr6ce/4GUn8un
	mMhCC+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMa1-0000000EGOg-2iEH;
	Wed, 14 Feb 2024 21:14:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMZv-0000000EGKf-12cw
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 21:14:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a26f73732c5so17398366b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Feb 2024 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707945241; x=1708550041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=;
        b=FoWYFRftHzUf/LA6xlu9dDnAtXd/oBRXNXAQM4uu1iN+520Xtwz2bjIQQV/aJtGkDN
         iqWqwIsdbx6Jk1LpL6xoPmhSso/XpPGuWyEUF/jtFqYsftt+kS+5mJUcEfL5Ad9qAyPS
         UHiEt5k3d4MFDPscNIvCccOmb3lTmyiPnZPSNxGbLk/fDK8c3CFXSQWLDdZ2ltCLDj5v
         9iuMzKqJSi0rYfajQV9GvWBCmzf54TpVuYoW1oJKowHmk9nyBm97QX2YuzNcOYyPNR7e
         EkQNQuZKLcxTxOpUz1/26sonoy6vNoxW1oGn0/FWRoXz8MezRX7m2V5Hdtxb0U042c9t
         wHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707945241; x=1708550041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=;
        b=MAsHDSAKHNUmvnu5AfhAFpgAB0FjTJYrEuvH87UWVg8Jk9miXgy5hg358bDQgzCLdK
         XRm9L1lfJzezrXZ+dLpmgdMdA3R6gr8NMWAWUmphaYNvzgUakh/t832ExEn22hqSQ3CV
         678nyKVo0rbG9w+N9PvHK0hSDH66bODEnsstk5JIzcnwnmkmF0UKVm6DGTiRR7y6MrND
         60wFB2LPkySRax0BZJGx50hBEyXsZInc+r7BtQ5xivpGQu/Y30J7x0+cECxhB+7HkrFq
         d7xbLalIc8gLqwwkQlnbHRkv0UJFB1zlIUtyeRkrUFPdkLcncnyE2fDkIv/FDvfoHa71
         IWTA==
X-Forwarded-Encrypted: i=1; AJvYcCUyUj+YJ2A6yAKyoar17HCi3vBDaH0uW7WvwkZwApdvxwR6qk8m6+82rskbj1oXvdNhxd4ycjmmE3g0brkrN4QtQaEr2HTRLYyb+7G0oBBAmoUH
X-Gm-Message-State: AOJu0YwZyz/GDygVjtnuJX/RibgYwGQrfOUQOUMi80xas0uuZRjWDW13
	GV9eg6xQuVSR44WT3SeEnkOXfmRK0Lt1WyMIvQpvxS+Phq/d9Y3hflhwqXMaBEo=
X-Google-Smtp-Source: AGHT+IERQ+p2dcu9AWYeFroSMradMDt1xsmtrj5+N7oOZKxSLsUhhZCgXubfKSpX35eOahZ2Zdo3dw==
X-Received: by 2002:a17:906:4903:b0:a36:5079:d6cb with SMTP id b3-20020a170906490300b00a365079d6cbmr2605774ejq.56.1707945241517;
        Wed, 14 Feb 2024 13:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+vB34uCULCafmxyP+an2zDwCoQ+925f8c+4lAxeFTF519JN28ZccJJcGYCAeENcDV66iELaIk1A4qoFKKyHEwG0Vo2al4q+DvaQjaTldODHCB407C8aT7bjWYC1hnM+zPFhaV72MWzWtAUY6i+Wnp9BZkIZLz3uzTn0dImTk9DKWRAw+HoA3xU1O4idD5nfGXU3Mq9RKn75eCER1aG66bmDllsPTFRdkWWk7NIqiRfXaC3LyOc5jfH760Vr3LBdhfVLJ/aHassuZSvNWwIPb6eS/UUaQv8BGKPUZKXmjge3OBCg8XgjzPpVYOCZaXRAfaKuffEPOnSuVnlN7n498PD/Ghh+iFBlhnMR4vExpweMJY6zPprnY8VWwdCIAQQtjEvdyooJ0FGkdRNM6XY3udeRa5Z4/RQSbYWS5K9yE1rUjndLGS/3/sA4aPJp6akvEP/cKjpAAL4D72AHEgKoQ41LuehfhwTIfc8FhmaCC/TH3NX2LoEYI4YCIs3vX2Ly9cyH2UCWw=
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170907188800b00a3d22f53210sm1457661ejc.188.2024.02.14.13.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:14:01 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:13:46 +0200
Subject: [PATCH RFC v3 1/4] dt-bindings: spmi: Add PMIC ARB v7 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-spmi-multi-master-support-v3-1-0bae0ef04faf@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
In-Reply-To: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ThFF7MydSq7GIulN2BiuLPta4fGlEnJTyb85puKw6/Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS0SrKj6hRZFi7uAuwtr9aowEUfQvftpdaQna
 5nyHsUxNlyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0tEgAKCRAbX0TJAJUV
 VklUD/4ij3JO+NzVeF+NUsfQn/3Wvxkg98v/Ye6oGHfxwyOdXuC9LZjLdH8trQeOrhCJGS9XCfa
 OqPUsds0dNdm7ivbhrXTS5qynYgbr/rkIzvAsVzm+FB9NZL0Lx4dha5F1oZ+k1735xnIY/hHBTV
 ioTds6dS5D5TDybVqy9kRe6SOxEOPh65b1V8a+VTZu0TSONnvkHyjlDy9yHujFEmROoWF/n/2UQ
 cA877Bam/c5fB5flWDsD5w2ZMuSQKbE/UiQo/Lqq7ykxT8gMFv+J8qO59Y7FnJ79BktsSbKoBUK
 Y+5BztTBP5e0TMhq9xXBohv5P3LL7plwZayKD2KHW3qHUHUSJrWbMyLJ29ggGt1RU5Z+ZOv0340
 VhdcuHqGdfOdc/lHh9DzrQ5g7GYK750RcCY6/0kqKombn7LIz2pLnBPJgdH5hSEhc91l3/98jiR
 NSRyt5liGQoF8krBSd9i0q97Ky9b6qLNSjn0u9PByULTizJ7kCHyINNBQm703EPd0TqDx2H4Sdi
 fVIsnCJpffPMqotchZW17WHRU+f+x5Xlpa8GkqMvWdnz7OablNRDKep4DPE7Vm733S4QwTE7fJ9
 Jc78/GGJGF3twpRWiF/huUYsaqdlnhxfawIcLvKr6gUnOqgpc3qUFPyAlQsf/GC+ygsSQBNPT00
 o1+eCAT9KBKmoUg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_131403_332463_B1F66561 
X-CRM114-Status: GOOD (  11.84  )
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

Add dedicated schema for PMIC ARB v7 as it allows multiple
buses by declaring them as child nodes. These child nodes
will follow the generic spmi bus bindings.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/spmi/qcom,spmi-pmic-arb-v7.yaml       | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml
new file mode 100644
index 000000000000..8a93d2145aa5
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb-v7.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI Controller v7 (PMIC Arbiter)
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  The SPMI PMIC Arbiter v7 is found on Snapdragon chipsets. It is an SPMI
+  controller with wrapping arbitration logic to allow for multiple on-chip
+  devices to control up to 2 SPMI separate buses.
+
+  The PMIC Arbiter can also act as an interrupt controller, providing interrupts
+  to slave devices.
+
+properties:
+  compatible:
+    const: qcom,spmi-pmic-arb-v7
+
+  reg:
+    items:
+      - description: core registers
+      - description: tx-channel per virtual slave regosters
+      - description: rx-channel (called observer) per virtual slave registers
+
+  reg-names:
+    items:
+      - const: core
+      - const: chnls
+      - const: obsrvr
+
+  ranges: true
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  qcom,ee:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description: >
+      indicates the active Execution Environment identifier
+
+  qcom,channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description: >
+      which of the PMIC Arb provided channels to use for accesses
+
+patternProperties:
+  "spmi@[0-1]$":
+    type: object
+    $ref: /schemas/spmi/spmi.yaml
+
+required:
+  - compatible
+  - reg-names
+  - qcom,ee
+  - qcom,channel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spmi: arbiter@c400000 {
+      compatible = "qcom,spmi-pmic-arb-v7";
+      reg = <0x0c400000 0x3000>,
+            <0x0c500000 0x4000000>,
+            <0x0c440000 0x80000>;
+      reg-names = "core", "chnls", "obsrvr";
+
+      qcom,ee = <0>;
+      qcom,channel = <0>;
+
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spmi_bus0: spmi@0 {
+        reg = <0 0x0c42d000 0 0x4000>,
+              <0 0x0c4c0000 0 0x10000>;
+        reg-names = "cnfg", "intr";
+
+        interrupt-names = "periph_irq";
+        interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <4>;
+
+        qcom,bus-id = <0>;
+
+        #address-cells = <2>;
+        #size-cells = <0>;
+      };
+
+      spmi_bus1: spmi@1 {
+        reg = <0 0x0c432000 0 0x4000>,
+              <0 0x0c4d0000 0 0x10000>;
+        reg-names = "cnfg", "intr";
+
+        interrupt-names = "periph_irq";
+        interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <4>;
+
+        qcom,bus-id = <1>;
+
+        #address-cells = <2>;
+        #size-cells = <0>;
+      };
+    };

-- 
2.34.1


