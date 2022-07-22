Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F02CCA48C
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=; b=wITW7ihS/VFaTytiCPiRAGzARp
	TW9HTS0FjlknljteRh2JyDR3AWsYNKoMdOER1phupI89NCfZWqHjHn5vTTd9VBuRiOrpFRj/+KeIf
	ur0lfqazRbH1eceDjtPIISvKP2bQX8dVOEEmHVicn7IXpUgZVS1T57ypscphJhaTlJKtd2xt1FHeQ
	ktHD/0evmy5i35LzDHAtuguQ4ogQYfPep9HbMjBTm3ZrH7ry+GwZ1lHq56x79chjNzkxmzNjCpSV3
	Hh8geOAlvtI26kIkR+qaYN/1rtVfTKiRA0uqza88nUjgvXQznQr2t8BgJ6SavnvmfBJhkmWOS01Ea
	tHZk43bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpq3-002dV3-DR; Fri, 22 Jul 2022 10:24:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEppf-002d1s-33; Fri, 22 Jul 2022 10:24:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id e16so4090200pfm.11;
        Fri, 22 Jul 2022 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=;
        b=K/1y14MlRObPJ1LqAyB3L2LzpyCt8ulro5fYuTn2JfjbaSDxMPq+onPJsBu1oxo9Q9
         TxRl7TcnukFuuxiyZ2ebjuamw7IvnJn31YM2M/lST/StCcpCQKdmEnXFxKNnTU/E7TAP
         e2mGFLSobfVEJEttgHujCsQ8ILYu8gvhjb+jh0RRMoxbUcumQNQU+wNHeum3ejbPBkqx
         tGaz/ywyX9eVGNyuIZkD94Opve92tu2Wl3uz4RYpMZ5jqNvUiNCM7sKAx7llEk7rOB3T
         3LbP3PCf64FJoTPLJdW+hzmBKpix18zSgsyW52vspd9hSfCRV7tDP+2qbqicrMPuZ/w+
         l68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=;
        b=mhSdUl92YRVgSeu7uVVTntiADO+4OMWm6e5K7q3pWgHcCwQS6jRArmr5zc02RKZTbb
         F77Ae/dG4sTxOagX0roLTAse9feRhGyFWuGtRENYXBZshFVfp3VIt9tRZ/G5n2OUWbsr
         9ooKlUCtBGpzscJBftqfMvUKM07NCYpdu5co2WXAOzLDcnPSvie3S+4xiB7208EtOHyp
         eK/Q2KrGKKOryfFRDu+BCov8UBMvN3BpgsQrhbvs43KmokLcJfDWH9PTauRAmMb8i7og
         xlaHYcA8Jd4rKpd+2pY2MZ8B87t4PDKmuSc5xCtXSx0RAiszt7gxwwd0DEHJ1mqhS46u
         dahg==
X-Gm-Message-State: AJIora9oOtaMucKVQ9v6Y5J/96wRZ9RDEA37AVUwiXLpuJ2I+JZtjo5b
	cT8eq5xnxQawGgl6dJAraN8=
X-Google-Smtp-Source: AGRyM1ujmkE7H/dKSC5luM05BdbGMVEn2CHVXsGjcX1E72ht3gAGdKv1Y45YEKH3Tv5yp/zCff0Hng==
X-Received: by 2002:a63:8b43:0:b0:41a:668b:399a with SMTP id j64-20020a638b43000000b0041a668b399amr2571892pge.554.1658485466445;
        Fri, 22 Jul 2022 03:24:26 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net. [42.73.82.239])
        by smtp.gmail.com with ESMTPSA id h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 03:24:26 -0700 (PDT)
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
	deller@gmx.de,
	andy.shevchenko@gmail.com
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
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/13] dt-bindings: usb: Add MediaTek MT6370 TCPC
Date: Fri, 22 Jul 2022 18:23:55 +0800
Message-Id: <20220722102407.2205-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722102407.2205-1-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_032431_185501_2A0D3840 
X-CRM114-Status: GOOD (  10.84  )
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

Add MediaTek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml         | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 0000000..72f56cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediatTek MT6370 Type-C Port Switch and Power Delivery controller
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  MediaTek MT6370 is a multi-functional device.
+  It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and
+  Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.7.4


