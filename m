Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52536C48260
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7JPZ3FlmXtrPMvqbv7p+KV2yBKsdrHhwCB9rIMVdmU=; b=22ghMl4gfVdgODbjZZJC5HCr4p
	kHomwTvUVt4vxj7OAyz0QxjRi36g3RGcjDV0pE60wA9n2BSA67BGqWyKStJCHanslMUE7ooyMw6ko
	dQukaoVLFa15/z5/hYNwhL/2YdOAanFPzM1xNvnq/S9+MLEKpWgZboE1Bnw9z10Ix/kKWidipOgcL
	T/znVtqgdszVE6EtsiIxtzN1FLhLAXTp0wk6fLS0UcQDT68toi5ravc2BctbUbKHfR15n1CZy25SI
	RDS+kVEKwnHAy51fH4Hi0mbPk+fJSkep01Yi76EYZN72BPdpSQowoPt/PV/Qny8FUZpa9HG7Yt7xP
	INyaOi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwQ3-007fNn-2J;
	Thu, 25 Jan 2024 09:53:12 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwPp-007fIC-2a
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 09:52:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso4670818b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 01:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706176376; x=1706781176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7JPZ3FlmXtrPMvqbv7p+KV2yBKsdrHhwCB9rIMVdmU=;
        b=VM/lo2vHMQeUdhPOskOvc7TA8RzQknuzwUc8+mzHuHWCKAC0YM4EWyhrgcfT6xwesk
         CFuhrGH9V9ZjQXkBJv/cae10vtaDpKzH4ubeuK4us4ABq5Ce+2JlIX/BCLKi8xglQswM
         /40JWB6NaDQ+Yk4ydR+oQqQbed8bg6yg3pe3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706176376; x=1706781176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7JPZ3FlmXtrPMvqbv7p+KV2yBKsdrHhwCB9rIMVdmU=;
        b=ABQrSsoQ0I5VwDt0Lq0bcH/RErWV5fHeC5aFyjFacEf12rEEy1eUZCYpkn4p2Zc0VB
         teM7/VTQLHoPunxjjFGfuw7t94Xbxb7iAS+Wntg+ugjU+ClPh12yWSfnFZQKpe0IAP9Z
         pYH2l8tRB4dSQ5utQ0bloCXGju/DLoqeHO/KDPo0Fs+VPVnBJFaYO5YJ5Rv+np3rrYdX
         yisPG0Jd6xqHZ5UTUjNWleL0DbnCluqJmsLyr8zBQDbSVkZUpiENp6cFxOKpl76t7TI+
         OK4uCwwZogcl/VbiMY2T1vDYaAl1+FAtsqZ8u79MDUnDlmuMPus7umn9qwtiRXyHM+DR
         xzQA==
X-Gm-Message-State: AOJu0YyP0LHN/PKj5zeXrsQ38lF8cfRNnWbhCzpZxIRZfH0VeevHoFSv
	pzr21q4Oe+7wSCkZ6HQWVtr3Jk54HDDqIyBBDHVrY9yggVoufMhzLidZQ6I2CA==
X-Google-Smtp-Source: AGHT+IEetX9gohXpDSKXt8dCp+m9IbL4e2u1dfNizaAo86YunKve6EwV6wkGQJbqZzkz7JS3K+JigQ==
X-Received: by 2002:a62:c702:0:b0:6db:d17a:e3ca with SMTP id w2-20020a62c702000000b006dbd17ae3camr283889pfg.63.1706176376292;
        Thu, 25 Jan 2024 01:52:56 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7fb6:ed02:1c59:9f9c])
        by smtp.gmail.com with ESMTPSA id gu15-20020a056a004e4f00b006dd8a4bbbc7sm3228275pfb.101.2024.01.25.01.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:52:55 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S SDIO Bluetooth
Date: Thu, 25 Jan 2024 17:52:37 +0800
Message-ID: <20240125095240.2308340-2-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125095240.2308340-1-wenst@chromium.org>
References: <20240125095240.2308340-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_015257_847066_C61954BE 
X-CRM114-Status: GOOD (  19.27  )
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
SDIO. While the Bluetooth function is fully discoverable, the chip
has a pin that can reset just the Bluetooth side, as opposed to the
full chip. This needs to be described in the device tree.

Add a device tree binding for MT7921S Bluetooth over SDIO specifically
ot document the reset line.

Cc: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 49 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
new file mode 100644
index 000000000000..bbe240e7cc40
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-bluetooth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7921S Bluetooth
+
+description:
+  This binding describes the Bluetooth side of the SDIO-attached MT7921S
+  WiFi+Bluetooth combo chips. These chips are dual-radio chips supporting
+  WiFi and Bluetooth. Bluetooth works over SDIO just like WiFi. Bluetooth
+  has its own reset line, separate from WiFi, which can be used to reset
+  the Bluetooth core.
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7921s-bluetooth
+  reg:
+    const: 2
+
+  reset-gpios:
+    maxItems: 1
+    description: A GPIO line connected to the Bluetooth subsystem reset line.
+      Typically the W_DISABLE2# pin on M.2 E-key modules. If present this
+      shall be flagged as active low.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
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
index b64a64ca7916..662957146852 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13657,6 +13657,7 @@ M:	Sean Wang <sean.wang@mediatek.com>
 L:	linux-bluetooth@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
 F:	Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
 F:	drivers/bluetooth/btmtkuart.c
 
-- 
2.43.0.429.g432eaa2c6b-goog


