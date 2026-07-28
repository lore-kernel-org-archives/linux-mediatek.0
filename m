Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BFC54F4C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=; b=aIy3R2ytpNmCK0FjrdemOt1GjR
	tI8UhHmxwLn1X+KcjL555ASmn90nYwFn40CKq3KFj6h7nunYaCPYlXxL8yWViH0MkwDRi7jr/iU53
	yE8svF9zPpIpDae141ImXWyuV7BkcCSHlvSiz5IEodKc6EsjMwWdSlAiU8yNVNCfLqwYyBly+cHXI
	riXpgEVgxzZLx2DLSTNEUScHJNZJTDaGEqIug3OOZ1+A01TvH2AlwEzLjxhzSnOjqIZX0Lw15qIgL
	Ztp8/Q0WZC6NUGuLt1PFr/6+vpOMlnYa7APuX5FcnkoJQTAQNmJGwl/lLjTe/NxVVHA1XDZXUsLxG
	+ejicQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3O-00000005hdx-1UDW;
	Tue, 28 Jul 2026 15:49:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3K-00000005hZ6-0GQf
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 15:49:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so25135655e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253748; x=1785858548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=DREr1m3oIYUAlo33sMHA7X7N4OgB92FqA65GuKB32tyJXYuTgTUE5X1zTMHCYjvj63
         x0d0jqnP59GWN/VMIgXIzK5kOXUXTrBUHx7WeAEfrjXyMyHRP68uLJXK/2YtSGDXuTxb
         zhCaCoWb/pwVRrpNXHzNaLUJKZqCNGRiIde7XtfodzZnMf1LkYqUeblUK3yoGMDsEuPL
         Wk0ZDl3o/HD7DHF5W8y0wLesHQrPav9MaPnQ+J4VAlUEIIfqf6QAzBllUpoVQkFGCEEm
         6AxtNjqXH+Y2wVokYzrYSEt5sepEOsrzL+DT/4NKszYHuyyaJ32E1XK/vNJcgTj2/v9z
         Zsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253748; x=1785858548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=suK7ScTFXxHmxa79pR66E7DSkoJIgqua3r4sOMozAdZS6cUZzzA1WfCZ5remnZuIfr
         bXMT/rrqfSEhoOqyaq2R8g2Nhe4vTb90hc/gl0UrRGevwDRnwgqAdCsemG0f6G7EXb8S
         AsEzmJUeB17wCQePjTFt0b1SrBOP+VdOjKQMGTlW5j/EldDN87AP6zCZpA3xJrIUZHfS
         3CVMrztiPuEWClJRUcOIRJrEkeBF3TT9x9x9e1x0fTOxFRef6viOPGREtn2qy4sDzxmR
         2913utN7nwmb20dvxJw/8HbZS/C1v6XIyuHvOuVfvg4Or3/EFGfMFRseHbXlz7Gj75ID
         TJNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiNbKaFrcJDbVXNDmkRatP66jzThwRXY+81UjPnuHmyCwAVvW9uFfg/HWbTZbvvk6cw8LspjufuCK9fa+xuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YydWid8cIdk9HlVDk2dZfH8o5hRtFdVIqAfJD4rtB44P6PjVCKF
	wCOKMSHM3sWR3vWeQ/87CzRitVkDZ9oJVlApgmTw+Wy9iaIrtk3nEx+k
X-Gm-Gg: AR+sD124/dO90k+9YTAxst5M5QrW83U34Fr3kjWyLgiHCqdIpbjHh6d/xlXVvWbE/Fs
	RaqW/cU6QeHEUTqMELY2QoZbxpOQOV9b+Nm54j93RXT3gzJQbxOLh+Prpb3yYv02YNW/fULxljw
	dkz9qVkpbYf0JaAXYxu+DGk2KT35FXIFa4JKyWlqIRJMlJUt93L59rhVTJlYE8tKhIgINJhQLCm
	2fqhqFXIMsXT9YUOBtsWJNZjsXOALBgoyWMDjdpNs8EbAo2MEnj+nJGdt+jkCsW88R2L7RIYOPu
	Eyy1kqLqMqikBSWOr9o9ukwuny1oAqfsDqqyqZ35WZT97/soy38HiyUltcSX3UROJOb0SOHRw1H
	+fVgyzmViD+aAmDTBusGsdyKANG6NNT4paAnGEusoxgnHmCyJEfgU0aX1A7yeD3cxSWvXGITfwd
	pfxaoqfUAdLJhCt+rbeg==
X-Received: by 2002:a05:600c:3e18:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-496c6569058mr33783105e9.25.1785253747906;
        Tue, 28 Jul 2026 08:49:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:07 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v19 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 28 Jul 2026 17:48:29 +0200
Message-ID: <20260728154846.1828945-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084910_141214_48FE5B55 
X-CRM114-Status: GOOD (  15.37  )
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
2.53.0


