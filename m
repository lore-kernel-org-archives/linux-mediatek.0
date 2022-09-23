Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EBEC6FA90
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 02:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=; b=x+PMaMrEDVBHUGQV7fFvOXMsd5
	dHLaxLTr7+dCY20ZbgnSoDxBurzswEM6geeFUjymcoPHVeNZaqVmaWWFN70wxCPOS6Rl3b9CGL4xf
	L9XnzQzGOM3CoCTH7etKfo+6UXxvdp+GUcqZXGtRPGzBxX7VWM95Raw+q/U6EdLFIHWg0LQzAMBIL
	E5YrmQs4YUdRQzOPD8qrnBlFM/daEeP+HhSv3Ls1seQENyUfjaPfXNyrnteT5ICVc6AGjVj4hBn+c
	8l+ACGBggNNxlFuls4q4h9JW7sXNSR9xz7Zhf2nKWREzEiiQ6tO/qo3aIOi2scQeSaF2t6cJTzUDr
	+0Ebc+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obYne-001ccj-98; Fri, 23 Sep 2022 02:52:22 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obYnQ-001cWm-5q; Fri, 23 Sep 2022 02:52:09 +0000
Received: by mail-pj1-x102d.google.com with SMTP id bu5-20020a17090aee4500b00202e9ca2182so7024259pjb.0;
        Thu, 22 Sep 2022 19:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
        b=AC7e/YMoRs7PdI4zPqf4eIRJ7TGejv/HIaMzTQwnf69CY8SRLkRIFrumEZn+opLCcO
         GfRpkAGRKXSflmI3c13EP4B+kPpUDmAaesrdD2XOHZxeg2iH5QxzHPncI0o1pAbVVZlv
         VJgPgp1anJls3Y5GWSO2DojXjLEdUOJQzSJlJX7IKDlsA+3WuzEPwe5FXXNMACQ1QPRa
         le8Gu2BOcf69I5JfSqo7yPytwattJFdDGGM4xGSxxbwZYofptc0EkKYt+FSvhruAmQWa
         seci6c3BC6AwTO/9ORAh6Vt4fM7VeJDVEaVXPv55dcPOTYfRRaIT3n3AZQ6w1hYIblHc
         t/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
        b=FXSo8lMHiOZzcBfFBakQf9sK8UEZgy3mrz5mNE2Q6Za9UeaADabBKXwT7w5yDxJrcL
         GYMnvNrk+ctHdMCX0Ytb2Egrht1PzkmVwz8nsICdEK24+NLLfpjsQFSIA/Y0imwl2mfV
         GF2FtMvdjH58J/VXt3KxW+WhuA7rR6PO/46Zj7hPADeGhbuCFqY8uDS5nfd/aP7uHGiN
         Cb0xobgATq5rMjFLkNIaXFs3s8AB4bic1C2Q6o1lFfv1zOxq2EbIi2GWNoxqYjCXBGvK
         vLvCRVYpUp7VCOABrn/q6n7od2DnYtB7/+6DqnvJagUa6pQUss4jK7u5T7fil5U0XP7K
         PMYA==
X-Gm-Message-State: ACrzQf1/dVw8UqoX8rKOrq1jE7otZU2o333+zQUcsnXiE1PY4rgY8WU/
	/7rjtNvotpJB0x8Pvu0Hb3Q=
X-Google-Smtp-Source: AMsMyM7eSoJTWL8zXsJbiLVdrPFOqNvwvUL1FyQ+EJ/ijefjMefhf+XTnrFrB8N+Ygdl960fPuCG7g==
X-Received: by 2002:a17:903:40c9:b0:176:e58c:f082 with SMTP id t9-20020a17090340c900b00176e58cf082mr6540418pld.60.1663901526345;
        Thu, 22 Sep 2022 19:52:06 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-76-89-227.emome-ip.hinet.net. [42.76.89.227])
        by smtp.gmail.com with ESMTPSA id f21-20020a623815000000b0053e85a4a2c9sm5167058pfa.5.2022.09.22.19.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 19:52:05 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	lars@metafoo.de,
	andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v12 1/5] dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator
Date: Fri, 23 Sep 2022 10:51:22 +0800
Message-Id: <27df85c30277a171ae85ff6d5b7d867625765d0a.1663926551.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663926551.git.chiaen_wu@richtek.com>
References: <cover.1663926551.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_195208_246789_58F5D096 
X-CRM114-Status: GOOD (  11.18  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add MediaTek MT6370 current sink type LED indicator binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..204b103
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - color
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4


