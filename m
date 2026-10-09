Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C26CA601E
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=; b=NcaMdje1fOn7FEiSuzTjOCvjqC
	iN9uFIe15jR5Lszk3I01FtH8f3MaEQQRuhzJyXFV1L3J/Svk+4HMxmnGe/qcMHH38mMWZ+2Gw+SOm
	hm7Jn1OcZCejgCbFbL7vPysFQ7ijhzaeCv/lefXD58eEB2OgE1N9eqr9Ji7Tp0/UZ6tq3MZEoG0F5
	oetBwyAleUetXv4v74eo/kqA3s8GP9U2RStkFk5LSSoaspUMpYyww203SvE4/ehHGxJ35mmS7JhCh
	YFy7zhRRtq5g+vVr/4mMZ7tT+908RoR8Q/CApFL5cwe9MUyXirasERhP5aqL5jMfktj5EkxlwGY2C
	aoJEYKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBs-00000006cSG-2NN2;
	Fri, 09 Oct 2026 16:11:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBn-00000006cND-3lpC
	for linux-mediatek@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=; b=FqvkZTxDej7Sb2TALyo7TQFfA3
	ALISoulVjsB+12xYCSeZh8lOTw8v3XsXWRLTqID4QAwWIVxcSCMy4NOqe9vzk/ruVMxdQ+T64svIP
	d8mwoeFIlBZt03xSyUNxKSAG/w15Lt9NEYnrSEnxjPABMelvBQWXonPPIIEnPNdEdua4dGgCGaCMh
	+AlHjG/kAPBe7uIYAVg0HKPckUXD/Z9sSvW+4b0m6eis6OD+MTzmxVOOKTg64U1FebCSPtv82Z14d
	1Fw3uHAFar2uVwhtqr9QZCiB6mGdcJngOwovsAORaY2bgkPvguPj0LT1ycuJTpw2c1ICa3VBkxoI6
	SjnxVjPQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDBk-0000000BOkA-3da1
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48afe75f055so5935258f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562275; x=1792167075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=MFjPsqeUJpzCkq3qtX2AlSDnyvEzTf0fozk/L7K+uwfktc7DHl/17fF/1/DB4ZF2v5
         rOYpf06x/9e7F2uYQZMt5m8IQTlen50yjeta3sQqvXHJgEVvbfeQm2pzJRM6pG/pctoN
         kFDdDO2aTqrWIhYabz2nq8FibZ6JZEFrnh/rccsw2N2HmTIYPEEivWiR+5r56ih288lN
         jsLRBmGm1AW3R5ptzuB4c0/oeMJWNITZyU5xLvlsxCMavv6NV+hFcWpuoYSV+fm7X2RP
         agrz0nEbh7RXn6aH7f4xy3+/nbYhjqdd7s308VEXFEDTjxh5CttG65CHbVxVlo8S5jZT
         vMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562275; x=1792167075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=RkHA+loIz4YchPnKk4iMeWIsNiImEPFuDoYipSP7fuAGpY3719LOJtYRv5GsnmfK55
         np5e5RqOCbuxeGLnGtCcFE5NN22JpDb2I1SVuE7zVXX2dWNtw4H8HUnWhJxwUR5Bu4sK
         aiBIfnFVGj/9unD3V3nZ8geajbHnolb2WhpqHpWYV48l0Ew4iw7pG6Y8/He/5s8c0uN5
         OryO21iXORVd65rU8QwZlnpahwylDIEf45h/hhIqeiNqGGZ4dY6O4/xlNNy2XK6q4VZW
         9Er03TFcyaAjra+8mGtaLmMdFuYa4cFXysTcVML5ogy1UEwj3xtjeG2HGdsTUCBEA2Bn
         c6Bg==
X-Forwarded-Encrypted: i=1; AKwUvByhrVh7MVFOWflYPFpv+3hufwtyvL2f3wmY9AFNIVvG8qOb84iF2ZlNbk5auXQyjDRsCXcaAV/KIPzcOrStSQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mzPSqr1YZeQbkG5vWNsrnF2d5yhP2sgZgfcNFBuLZaEWKk6hPT
	doOFXXaLre4/w5PJqzIlZfbbm6SElxJOFxOQD0vXXFg5qz8NxCRHRWAy
X-Gm-Gg: AYBFou1gqEdVdgdhh/riFhmhzHkIbhax2Ss/RbpDCTnvwCXfJt3yiO032h+lKp0Th55
	WQDq+pmVO9m/SPZGeI88/Tz0JekWdlWdr0Xde7XzmtaL9nmOPYH1d1GkjyT9wDRIRg01gRZDU0m
	P+uAar8l3yhsWDB85jrqLLXYqLG4yndJCutRGlgq5c48uPHp2SjJaVj61FB8I7ry3X0+8R1AH0+
	24rvXNl5JhWBRSiAaCy+YL+2vuhSzB5HcCiCM0lVYFtwedXLpvbYYwQ2C/g2zARTJPjYfkt0lHu
	woDPc/GvJSrMnyP5c79lvbJzEPYVNBSmxsx+3wY5s5YwUduYIaujMkp9jBayjfp9V9COQbBdljG
	dvNP1dXITrCzG3LhB9b3OKCiz6zxpYrwUC4djw00+pnkR6i2dC7zRlgAWNXMs5W29McfWV2Pt0l
	IgyxyhnOesiLOTpZkRw0kUcVwUFxA8XjbH4YEORbd5mylEWvQqkiZNlygfY0PiEUNwqkJkWx4nJ
	zHW4elf97LxbfBonk4xanopKCcTLpjaU4ZCH1D/fjT3uCprmFLamTNNkS3qH11eLMA6tuCV/ALJ
	8SXve3TryLBY9gtEzQ==
X-Received: by 2002:a05:600c:37cc:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a18e44396cmr51955465e9.2.1791562274820;
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Fri,  9 Oct 2026 18:10:47 +0200
Message-ID: <20261009161102.38961-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_171117_140976_D52B01EF 
X-CRM114-Status: GOOD (  16.73  )
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0


