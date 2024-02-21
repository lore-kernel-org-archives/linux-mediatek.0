Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537EFC48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 12:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=; b=ISJzKcnB9mZ1FlhDsf8G6TIA7T
	fl1Jf0yLvkgBnW0hFOGA5WcXHnq/zBkqXByaoqGHYwMNNg8dGMJkQDkiQxGLSAADFeBBo+b3gxwk7
	DR5RR1xcI5Kqwp6lTj8BrGvsoQBA7HNQZU4zQzsYW+xtw6pdl8uXh9r8xu8IwdMAXcXQiD+1pTuGu
	6ufjT10siWV1AlOLTTm2v4I3qZrcU7wX+1RvrGESgSBQ0V51KMrg7WrG5vzAmEXJUR1o7mped2X/P
	UzUxKjUEP+95ebRcFpGAD76bLsdvkzLYwlWRrC68P2BoNY1flwj4wavZ1/6rufXPBaemf0KWpnoZN
	oFf/FlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcm5y-00000000ubS-3mUU;
	Wed, 21 Feb 2024 12:53:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcm5k-00000000uTO-3XqC
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Feb 2024 12:52:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a3eafbcb1c5so356363766b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 04:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519971; x=1709124771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=;
        b=EX8QxKnlUqlpUpvQE4ofYJej31xmNh2BXLTtokeSdDuREacU26niPA0YpUiFYCpFin
         PtnMEOh9MZvToMf4uRhlqOGrd5n9PiLDlqVp+eWB2Q+3dDmzGOpWBxKrO+jGQiOZZ0em
         GP8hI0+rul0wOTlya95893/DG99PVXUsyx99OQ7+EuizS40/DcU84AJEoIkqFkwhlFd7
         zEHT8yKYeAeNjPzIjC31jh5Bd/DHqHtJqEnAUEX+q+wMJTkrjzQlLTf3l3k7cT/M5Ax1
         cwfpDFy1/HBv+QiYPxqYYx73c8wpMiZ9Vzg8Jn9blRNMuTMtjReKFMYqF9EpUhjlFFkI
         jlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519971; x=1709124771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=;
        b=pPWVtN9wSHHcWqzSeKwZTe0rp+1BAiZ+YzEDXGOTKNdOH3f0dpI7D3PBP1wyBD4mEi
         VBf2EKjkUMddZWEO/vvEM96kCGyYcoDL+ydEIa8K8WyKDwNNvc48r1mowbk3ortirD10
         45OlmYIChvrevrrW9280JNgdsM15VdXKCD0V4Mci85ann2LJL0246SKLLmraKeHUvZqx
         uM+Jv7Cdo26HFDAW4VWmOMMNwi0/0S2sELGPpj/aBpEJPCF4dESizYB1Rnaxi7IHPgsO
         d1liMVP9yE8tt+Yy2C+amRBywlCdbsujtiiMV+smgTnkgBkhaT6dGXFYqIvuFJz971yQ
         hWNw==
X-Forwarded-Encrypted: i=1; AJvYcCUZR9WVTR0f/pk/sHr+al9wvsqEsRJtN/3cXEXG7ormyPVfUK40RcjVSmWLYDoeh3yTJgl97iPu+Uj/RxvGva4bPoanPJIieL2PPKgnQ9a8C8fJ
X-Gm-Message-State: AOJu0YwC16MuW+LDfp5o0FE+pwvR1bX9wvyJAj8EJ4sFy+/8xSoMnBaM
	tV/v3Ew/k1WuyI3+4cWLOLIkrFApOguV4eIjC1dCnbZbu2cuLV58Q8rmteDITIM=
X-Google-Smtp-Source: AGHT+IFfJb9m3usN9WfSh2Gve+kZOuvECibupHZOqpQ5qo7RskgYkY97KVcOy8RHrkzjTD7vGyfOjQ==
X-Received: by 2002:a17:906:280c:b0:a3c:cbab:f3b with SMTP id r12-20020a170906280c00b00a3ccbab0f3bmr13049387ejc.23.1708519970972;
        Wed, 21 Feb 2024 04:52:50 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id tl23-20020a170907c31700b00a3da5bf34absm4930392ejc.207.2024.02.21.04.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:52:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 14:52:37 +0200
Subject: [PATCH v5 1/4] dt-bindings: spmi: Add PMIC ARB v7 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-spmi-multi-master-support-v5-1-3255ca413a0b@linaro.org>
References: <20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org>
In-Reply-To: <20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1fIbsBAWlgDn3Auks4oUMtCdpsV6ZLQRxy14G
 UE1bSMXsayJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdXyGwAKCRAbX0TJAJUV
 VozQD/9cX+W+CF+0DET2wbnV6ncUZ2kIluZYFSgDxC5qHUv815UvVAuTboCqCaS54DfkpJIyDpm
 IHD0MR5pAybsIbVeQElw9VSZbPt1sUW77xXFk9Oyv/c513YyWGGE9c7XaF8Ua5F6vsu76NQla74
 LOIeZuBAohmgeEoi5hmup4+DqquXYh1qRKymTeFvmfCeIgld+SFmumEwoEW4So+Zi3dx91wd2Ex
 seZdohykYsRo0nvwh8nG/CTcGOYuMVkOtIJuX0RJaXx9+H7uiSY+m0CHhqWhLRDTeY5qXq9ZmNG
 0uAtx7KqoPI/Z7OnvqiR+tAdq4xrZahFnL9fRhdOl8gh/Abit8mQ89A2fAte9q6IpL8mFY02SdN
 abBIOz93Eucxmc2HOvKU8sBbUDliDL9vcxI/vydcw9rEskX9giXgdEjoXhG3MtpSG6/eAYtmZNB
 xmnZAw7xbPA06M5POqAplGiQWsLyOHfzHzR69qwuPDN1mBON63fJaB/FffGpEyRZrB3Vq57p0Ca
 z9yRDHsZoM7qvoXMNWeiDsTyCyVXe+VNvv8U8G4vOoYL8VzsL/wWaSDUtmYFQkTXhZnERjd/x9h
 cg6uXv20+36PSMX0YeVPstze/6hdbSN1mU0Elh9QsUplbEWtZ9KozspOgulGx+RUTrR7shTAtL2
 mrd+c+s3N5Ppgcw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_045252_912177_20A44D2F 
X-CRM114-Status: GOOD (  12.09  )
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


