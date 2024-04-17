Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64C1C001CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 20:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43HApKIj0WdLuJWJQYaWKBO78pu58Pa0oGQOq0HzDlg=; b=5BSNNO41CuQQorqAdzkEwceB5y
	gvLyk2rfs9q9kb/UkVWFe64kVST0pefmw9LneT7neLsOAPV/g7iGmg2+PD3bpxcOQ1yFNxRtl0WPf
	KtBjvchvMXzVbZWQkrNbGCw25v+bh22jJ2LJpoBERO/ZbZdt3B1w8HnaFrsSNmLi2GHx0+0z9I2Qm
	U4NFuqku+tB45tUw243kxroEzVpOib2To77Nc6AzVZeP5MhOHee18dfZWFmBWwnflNKpdk7rTmfsj
	+J8Mj9svDkaFrqyEuUTDgJX6ymmZdfBSq7xBjvwSY9tfiFdilaGhH96vNAKV3m+RiC6oG2AQOEcG0
	2ceGBQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTR-0000000HQmJ-1bXV;
	Wed, 17 Apr 2024 20:01:41 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTF-0000000HQdi-2u6K
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 20:01:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a51addddbd4so1999466b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 13:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384082; x=1713988882; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43HApKIj0WdLuJWJQYaWKBO78pu58Pa0oGQOq0HzDlg=;
        b=PldeDBcozdPbv44Xl/WuFtxO/Eoxz9adWbjHWxMB0INSNCmJTvN2YDqszhV3vXxOzf
         uZ4hu2M+0ZYFvPKFdxt7ny+bt1iD53LDXyfQzkVKMQKrxmmdXPEpoU+5k+0fPBqn9WAs
         drdnXrwvgiDPH4a+asXRwzhqyYKIe4Ijm8weFacCPv/yQnKNiGw80Cd3+HMN9ykx1yov
         hULOgj3zagR6wTvQRps6etYo8iHRVgFnBRn1VPEcNBrhaTr9TbODz+MWEGG51Gp+oyOy
         DasSr0+r+hTLQvCcIP5LK3GEgauQWXxaB415FZ2IggZAh40Eqr1DMf2iv7YAjanFHZ2x
         Um7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384082; x=1713988882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43HApKIj0WdLuJWJQYaWKBO78pu58Pa0oGQOq0HzDlg=;
        b=hdbh5ZCae4rNWcF/vs1uI76eqirwsvQ/I3Za/XZTjOikIJKq/cuTXStDYSwMa22/pU
         cO167Uu5+g3f5bwo5BXhpiYJmL4YSNCpFeQt8MV1swk/CgwY0gNa1zhPYhs9YlXxDFZh
         yYTTcYnHSxSbo4ITA/cPmYDL2BBuL6MoSBNDaj/SmuSa+TGr+sHuVSZLcX/NqoWcOc9U
         xYeKdjDQTk/5bqQETet1xQ2JaEYz7E5kbFOLsmovTb5DUGb72Z/P+pvknZDlDKD0FqZw
         LtHS4RN2gnRdr2M7+cVGrBS/wcO2SU7s4+BdP9RLM/eQQ9Z4fwQOvfSeKHMrTLwQBCrs
         oNDg==
X-Forwarded-Encrypted: i=1; AJvYcCUxWjy8EpV0Zp/yDbdfZWFTBIzMqw3HoQZXzFdwStzl0e2/T0GkQWTC+h0Kdz4T734Oqn9wZlFSHLFdpW4aM0NoAx5NpXrB5jhT7mzpIplhPD1X
X-Gm-Message-State: AOJu0Yyhc8W2h6LPvb2pL78oX+6vHLFTamrWPmSLB0YBP6fGhSsfuWYF
	yBB7n+MIDKLsfFJz3HthTHTNDNINN3y9Qp9b7EdvDd/6B6rQhKWyj/Rw498q2ro=
X-Google-Smtp-Source: AGHT+IEfVAP5icOIVHJw1Nv4oEkeMlkL7zZzTHle4C/+UhATBDRNfzsaHY3+L+kT5HHxQ7ufCStNAw==
X-Received: by 2002:a17:906:710c:b0:a51:d1f6:3938 with SMTP id x12-20020a170906710c00b00a51d1f63938mr334650ejj.42.1713384082165;
        Wed, 17 Apr 2024 13:01:22 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 17 Apr 2024 23:00:53 +0300
Subject: [PATCH v10 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-spmi-multi-master-support-v10-1-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
In-Reply-To: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4635; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=HsBWA6C5yW4IIcnCtqxAW2pot9IPKHCnHQDO4UZ05LQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICp9ePv3z5MxN9myqCZrbWFYyyjC2N+0AXUP+
 rnmj1nqV3uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqfQAKCRAbX0TJAJUV
 VsIID/4gHIr6dpPvTMMMBeRmFAHO1zvty/TqrFp+m6l6gWxhD2Qkb66EXd9QiXrSPi9kbk7efzp
 rmEE6Lp1yN9Ej29G8D23jhfYeGD/YUOgeZqSOTNrRK8JXA+WSFLb7EqhtURcZ1Dd+vHatcN3iTe
 6PaDkaW31SxskM6BXRp8HG6J0oPbBdNwqQUwbiBIspDPLl9UnvPfKgw5gH9wuN79uCcztcwVuJW
 MNtTrfuXUIaH3pD5nqDM26tH7qGgbu9gUIw0zwdgfvMqPgHDjM6Km/HMUIDUPLIk7XlBLXkd2xf
 NyZ+iyPlXqFbSLKm+peHBIE+hR2n1Po3RS4hpHzg1WhHC+EeF04Ej1Rm5pN8rHo+1xj8cC6L3LP
 8jE9L6BLrxVCNC6G+cQKU1kTuzlFmhPkbmuZqQMrka0LmrbsRFG1w1zNd94FLclk+zWHaKcBz/Y
 jOGxGOB3j35MxcD8CSy38pYuIYRZQLGoBAKPG2oU+Zj99JhPoiD9m0p6QC2IfWgiBP1xWu3b2vM
 ClU7nZ0NHDsMIYOvRhbRbVojil9ANAUF1IpartwU82DdeIIoCNGns3zEG4RfkfIxbhDWbJFjy33
 5ngENGI1Nt70oXFcFrDHKp9bc4Gk8rVXBa+4l/tdhSx9Pt4mc5+3S7ekziujk7ZtX9PEt6kubPq
 GAh0pyuUBzVvdFA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_130130_106561_9C2C0CCD 
X-CRM114-Status: GOOD (  14.89  )
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

Add dedicated schema for X1E80100 PMIC ARB. This is not the first
platform to introduce multiple buses. In fact, all platforms that
implement the version 7 for the SPMI PMIC arbiter have multiple buses.
Since the compatible should not be version based, the platform specific
one is used. The X1E80100 platform is the first platform to really need
the second master, as all the available boards have the PMICs that
provide the eUSB2 repeater on the second bus.

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


