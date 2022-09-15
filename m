Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E15ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=; b=c0P/gfI58YInsph4fYYQSrfT13
	XG4ioY4V2REu1WEZE6pOhJsnOOI/1Wrf4NEjgK8wDtc03smP1mWrxDQyHDe7bLKgZpltvw0jHkA2W
	V1AK1pai3f9H6kT+4HcX0MxrDJE6dvptv0UBwmnuzhvDnOz+XZGSw082eZQ/HDamjF72+Mk2F5Vlg
	PNSWD4Dom8l5SXyojzs6eJk7DJ12w99pI+8the5i1TPEoBSNyM/ZEXBqMWgwMZsbpFMtNkDqrmocw
	A1JTcE1PGj0scbLf6sswqU7QMnPYRsOZh+UBhc+UpAZMEpGwVcdWTud6E606ZCrSY/dRyDsGmkAV0
	W9yBXJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlWQ-005kAc-IA; Thu, 15 Sep 2022 09:51:02 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlUo-005ivG-HJ; Thu, 15 Sep 2022 09:49:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id q63so16824613pga.9;
        Thu, 15 Sep 2022 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=karGxf6tDVJtMGdp6ovW9u+dUHbs4aPAGfkYDrgwDj5TT+GvOgg4dTIWyTz1ED7ij0
         bfeR0Qp3CAQu//asFXj9+okTLaUmIex3ffhd6CuNyS2zUj6XV1E8m7IuyEw3gcm9Ttn4
         WbidfEi5z7T3LroMMpCfWI0kzq2JTSEGZtg/d4aZk+A09YWpArLN3wVO7TuFxMrtbmuT
         VhkJr7R1fFhVOX9pQ/EdY8mTKY7EsEPf7bDqytIzgqsf8th34IGU7pdhTMSGZ/XTNUpB
         cJ14KTRyBiGc9iQhsIQ2iGuGeQtqJmLImtD37VzIoKniTjXjwC56YkX6HnjDMCaXJV2I
         NVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
        b=VOS+hC3cqg/0U09n0whVGFkK9Y9G5sVdDbU5LKnuHa2oSMcYeTiC0kTzTnkxU/alVW
         4NFB3iThjw3Ztc0+x2NMF9wZ5coBSB/jV7G0wrNLnWpWpHetDnl1uNhTwvyhV/vpu63Y
         6sTzRWXnVMoczcWnT+xSuCgscDXKyGNe0bvJnV1bkhC2gOVttgZrtskaDvffFDY6G7kl
         wC1wSJMsYaXC0JI1K0v0XrX6RMCHTum8X9jvNzB8qVxlRTwJ1NLtI01nd0hV5LTWCIOY
         qy9dLg/k5lhnPxsIJqju6pPy0sYn2fCIHtbRD9QtbDz10eVz5IMaK97/iH4lGX2+mTo5
         B8bw==
X-Gm-Message-State: ACgBeo2KkIizdXPeddrqBiJfAWjEEcKq4zLTJBaks1JZQCesOzg3gUw2
	sLXT1Hr50HWK+jkGw+aqQ58=
X-Google-Smtp-Source: AA6agR7rP6II6rBPfeu9hDGM5xx1njOwHISVNlhJeHqrJ5o7bqrc/mGE7ZkOKF566mvV5xM7tX85HA==
X-Received: by 2002:a63:2c8:0:b0:439:3806:32f6 with SMTP id 191-20020a6302c8000000b00439380632f6mr12044018pgc.217.1663235359590;
        Thu, 15 Sep 2022 02:49:19 -0700 (PDT)
Received: from RD-3580-24288.rt.l (114-137-177-189.emome-ip.hinet.net. [114.137.177.189])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b00176675adbe1sm12669010plh.208.2022.09.15.02.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:49:19 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 3/8] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Thu, 15 Sep 2022 17:47:31 +0800
Message-Id: <61ca6fd2094d67b3e3ee9aa9a0426774fa01589e.1663254344.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663254344.git.chiaen_wu@richtek.com>
References: <cover.1663254344.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_024922_637326_80182E17 
X-CRM114-Status: GOOD (  11.47  )
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


