Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AFCC54E67
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21TlRVjoWnFJstWCWbc/kPU2iAo+CaLQkVmZjbxJqtA=; b=Va0UFyf9gqipB0t/BGN7M2/mG2
	HOK/93LGKxX2p7QN3OMzrNsi1E/bixwUkjOeu17hZ8WgzFSBMvJrGRHdSamxwTw75FnKEzxiLqpcu
	ApHQcqOBeaomoCneeO4uqzgQfIG92ND/JzzQk3O2bjVdbpNUs2fN7x8jBYTo/5hVa6FUips/6q14I
	pWzuLSUCWGT7VFXR6LdpUsqeMSu3sdjD5k7K+4R7LRVimeE3O1hYL9SJqjb3Am5IAvOyKd4A6J7tQ
	yBavSIqtj5OqaU6APd8xKKp2/8pSRqtJcmPakr8d/kpatLmtzkGGJehT+YOedxuEc4DJl3ReJO28j
	fDdoz0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9fL-00000005Sg6-129F;
	Tue, 26 Mar 2024 16:28:47 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9fF-00000005SbU-1Moq
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Mar 2024 16:28:43 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a4702457ccbso737270566b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Mar 2024 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711470519; x=1712075319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21TlRVjoWnFJstWCWbc/kPU2iAo+CaLQkVmZjbxJqtA=;
        b=Jkh2k6m3xb6ufIbJ+TPUJK3gbRtYCQWepuo7H98N1BV5Pc+l3F6+qYoKtWyTHF0Uk+
         YGUc1smLMzOO5GXTQ9NUEwKvdYpMPi5MoRvJ8sCsK+Yj8AsONgztrMvhl084SHhIpQUU
         jyI0Gy30pWNKISCZkbUzWZV37Xy8g2vCnYSzCsapsufgIMhi3fjzo6Z62GfETMd5w7fs
         TrXU93Pqm2cTlwPDy/qiQd4LwmNsiAk4wcM2X4EAlgBEKIC+Hm2YTi44E3ZaTCb7avfr
         IJ5B7SrbJOYS5EzqAZ7EqiOSZhFOloRBAjYfoIJ5Q8xGNn4dzFNnGYYOve2TOsmkiP/A
         Hi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711470519; x=1712075319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21TlRVjoWnFJstWCWbc/kPU2iAo+CaLQkVmZjbxJqtA=;
        b=ZHuk9V7D36XCXZ6GTjb3i7NzuaXfi68RSIAM5azY+yegYiqvuIgHMbopqB82k8WNzY
         HvHPNdT1plphMz1P6XcnxyK5ft2QBsU7nEDxTkD95COvfSGThCHbzVB05Q3VslbnKXFe
         cv5/Eo8JfPWHvuY6aFzl5cNFMEBUhbRkcGRboA1+1ecew5ol5fZbxD2xzSmzISdoJ96w
         C86a+rK4YFffOlK1MERpDFF4UFu7eirCchm1QhjR2IbweOX/x3h/N/bgxfnRDTcVSBQF
         hvVIu5QyM9j5n2DXcLpY/7dgPmJT5cpHVaY6EiwWGWzMhFlUtuh43tHbArdrUCvUi3C8
         Icjw==
X-Forwarded-Encrypted: i=1; AJvYcCX7yd1AKMOzH0vCP2JzMzbTjr1W7GpmBRWmknFELEDVi4mSB4K9Asxi0neUbyjdN5yENfm89j98DwV/5IlXcj8wnX6TIRHh1tOb/1BWTkq/ihqx
X-Gm-Message-State: AOJu0YyoVeBBS3WT4JDiZyUP8e+CQ+OVmTIesVHoGOsedUyBVBVP6u6J
	wQkSXRx7Ljuf57UK7wTx+honwmg/5kuQ5y4VtOGKMs2kXsn2zPQ+1fljKZ033vE=
X-Google-Smtp-Source: AGHT+IGed6RYYegytLLJEvd4IRwiScyADdhypb0dxesLrpFiAXmkGzv8IRj8uH4ltIetznMTCVs5MQ==
X-Received: by 2002:a17:907:8694:b0:a47:4d61:de44 with SMTP id qa20-20020a170907869400b00a474d61de44mr6699025ejc.55.1711470519023;
        Tue, 26 Mar 2024 09:28:39 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906b09400b00a469e55767dsm4375051ejy.214.2024.03.26.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:28:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 26 Mar 2024 18:28:16 +0200
Subject: [PATCH RESEND v6 1/5] dt-bindings: spmi: Add X1E80100 SPMI PMIC
 ARB schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-spmi-multi-master-support-v6-1-1c87d8306c5b@linaro.org>
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
In-Reply-To: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4212; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=YamVkfgVhnxdN0nuqUEaGc7/CimD3+iO1qHB6FQRmek=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAveurS+krQLbG3LbSzQ/3ngLL4be1mc194dov
 qz17LJyvBWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgL3rgAKCRAbX0TJAJUV
 VmEhD/9Kax6dsIm8lqYaUwHdsl3gy7HPX5wpmgFpViXDZxM/V9jLNEyTWLWI7gEvnkyCEGWU7L0
 giNfadM3k0Q+LLmD07Q3NbtSen9F0XojNZb2qZrvDsss8w481lYE2bRHirMyauYpBPhIGpjTiPV
 w3hVuqFt+5dCMBT4XOMr6b5+FM8vOD1T7AxkSQika5CTzaitXXr3SGBMYhckwdQeMh06ckqS5eD
 GqCPR73FYEoUPJv2Rud7U1OUy/KmIzL01Askmt4PthupD3hgRaMSmEJDEjK2B6HCs+2wvdSW8F1
 vzpYgg4veOZfc5bDVoPNnkGOZijg6P0ZEJa/1EsgXBXA1tnzItEJiEzb4Hund2Z3coTBXjtoAZZ
 yqEiAkqpnRrKGDoZ3zZ59jluu1mBPkGfkHCzvzDgW4Ak9qZwcdOHVHKCK1XFsNmMJoQapgOARtn
 g32yfnaW/GrhmvJ4P5ORMI/i+5i92TfRYcSZr8/3HL1ZAarG9vXtReT/wBItb9d/9RNI8mhDJ3q
 sL5HW+b4eNLTt0jPafe0fkU+W+ntc52CohFmaJWABnSVDKsvh3A43kQJe3ArNWQGc6zVD/zG6tL
 hQ13pecnVzRR5zBLsfCaA0806jOXv46khOM/Sff1uamKrwLpAnNziRyiLy8gT7pnq/5ymmC2HWo
 VZkMYuzEYszTnXQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_092841_501955_63D26256 
X-CRM114-Status: GOOD (  12.77  )
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

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
new file mode 100644
index 000000000000..bdf362c4a147
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
+  "spmi@[a-f0-9]+$":
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


