Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B448D15D9A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KDWJEWLZJ1CVUWk2MFAM/b9RaQi8+CWSryFDS8nn9c=; b=KViwAefzu/CKVILIykHNpf1GYl
	3KFeh0ygCBPduXCVTnVdB53pux2dd3zfa34uf46Rap6vQs+qWtvRzOzfCc5+qw4RcaE/gffVSuqAJ
	TzcGvQOvKFSpmyF+i7KVrO4urG9QOYdny18jbl0D/qSorLSSlo4LKAMMXrvva4SXnKv4AN9fjPVe1
	tgKNCz5AwjMWGCj0ylg3O8bSHcuqwQvAxdhoi5SyJ6evSHAlHzOSj7Dj5T5CYQHYgHnF1J9paeeKp
	Kz92qw7nccyqfZiyvHmfF3x2WGGLMHIttjSsApWO0wnhHXy0KZjSxVqTHf60MbifN7Vs+CsbWRfuV
	hZLZpO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tBy-00000007aMx-0iyV;
	Mon, 21 Oct 2024 14:15:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s3Y-00000007MAo-15Y1;
	Mon, 21 Oct 2024 13:02:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43159c9f617so42056345e9.2;
        Mon, 21 Oct 2024 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729515762; x=1730120562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KDWJEWLZJ1CVUWk2MFAM/b9RaQi8+CWSryFDS8nn9c=;
        b=O76JlzDNwDXynez92wLlOyq5MMTYR8tI3t+sqL9qvZJPPYHZdakJNJ+QaIMbcZzvjP
         Ugs0f/f/ijwyLMdGFunFTMXO72tyotaKEWpOqeRonE3uznf6X04bv56gMteL2UB97XgB
         qTV6OGAL2CDrjXhwQLp3TONBKe508xFGBVP6q4ewN6cnMTHDp7M9Z2dx+vi648hNZH17
         q4zYEv7ELaFaBQQGR5CQAKLl4NZX7bKBcKT3oWtcUCIunjbCwHBM7p65zanmVkqrYlsP
         UJ874hByOoKeBu8ZziXD73oitZzf3whzi/e+yx0uupsLNijjgS9udkLm/Ck+8I7MDpFZ
         0pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515762; x=1730120562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KDWJEWLZJ1CVUWk2MFAM/b9RaQi8+CWSryFDS8nn9c=;
        b=WBftGJkKhWcfDWrQSK9/e0CUa7+tLBuS0OmfwB7mdjUnOdPJZhUx2mrecvuCH/I+Bw
         yLLjTy0U3lA7wXGbpcZ+4u8H+O8tiH1SzH12yFPPsmPU4DqcU6jI3OlYsAEei4Ldey3f
         N2Yz4CReqMm/WpavTkc1k9CNdqikBV+UhrB+FBzsjlMJg+74TgUzykY8UgKb7ArhDnhB
         R73nDXnhsF1v8lbswMYTyLkv2u4j8HU4TaI8zy5CNiT1Lp2zfEYzgjN8KLVFDt4ZcjvK
         1lX/MJhfK1LlGBzpyX7SvPs99gxq04fYISNUifTLbZiGcdS5nsNuX3mE34u62R+xPHsm
         sWuw==
X-Forwarded-Encrypted: i=1; AJvYcCVaMTrn23pozloa1O+NpwjjVZGmq+NI85F3cCO+H3/kOWNR8wjXkeIIWdC1tQHmO4N/h4g5R88vxuax0YoQ+Eo=@lists.infradead.org, AJvYcCVd13EBP2HsxMPuBGZ2bkAeG1pjOC58WTYYOlu9EHB2xwcgyfYV1f39ZBj73NPX3St1jfnR065xb8yNOte10dMx@lists.infradead.org
X-Gm-Message-State: AOJu0YzscJhWo4/wta9NW0hg1M7uY1n0QJSXuld796T8gXc0MV/1VZJw
	rwnsRd/RitTeUR3pqNfcOkKe3mZkmZXEOYA/rqCVdO44FsQDB7qJ
X-Google-Smtp-Source: AGHT+IGF2Q2tTuZQbVSZqD8BAKwHRLUIubueT3PHeLHDrHhpON7G/eioiMlOqDAAeIRrgx6VjgRikg==
X-Received: by 2002:a5d:5004:0:b0:374:c640:8596 with SMTP id ffacd0b85a97d-37eab7263b0mr6449258f8f.32.1729515761255;
        Mon, 21 Oct 2024 06:02:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bcfdsm4295329f8f.103.2024.10.21.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:02:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next RFC PATCH 2/4] dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
Date: Mon, 21 Oct 2024 15:01:57 +0200
Message-ID: <20241021130209.15660-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021130209.15660-1-ansuelsmth@gmail.com>
References: <20241021130209.15660-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_060244_340921_9B2C9634 
X-CRM114-Status: GOOD (  18.86  )
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

Add Airoha AN8855 5 port Gigabit Switch documentation.

The switch node requires an additional mdio node to describe each internal
PHY relative offset as the PHY address for the switch match the one for
the PHY ports. On top of internal PHY address, the switch base PHY address
is added.

Also the switch base PHY address can be configured and changed after the
first initialization. On reset, the switch PHY address is ALWAYS 1.
This can be configured with the use of "airoha,base_smi_address".

Calibration values might be stored in switch EFUSE and internal PHY
might need to be calibrated, in such case, airoha,ext_surge needs to be
enabled.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/dsa/airoha,an8855.yaml       | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
new file mode 100644
index 000000000000..861c47df5bde
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  The switch node requires an additional mdio node to describe each internal
+  PHY relative offset as the PHY address for the switch match the one for
+  the PHY ports. On top of internal PHY address, the switch base PHY address
+  is added.
+
+  Also the switch base PHY address can be configured and changed after the
+  first initialization. On reset, the switch PHY address is ALWAYS 1.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      GPIO to be used to reset the whole device
+    maxItems: 1
+
+  airoha,base_smi_address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Configure and change the base switch PHY address to a new address on
+      the bus.
+      On reset, the switch PHY address is ALWAYS 1.
+    default: 1
+    maximum: 31
+
+  airoha,ext_surge:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Calibrate the internal PHY with the calibration values stored in EFUSE
+      for the r50Ohm values.
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+    description: Define the relative address of the internal PHY for each port.
+      Each reg for the PHY is relative to the switch base PHY address.
+
+$ref: dsa.yaml#
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
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        switch@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+            reset-gpios = <&pio 39 0>;
+
+            airoha,ext_surge;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    label = "lan1";
+                    phy-mode = "internal";
+                    phy-handle = <&internal_phy0>;
+                };
+
+                port@1 {
+                    reg = <1>;
+                    label = "lan2";
+                    phy-mode = "internal";
+                    phy-handle = <&internal_phy1>;
+                };
+
+                port@2 {
+                    reg = <2>;
+                    label = "lan3";
+                    phy-mode = "internal";
+                    phy-handle = <&internal_phy2>;
+                };
+
+                port@3 {
+                    reg = <3>;
+                    label = "lan4";
+                    phy-mode = "internal";
+                    phy-handle = <&internal_phy3>;
+                };
+
+                port@5 {
+                    reg = <5>;
+                    label = "cpu";
+                    ethernet = <&gmac0>;
+                    phy-mode = "2500base-x";
+
+                    fixed-link {
+                        speed = <2500>;
+                        full-duplex;
+                        pause;
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy0: phy@0 {
+                    reg = <0>;
+                };
+
+                internal_phy1: phy@1 {
+                    reg = <1>;
+                };
+
+                internal_phy2: phy@2 {
+                    reg = <2>;
+                };
+
+                internal_phy3: phy@3 {
+                    reg = <3>;
+                };
+            };
+        };
+    };
-- 
2.45.2


