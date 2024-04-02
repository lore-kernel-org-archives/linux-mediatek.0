Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C403C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0l9XqgR5rgZt/McZ1+LYeV2+Ae3g0xUIEFWoqdq9PI=; b=qNKS5zr0OlZNn9QhQPw9fOi8JK
	Et0a/HBGxwJTtyYusVUgkulry3eiVFlV1lov5NVVz+LO1RoEoEH15yJ0k6ekC0ufUMcvixtyGaYAX
	GHaL/qM/aZHpVXPvCouht8234lln/yygezdrh0qFoJq7twccmyoZMA1AQ1X12AwpEMI3mArbAN1pj
	uv56OSsPa18zct1kbiCkCryiuNP2KcConYpPsPaITdxHS65wAwzev0dACAo9HmklNmO2YsQwB4stN
	WWAA1z0CAcHfqyrM9cLiIjYrhUE1ecdAnRJkOH/68EUjr7sAXRINvZVJ7JTneCDPy0m18+AXs1Kf1
	Z3A6d76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcwC-0000000AyhN-1zG9;
	Tue, 02 Apr 2024 12:08:24 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcvs-0000000AyR3-491m
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 12:08:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a46ba938de0so670061166b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 05:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712059678; x=1712664478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0l9XqgR5rgZt/McZ1+LYeV2+Ae3g0xUIEFWoqdq9PI=;
        b=dQvy2kLWh3K1ofM4qzhuJBZ1Wqk/2Ur9WelGXdERXRTtLGFqgZ0JAnV85bzkUios2x
         gwiYqq4UZrbFK2Hv85fyr3ljuf0lUvX8FyHLEbhVxV44lph87BiVTo50S8ZvGklHfyj1
         GMOemq2O/K/CXvu+On3oYWDTqMePFGFl0l5XEMNH21dClrUnt0gGDW9xzAKPMRHqrpjP
         trkIGHHv4tzWczDIx5qQ2JG8EKL8yHkeIjLf+HuxoNQA7gjwt7SDnD90nEV/nHwAWlKm
         mv4aaa1nbMSInF+xLO2WblfDTdeQjgzoMvycjolbo8jF2QOhyZXYPZknghRH+hKpnEg1
         +FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059678; x=1712664478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0l9XqgR5rgZt/McZ1+LYeV2+Ae3g0xUIEFWoqdq9PI=;
        b=Yyg4jJSkztue2WR3eFuEzVle/TkpTr8rZhru5h1CQXzNCVr8v/chmAkJIzkPYqIB7a
         W9zXwqUl0uaHS6ot2cHJN9Gs5F1J4nhtPUIkDl3I3U5NnE+oz/Jr4p9vkMZzPb7Q015C
         4VAtL1jH+h4dc1O5CYo+UpQudAPMnXVaG/24mipkYZU+CUj/Zd9Koz0X1/QFRUQYxCF5
         a3y5TTTcWPlgZboGKT5iMq6N+yVbzQ2lyH2qN2D4g4BY7PGaq7kjNpxAT7ad6bq20+Er
         SBdMG9pYpK5EbIA4RrSPTmtdN/lu765N/+fdJsFZq/PEANO4jMsNkbdSDOhS9/0GpXn3
         NGDw==
X-Forwarded-Encrypted: i=1; AJvYcCUnxD2qCK9VDfPyXZ1tZRhUMBOMHAc7NIAPkpg8DWVIz4onMmESVzXzvOS+SUgJIKHdfo66SD4CcSkrmr2RkI4zcL3RLfiLCawQlOpRq8NJQwyl
X-Gm-Message-State: AOJu0Yxqg+JIZNN9KHkmS+fvbKBwrP+Aei61oasr3u/art/qmX78jhg2
	GOw8aLfep3G19IUVMMCuue63c9mGlFAypu5ocb9491eXWIs2dVLIG3RsWqA7d8M=
X-Google-Smtp-Source: AGHT+IEJul2UyOBnNzX9jiFv2kE1saST7wjLNXY/wrt3Zz1YliDjZ/vc/6cnOv5WctEGKams9g+fsg==
X-Received: by 2002:a17:907:961e:b0:a4e:9197:7f21 with SMTP id gb30-20020a170907961e00b00a4e91977f21mr679253ejc.30.1712059677980;
        Tue, 02 Apr 2024 05:07:57 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709065a8d00b00a4df251a601sm6519384ejq.77.2024.04.02.05.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:07:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 02 Apr 2024 15:07:30 +0300
Subject: [PATCH v8 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-spmi-multi-master-support-v8-1-ce6f2d14a058@linaro.org>
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
In-Reply-To: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmC/UPXfe0w39Yxj5a+0jZ+tGvt2H1SNZQbKYzl
 nglHQRsoHOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgv1DwAKCRAbX0TJAJUV
 VuamEACbNcLnCQcnz4W18nC7uDvgNVQB0DJoknwroD1Ma5Q7R0sJFX7R8Htqoh8oIvdJxoO/vrq
 iHkbdbyh9l0Oe5PuFdWnXoLNrd9EcCV/zxHnNOMOZbEev3qRIDf8tWsPMpSNFbtcr9AuLwGpBCB
 T4AA/c78OtLRS5S4NeKTDlDt1XlNDAQKYz4uYp90uYjC8TQZoMxckOTESiolJqg6//Hs/JCjeiq
 Dbl5T/d8divypDYuvcpxCv/ikxnW9SOIi9hQq83uYogMDL3sKbuPysObHynwCKlrgn3sxj9prTA
 kCD4zMn2TFfYDh+DatI5BuakEbKZwSitdFMLXZe/CZYxkHOH7gm1dj77skgRabBjucxG6xnwyAW
 x+oMx3hIHn2wuULBfWBl7WS9sjA/32Guspi4CVYzTATB68b+6W6zKemOtUeOjz6vdPWh2ctzxqi
 K2Z74OQpZVw8dydP1oJItac98gloxs0Y4IGmhYYVrDbbz4lCC8Yk/7DdjUWkXZIL15NIeaBiTnm
 bc0pCUM1JmTqktZIrxy8bb7iAWXjlrBhn3eupslmV+AetOZ0G45G+8XF5k35hnoGwK4w8ixwVwr
 O5srV5H56hWPW+oJT4Yg0ILukYwcfjpoNNUyb1dV+ASM8bHbW7cbgE6G3mzQqrrfqq59n0uj9rt
 wvxqwRk60deyWBQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_050805_290343_68B44CD6 
X-CRM114-Status: GOOD (  12.57  )
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


