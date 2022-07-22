Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0194CCA48D
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=; b=rVsCzPGlJqE4zRyOHlQxsDQ1B4
	0xYLNdOafgIjteID5qxInHCwhCESzAfsoIkk0HEvCNN+udTxSFC3JMNLWcYGzzbU4pLC/x2/LmyMR
	XZdKCf5xxUAONR0BJepR1tm0+u19H7ZiT880/spjLAZzR7NSBwYpOGr/9SWcHVJ4o4nv0RlUYCI0j
	S45mRnoZGerxPIszfNsIbUqjVKRQ8t7gKQy0ECkm28on/+q8H4JZghvAJryqxRgP7oSAlmvJzAOgu
	Vq0GRPIpwDmWL7fIOX9M9FP7sDJ2n5do7Sz4JU10alIq5Ly6sP67P9nXcN/NVsM+p4Vc9/3cqwmGl
	Q+0ahy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEprs-002f52-E0; Fri, 22 Jul 2022 10:26:48 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEppx-002dNU-F2; Fri, 22 Jul 2022 10:24:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id ku18so4013912pjb.2;
        Fri, 22 Jul 2022 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=;
        b=qIjXERqyCxulsL7qrxC5ZZDDBbrioHFknIfqWTpItY9DnBOYdTrKjjHxJHVKgCGl/b
         qI1Bo3uVYHhVsETc34PIx5Bt5sRoC2tiuGaxCHy/jAJM0eDPTQXZeSPQFinIe+I8aq3k
         b4sxp+LsavCZEhpdo/xTXeoek2UqXswoT83RvGn19svgCZFMQWpoDvYyiXUknkV3mWGc
         j0uEqKCYVhxP+mKB9jyzIsWR4TAUOava99C6Tc8tfKqlztes7s1/XY6RtnvubtGfeZpn
         xjRuSRo549Wuo6S2lnKGNBn8iJB+KM+O2KEuPv2JYYPohP2Sw8x4qlz0WakW9LdwI4/U
         Et7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=;
        b=U785S+y0z4cIWgTBSYbFimC8DWB0fjXNHaZyVfIDmOT3rdO16tzAqneM80xinUkymO
         DwxoS3t6gA0BYg5VrbWVHEb5AuWiwyK5G3pCKrUQ8xmnhAvGceQo5pbxjgdkSZt0boWp
         8ug7PRndxDhFgLTSDE0XT8T9vEcWkqZ0YNjLy58Fn9+XbLC+pNcu15RvosDf7bpi57vk
         jbnJqr8qOIALlU1lW+32Gl4CIJzVwf0YLtJy20toZW6RWvS3WIlxWerjCtNSviWUZc07
         Bt0S+/uV9Ik+qMf3HaOOwqxO3zC4+UBRyvSM2VxuKcClvnQpsjbcyv/5yNhaPoR2Ns25
         GMNA==
X-Gm-Message-State: AJIora+1c2mgFJiOQDS2a0UO4s5yA1rVWirVlru5WtVLV/zVSFV4WOoX
	XHQjJeE0v9DaMl4vDwtcDw0=
X-Google-Smtp-Source: AGRyM1suCduVs2OcapdKOFquLFxR9PV6851tgTGd/xvEl5/lz4vxWAHevo2+JXiFLf4k/XyyV+aWjQ==
X-Received: by 2002:a17:90b:3c49:b0:1f1:9213:e747 with SMTP id pm9-20020a17090b3c4900b001f19213e747mr3386233pjb.15.1658485486574;
        Fri, 22 Jul 2022 03:24:46 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net. [42.73.82.239])
        by smtp.gmail.com with ESMTPSA id h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 03:24:46 -0700 (PDT)
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
Subject: [PATCH v6 04/13] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Fri, 22 Jul 2022 18:23:58 +0800
Message-Id: <20220722102407.2205-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722102407.2205-1-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_032449_525413_1A4A253C 
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

From: Alice Chen <alice_chen@richtek.com>

Add MediaTek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


