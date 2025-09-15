Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA140CAC597
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4UfTitWr0/SY0YFizPV9dalGTR12rbqo6S3iSVpAJc=; b=kmGU5MtWxXkQslBzabcl5napul
	Bav6UyGjHrQVAE8pttRwBIFHlc9CImCBl5SD7gDKVPA/Vvq+uivsijnl6ZEu6So3QZBdog+vEhvOh
	WF69zBF2F/DvrmQkbDLjp0SMHoHh6Vg1TfuAdWzsO9PWSrKMGpBjjp4DBsmPusMKKR72U0nnFuCag
	9IsguH9YYXFBN/lZhVvw0xDU4lWeBYhCpUtDxxlDyAgl581HUjp9LrJ2jYA923c/TxpfTQV6U3X/W
	C7JBBVHj1joYKkdE1aUgUXSmyiqxbFXZh/cw59RgMREE29wOW4KLF+lq3mFq6hbU+tbzIuFYOAkPc
	VaFd/cWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6ir-00000003l59-48Eo;
	Mon, 15 Sep 2025 10:46:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6ii-00000003kw5-1rNg
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Sep 2025 10:46:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso32927155e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Sep 2025 03:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757933162; x=1758537962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4UfTitWr0/SY0YFizPV9dalGTR12rbqo6S3iSVpAJc=;
        b=bfcgqfM7qb0Ny7IraCAVKUPf3U5HtDM0hnG06vpt2IQ5nL/rO86HJ8Iry1DHyj0Ob4
         gaqBLxi1uJ7gjWkCgRslGWpvqrcXqwD2fYMQDLFc3z/OGJ8Nk+M3o1iRvCzxwx/V81xD
         yRrHIhNYQNHtPVQ/I+6naJXG+fTTVc6g43JZwpDk0+h2p1Clq3CET26cQ+51v8ponylF
         qXHu+AuC+A2GkOa3+kqhq4fj5l/0tfxFdJYz03W9Jds1zu1UZw0DXZvwkqfmTJ+iQOMT
         41vOE/849/htAPGaKVFmKt9FpFkzTl3ykKvYnQUVGD2zk79gmdWNWljK4RmUjX8r+D+i
         qA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933162; x=1758537962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4UfTitWr0/SY0YFizPV9dalGTR12rbqo6S3iSVpAJc=;
        b=as5JlQfeIvdLGA8650TNE2hKvd2aqYpUam6zi9pN1Z62kwq1hxGJqZA2yE3+Ta72MF
         psqRl53pCtM26DXGEmyoXVTRcVd3WjSWhDM9oipjLGczXPlwHpWPPZyKioEbtG2L+5vJ
         iBnqAyhQJxMwDgCNlpp/TzzsSREKrCN1G8DEMW+bNmLq5zCeA/vTc/fDOkEFAcI3y5Ok
         wF+yF9PknLUD+J+n+InPS5kxX7RwnNKGEoIdN++CwcPU4FUX2RF/S4HLQdmRgCVBLP+B
         ydtSu1HGkfFK+mu5gLMbtmQcVAV4NuyuFO4lb4uNC6oFpfx1Mq6vdGMOvnjv9FCo82R3
         RJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRKggB9Lwl6aX6Emql0zw+S3cFKCEnf4/vBQn+4fCgTsDiHgxKIcRck6LZM/qfKBR5iRrP27j3EAFVczlOVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwysF1T2hm1BQwuqSq+De0D64IRbUJgkHkh3XimGAHvt8t187j9
	1ZBvxeKCd0WK1kRM2B9Iqtf3DHLDyP4sxvFp59DrwiB4Tl53u5NfnKxG
X-Gm-Gg: ASbGnctj0R/aA1IQWgkTJxi+sW7pa+Gpv+2UqzGQkuvUY98UpsPAl4AqUfWXXoF/+JM
	bsn7WMZp6g6ZNDBRAOvl99Qs36W4R4M/2mCLCf1MclJHGBzxFecBbhrrVg1oYKqGIavp5jMAu4E
	zZIDkZ8Ud2QIpGJxDsbapGb6pWl/kbXxvr3KGVVC2M8My73dx79Ys4/uRrmcmdwKVYlvCD/2dZO
	F2IDguTYQwNi2y+t85E9CtJAHWUKKaeeFe3n9zSpZ6HaxG1soXIFlXBv2jvv0pwecMnRlWcSOFc
	yS12sSTYy+AhnmcXg+ws//PJ5Ht8E80it+W5eFKzlg6oj/Uz/okv1b33bmB9u/ezua36f7mb62B
	fru5xR3T7dqf5cGtZY/jHpq52V10DDRlX7xGob35PIVRS4nUbmDXH1KCDvziSUD/aQZp/wEg=
X-Google-Smtp-Source: AGHT+IEXNZcoVd0GzgGmN5xy38B0YlKF6tMdJTyKwSotC55HsiTkVEoFjPfwlkbgqGZKHOIXVx84vA==
X-Received: by 2002:a05:600c:220f:b0:45d:d9ab:b86d with SMTP id 5b1f17b1804b1-45f211feea1mr95031475e9.31.1757933162216;
        Mon, 15 Sep 2025 03:46:02 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm67163365e9.0.2025.09.15.03.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:46:01 -0700 (PDT)
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
Subject: [net-next PATCH v18 3/8] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Mon, 15 Sep 2025 12:45:39 +0200
Message-ID: <20250915104545.1742-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915104545.1742-1-ansuelsmth@gmail.com>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_034604_628487_D95E4E8F 
X-CRM114-Status: GOOD (  13.96  )
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


