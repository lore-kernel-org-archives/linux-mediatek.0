Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE55CD1299
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRt6rM9Twb56M3ayCf2fMMjJ0a9uWjup39IBritYyoc=; b=Qn2VF/ZJAYjMuAiR866Yvm4vkZ
	NtQsIdQ4kE62oaDfp1+2jz9ucpNGS/8RlaSIAtlNHAcDyT5tUNp7r2tJqjlGLWhstXvPyB/FApIuE
	+vVnafDI2r4t+jnB9pUC+xdPGzzTedBIM39FRIIok8ZHFKDJifPJl22nolLBcKgXDb2VCwCieyBQG
	ZbZSa3rWjyfWSt4R8HLYtzeWT28lv8/sjcuNJaWIsz5LBtKmixhMFd4LWGzqjifps1RMX6AsKoGJS
	vOy2zZ6WOVBDYV4vBbSv1lX5l3APmt4GSZMDkQGBYh0XqO/EonFzt0fUlguDK08CMRyGDUix/Sb12
	K1b8miVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVJ4-0000000CzME-31jW;
	Sun, 07 Apr 2024 16:23:46 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVJ1-0000000CzKT-2xdL
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Apr 2024 16:23:45 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a51c35a1b7eso108137166b.0
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Apr 2024 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712507022; x=1713111822; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRt6rM9Twb56M3ayCf2fMMjJ0a9uWjup39IBritYyoc=;
        b=gaOjc2Pm34Y4ULFsqYGe6UaGGk6CU+AVPjOurNN+NcekmHiq4kjjiADJQ3R0O2k9Q8
         iPSFhyUTDI5e96//Ke61qwF6mjZRuEEK17nN5os1ftTYrwo9eOT/sDf9U8qLzqqx4ofo
         wgmolfa7aPYO+61TRIxhwmh55UqASfCoSc13q9MarIq501VfwgcWcSvexd1x0cBTbyAw
         KcmJVRBdCtXSLEINbZYrPAVYrcImO6cLMQ+Hlc+X/pxGgDaVVekVuJEnpX8YmWR6elYJ
         eEyIpyqmnDIAVwFXPXcjkVxUGJSTDkwNMEpM9P+RrT0Qql5UjxM+QgCUfY4TLtXWkgzR
         ucjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712507022; x=1713111822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRt6rM9Twb56M3ayCf2fMMjJ0a9uWjup39IBritYyoc=;
        b=ir+H175BtecdSjX014l8SYaY5GQPnO5KWop6PdkagcR6foaJ2J15+I5PJqj+130HEq
         x7yRaLDDuk132Vuo0RtaoX5S3d6Jv3iV1iKewvfnfAGMEnUYmBWDHcgyYkfaG/D+1sa6
         E0anGuV4Dbavkcy4FTI1cD4W1Vkn5Xo32QqMfXF4F/xVEro/HlR28QtWoJUDdA6u7Zdx
         x1pKJ4MQdiEnGWvF67CAAIMTvZHCMd2dWDI15RdwDfqdzktrTxEgtX6M1Cv1yrYflLYL
         OZPtEiCamB4QSpZ8QPbBpDehoKoqNNfmBzyRoBVMPsV6H7FyTnRErKVY1K0spynFe842
         VVvg==
X-Forwarded-Encrypted: i=1; AJvYcCX3cpTSRTeb3W4leF3VHmp9lRM7gGfG/BEy53GJjp4EAPrkcPwHS9mWfi5bkGh+XvM3KYAyPRkbOE/ivIuWtrA8vls54HCShar/v1z1rRWB2kK0
X-Gm-Message-State: AOJu0Yw6CKEMCnQizOw+jZvVMDEhYplarIeVh2hgIZPBNawsCOspI2IR
	/lT86P8Zlco2iWfiMOf0T8ekru+C4jEEEe58n6MOzfI/XorVva7ksvSoTiz2g8Y=
X-Google-Smtp-Source: AGHT+IFByAhkWASSEH7HI0Ywz4AL/IJfpKfRcVOuocpKS+0jAne7bJChvlhu2fEdc9QBGBtBA7zj8g==
X-Received: by 2002:a17:907:6e87:b0:a51:c1db:659f with SMTP id sh7-20020a1709076e8700b00a51c1db659fmr2880334ejc.9.1712507022013;
        Sun, 07 Apr 2024 09:23:42 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id qs28-20020a170906459c00b00a51bed388a4sm1811626ejc.139.2024.04.07.09.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 09:23:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sun, 07 Apr 2024 19:23:21 +0300
Subject: [PATCH v9 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240407-spmi-multi-master-support-v9-1-fa151c1391f3@linaro.org>
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
In-Reply-To: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
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
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4280; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=JVkBmCam2jdYO9LinquGWXrAvLM+y7WEW8TtTtGRCWc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmEsiCcr851qTRXAH7gE1SwkOFNYU1tGQZBb8B/
 9sEIdFUhtmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZhLIggAKCRAbX0TJAJUV
 VtRMD/93s27RINnTGgd8p2L9n+6axxSTC3sxduApeGdowZfWkWWzP9VnxFu4rkRZTZ9zTrpScTY
 4K95GNeofSNDTengwSLf6mvajJrYdtE937r6A71QgepBaMO0x8l60XT5M++iohjU/OnHBAPHSic
 4k/5HID0me8IRvKkBzzPm+KjBNnH19llmxP0JIqblS+Ljg0yLdOWo/Y+Q0FHZa1amN/7ZbdbpZt
 8RgXeYgxZrA4MP20Z9EhbmJizDAxehPw/fz9x9d8E9+5TOSjpePlEn8JssBENKbep+o2vJcVUEa
 UXqFGVevN53tDiPWvk+QbU9HjTRgwKI8Qw/Gzn8sPwmqHpA+ncuMNUAxSWqm41siYHokFrEehMK
 z1gMJ218Oo6cbdeRXJB1des95Xm/I0JI7WRukNyEEsY16umZgqdgYpDR7OFvflkQv6aTOi+ntel
 LFtixjMIrOb9Ry0DlPtei38OFWxs9k9FG9swucvwHGOnYKX5L32O76g0SGVU1d71VeE9LiXYNcd
 veRBOfBctZhIz1zxxQEedS+xsvHQYod0+f43MSrRU4F99mVEiXXZQOvptpzroMH2ky2aj/dtfrf
 10aRzRLhVpnRR1GU/oNKHMWySGd/w3F21Vhywk9fs0fm3S/sJ38++pwATlnFP9qx2OTzI158ENm
 GCNqbg8y3ho3l5A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_092343_963430_0035014F 
X-CRM114-Status: GOOD (  12.25  )
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
index 000000000000..a28b70fb330a
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
+      - description: tx-channel per virtual slave registers
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


