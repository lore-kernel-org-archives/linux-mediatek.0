Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Wi32tmpiQHX52ETq9Uk/4lGPfSR1D8G8ZTXJ1dPWC8=; b=FLLQvaDpUPZW2T
	Lwrb750uLNXy6nmWrPN5+duGibhdLsImWvSfPS3UdpblF4zA2qrYGKaeIKPN/6+43QwXkQDCCTrqD
	cRFiUmj9qRd0hhO5GM380kA2hX0IACULj4Gr/WdqS/8/LyetrTFicynpCpVPU41YIrk46spXRdOYd
	wjW6o5QmPUy4hWYWqMEg0XMZ1HUXYBQDpHYNimXxpnK6Ly0X5pP02BAKhivW2IPqYFJbrrOKw0hxE
	KuG2RBlazP2I6HEuJwtTpdB6AdEnmHN1XQNAQGTqHQy3zZPPqch8oiyFTgb650Naa8cmgslWm83Zr
	H1ntIALr0+XHHagDux3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1Vd-00AwJ3-C2; Tue, 31 May 2022 13:02:05 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1VC-00Aw4r-Np; Tue, 31 May 2022 13:01:42 +0000
Received: by mail-pf1-x444.google.com with SMTP id c196so1248172pfb.1;
        Tue, 31 May 2022 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NLlQWPmyPhz9LkYQh7iizThmB3DZjfxS2yfzbAOphFg=;
        b=c0XNKUscB1zMhi+CiKfzPAgi33gB/WNqZWTgiA6e6T/74Bc+S+2rt3VJ3UsRfE0t0Z
         atH9jyvYzC0EuHULZHe7WGzjQCb5VogDsom7nT+y02vKhMq0PK6qK2zKgULSu7mQCNOt
         3cUrkF/0FasX84M0+5XuHDd6yond+mMNlk5/zXu1Pm6xb/1W8a/7IYavW6Z5dEL/BLAi
         5pIQ9L6xn8925ggiqoLynT5VVlHrpmBo5ejz931C0Tgf9wQpG2sWForIN55zdE/CujQr
         /xY8y+2ZbC2EyFElWyMT8ivNm8PaWwGA2Dg8LLlmNA3TLB6fz9aecy0Tx9vI4rMPT8mO
         4gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NLlQWPmyPhz9LkYQh7iizThmB3DZjfxS2yfzbAOphFg=;
        b=sfsnFOOcmO0dAQ9Fn5v1QWQrRMDwNzijGZv4MvpfuDfSspZtvbewBsITaukpqHuKP8
         39WNeus+oyZR4a/W84UPrW+QX2H0OPG9R5tkup68LNlFe7qylH4loytu7yiB/gFfzgqs
         GcKOVh4wyf+ehdchZRgvSCG+neBLs6/qjL4ULmEcKviPDYW06kHSDlJUbI4PV1IGK9Vh
         YUDPpmUEnhxA12eZ+ZBDZtV2r1dD/3kYyHDtgjuAhgNztD2qcUoBGRZRVVTHBPk0N9Ga
         hj0LZvBFYp6AMP8I2AY8vIFTIq/NuwDDuWpwlrnOqWA7aVHMKwtzBkmgHPUMs8HZxwvn
         ov9A==
X-Gm-Message-State: AOAM5339AcUlrYE+EP4KuKnsnvFjV6Q/PzNX3OEYEj43YtBGsF3Jb83X
	/OWg5EXnkffKDCgJkSjyBHaOf2mVo3o=
X-Google-Smtp-Source: ABdhPJy21tg5SBP0FImL71dOB56WQUiWGSqoTOYD2ff2cgdAz5FYkYg+kGU6v5K00Bt1Va+nB4MDaw==
X-Received: by 2002:a63:4:0:b0:3c6:cce2:8457 with SMTP id 4-20020a630004000000b003c6cce28457mr51332560pga.612.1653995967138;
        Tue, 31 May 2022 04:19:27 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:19:26 -0700 (PDT)
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
	peterwu.pub@gmail.com,
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
Subject: [RESEND 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370 indicator
Date: Tue, 31 May 2022 19:18:49 +0800
Message-Id: <20220531111900.19422-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_060138_861374_1C603510 
X-CRM114-Status: GOOD (  11.54  )
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

Add Mediatek mt6370 indicator documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../leds/mediatek,mt6370-indicator.yaml       | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 000000000000..823be3add097
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,57 @@
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
+  see Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
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
+  "^(multi-)?led@[0-3]$":
+    description: |
+      Properties for a single LED.
+    $ref: common.yaml#
+    type: object
+
+    properties:
+      reg:
+        description: |
+          Index of the LED.
+        enum:
+          - 0 # LED output ISINK1
+          - 1 # LED output ISINK2
+          - 2 # LED output ISINK3
+          - 3 # LED output ISINK4
+
+      mediatek,soft-start:
+        description: |
+          soft start step control, support /0.5ms/1ms/1.5ms/2ms.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
