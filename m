Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDD9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PF993pDtOtpfpACjO6YosGDNVzyY0I3Y8/OtvIzCFsc=; b=j0tfA5pqsrimcA
	sve0ZLbxTFlMBjPhz1qUmLBo5VGKWJM4lpwJzD6iEco//kBtH7vG9WHxjP2DVccpt07DB8wJicwHY
	77RbGQhJroQXrEdt0Gsr7Y/5m77nriV9no2Ma+tbWhz3zbFh/Nmfia7vN+9GqisijIrwnqQvv95pV
	J69F7Li53H5o9Ria2vZhkUXcce1PQt5FTHMGESUhulssWgavVdm8zCBc++6KHCsuRWZnnvXJFHPwu
	Iz3v1866MTyzLXfAVrorXq+sXIa1Cw1+9SyA5GHVckVu72auH+9icSNo6Hwoo/oQoB7UI/py/MG4l
	GhSGZ080ud02nL/kHF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1hd-00B0Fv-TX; Tue, 31 May 2022 13:14:29 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1hR-00B0Cb-8o; Tue, 31 May 2022 13:14:19 +0000
Received: by mail-oi1-x242.google.com with SMTP id k187so13175253oif.1;
        Tue, 31 May 2022 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WjL5ChPbIi7K/V0MdTfM2rPQhvrdOuYsXgOFgMyivaI=;
        b=WmEqihZdq4LKwV2jTDPCqYBvw9n0DRGIq4RQ7wYrno4HYN5lt3eH4qZDaQTWUHqXVE
         b8kC+BH6VHErKiVz4/M6PdWldjxCdPMXwoZaJy5mcfAaj/61IzPllr2pjGhtE226tIKp
         3g8DyvJ2eSUv9HqWtrJMauqYG7IRTb03st1dgUtoPD8MzdXIFGv9FjbNd8b9aa6G6Qvk
         CK73YGmE24rmOzbwEGXdqwYi3bosJbRJzTuJMuQuk7e87+QK7CNxrvTT/vOoZC3o3/JQ
         ZA8x5trG+NpI0u9i2JaTtnqB+LA6Kd5J8Ld5nyp41nUyuudbZrk6OWs3brs1crItb4FY
         1SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WjL5ChPbIi7K/V0MdTfM2rPQhvrdOuYsXgOFgMyivaI=;
        b=47hhXOHjBQJnCGI3j3wwDYCQGpxcELYl8cD81hvNTqaT7HPMIbzebzc8ibYlNxJKoM
         4fBJYj6CRSQfo5g9xkMyTH85Sqv7PuHq8M/54Ga3LjROWlazWvmRaMgwIKnRJkI2FjtF
         3NFgiIfqu/qKAHmgs2CQ/FDXTb8FfJiXkEnCRPbz2vaMW4OKyR1wrsrhgw+EP9YlAAiX
         8cyK9RQAks+SVuBUbj+xP6FxP81Sq24lGTl19QyOBokldv9rXdHfKxGsgDHX0snG5Glz
         ungk6ZMsmhdE9wakORPmKBr1Dzq2W2GM7bLcJIvi8DL64DuFVFDkiBIGP2+v8LPea6z/
         IA3w==
X-Gm-Message-State: AOAM532sPtzNS/UfJHywpr1c4pJIvVGAKmr8wh0FFjMwpOMRhEPwFkgr
	PFV+IXwnwD5JYj2nROPNk4PIGsDLxT4=
X-Google-Smtp-Source: ABdhPJwQQg/OzLXNx/Hq3Xv0QAqdEOXRvSI1uqk1PNeKMu66slAGcZdztnBeofE6iyRo6FC0bhehIw==
X-Received: by 2002:a17:90a:8914:b0:1dc:20c0:40f4 with SMTP id u20-20020a17090a891400b001dc20c040f4mr28485260pjn.11.1653995954965;
        Tue, 31 May 2022 04:19:14 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:19:14 -0700 (PDT)
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
Subject: [RESEND 01/14] dt-bindings: usb: Add Mediatek MT6370 TCPC binding
Date: Tue, 31 May 2022 19:18:47 +0800
Message-Id: <20220531111900.19422-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_061417_341128_B6AAB4FE 
X-CRM114-Status: GOOD (  10.47  )
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
