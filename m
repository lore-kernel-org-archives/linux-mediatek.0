Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8D0C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 18:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0l9XqgR5rgZt/McZ1+LYeV2+Ae3g0xUIEFWoqdq9PI=; b=bKE354SKiGkfYoRVkhk4ZNZ8bG
	ZvtYLgXC8JByXSqwnTgX0HwyqlfvmLicCgj6PpXbtz5ys3Sh98YXndQsNBfxUVN+ey2sBLau+GDBi
	r32Fv6LFiPvhuFsRK6n6GoPurW7iPA0hxp8LajVsBIPRpQsJzEiDgVAny8p4wXcmLsGZgr0ozJAmN
	ii8utc6Aop8lHtLFKdosGgFT8RNuZE1tRRaFhaUXOK1s62Dm/6FTsnHWME2apdecAl8oLIxv1Ajp0
	v7qf6yx0hlAGyfRf0dQ/tkOOCi2wrWzaiVDAYGzonOe9u5GGGg/mjyhd/GW99GIUV7S9ewL9BHJ4v
	8D0qcdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHNW-00000001f8K-1xyp;
	Fri, 29 Mar 2024 18:55:02 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHNH-00000001evo-21H4
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 18:54:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a4e0e3ef357so304268266b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711738484; x=1712343284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0l9XqgR5rgZt/McZ1+LYeV2+Ae3g0xUIEFWoqdq9PI=;
        b=giJxJjYsWGXCT0NNyElkyYyx6GLpqnUugiETqUrAcMK57o8POrlJO4g/G1jn6Jd+Nb
         OZuvMfYvLD/E1IDkBLCF3V1jFAKQVbkMFUFzD4bJIqL21tfVW7oiJ9GD4osVCvlXBC4N
         pu0syRz930La5Xw4BG77Y7oZZWfAJqVbosaLnb2KNLfo1J9p24wrQsT4iM7MupOhirHQ
         /YjZssmMX4MSM/NciM+Jd/bEccP6GMmgi2tFrY5T5p4zWVOiKMEgN8nqjFw2Vio6c4Pi
         NWreV7RDMqE7G2p44On9AN7lkbI4ZKiMg24uf+wfeC08ud0XfntwZi6+CH6I5S4iZkIA
         7v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711738484; x=1712343284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0l9XqgR5rgZt/McZ1+LYeV2+Ae3g0xUIEFWoqdq9PI=;
        b=HQLFpX9OwoB5quEtuuqv9YQ/+aI2YttRo3UWEkg59w15RczD2rQaYfYX8cj6LRcKdB
         i2lsG2yF5rJPGDgtjVRVPTZQTOdeHumHitJiOiIf5wp7XTMC3hZt5wgzBL+cfCOf2IkO
         8pb9HxI6VXKyXOIzyKEZdLqlUckPAMbEYSQvUKd3oSvDPUbn0SxOYl4HctMAo+HjXsQO
         pjS4iKgs6sQZz48FgEM+mr2tfVZemBUmb1Uyc/8/pIx54N8WdoGWy/A94CjAadcIRUwI
         LwFTdVUCy/W1XkGBwCxPs4ObqTzR21SUd2oXf45X7aXCcQ5FDCz5aC0d/HeeDhp4eOHm
         4MlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz2XjGwkLIa++3oBS5xlBVu3CXVf1XA3jqv2tRz5OHP5bHAFccmRS1HFnwIeKkmSA2s+TGX3DI/whi7w7rTeMEwg7GRyk7gaD8ykFRZsi/N6ea
X-Gm-Message-State: AOJu0Yz5o9R4FPp2vHC8NUCFYELZaZNrgVyUht8w0eVgyGfyGprTrq8q
	SGdelJTeUsua8DWdsiuJ4cZmZBsgSYSyJnJNnZyIWudSCXo8E5tyJSRghUBJ/+Y=
X-Google-Smtp-Source: AGHT+IEvez3gnbfE1h985nyrZbf3lwtS5MK1xcBVKx0GUJnsoq87hfeTZGXxgOag0cR9v/4ebdQxYw==
X-Received: by 2002:a17:907:9877:b0:a4e:1c3d:89a0 with SMTP id ko23-20020a170907987700b00a4e1c3d89a0mr2367909ejc.4.1711738484378;
        Fri, 29 Mar 2024 11:54:44 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gl20-20020a170906e0d400b00a46c39e6a47sm2235618ejb.148.2024.03.29.11.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 11:54:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 29 Mar 2024 20:54:18 +0200
Subject: [PATCH v7 1/6] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-spmi-multi-master-support-v7-1-7b902824246c@linaro.org>
References: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
In-Reply-To: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4280; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=H2L6hk3BSbGZWXsaMqnOwDhN0rNiIn1lAFbUz+5zVTU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmBw5p2QmwCkKqbzyOMMbpOWoF0qvc0ARyq+X+6
 7dr0j/S0MGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgcOaQAKCRAbX0TJAJUV
 VszXEAC7xyiA34AfEV+TDkvZPPpgeAtVDPvwKYKFPF3hrkY3F0SNCyutBXWPsZ7dENoGccze8U0
 7kCiz7fwqH0tnQV4rqcWaKO7cbWzczKlGSlxVVDYElSZ8a0zGf9WxWwzYDOKMkJjad9+eD+Xzex
 VZKu9Utt06TL/e8lfdjrAInA7X/Ck+RrxxzU7XVz5bKQE5WeKpQf5gth7xUsvcNBcfdk0sRq5iK
 VflDiQ2y44YfO7Xuj/CLbOtUeORzhUHJl4L45OHG2UoFE+oNpD2jCSFWHLf3d01gnINHUYDrSJz
 47qnj+g26WRZwhTI/I/C/s+cYbpDvlP/rrmTy9fE7a5El/h69oOXt4ScbzOU9SyDIqJE8N9yZTs
 95P5VyxPlfzlykS13ZWttrlVU7s5Lf4m5Vr0j3JRTp5AmW2sZAf+UOwr1xhnMzzkVh/UM1UVe4e
 LbkV130Tk5QEfBSg++abtl+qjr0cogYZfYGAxH2GMVOQcTFEqVohDWou6hxuGxXtSA45hP+vzoV
 3wn41LNj9CsGULuLON5/HvbBG0VZCHBS40ZP01hft0uBYPsXXksiSn18m/NLojuBXl130tp8oQF
 W3eFMnDjO+bGm4CwZsmi4lKQYHk6UJJLeyzSh0qKzO0mDFPcDKYlOcuxWONbDlTkDpQuAbblx3Y
 9QJj0ZUb51A+sGQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_115447_571861_486BFE84 
X-CRM114-Status: GOOD (  12.62  )
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

Add dedicated schema for X1E80100 PMIC ARB (v7) as it allows multiple
buses by declaring them as child nodes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
new file mode 100644
index 000000000000..f32a7ae33b4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,x1e80100-spmi-pmic-arb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 SPMI Controller (PMIC Arbiter v7)
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  The X1E80100 SPMI PMIC Arbiter implements HW version 7 and it's an SPMI
+  controller with wrapping arbitration logic to allow for multiple on-chip
+  devices to control up to 2 SPMI separate buses.
+
+  The PMIC Arbiter can also act as an interrupt controller, providing interrupts
+  to slave devices.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-spmi-pmic-arb
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
+  "^spmi@[a-f0-9]+$":
+    type: object
+    $ref: /schemas/spmi/spmi.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        items:
+          - description: configuration registers
+          - description: interrupt controller registers
+
+      reg-names:
+        items:
+          - const: cnfg
+          - const: intr
+
+      interrupts:
+        maxItems: 1
+
+      interrupt-names:
+        const: periph_irq
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 4
+        description: |
+          cell 1: slave ID for the requested interrupt (0-15)
+          cell 2: peripheral ID for requested interrupt (0-255)
+          cell 3: the requested peripheral interrupt (0-7)
+          cell 4: interrupt flags indicating level-sense information,
+                  as defined in dt-bindings/interrupt-controller/irq.h
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
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spmi: arbiter@c400000 {
+        compatible = "qcom,x1e80100-spmi-pmic-arb";
+        reg = <0 0x0c400000 0 0x3000>,
+              <0 0x0c500000 0 0x4000000>,
+              <0 0x0c440000 0 0x80000>;
+        reg-names = "core", "chnls", "obsrvr";
+
+        qcom,ee = <0>;
+        qcom,channel = <0>;
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        spmi_bus0: spmi@c42d000 {
+          reg = <0 0x0c42d000 0 0x4000>,
+                <0 0x0c4c0000 0 0x10000>;
+          reg-names = "cnfg", "intr";
+
+          interrupt-names = "periph_irq";
+          interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-controller;
+          #interrupt-cells = <4>;
+
+          #address-cells = <2>;
+          #size-cells = <0>;
+        };
+      };
+    };

-- 
2.34.1


