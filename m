Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE981C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 05:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bEwwpPztKOpZdSo7WcUxDYJ/5pj6Ekde9GfAMib96bM=; b=Q1l1F+mS0P0A20q+xk2YvKuEw+
	1G61VmEStIRRoA2+QDIp5rS8qyMDxKtzQfuXMs8wuHfXWNaY1/7HMOZyoeNIMVHfo/1tdXqAyyUvh
	W6KvFWKeR6t+KKSeHUZ0tgeVrFP9ahLIchyCyRL5KIdnf8nWMOniTlVMzOclCxRX9rMimHSUqA75o
	6kxhBJS3h7O5AFFdB2zuLg8m+OmiaZgISpyKvOwFzur80ExY4LV5dX/xzjLlMVyHo/DJZR0yn9nC2
	/qWMdjRRWk3Ghiv4PlriXbc+f4ofpK7hpgEaIRzTu7qS/VVvxTKcQstfl+57b5eR3NAD4ZPcBkWMj
	dIBk/7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMhs0-00000009IG4-0yNE;
	Thu, 27 Jun 2024 05:40:32 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMhrr-00000009IE5-20BZ;
	Thu, 27 Jun 2024 05:40:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a6fe118805dso538090266b.3;
        Wed, 26 Jun 2024 22:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719466821; x=1720071621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEwwpPztKOpZdSo7WcUxDYJ/5pj6Ekde9GfAMib96bM=;
        b=V+QbzyqxPMRHbkw5LwxMTGQRWmrpBNhKFLiKrzUszglUlJwUS8nrudRQoEB2aYvtZ0
         DUHNi2K/xywdBK+R88g197nE9bedpTNhz3OfkSO779waqWDgwofJ5u5v9srt8hf8vMuk
         LQHD7QU5Lz9HlUaRZVhB3U/u+X0Y/NneYmAshhJi2uYg+46ru1zebLKwpmXRB14SFR84
         nUZK1UiqDQV1YDWgYTy1GUG+pfBTegwR7E0C2+NrfCdRQoMo2kRwxYqduqV4xWmyQI10
         jP0UkmOL1D4z6/i/nO2cP2r1LIbCHqb/bDj5B5xUs9uKowq3aNY8yL5PUk/ycODdJsdm
         HgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719466821; x=1720071621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEwwpPztKOpZdSo7WcUxDYJ/5pj6Ekde9GfAMib96bM=;
        b=prXfvb1oJtIHE4A49DM67YsT5t0bPC272ZXySdVq36ASIsozFCoTEotSbHCpp3oJX8
         HZRQwPEct7aSZC+8KTH04gB45W92mW47WOCXxPJN2aIoYt2YWxEzUyqP3bOpci/gRCgT
         +SwAbb4lXYr6ZGLAW3ESYVVWHGI60CWytwz+br6/z215lhOK9t9Uh/OFMsq1WOF5bUza
         rzrkd8URSuQFY/CxNB7n4DqMFi/Vad4p4xYifbDaIuSr/Ujs2B3Fv08N7lqFuwp18tll
         MCzhlfpTrdKfIQBHPSFJoblHuwPrASdooytJKdaW5XANVqldaSdr3gHJFW2z8xQej33R
         VSAA==
X-Forwarded-Encrypted: i=1; AJvYcCUCBpKq9dcjOgk9neIUDpXse1borx/n7T8DsOJgZLOwfoh201U4UDrD9CfPXQ3VI2HNiw7nLscjhia0RNQHJ66JnfiNHKdn9aDpU6l07YCZ4HINYeR8/LdMrm+OaUuTpmpqSena7MjwW6r/W9esrwG/ZlVR/ozP9Gk=
X-Gm-Message-State: AOJu0YwsrYzp3MJajNlwRY/oMRvMzI/2RZttkeiqudUJp2jOBTbgMgCk
	ISG4ji7RwuGzPx/xV8y4TBJGGG2J0xPbh7txanM+fVZukKPJwmDA
X-Google-Smtp-Source: AGHT+IGJTzzisCNs2LoZuqnirLLGTmklhBGyKduxLjCFQSvCSMCT112XldrpxNn1SEENYWOPqBn/SA==
X-Received: by 2002:a17:907:a644:b0:a72:7c0d:8fd6 with SMTP id a640c23a62f3a-a727c0d9072mr475288066b.2.1719466821170;
        Wed, 26 Jun 2024 22:40:21 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d778b6fsm24551066b.98.2024.06.26.22.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 22:40:20 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: net: bluetooth: convert MT7622 Bluetooth to the json-schema
Date: Thu, 27 Jun 2024 07:40:11 +0200
Message-Id: <20240627054011.26621-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_224023_553818_B95ABA54 
X-CRM114-Status: GOOD (  17.55  )
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

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bluetooth/mediatek,mt7622-bluetooth.yaml  | 61 +++++++++++++++++++
 .../bindings/net/mediatek-bluetooth.txt       | 36 -----------
 2 files changed, 61 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml
new file mode 100644
index 000000000000..cb8ff93c93eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7622-bluetooth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoC built-in Bluetooth
+
+description:
+  This device is a serial attached device to BTIF device and thus it must be a
+  child node of the serial node with BTIF. The dt-bindings details for BTIF
+  device can be known via Documentation/devicetree/bindings/serial/8250.yaml.
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt7622-bluetooth
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ref
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt7622-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt7622-power.h>
+
+    serial@1100c000 {
+        compatible = "mediatek,mt7622-btif", "mediatek,mtk-btif";
+        reg = <0 0x1100c000 0 0x1000>;
+        interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&pericfg CLK_PERI_BTIF_PD>;
+        clock-names = "main";
+        reg-shift = <2>;
+        reg-io-width = <4>;
+
+        bluetooth {
+            compatible = "mediatek,mt7622-bluetooth";
+            power-domains = <&scpsys MT7622_POWER_DOMAIN_WB>;
+            clocks = <&clk25m>;
+            clock-names = "ref";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
index 9ef5bacda8c1..988c72685cbf 100644
--- a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
@@ -1,39 +1,3 @@
-MediaTek SoC built-in Bluetooth Devices
-==================================
-
-This device is a serial attached device to BTIF device and thus it must be a
-child node of the serial node with BTIF. The dt-bindings details for BTIF
-device can be known via Documentation/devicetree/bindings/serial/8250.yaml.
-
-Required properties:
-
-- compatible:	Must be
-		  "mediatek,mt7622-bluetooth": for MT7622 SoC
-- clocks:	Should be the clock specifiers corresponding to the entry in
-		clock-names property.
-- clock-names:	Should contain "ref" entries.
-- power-domains: Phandle to the power domain that the device is part of
-
-Example:
-
-	btif: serial@1100c000 {
-		compatible = "mediatek,mt7622-btif",
-			     "mediatek,mtk-btif";
-		reg = <0 0x1100c000 0 0x1000>;
-		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&pericfg CLK_PERI_BTIF_PD>;
-		clock-names = "main";
-		reg-shift = <2>;
-		reg-io-width = <4>;
-
-		bluetooth {
-			compatible = "mediatek,mt7622-bluetooth";
-			power-domains = <&scpsys MT7622_POWER_DOMAIN_WB>;
-			clocks = <&clk25m>;
-			clock-names = "ref";
-		};
-	};
-
 MediaTek UART based Bluetooth Devices
 ==================================
 
-- 
2.35.3


