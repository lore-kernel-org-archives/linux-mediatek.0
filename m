Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB85C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=; b=TGT1jQ9BPKaCqswe+IGIFOy7mZ
	qC8KiA3ZbI3g5LEeHmwV+akeRQ3Fe0lxtJ/N0MInlOjUlTWmXVGWpuo/yQFDC348wiVhHS4vDYXON
	zTF/dZwDlV4S7h8f79JaRs6fAemMouVGqaadDhjJuOSEhbSAilH0kztFcb14KZpdOlj/zC3zD5qC0
	YBVKFqWx5XYXnnfTDiiJBIEcl3FLNaoXYzRMWwN1TNcwi8eS4t+03GgIJz3OtjcQxnFN5pty4GX+g
	lMF0uG/ISeQanbUjfEl2xzBGgmCR55LmVqmSIXC70xRdCfhzLJdBc9gX7/YIGyWJ4V6gtCuOEhnWS
	YMAFZMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQz-00000006WrU-0nm6;
	Tue, 15 Sep 2026 12:38:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQf-00000006WbL-2ehS
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:31 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso20666615e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475908; x=1790080708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=EUCxs+UVXpLU8kcKeZQlMOCZcxrO75ucQue1M+5e6MVUC7XKSNDirw5oNZyOwIlEB6
         uPCfpMxRKe4wc4xvw8CjmvazUG9bWCwzRSWcvQcyspaIQ508nr4pBc/OlEymN4DS+luM
         RQFfCGmptfv100ZkFmX8sT9jQaliJ/sHjPcV5eKMN9o4bOw1a3fkUj8xB3u6f8b9Mpgu
         +cU0+H0Xxg1NQ1845ub6mTbkW92C2CO5wQFb7npi0/k9RJAuvIPH5v1UFeje62rugDGj
         QFT4+u0/JKFEjFCQcAUA9E6+YZqktWed2JXqxhkAxUJ+ViestTy5siPBHbGWRM0EqTZz
         3qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475908; x=1790080708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=tLaT0AqDBOk0wsTXISub045gwmIV6NJE0NDENQ3C8lpt6/hGCmBnAt9s+U9EswZtVi
         U1/liCn5uwo++/CiF0+lzheNj7LzqrdUEnzZUn614ft+JA0l2NZPGpSLG0iFrC7PgxTs
         WuZH4aXDO/MfrbwLPUIDC/LNDIv8TQB0TpcBls5QT/2bsR01u3dcwYAwSzTZPCHbaZu5
         EALi/yi7P7Ye58PVTYHS0l0tuMaIKZhcvMrrh11mxQxk24ELJGi0rOC6sjdnzfF605ht
         3KRrma9FYCv9jcEvMEwgr75zyfVNjTTMcXyEBCQvDYCRvPGVsoYCeUgM2AQ0nKAjuFPs
         RL/A==
X-Forwarded-Encrypted: i=1; AKwUvByr3eU+gisKSQNpChL8eG9GMkGjJ5D27s4580PwUlDpKV5vF0I55E0R//ipQ8GbR0ufc2WHGnO+gIRVWr/eWg==@lists.infradead.org
X-Gm-Message-State: AFuF++lKuqfCk4VBoXGn6lefHFePLhNKJAzCyxkRr7Dd9XgAsaT/I12T
	LwFcAB/musE5OIr7Es3n0uARdm006wI+3AVY65M1H1b3sdGsXvhQvC0K
X-Gm-Gg: AYBFou2Bo4L8otsrrhTT2JsXXf1octmz87hEFd68BZGWqguNI/G0AKCbfRm121HJS9q
	9xtWlIq74/8uALZqIgj1Nuc+YU0Kqs6u4sjQPkR9R2lsr3p7DuNDzLY8r5eTtBRy1BQ9737i/RO
	NN1yptlloSO784OgN9GoDJZ9Xwk+UwCTfAYGcdkLdd0w4z0lEi4iZ3kHOvXjA86slD3rWi+pldH
	wXP7G58us9QETQi582BsrY75TA6wNql3bynlYSeL2WMLFYkJ/RLDhbZrYp6ZF5rQxq+azyrA/EI
	6234fGiwkH8WZ6qMRBbE2pTc2OC/apxoknRZemCPaksTSQzBDhRnTkfzEuj1gd4HC+XNRe69TjM
	ZUsLl0Cc4Cm77JCU4Cd1r3sg1zxfXO4O1mihd8o+ARyysVo03W9mPmAhzUIBYWlsiQDLefehlvg
	DmkJ4W+yCYPkGAmR/l5mGgVNhkj4yF9LUquY4zbyBmSeBsFMG/gwFQNTtSKWz4nLw398HLO1hbZ
	RC5KLL1VfEbofoi/LoSymkklTDpoHv+5LpL2nOUuUcYkfnhKYCzkri9u3iZc7DP+6VKJeUdzWY=
X-Received: by 2002:a05:600c:4e47:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e7a677cdbmr68143945e9.25.1789475907626;
        Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
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
Subject: [PATCH net-next v22 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 15 Sep 2026 14:37:59 +0200
Message-ID: <20260915123812.14747-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053829_935372_0CD0EF81 
X-CRM114-Status: GOOD (  15.68  )
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


