Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F22C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPVvWMAJiQ9bH1Vh3FBxv8RA77e8O4OnA04Edjj3+7c=; b=jVh/7vGocmmLX6Cb8Bv5pLrBPV
	lusMUKeh/58zF/O44lpC38iDAeVHkMcSJ+aHWG90z9ESF8JBDdABZjsCzCxvw1WSOMtHoeozc43L7
	ptA/G0MrSu0LgV52Nrj/3laIeX6W+M5/DqaPfuQ430WPr6FtZ2BsMC1eb32xtwSmQOQLw0kGY1IpG
	nytSiat1pj8xJwc57dKMXP124meemzy3x6BylL4MCsJnAqB4P1O9ov3kgwOz0braZhL3uyRqpPdk8
	w+RIsu9K8VadkfdWoa2kDUXdNwXIh1Ocuxd1KUNzI/nEWyGn1/1iZxfGyu+ZsSmg9oUQdZz3KbWHD
	NeMKxvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBNM-0000000Fr0V-0WVR;
	Fri, 12 Apr 2024 07:31:08 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBNE-0000000Fqtl-0Xsd
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 07:31:02 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5ac5376c4b2so349087eaf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712907058; x=1713511858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPVvWMAJiQ9bH1Vh3FBxv8RA77e8O4OnA04Edjj3+7c=;
        b=CH7B/YzCTnJGm+t3sJFG1DK2vD7Myalruj9M2urSX163AkPsQEFvdg8c1Sp9GTFHfb
         Rq5UY5B0Kt7Lt+dw06F7mbGA7H52QQ7YgqI333pGuaKEj9oIfBXUv86PZiaP7aKc//7U
         ZKSTDmHEuY8GeHz5kFXeD3aZ7S7hrvn2GgO4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712907058; x=1713511858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPVvWMAJiQ9bH1Vh3FBxv8RA77e8O4OnA04Edjj3+7c=;
        b=FsOtG6LnRjEX7Hit3vNc9PhSRRXk6Yxdj6xrb8PFKbbuhCwXBxp1nNpidL1iOnPhXF
         GywOqC3rQ+5Qi3XzC4uHwmT1Gi0E/Zn1W6Blk4nbQg/2Dv7MpJPlz0MJZM2PD12ajdxT
         lTIHEvhWjaRI3VH0wPvc9NIP0Lg8vZ5Qw+NWAhDz4mqUCozhuOSvtRw1+w1Q0oxipaA1
         mOzpUyEDB2c7JRk1+l5atVms0KPIJCREy05slhPn3wr7e2GGpBA9QLCedQ8ej6RuHvPE
         UCSbertYNHo72n0aEgsrwPalmrSsjy46Hz3kWythne19ibIXRNObxOLjFVGM95A/UlF7
         GqxA==
X-Forwarded-Encrypted: i=1; AJvYcCXhSXXxfBC4z3r2vTzcRORO5wWe6yrObCDOJVjGsLxBRuDEoBrcl2LVAn2QuKaoCd80AkTPwUnix2/iFCXYtOV+Z4wXafGgKufS3wGezAdy+nlG
X-Gm-Message-State: AOJu0Yxyw7TtU0UQEkcCCvGYpcX6JLArFKBNV7btMzZx2Xj424YtBq/J
	4zuHfEc1XqrKaqvoH3WtWUDQQHGJ/Eyb1cjub9Rd9QQ+8lX5CZ9jENd81izCAA==
X-Google-Smtp-Source: AGHT+IHbqeFZC+Q0e8Ic2lEtKsE2fsonI92D1nvKY+dlmohGFGapjLW9bPiT6QlzY3Dyk6ly/4CfLw==
X-Received: by 2002:a05:6358:6b0c:b0:186:431:d9d6 with SMTP id y12-20020a0563586b0c00b001860431d9d6mr1648558rwg.17.1712907057809;
        Fri, 12 Apr 2024 00:30:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e3c8:6e1:dcfa:3e8c])
        by smtp.gmail.com with ESMTPSA id d6-20020a637346000000b005d3bae243bbsm2149609pgn.4.2024.04.12.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 00:30:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S SDIO Bluetooth
Date: Fri, 12 Apr 2024 15:30:42 +0800
Message-ID: <20240412073046.1192744-2-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240412073046.1192744-1-wenst@chromium.org>
References: <20240412073046.1192744-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_003100_385021_1CF097D3 
X-CRM114-Status: GOOD (  20.99  )
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

The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
SDIO. WiFi and Bluetooth are separate SDIO functions within the chip.
While the Bluetooth SDIO function is fully discoverable, the chip has
a pin that can reset just the Bluetooth core, as opposed to the full
chip. This should be described in the device tree.

Add a device tree binding for the Bluetooth SDIO function of the MT7921S
specifically to document the reset line. This binding is based on the MMC
controller binding, which specifies one device node per SDIO function.

Cc: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand description and commit message to clearly state that WiFi and
  Bluetooth are separate SDIO functions, and that each function should
  be a separate device node, as specified by the MMC binding.
- Change 'additionalProperties' to 'unevaluatedProperties'
- Add missing separating new line
- s/ot/to/

Angelo's reviewed-by was not picked up due to the above changes.

Changes since v1:
- Reworded descriptions
- Moved binding maintainer section before description
- Added missing reference to bluetooth-controller.yaml
- Added missing GPIO header to example
---
 .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 55 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
new file mode 100644
index 000000000000..67ff7caad599
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-bluetooth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7921S Bluetooth
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+description:
+  MT7921S is an SDIO-attached dual-radio WiFi+Bluetooth Combo chip; each
+  function is its own SDIO function on a shared SDIO interface. The chip
+  has two dedicated reset lines, one for each function core.
+  This binding only covers the Bluetooth SDIO function, with one device
+  node describing only this SDIO function.
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7921s-bluetooth
+
+  reg:
+    const: 2
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      An active-low reset line for the Bluetooth core; on typical M.2
+      key E modules this is the W_DISABLE2# pin.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bluetooth@2 {
+            compatible = "mediatek,mt7921s-bluetooth";
+            reg = <2>;
+            reset-gpios = <&pio 8 GPIO_ACTIVE_LOW>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 88981d9f3958..218bc2a21207 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13818,6 +13818,7 @@ M:	Sean Wang <sean.wang@mediatek.com>
 L:	linux-bluetooth@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
 F:	Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
 F:	drivers/bluetooth/btmtkuart.c
 
-- 
2.44.0.683.g7961c838ac-goog


