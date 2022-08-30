Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF63ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=; b=JwacHLV8z7YXF0p3rF0MhjCNMf
	eJtIpRVlJLmjPyE1OeIaQLtWyXlFYUL5I5h9DRtHqH7caI2bPJFXDOLpeim0DRZA0yrY4CurqZYcO
	e5Ssy3zOR3r4Fr0D6dZTPpmauMGp0+bIW4bEtzLICOXuMRA8zr+8OVZKelzChgTKQuq+RTEBkKTwG
	n3DrtbnqdtqS+70QC082vYgloi/2Lnez5rcsvdZUnDeys9delPsNjzUp4g6oYfzYL4rIiDXRn8+ZQ
	Z+m/b20MUdWJoNhfhP3sJrXeh7lP9gdTkN8u06q27KdtBDQMVLEUeyl9VXaSniDQ0kqbU5XuMa3o4
	V2bMPnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSs9k-00Dq8t-Az; Tue, 30 Aug 2022 03:43:16 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSs7n-00DpPr-AC; Tue, 30 Aug 2022 03:41:20 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q63so9504416pga.9;
        Mon, 29 Aug 2022 20:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
        b=THOUneR64v3tlyVUM5vKHd7RESODShVHr0oqdLV+tcjf8VcI5Ysfq90VA0NuV4ylKL
         Uvl0o3giqVj5adaFUmpNmGoZ1gF0W0I4FMb+9mD0y1Kyl05zOtJGLPzelM74fqxWHp/r
         H4fXx5+ZjrayySJzoY5QQuqnfZsU7LxcGyTxiebW5ACTAmAoqjCmxXpavOEHxqMfIJFc
         vpiNxOB/5GcjRlz5Yt/5zjYJoEEwdv02KgEQFy4nQGoRVmtMZbqi0++WMwv5OioO8MA5
         h87td/J5XQRNUCEjSIn3g60nu/PPbiDpjFHxfxETzTUnPH/1y3lkX7wnPbkH2bJ9LdGp
         kqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
        b=j/nBAQEhsJv/cWyTmo8awKDB4xXGdxpN4CIaNPAQ/p3VrGDiUnpb31NYAgwfw9fphK
         2rPnRsix8QkfUjBBvyjbs/Umg1UixgsIDLw0jfaGvO1DmOkLMtHkjORnR/dNnKSivyHt
         CLHQIUwJma7tPk3fO1jM524W/vuBp1TyZsNUUSOYCgc7C0FHiiTeOV72UVbVWdDCoQ/k
         NJp/bEIic/dpa+HQwwoz361Lq0PERqcENvNbHyyqMhop7ubXOnX1DTfGAC76Zbne8O/O
         G9MXmWozIDFaJ5gXI/ZnspJ6xEBot0o0gKG7UpM+1It3dwFP7XpKLQgcxzO1iW+ubipd
         zrtA==
X-Gm-Message-State: ACgBeo1vlC+J5SqJguWY3g/P1B0mTs6jEemQ/CTIPR3IFSnddtJfD9dj
	7Mf3byRQqsm8XvoLm3ChSYY=
X-Google-Smtp-Source: AA6agR4+JKvAffch8TpeJxlSEYvockRo3r5A9JM5ru35+1u/uBGvjHutYzvdaUym6AmDomEaFNwilQ==
X-Received: by 2002:a05:6a00:1d1a:b0:537:d750:65b5 with SMTP id a26-20020a056a001d1a00b00537d75065b5mr16582975pfx.85.1661830873398;
        Mon, 29 Aug 2022 20:41:13 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net. [42.77.88.242])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 20:41:12 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	deller@gmx.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	andy.shevchenko@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 02/10] dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator
Date: Tue, 30 Aug 2022 11:40:34 +0800
Message-Id: <20220830034042.9354-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830034042.9354-2-peterwu.pub@gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_204115_432144_7F4D2C39 
X-CRM114-Status: GOOD (  10.98  )
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


