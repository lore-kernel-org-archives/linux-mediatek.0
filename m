Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55286C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 07:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u10vAEHFFPV+m/GXeBz2tZsyM176ncPweeKXNtbzC90=; b=I8EEG1tiopl1545vkJcgv6t0RG
	Y3ExtIURrNTeIMwrWKwlKZeHU/Wzmkx0bPFvqJtMmhgQTa+hcKlYW9B2wOWmucYQ5Lb9MRZoYYYm4
	J/WvQiPwTACL3HkGPXLIDfeRhp2K7jl+JfjkpPULiKyWmMcPSFXHmJn9ZHI9of+rgxaSa38WCvEjx
	PaS/OWGFsbxlr8AWvPq311GMYnOZr7k/c0d6s/3F8RYbkLlIRTwfp0M8yR+GAGTLDhgvOrrrGAQ7q
	Xr4QA+p/WUbX2Lqe3YfSS3DJLvPhCyRpCO8Qvd7VWO2SIX0nvuLP72Zt5P/WQMkfnFSNQnW5Qq/wj
	BYhxY+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrQw-00Chaj-TZ; Fri, 05 Aug 2022 07:07:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrPp-00CgrT-CB; Fri, 05 Aug 2022 07:06:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id x2-20020a17090ab00200b001f4da5cdc9cso7497593pjq.0;
        Fri, 05 Aug 2022 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=u10vAEHFFPV+m/GXeBz2tZsyM176ncPweeKXNtbzC90=;
        b=lpYlKFaodSrlaln8lz1dUNOI4lQWvJ+cRzzDOYyx7EI8KlAYjZuIitS6HOEUQ55W5f
         PWtVd6lpKNqO8UwhiTfFWePr3eWySMaJkxBCEYByfZwBKNfy0B1tZ1tF6vY6HRslE4bY
         smKZ+gY3X3WRx2FXUfAq/ekAOdKBFxwUleaomuQRLg6mMBQkLAeGYUi+ihaAc60ujJja
         3qnW8ixtVDSQ8kBKInU/9OJEZj1PRzkU1v+db2Tuizs6WFlkTzLHc4CuqYn3oXAYRsoE
         MdETGC8tm2553zWhLzOHMWW8CN4c0t1kiT9g2SbHHeWr/92Zyn/6Ulnm0EClXMiT7iSg
         3fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=u10vAEHFFPV+m/GXeBz2tZsyM176ncPweeKXNtbzC90=;
        b=Yzq5m1OswhnMxpz8HCdhm8jwWKINmRS3VTqDW7ewjy6kfe37E4uTc9OynuEtUsYQt6
         /6vbzDQX1Lbx7ykLZAqI8hFZZ9KD0miVr3jTF8KZI2CO6tdX5wIo+LFqbSXGVTuRVjyB
         DY9SeovSM47/xO54qmPN1/TIB8AM29xzjXR9JOiD9pcKHqQ3VId8QwUOlibcysy0MgQ2
         Wk0iKlzyhlBQ89HmjKWxkiupbMd8hbQWzxE67xcvzG8TcqCAX3k+dIyYq0R4396Wokwx
         vLR+u6vXUbxv2h9lJBm/I91iFBo2QT1BTJKRygrNpRGv47BSbhKu9ZNsc01lZJHZn2V9
         9EoQ==
X-Gm-Message-State: ACgBeo13riVovl18CqMTsemyt14S37FavQBDRjA6wU4N/gLDpXiagvAT
	8LNDX6BA7S+bRCk4m61I3dE=
X-Google-Smtp-Source: AA6agR6uOX2JJQosvwhOiZcfULuJgPT1rgt3CEKqJiZbC5XzNWkHdOg8QcgsZu7eNgGXLbciVCi0Iw==
X-Received: by 2002:a17:903:11d2:b0:167:8a0f:8d4b with SMTP id q18-20020a17090311d200b001678a0f8d4bmr5573656plh.78.1659683194207;
        Fri, 05 Aug 2022 00:06:34 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-229-62.emome-ip.hinet.net. [42.72.229.62])
        by smtp.gmail.com with ESMTPSA id i5-20020a056a00224500b00525343b5047sm2191616pfu.76.2022.08.05.00.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 00:06:33 -0700 (PDT)
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
Subject: [PATCH v7 01/13] dt-bindings: usb: Add MediaTek MT6370 TCPC
Date: Fri,  5 Aug 2022 15:05:58 +0800
Message-Id: <20220805070610.3516-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805070610.3516-1-peterwu.pub@gmail.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_000637_482283_BEE189D5 
X-CRM114-Status: GOOD (  10.93  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
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


