Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AE4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 09:47:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F11D6120D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 09:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F11D6120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytjnX1fkJDCepahYexOycQfHB28FA1f+NTQha+Uzj0U=; b=x6BaMjuhS366QB
	sDiwxslzAKgJH11JqIQVmP7U9eVCjyIZwpFxXMqEw58467UuCq4f5CCoKi7LWYHOv7db7Xw6nux0Y
	Gzx7FdGUa5Rt/fsLQYDFwQZAvMU51iCnnSR4S/5cykw9QOFkfJ+/ib1Mp/3rV+EXqnVYfa0zNrZGF
	4XMFJGeDEucBMuXPvmKKQDn66DQyURgczrTDrKo2LJH+Il/RNtN4NE03qXxQViBdhrlAljlkcPQMJ
	4AydvaJNgyvnQOvYzlBMmrf7cDI26SI2Pz+5fMxpwo+KcRkbC5hMg1IboKWyAqCkLVBTFNUkGBQIo
	wglPdCtsxD+zBxs/VuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVWBQ-00Abah-Or; Wed, 29 Sep 2021 09:47:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVWAy-00AbSk-9V
 for linux-mediatek@lists.infradead.org; Wed, 29 Sep 2021 09:46:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id x20so3155831wrg.10
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Sep 2021 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mwf1tKg1O0N4TdrAHDKMubF2cwo9nO/+84LsL8mnCUg=;
 b=EK96bY45esZeXSedAHzaXDD/97/7pEB2Ec1TlsHkD4e2go+rNg577bZ5PJAlUIs8B8
 Z4y3LZ20BMQVmfHNXRs6g0vcBiWN4UKZmhwOdo6RtykBus9rnfXCaSE9T24hiQkl1EEr
 yJgqKcJt7e7de39HZ2lYtpadF7nlHmpY3L80X6rrkKPN24WXcn/nhd2WIrTgnqr56fcM
 QK5AnjWaxg2zsBY2b9VWuqGOia+Dw5QJyMekFjYA2pkai8W+s8SaLSSaY3x/JMnTAU09
 BK/PyPJW5gXZGNkWjB2eG+1TJNOlZxYvW1YmkSPj4ceLchjcwfrdxGe5svJcVLdteN3w
 zTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mwf1tKg1O0N4TdrAHDKMubF2cwo9nO/+84LsL8mnCUg=;
 b=1uZFVdER5DYqw/I9lLHdXJsHdkjilO9/17UuUdZre4Gr+P0xdDv6iJHnPYmTwV/mTf
 +2SQORiPBaadnG7poB6LanMFFBZWZAN1itgrbYiYS6K7JpF8JqEnaeb8+0oJR2z3196m
 Rv/rmVTDlkTFfXmCEIpsJ1rUCMeVu3nxVtRgDz/UM6bEF2B0FValjlBBIaxOQ+lX2M2W
 2xvQBVQHwbooMrOJcZc8Hu7a4YlGyxGfnk2KdDpDzwdIsxH90WHPHeCKQ9xU33qjSFcu
 2vMlicwjSNAwCzN6XvEj/jqKJHG2M6BeAVp1HfALk95AWHE9xCoMrFAMdGP7W15H4GCw
 TDKA==
X-Gm-Message-State: AOAM531CS1c7U+StD9dLbQoeMXYA+slf8+1m5fbnYhG5eRXBcBoIQCjI
 4yo+foLtQiyXADpsI2s5qpMFF7aI6fKVIJQ1
X-Google-Smtp-Source: ABdhPJxCZB5y9/24ZxId/CvDAmaWQ9JH8Sym9cvk3b1JSHbLkJIcqxj5WU+LObOEzlSfu8A5xUrM5g==
X-Received: by 2002:adf:d1eb:: with SMTP id g11mr5521254wrd.31.1632908814812; 
 Wed, 29 Sep 2021 02:46:54 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-2cf3-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6240:2cf3:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h7sm1751938wrx.14.2021.09.29.02.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 02:46:54 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Date: Wed, 29 Sep 2021 11:44:23 +0200
Message-Id: <20210929094425.745-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929094425.745-1-granquet@baylibre.com>
References: <20210929094425.745-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_024656_364029_14BC88C5 
X-CRM114-Status: GOOD (  14.89  )
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

Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 45 +++++++++
 .../mediatek/mediatek,mt8195-hdmi.yaml        | 98 +++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 0000000000000..3c80bcebe6d30
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI DDC Device Tree Bindings for mt8195
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ddc-i2c
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmiddc0: ddc_i2c {
+      compatible = "mediatek,mt8195-hdmi-ddc";
+      clocks = <&clk26m>;
+      clock-names = "ddc-i2c";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
new file mode 100644
index 0000000000000..17e542809a4e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI Encoder Device Tree Bindings for mt8195
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
+  its parallel input.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PLL divider
+      - description: PLL divider
+      - description: HDCP engine clock
+      - description: PLL divider
+      - description: HDCP engine clock
+      - description: Bus clock
+      - description: Clock for splitting HDMI/DGI into two pipes
+
+  clock-names:
+    items:
+      - const: univpll_d6_d4
+      - const: msdcpll_d2
+      - const: hdmi_apb_sel
+      - const: univpll_d4_d8
+      - const: hdcp_sel
+      - const: hdcp24_sel
+      - const: split_hdmi
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - ddc-i2c-bus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmi0: hdmi@1c300000 {
+      compatible = "mediatek,mt8195-hdmi";
+      reg = <0 0x1c300000 0 0x1000>;
+      power-domains = <&spm 25>;
+      clocks = <&topckgen 153>,
+             <&topckgen 86>,
+             <&topckgen 78>,
+             <&topckgen 146>,
+             <&topckgen 73>,
+             <&topckgen 74>,
+             <&vppsys1 44>;
+      clock-names = "univpll_d6_d4",
+        "msdcpll_d2",
+        "hdmi_apb_sel",
+        "univpll_d4_d8",
+        "hdcp_sel",
+        "hdcp24_sel",
+        "split_hdmi";
+      interrupts = <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH 0>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdmi_pin>;
+      phys = <&hdmi_phy>;
+      phy-names = "hdmi";
+      ddc-i2c-bus = <&hdmiddc0>;
+      status = "disabled";
+    };
+
+...
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
