Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C8FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAIuQm2COlWkK+/Z8BqCJPN5NppYOkaJmMDk8pvQT/U=; b=krV3HwMKFzXlle3R6sc8JGE9l7
	NRlDpXU9gTVzZFHHvMcDe7W7RdwbEdjHy5bgBxuMAl0ettQJgAa+vT+bk9ODwBW26j8cuJB4N9f4v
	QA9ivM5nmV/m/jGG6j7y6YqPXCGhLywpN+I/JlzsyWDsP7MTILumfZfWTPSM0tmx77h+wQQKtJ/OK
	n4HE3g4nQ1XQP1S+JUnLqnKLYgWh9oR9/E9pUvcPEaSi2Gq6dUJzNVD8UvM6YKmxdWdCZv87X8FI0
	NRb8vgBysijdrUIe5hiVCUPbDvsnKi9BThO5GTl/9MflG3djLS7HyLvt8zbUSL9bX44BHNIL+s5zS
	D1jsryaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8EpB-0054Qd-SC; Mon, 04 Jul 2022 05:40:45 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8EoF-0053gd-Fz; Mon, 04 Jul 2022 05:39:49 +0000
Received: by mail-pf1-x434.google.com with SMTP id w185so4294280pfb.4;
        Sun, 03 Jul 2022 22:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oAIuQm2COlWkK+/Z8BqCJPN5NppYOkaJmMDk8pvQT/U=;
        b=EaSKmdfnWVJ+MEpeWqtg1O0K3ULAhPBZDu4y0J5yHyWuHGxf6rPYMVoveDSCrlTjR9
         TFnf+toKwQdO2ceOqWxkRj+OW2XjezFBJEHyvgRge+bPiCAOhow8MLv60v31u0rXXeV2
         ZjnVQu5QusuAatAcEzgnr6JoiiFWDP7dwXs72jp2mI0Hk7Nq3P4rJRfNcz0HDHPc8Yhh
         dIocVDAVZKBFCPD4y0OyYzLiUsFhTzgXxm+hFjDiZclY7X0LOG/G5870oDbQR+i3x8XI
         A46KXgDjsQFhKpsdYYRe53sfrWe0HN12AxU1k0KCpxf+VUs3YJOzJ4YZhxd+ARoZ6BtY
         dERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oAIuQm2COlWkK+/Z8BqCJPN5NppYOkaJmMDk8pvQT/U=;
        b=e0/WpWPB2yctCY2ssoBTz6OVWCS3dxjytlAaVfNtptxAfxctyMl56ga+wmB4h4jfHv
         7Jha0PinVe9llW+65VPSHJpSnumnTb6vf/ojM2RsHXtOUcWBep8zhodnuJ6Fh5NKKWM7
         e+Ogsm+NV8bLQbYuMAttadk4Eb7MpHEEobMRPzfouhsorMco3utMGia+1lF8KP3hFnP/
         HwcmV0Y7T6BXIYykw8PM9Y4UJgVQTUEHNA5N1uOXex9WJGmMyhruU4iKA7cbr1rzq4eZ
         kBlak8L7/9QmlQWrAbtyDmngVEEFR+Ls9iX9GISBmDo+tb/TAojEuL4xctkm4ykCG9IZ
         wStw==
X-Gm-Message-State: AJIora+fFDbctAKbkMT2oYHJkmRM3KBnzlPQJ9ir8uDnNrWN2CwncWZm
	Su9qTVUcsHpIXi7dpQeiTLA=
X-Google-Smtp-Source: AGRyM1sQccU+fvMq/w6AhPUj9pevtapjlIxEFCp01xKjETVAPCINpFYH0R4xwRYW8OPqboB13jMtDw==
X-Received: by 2002:a63:86c7:0:b0:40d:af99:608 with SMTP id x190-20020a6386c7000000b0040daf990608mr24095540pgd.515.1656913186411;
        Sun, 03 Jul 2022 22:39:46 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net. [42.72.4.255])
        by smtp.gmail.com with ESMTPSA id h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 22:39:45 -0700 (PDT)
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
Subject: [PATCH v4 03/13] dt-bindings: leds: mt6370: Add Mediatek mt6370 current sink type LED indicator
Date: Mon,  4 Jul 2022 13:38:51 +0800
Message-Id: <20220704053901.728-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_223947_599655_559D832C 
X-CRM114-Status: GOOD (  11.16  )
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

Add Mediatek mt6370 current sink type LED indicator binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..45030f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,77 @@
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


