Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD85C54788
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21TlRVjoWnFJstWCWbc/kPU2iAo+CaLQkVmZjbxJqtA=; b=xea78oQzX5WGYXeipZj961byw9
	9Zx4kO3QKtJ22ji0laXua3hJK3dhebAFsKzwOhma/DxmXuYBpAwAtzAYuL9Z5UjVIRQ0/hICn5mIZ
	EJClen1xzOFOLB1p+vLIIKAWmuZowqas98ZWksAH0vBlnIxbNg+nh9imbVEr3fX+48F3ZqPn3pxen
	jcyiE0fyvNK/xWDJTjOugiUv+nlLrCa+sLnfcsfvgxFQ+wnw4ZE8h5OVEXzN+6QzAYzEjD06YUmyP
	2PsP1UEAfGe0EGMs7Qlx3rkjvcVXMBmBvswD7BpKSXCr4g+zYdp+e5bvDlZjoRUL8i+JUjwjmFPvj
	ZX8fjTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Uz-000000056um-2PaL;
	Thu, 22 Feb 2024 13:52:29 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Ut-000000056ot-3xnb
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Feb 2024 13:52:26 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a3f1bf03722so334202366b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Feb 2024 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708609942; x=1709214742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21TlRVjoWnFJstWCWbc/kPU2iAo+CaLQkVmZjbxJqtA=;
        b=E/6gHa+P5SEI05D/iA0anYMyb2EM9s2P56wAMeUi0T1KMY8RCHSVbjIQe9g07wCzOD
         zim+UFGa/4qddYO2e/Hs8w7+s7TVc3danLFeVL5hKdA3YE3Sy05FtodORJZIbCuD9UIc
         TsWNigtdTk0mu8nbvNFvo8q/VdE+v9zCfuoEQCqehXAtq4grBxSlWhTKqYMRI4FqDrlp
         BKG83ae8HuX3gxM4cTLqUsyVMnvIbngwBHAp7vRZf1XomEXOtZ3Gdrm2gWAoU+NiR5FZ
         kfO7hO0Yw0SbTFu0XKeLcWLF6FqdjS3AC3Exm52BI2k+VipVbuKIH3eMe7bY+eqbVSeA
         2Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708609942; x=1709214742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21TlRVjoWnFJstWCWbc/kPU2iAo+CaLQkVmZjbxJqtA=;
        b=iWgCujI3nbmngjmRTflHnkgA9VTr5f5Xr4uysVGJ6eJeP9+/Yup979HagaG8+AQyPy
         Ui1+SOB27gm4J7YFHqdQaKCeKAD++44ja4Ux/a/rT1HG3WVS0qlt/iikdrVP+xGLMLTS
         VRjTNwA5zBw4ZMsOX5mH2ISxMdPhE53GEQSvwit+A1yxJXZOzJF0W3crySBvRacIQ0J8
         /QEeT7WHH3LE/K9ISWMZHT0pJ0GbLkSYKR6zo0DcGgafe0tIYxb17UidySVRL65Zgqrn
         biFMdZjvuBaU+W2fhfg4oBdqGyWFCaE/v6UCGV6Jj750WLAg477A6fo/6d4MW4akzbcq
         8jgw==
X-Forwarded-Encrypted: i=1; AJvYcCVVgBehkMvBzT/uojQKrVWwlv3A8mEHkpZP/oCx0tvEVHiIoMruU6H3hB2SBc2/M0+RGVMM90qA++dTq6Y9P7wItXdqYvE5cD72iLsS7RRzizyA
X-Gm-Message-State: AOJu0YxzGXu0bU6zEwGllcTBUfG1/yS5ZVMDSyEB5n5YvnrbAs1gsDi8
	A/uGuM+mu84cOwaibh2cBRd5jkxLvhCsyKvjXnSI+LiVJGPsL69swv2Wv3ecbfA=
X-Google-Smtp-Source: AGHT+IFdPFyrBje7sUs+QMqSsRR4mXBEgQ4gwdLmQeuQgZxbs4V5by2vRpvDN/ZESO7FqWTvQg/ehQ==
X-Received: by 2002:a17:906:48ca:b0:a3f:10:bf70 with SMTP id d10-20020a17090648ca00b00a3f0010bf70mr4975855ejt.37.1708609941995;
        Thu, 22 Feb 2024 05:52:21 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id ot18-20020a170906ccd200b00a3ecdd0ba23sm3382839ejb.52.2024.02.22.05.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 05:52:21 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 15:52:02 +0200
Subject: [PATCH v6 1/5] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-spmi-multi-master-support-v6-1-bc34ea9561da@linaro.org>
References: <20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org>
In-Reply-To: <20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl11GNnhK0hUGx1IRjPnBlHv9T0lvkCm7Bwz7JT
 Qltoxb8PKeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZddRjQAKCRAbX0TJAJUV
 VqHjEACxuEh80xqEDASrIjulg4ghwtGd7HRkroC5CRPYtS9B247hbzv8x4c/ADi+bVVTiRmnvU0
 rFdPQ/HGDEm898tuapdTA4p34lwNuOsPKvGR4Z0WK6OXDL8LNkC5Ee3yLpwYZg1B3uJwgW4DfRp
 iJ3/AKivBhOLY/Dqn1CZWUrEXTNFdQg+aJpALJkNKx2sXfWLsBNpglKf09RkdfXYMKzrDr+Pm/d
 cDQNNFjFzdEZev0OTdoWZCvFsUAjBBCZsC2CO1TgdtaPqTlSy23TBpSwZqj+ynMg3aLJiPOaEBk
 JrnPzd2oE7N5L7utVB883tGhfouRkba3h7kCYOHSG/NJfUzKsxm8GU4Em8lDW6+FsoxfdnBvTaE
 RcG3Pp2c3jMved/p27EQxMl7cAnMYPEFM5zuTyMGI6JboNm6sfbX0HXkCnHoKuEO9exCVpqDonu
 TtXgnzaPKptRKvTzK4shV/ASo1g7+SNNJ57E2B7WytlFNS2H7lGdEVgNxLiWb2lt/dwBEI9a+pl
 3KzyjUtVvJyCtlFZ4ZhgcibvCqHbF70NWZABW8xopoXmjkeZEkKLWPaete7b/OiUKnBTUa6nb5H
 D4DaGfjMgHljJXqiXYnD7YJNeukzSyJh5ZolBcW8FUHaZjgfzk+ioB7mYtDsJ4QHkcNUWGDnUUB
 9nKDe7pZv6j6umg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_055224_107937_F58E71D1 
X-CRM114-Status: GOOD (  12.86  )
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


