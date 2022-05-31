Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D509C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syoRFXdXQzcM34VIbzkvZvVLjPFv9mAzVTqdtXYiV5Y=; b=NAfgWvAcIO5rSy
	HjuWkrXQ3lDGMalHv+nHAquSOUFHzojwmjE4jU+GpVIHuNQeeKR78VTpe4g9/X2NK443Hvw15qwRM
	ZSushYqY5FAOx/71ntB5VVblBS+t6yTLQxJppvIsHgBUc7h/VgLHKgGtHDA+7ZjkNxRHf/3x4zglb
	KN7kSu56vgK912J6H0ILsTsZCEPg71QrAqsDRFgSvWeSkmjGihfiZx0obg53RrB6QGrfobiE0nwlM
	gcKAwAm/6p6Umwd0DxT9ZnouoFE1wmMVuq0/Got6vspD2kBkGJyhlAfYdn04h1QnSb3kYR/KOVVjI
	IxPUOgAk1fOK5ky6d+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1pZ-00B3Em-5F; Tue, 31 May 2022 13:22:41 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1oH-00B2dJ-3e; Tue, 31 May 2022 13:21:22 +0000
Received: by mail-pj1-x1043.google.com with SMTP id m14-20020a17090a414e00b001df77d29587so2666151pjg.2;
        Tue, 31 May 2022 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U7ahqBydDZnP+CjyjsQFK3suIZ5X/7W6Ul5AL8gL7a4=;
        b=gY4IDX6Of6Gq9PA3f1jZGTS5g7DSpVEowE1SjgpLLb07Ek5O3bUa1AT3+cfdS6UCd8
         8Xt+NMoxOJuIk1S99ITLMNeJSVAIWnxd9ngnf4E663cBpINBrMmGDXNRpdw8PQO9ESN0
         731JEaDVv5f30evjoU7f4yAGsARRqv7GDBqzFnJF0rzOI9cPUCcO5ApJXoM2duaDE0f5
         fj8i3/Kpt7FIQOYfCSd45IYis8XPGGX3uAMe2IUBvzNCFMPsb0Au7CuvCnnQPXwZzS+b
         0RWSns/CRrkU8x5/UqEZiAzlBoLt3ZRjybQHALkf6vqASoClAAn6hcUxRm+1zZAddYJi
         ZVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U7ahqBydDZnP+CjyjsQFK3suIZ5X/7W6Ul5AL8gL7a4=;
        b=3lvZRZX/mpjXmEsH9ZMquFaFDdGaGju89FoWSqbNXqSdsX6OXvatHn2jD2WIcpS8pG
         ZlguLExHWgkUs8oLQwrrwJO5A5tpT1c4oKz60eKomu0MO9EUr6gSd+hIoTtPVUxy/4XX
         PQX44Q3hMZiQppK05LJ4lAVJM9LPZ+B3hN0ziGmn8iATCCPSnnliDAYDIBgsq8U9rzZn
         X0M00RhUg2FqnCTBNFFTXIN0pIGWCRsi7P5arX/1ZSweKxZRAKGg3GZYNMcKz6dIDaMX
         S0RXnnL1hwVEicDiITOWTjZACyt3ECJG+z2S3tHZm8PBSXsXooG8+ZCmFSZH+L8Eu4rU
         s8ZA==
X-Gm-Message-State: AOAM533AWssE7WBTic03ewJLeORSf0OYfQ4k4b3jy58m1Wk9f/AW+ejp
	xLJKXO/a/u0YizOe8FizbX/DIEFST6E=
X-Google-Smtp-Source: ABdhPJwXXdpvzfH0OHWambVU4ULlh4L9pgITiSW26L4OAZncDI72140qTyXM7wFe+JzlcNO/h+5R7w==
X-Received: by 2002:a05:6a00:a04:b0:51b:6ea0:43ca with SMTP id p4-20020a056a000a0400b0051b6ea043camr3778065pfh.78.1653995972975;
        Tue, 31 May 2022 04:19:32 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:19:32 -0700 (PDT)
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
Subject: [RESEND 04/14] dt-bindings: leds: Add Mediatek MT6370 flashlight binding
Date: Tue, 31 May 2022 19:18:50 +0800
Message-Id: <20220531111900.19422-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_062121_192127_6A1F0416 
X-CRM114-Status: GOOD (  12.03  )
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

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---
 .../leds/mediatek,mt6370-flashlight.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 000000000000..b1b11bd3d410
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  see Documentation/devicetree/bindings/mfd/mt6370.yaml
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
+    description:
+      Properties for a single flash LED.
+
+    properties:
+      reg:
+        description: Index of the flash LED.
+        enum:
+          - 0 #Address of LED1
+          - 1 #Address of LED2
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
