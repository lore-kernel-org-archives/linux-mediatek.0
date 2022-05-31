Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PF993pDtOtpfpACjO6YosGDNVzyY0I3Y8/OtvIzCFsc=; b=UqdXLBfgLunVZU
	HnW451uOGZ6yrtbauiSTZ8XLOzwLRM1Ewg+VsGMu4lcCLr9IXqZYM5kayNd+YFynn0MPuXx8ZVCcu
	q3kOUlGFkU3M+fY98Dr7oyqbt+rfrY8dNxw+dR1b7pUNaL7msQVwyJrZxqL4Teil0Avd3PxCAbRxe
	UrehWGe+m4roO9XmXTYpTsqBZXqcLTCrJSvD3RuYIvF0mFyzfbDsdg0c5BiRa7j8uCwGYObOCJ/oF
	N853zNogdQzxHxaALEPxk3lY9Bh1OMhNfMjdxEOw1OEeIjhv1ZEB6iaAweSMw4g/BUiB7r3LNrlTL
	AmElzzvLERVPo+PpV2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw13G-00AmER-Rb; Tue, 31 May 2022 12:32:46 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw12h-00Am0L-Om; Tue, 31 May 2022 12:32:13 +0000
Received: by mail-oi1-x243.google.com with SMTP id u140so14783721oie.3;
        Tue, 31 May 2022 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WjL5ChPbIi7K/V0MdTfM2rPQhvrdOuYsXgOFgMyivaI=;
        b=Dt4cmAwTJzLQp+0BhvSpwI46ky2dI72Ho0ICX5p7qoY/Cq20zgcg3MruR/EMF2Bq/b
         bttgX4DseumTdpOkyOeLDbhu/g0tdhRqMTJq3xHeH7Y+46XvfvsF6ZP0IAktzO7U/eKj
         0versn33tjTT0IlRhUYB+CU5TjsWXAfTIXhupO9UAG0+WcQTF2olwkKQexwJa36jFxyt
         JYXcZGUcWG0zYb6nYsM9gn3xgDRKrfJ+kh54KRUoE8hpcI5Mj4N0PWANGjFFYncNE+7l
         5k9RicWNlg6t8/gUtoxx5UXQY1J+ugPqpYcnRDiZjTqXfOM7cSycfbANCKRtA0ZdAi/2
         Pi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WjL5ChPbIi7K/V0MdTfM2rPQhvrdOuYsXgOFgMyivaI=;
        b=QxBv9Nbt0EWm67mMbYd9ZIm6VP97sYPgd/kRXAfp2c9o/UR3dIAvWSHGhykqWphvvi
         prtq2+/Ws/orQHigSR705HAQzpgjKrDcG3xBXFbJcRpyjQ5I3EZGOtEMyP427PzW863N
         yewWSrHUnD/0j49UyfyCbPY5N0u/eUFm20H3pn2kMAeXUZ0XYcNpgYW6YCB+6q1EJIw6
         S6puATyR9qrme4fYuk7KEnjd8+YrW5kie4h9bMRe57soy9QY+kPaYVOqhQ+YCQ+7meYM
         UaG/0eUjhlUtCtvTDb3+/LZtyUjcn2MOSCgMO0SlTDAqDsNG2bI8+buYQ8sEK+3bGz+o
         P8gw==
X-Gm-Message-State: AOAM530XJ1UPHjGK738If3yOe3cklop/2W0TZZZzBEoJJFt1kVTy/C5q
	v5CeIxqcNI59AOz98XMcVPrftS6+fgI=
X-Google-Smtp-Source: ABdhPJxcNj1TTo46zD0wjy4+ZyPww3ji1KDlsT3qEGdzSt4nXnXjTaqvtqMA3y7vBlN14PrpZHzriQ==
X-Received: by 2002:a17:90b:33c8:b0:1df:aaf7:5822 with SMTP id lk8-20020a17090b33c800b001dfaaf75822mr27811307pjb.9.1653993738855;
        Tue, 31 May 2022 03:42:18 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id d19-20020a17090ac25300b001cd4989feebsm1525829pjx.55.2022.05.31.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:42:18 -0700 (PDT)
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
Subject: [PATCH 09/14] dt-bindings: usb: Add Mediatek MT6370 TCPC binding documentation
Date: Tue, 31 May 2022 18:42:06 +0800
Message-Id: <20220531104211.17106-1-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_053211_884549_C083B33A 
X-CRM114-Status: GOOD (  10.06  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 000000000000..49316633f92f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT6370 Type-C Port Switch and Power Delivery controller DT bindings
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT6370 is a multi-functional device. It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and Power Delivery controller.
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
+    description:
+      Properties for usb c connector.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
