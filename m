Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2387ACCA486
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=; b=DsLr719yXCqzkpnHlJWK6GauIa
	qNcS1XLt3ezC1XGFotgu2mrHbdo5RNElxPJPHvGB8BhujC4v4VFHPUb/qqjNs24+2Z8P1KOPYExFZ
	NkRKHAVwUV/U2q6pTHj9sEW9lpwBEWsyuKgcL75KMLotAR3r0oQ5c+7LxsRQlCvQvUAK+2zi2AIAR
	GBWI0PA44B/1Zwjp7d5kWCKsOH1X0zUDreDhaf4ravnIrNRdp/lVWlVQ7briOjRakIZDC3qOhNu5a
	mNi3FcpzEuANzRD5SHqXOWez8NUYG02Wae09mMjV/RkOd/NlWN2osWGJfO/iIoDTn23JYWHGC0nLA
	ScZ0xEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJUP-006ZYb-Ne; Fri, 15 Jul 2022 11:28:09 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJT7-006YnP-Sh; Fri, 15 Jul 2022 11:26:51 +0000
Received: by mail-pj1-x1034.google.com with SMTP id p9so5384628pjd.3;
        Fri, 15 Jul 2022 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=;
        b=WboNAeOE8zUIByDWEwnyde87CtzBmrbdti4AKCsZfCWV2qiSc8kOZu41SxPIZj8GET
         c13f4iEKQtbYsCgkl25EFNQeJqBoxRhrmcEORQKISJjJXA1C4SG8M7mgZJdk9JLAk1Nx
         gS4IDfySupoxdTro7OH0R34aAROWLE2Wg4Ll6D3MUVmEFM4H9miJcsDxTPL5+SEFmdFO
         GYz3l37CyNfTwziEu3yBr+JiwWx5NR06sGtTakqH682gRLtstaxj7jN/lk06dNqf6Da+
         wMMp90zBsAGb7CgnJG6GcxBnh2dnmWDpzR2ycGXP2eh1lUZ3pbQ7oPmAFk9azTRatLzm
         Gtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=;
        b=5uzo1ifivsV4xcwZwTkEgEuZYpQWDwoljPfNUeM2Z0q8epKnIDByBjtMj+PjTX8R8L
         iRN98JitstDgjTIo5APxwJBrgL3bpPul5lnP7hC1PXZ6VJehMhSR7iqfQXHSdVG28vk9
         T0aOBJ69/lKt7pWkc88Vucu/vWRLDcp5iM0yw1aCCc9DdscNIMwW803mlMdU6v33VFAv
         OZhZPagcEJTprVy2l3W00jYHoCFfWyAkufNCYRChgTmN3X63fzCzCSbu60mGMd+osuhm
         INbvJkUlezBUPEo8LJM7/h7nwMRKk4fUEqTfNvVJZ5L/42eKva+ho4j99p2wbGi1+t6K
         2WbQ==
X-Gm-Message-State: AJIora+WBJMVzqFw3q6v0Y5JADhkuSYthTs4SMAr0Mwr0k+dHEKiLJz1
	YRrgcykwwJkT23W2Y1owhd0=
X-Google-Smtp-Source: AGRyM1sZltUw/1JpGkrrx6xlT+Z5GjpcQ3KIeIf35T9nrHUA2Cz4hQ1u/67IaF4MBUiOqAfgRZNPTA==
X-Received: by 2002:a17:90b:1bc7:b0:1f0:34e2:5c86 with SMTP id oa7-20020a17090b1bc700b001f034e25c86mr14843981pjb.136.1657884406842;
        Fri, 15 Jul 2022 04:26:46 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net. [42.72.159.86])
        by smtp.gmail.com with ESMTPSA id a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 04:26:46 -0700 (PDT)
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
Subject: [PATCH v5 04/13] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Fri, 15 Jul 2022 19:25:58 +0800
Message-Id: <20220715112607.591-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_042649_963077_1BBDA5DD 
X-CRM114-Status: GOOD (  11.00  )
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


