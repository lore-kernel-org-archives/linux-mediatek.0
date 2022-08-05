Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BB3C25B08
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=; b=ba6B5Joeq5XVKWVohvNYXZx++T
	PT9lPPX1WSeYGWaBF0kXcaEa695eFd9uxqnL8C3/zuRrmXo18+saOEuZEmrFfRiybsQcSdWVLRMN1
	grhabR2jixj50ToTRkJwKZ9KzzNz1Jm/1G0vTp2jVmjppUW3I/FfJpP0TyA8Fi9f0JkxxxSBaOXV0
	y9wumUmXdoOwsUpwu3TkARD1b7QfGoyhxD7d5DOtnl2/j5/0amfwkuahtT4ZB09D6Y5Q/vkskGGdg
	/fmGW5Q2o6r3Pvwssx3jHAR11C3rsFUnSRy2hJ5fvJdfz3tr3xSfFehzhDaBB5NhFD8Kc9vz25+2A
	x4adeZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrSr-00Cige-T3; Fri, 05 Aug 2022 07:09:45 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrQB-00Ch5w-IV; Fri, 05 Aug 2022 07:07:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id f65so1921433pgc.12;
        Fri, 05 Aug 2022 00:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=GbRQHYJWpxNJ5WAA2fCLZDXWImpw8oQErL6RHuLr1qgR3c7cz14qFaq1/bgXHrJcjG
         aKu4qpdD0z0YDXpWslStuuvY1rLpo8AEnM3CeLgueSF+WIXvcTIhywulOxwF1jM7h0io
         6m80d+VHmLR9b3erIIgQlII6EX7Itibg98z4kGEJCQpfyOIfYsSa/dnOm5FjWjSzvFie
         XgKcW98VZGYkul0QX52UnIfS0LTAwyLZHmgP+jTlF/9dikRHy/3ouBR2tPOay0Lhx6oG
         isBNJnKmY9kSjYt6sCaunANsLS/R3XdAt7W/7euizUoulhqLNRBXOcRMGFdcLnWieIIW
         pO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=5iN/VX4BRqH14UnCBEBVZXGTXQq7elNgdtgzdSpCT3AYY1FFyDcFITVxJLUD0fkzQW
         MKFLKO0stHWk5nZ2uzm/yRyR/Um8l2KOcVcGO5WyLtx3fWkPqZZuI+RGfDDVucBznDIe
         P3c3ffYL1qGDs8lbgOxx+zThaPCmiQK+BGQiw/n1/0ndZ4Qvq/Bxoq5proRrJjrnAp7j
         e+QAQR0FcYhyhIP0yegO5IZU0x4U93MtWSYR5PBldskawGd7nYoOtVdVXoehPmMnjOUi
         kPeaCJ0P+wHiPvjd9qRFE4wvWyKdF/qKc5G7Lpd/gDPZhZM7a4Okd1vhY156iknL3i7U
         M3aw==
X-Gm-Message-State: ACgBeo0SQ3gmT1DfthEz5wMJ+pNZqLKr/JcmejkcLcC+6EzyXvt4eGKp
	5nubyi9rfp5Gsn9LVfGPk/U=
X-Google-Smtp-Source: AA6agR6DJ/xGXIEp9/SiYGj8B5E5YJ/4TnNDD77+rwk4vvfdS9F22unZx+OW4+D1bIl8u5r1XbFyuw==
X-Received: by 2002:a05:6a00:24c7:b0:52e:7181:a8a9 with SMTP id d7-20020a056a0024c700b0052e7181a8a9mr5495612pfv.78.1659683215955;
        Fri, 05 Aug 2022 00:06:55 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-229-62.emome-ip.hinet.net. [42.72.229.62])
        by smtp.gmail.com with ESMTPSA id i5-20020a056a00224500b00525343b5047sm2191616pfu.76.2022.08.05.00.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 00:06:55 -0700 (PDT)
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
Subject: [PATCH v7 04/13] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Fri,  5 Aug 2022 15:06:01 +0800
Message-Id: <20220805070610.3516-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805070610.3516-1-peterwu.pub@gmail.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_000659_652318_17083774 
X-CRM114-Status: GOOD (  11.26  )
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

From: Alice Chen <alice_chen@richtek.com>

Add MediaTek MT6370 flashlight binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alice Chen <alice_chen@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 0000000..e9d02ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4


