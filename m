Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30D4C5475B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=; b=0VGQMpaWVTP/L7dt+bOf/VlfLA
	O2zxKx7K/1Nq7+5qepEyC77/jIGgreT9uaQOHfD+K1OLf13lWKotPdyvzywt1EqEUAQtqwAD+Qbih
	maMJPmqGA0F+KsaGDSlh2p25t/8hjbl/xyb2asEkS+Z0Mz9Z7M9i9vBCM4Z0iTgkJZ4EJY1HjI6vN
	MJo9JEBewcht4RC4anLlqg6oJRAu8pnDiSugcFZlFXiHfQfJaTVKBtRKd0lbTItKH/p7ahHnHt09R
	JHY4G8ZYy/WlY0iZxw3+AKBRpc7J6Iq5p/8tbEqNzeY7UzMFsJ5iuPxjdsYTlyGpIrZOzdM+w9q0L
	HyLDLvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPip-0000000ElZ4-1QPb;
	Tue, 20 Feb 2024 12:59:43 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPil-0000000ElWz-40ze
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Feb 2024 12:59:42 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so740721266b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Feb 2024 04:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708433978; x=1709038778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=;
        b=Ru0+mCdSc/nB70k0HbIiKXqjjqicOvI74RZEw9EeaFAD+c9wczRpKZbk4f5lFbLfPl
         07S57Z9aA/xD7UNjKJql6JJYa/dCb9Ki+k0IPA8WDmEcfpwzECSvo+T1RQ7izWRs5KU2
         T+451YZGGfrXMeG1IQ7UM/bPFt/EEU4SeJOCwrdILr3g24tV7KSxCvxzMM2od16edevv
         AgpnNmtW6/YNvDjtqgKiyjQeV876pWCVB0FI86sFGZEGIsCsu3o0vxLbDy6LWbn9VgzN
         R+bgu+WaphOe0lT3zdg4V3UR5jw8GRy1bOlQvk7GV001LLoDZjRdvLhxUm1PAgOkPRdf
         B4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708433978; x=1709038778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=;
        b=VEKCopsBT0yXEY1v2WARGOY9Hb4FHEjbfwArw7TLrruDivrnKi2H7hek7M4L1Ppfv6
         j4g6iuME7lvWB5XHAMaCuS/dJJJQRMcqhH4Z9EP5U9TLflGSbwEELPaTscc81UMz7vcV
         8Mlo9HH88Xmn5Eh1SouRIJKqPlhBlNj8QTY1WT8Yv0dOJ/UNM7iY10DqjjRl5GKmSjf4
         xJI02Vo0qaCqgxnX55MzWmyUeTn9DrAqS90T2+oGguzHaN1VjVrRIoFzbj3DTyLEAG8r
         l8HMV/b6eGawZNYwC2XKOAw1QhNkAYrd6LINHC2Sumu0C5j7cqjicYer2mh9r+65vSC8
         ZSjg==
X-Forwarded-Encrypted: i=1; AJvYcCVJyb8EdBCI7vNdAR2qi/946i4DijDS+TsOK4zRK6TEyetEhq12CYdXx2LSAhpbGWlAe2PhukgfQ+33e7NeAqxC1ZbIKvfZMJvlKtaTpOe3lkFd
X-Gm-Message-State: AOJu0Yyoqf0Klsk9cGHzNwgiMkSL831QuL1D8eq5WB4oKNmBqNv8lKVH
	7S31wLGojDDg3OWi/KwQ62cuq4Q+SSfC2auu2H1/qzUdfCbIMMOrLM9JctBF8NQ=
X-Google-Smtp-Source: AGHT+IEb4Cm5uVF+9tBq0GgVnU8zP7htuazyc7HAMuiist+/EysRahieUcUeX89Q1qGq5lLzBJ7phg==
X-Received: by 2002:a17:906:816:b0:a3c:5e17:1635 with SMTP id e22-20020a170906081600b00a3c5e171635mr13747344ejd.30.1708433978257;
        Tue, 20 Feb 2024 04:59:38 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id rf23-20020a1709076a1700b00a3ce36ce4f9sm3948802ejc.83.2024.02.20.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:59:37 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 20 Feb 2024 14:59:21 +0200
Subject: [PATCH RFC v4 1/4] dt-bindings: spmi: Add PMIC ARB v7 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-spmi-multi-master-support-v4-1-dc813c878ba8@linaro.org>
References: <20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org>
In-Reply-To: <20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org>
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
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ThFF7MydSq7GIulN2BiuLPta4fGlEnJTyb85puKw6/Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1KIyzs8YVUgvE5dRf6d5suxJZ7odVJwulay/g
 YQbLKVqXNOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdSiMgAKCRAbX0TJAJUV
 VoouD/94NOL0UK2zX/jQmWLQ96DxsMJTSYNtK4mKLvnQhjogZQ6OxWw60gq5iyQEIiozWWpvZKJ
 GXcIsHO4ohx1JJeyJRLHchnwKfqWY/BnbeCu/Dso678WaufCI5Ge3KxycE0C5NVeiiAAvVO90tb
 aXCozh3DCo1T10Vok+XdB0hJ/iRC+q/8jwLVgoAgQO6H4LnRw5B4QoINeg4utoWMk9pFlwzGoTa
 wW1QVlMwRjUH6/LtYCWEaZjOVkoqdtWzWB51TGHoOjYKW5N/JOHHuOorLd7G2/Lgw5WrGX2FZ/Z
 07OilFw2R1gVb++I7nyLEM199hBgl7T8nKeTwgHPmjpKFE1t7pBto8SQXPnctCOQUUPsVRsL/Gj
 RMhseYUa787BuqJdrTvGD6uQcsjJ7tmIHRlDc45/ZUAhQlnXsrRRz2H9OjzMK6usuj3dPx3Jurt
 5dTlHJ3fW3RQqCm7bYlAGzjMzbL8VxKevcEKjMRfxJeFb8TIjNtHrcjAmlrWfE17DxSahbZAxwk
 hGsi/6KMqDFiveuOcWdZ6Ks8iCInBufdS68QXScpUJDB9IvB6xTieoMQecFW4aZFVnmAKpY4UD3
 zFUVvifa8G55DHkvRkiVRgR0d+h1bK1c4v8eDXD0lTWszfWAFuF+qDUgrMOEyVciSi4uv15NqlL
 4CCgtIkWWnH7tig==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_045940_044183_200DE124 
X-CRM114-Status: GOOD (  12.49  )
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


