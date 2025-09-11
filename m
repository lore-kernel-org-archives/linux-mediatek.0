Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9B6CAC58E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkqcfK5g5kwyolRjxk9xPF6Gs0633C5dadI10Wc7gbM=; b=xIjliRwGL+q3nYcPN8sNg0eLwS
	xwthYxgYVBQEUYoltCBpRWVpa+tm1G6AxPqYnis9w0rkF200SioJyo7gTs91ZX7Sw5NRZPZ1sW0CB
	Uu9e5OHvGZMjC8V0rVzcQFONNrb/H/0W8WRbyNo6d3r6vBvoAGlpOv3qrBIzSV6JKD8tPMDLfcD3/
	Dcqh5sP5fW3A89ka7YYolpdZ9tYE+aDK6Kt2MPHeAvgXG+lkMRPkTyX4g9GcxFkSLvgL1rczvGdPa
	weYABHrf8nC7IaILaamJiSrKjnEJhzR+w6Xt7jaJuQa6sEjJn4I0G6eIj2XbNMH+pcxAhkFjy4QO5
	XCXa+TqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhX4-00000003Hgk-36c8;
	Thu, 11 Sep 2025 13:40:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhX2-00000003Hdn-1ONf
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Sep 2025 13:40:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso8592235e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Sep 2025 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598010; x=1758202810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkqcfK5g5kwyolRjxk9xPF6Gs0633C5dadI10Wc7gbM=;
        b=XYiHsaVi7PxSzLbVo7ID43um1fkobfuMGhe3Q4U6SXeoE3yzg69eehBBUcS0I2+vIR
         Mt8gHQtANj7NUdGpTtR0A2nEc13r2F489uApnhHYDldTkyVqRzW8UyJU/pmNz89eTD/T
         esH49ENPVu4dkK2pCaAc1t/I1o8VKTcolE9zVPggb4c95Z+zX9q04Pi/DCTvvwdcUSRD
         zXNZM1vi1wpc3WNRnbMbOypE9JaEm8jncsBrR1iF27LZlfhwel+I4VMzuNmh6NzJ5jrM
         3OamMJUdPHpZw0CVDZgDci7+WWV6zfL3eROgMsWbvdeMweppp+pF64PF96k867TlH0fQ
         ppEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598010; x=1758202810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkqcfK5g5kwyolRjxk9xPF6Gs0633C5dadI10Wc7gbM=;
        b=oEKsdFc8IFPBB2nVNFeT2TAir0KdYqJwRSW2XHSu/BvLr999dQnQpkbDftxru4isPP
         73YBjhsatHtuBZl+BIM8yTyOGdF3/57aFlROBJ/midAhQaY3vlwOoDkoy5JBkkECOgD4
         iJd7E2/BIe/nqcYrH7I5n7WHad89O0+0xY+cs5OucII0ivhPdPlqQkSPrQQ96QNerOyQ
         82DMptvTWoxl5i7oZ4R4qJu/jnGBti8kpuX0TWVpJtAE8rC0VJ9H+jvArDwHo7kHmgGK
         TwIe/IB5hRWUbg/Vd4ixJga0jkbAOFJL2/XVnp6Ta5RsC/JAPREoCPMEV5LpPMs9xIlV
         esXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaP6u/AEI982RxU9hKOBMV/0ozIPuKhIz1dpxLXmJUEqHcLWF0bnM6sSfrgSF1F2RmMC75I0atrGDKO8HENA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy36IuHpuwHgRddXb1EfH6FY1k865t+5fsTsSctpjifjkuCTwpV
	JEEsxkCLruoXWDbEhbqp1fyaOLW3WQSjDCJQ0b01QvDwxE5qvMQiycs9
X-Gm-Gg: ASbGncuhACtntjVO33KftVpojn3qwVMswSHP6gQIIpKkYsKp6AKalZcEzgL3JgTbZU8
	lWp/zDP5jlgXoqFJCCxgg3HVvWz37dniX4su7hrtLheJLArjFl1PID7DaS57sygXopgb2eKMJKO
	ZFZjQnPcj2OMM4WrMfLJbOFi98m3ThIe5nqFanOcj+g43tF9//aKrdpc/Knj0vzzGWYT28r882q
	B49xFnZ94eQGnsNPS9QNFIm2QglQQDuHL9jkXG56Xx5msF0jr1f480Rgn1iar0lAbWASkSe2Nou
	NFGTrnfOvXzCeSDi7iRTApoAzbIS/fiwjQtrnkVIlfktZVoZDcqNRguVUa3gZcDmXkAxDkefLBP
	KOSOWmG7U0eoIZJc7N/wp/69e7bgRMdSz808Xdx5sKQXSPZNHxaUzMdXN4loA3y+ALgJbC6w=
X-Google-Smtp-Source: AGHT+IEurhbsxyz+hG1AOEJ6v7+ZpKbOZsA3ll2VFQ+7hS7XM1WK7VBJbXT7MuYmuykPNpdXEUZ/yw==
X-Received: by 2002:a05:600c:5249:b0:45d:e285:c4c6 with SMTP id 5b1f17b1804b1-45de3c551f3mr150961565e9.37.1757598009703;
        Thu, 11 Sep 2025 06:40:09 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037d741asm23413475e9.23.2025.09.11.06.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:40:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v17 3/8] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Thu, 11 Sep 2025 15:39:18 +0200
Message-ID: <20250911133929.30874-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911133929.30874-1-ansuelsmth@gmail.com>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064012_411647_92AA3141 
X-CRM114-Status: GOOD (  13.70  )
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..647d6d4c4c6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 0>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.51.0

base-commit: 04b74f665961599e807b24af28099a29d691b18c


