Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6956C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYG4C7EjYfh+kElebz5FKcr4p81N8zXNy7w8D5DkdPU=; b=OQXYGzHzArM4kN
	oW8O5fAbAivi0eevA5ICCYhCBQVf9gxA6II5DtVn5yM+3J0bLRRbP7sUBHeiZqtjWyLHOy9NrnkEP
	nzdoaoURMO0BJUjokCtzMRBcXFEboiblX5wiPfXij3xzGVoR23cmPDmVsTWLvTQZUDVTArsDtLUXZ
	OApR5YNX59HskQSqXNxcdRwLuBRsSPNpik6Sb2jwhoNG2Q+tIcgBGC5BpdU3/ZQFvotxN/Vwx/71h
	ioXJVkcyE8O2yQ1XtjhuQcjAWnLANhRd2FVnmQDexpZuGiyQXnkqx6zfBW7Mdp/oR4TmhGTbSWLX2
	tkNoHdq27k2x7Zl+G9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0zS-00Akdq-Vv; Tue, 31 May 2022 12:28:51 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0yq-00AkOl-Dd; Tue, 31 May 2022 12:28:16 +0000
Received: by mail-qv1-xf41.google.com with SMTP id v5so11800571qvs.10;
        Tue, 31 May 2022 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0sCP0jkvIeE07R1+RmlM9MygA92ez6zp1dtKYb5AvDE=;
        b=a9be3peBUoFVZqZ50OCR7WCQoA0wgtbUgT/V/GaXiuqSAAZwShGNehkdmtF5IgcnLo
         jos3yCaQ+rs2+jVEUM6NGd1bpsXdyfVaoP4C3RyV1nA225rnVpOny5wc4TVI3jptz0mE
         +sgwKJ+DFBy9R74Flg0uhc+pjh/5Tv/g7aTTUaDeYptE/YR7biUq6nb8nux92xPZQR9X
         2/Zsydv1BO94RBnNsZg4bMGjUzZcuMe8+mwXgJv9ZLXVBFhtafQDa8Wq9e2B6JZOQmTq
         l2LzCSoS8Sh3j1FQzAjfrHIlqOnqrWmVDmh2CA9+3bAVKobrIEr1gHEf7XJLdobrcTTh
         g6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0sCP0jkvIeE07R1+RmlM9MygA92ez6zp1dtKYb5AvDE=;
        b=JODHAj67WShS4Su/TsG7KtnnKZ0PidJLWP+GZIzthnD/C1PY/7kymghY31O5EcCAi5
         jqoghqTrFPIMiBNvrfsIlOFJIOUxG0Ut5ndy2Vhp/bxeVcMVrLkbZwxM55Yks6RHrDW1
         buwhSEKTS1t+6VUZT3CS081FvQQQ6EF8dtEJMWunNdJKZubaVRNYbdbSQ/Cv4j+bUz51
         HkwRH318rCjfrPa2awn4l1Nbn6nz/WcqQM3hJnZwt9DYICNLrPAr+OpsBhF3xDRQqlEo
         x99BH5nfVX9YrOz17Bal9xK+FvarLCJDR5+dw+3gRVNN6rSRwHcThW/dT4qDHeaa5Q33
         1CZA==
X-Gm-Message-State: AOAM531tIoCqPWAiY25fzae4Ljh8/dEWumFpddfG+Pozf7BgSwU1xl0w
	yDK9dg1JuipZLOG72Queu0r8WtuT3Jc=
X-Google-Smtp-Source: ABdhPJxjB9hNHIBZP+TwpIDn3+WjAr/DqSbaH953TORf436cYOrtjkr7OObAuQDCpGlL2O/dNLlIWg==
X-Received: by 2002:a17:902:f34c:b0:163:fa4f:2ff5 with SMTP id q12-20020a170902f34c00b00163fa4f2ff5mr4895286ple.174.1653993745016;
        Tue, 31 May 2022 03:42:25 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id d19-20020a17090ac25300b001cd4989feebsm1525829pjx.55.2022.05.31.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:42:24 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: cy_huang@richtek.com,
	alice_chen@richtek.com,
	chiaen_wu@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 10/14] dt-bindings: power: supply: Add Mediatek MT6370 Charger binding documentation
Date: Tue, 31 May 2022 18:42:07 +0800
Message-Id: <20220531104211.17106-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531104211.17106-1-peterwu.pub@gmail.com>
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_052812_485042_A1D8FC35 
X-CRM114-Status: GOOD (  12.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add Mediatek MT6370 Charger binding documentation.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 000000000000..9d5c4487ca9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 Battery Charger
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-charger
+
+  interrupts:
+    description: |
+      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
+      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
+      are required.
+    items:
+      - description: BC1.2 done irq for mt6370 charger
+      - description: usb plug in irq for mt6370 charger
+      - description: mivr irq for mt6370 charger
+
+  interrupt-names:
+    items:
+      - const: attach_i
+      - const: uvp_d_evt
+      - const: mivr
+
+  io-channels:
+    description: |
+      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
+      is required.
+
+  usb-otg-vbus:
+    type: object
+    description: OTG boost regulator.
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpio:
+        maxItems: 1
+        description: |
+          Specify a valid 'enable' gpio for the regulator and it's optional
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - io-channels
+
+additionalProperties: false
+
+...
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
