Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A23EC5CFC1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=; b=0v0Es8T+340Ugntjr7TS84niAO
	FkbLAAcAgs9XMzWh6Dg3k8ybPP7eWHdxcGf8PzUiGbZU/VGxzdy0jKfxg9eQ/u/5MBZb2BD9eUzh4
	sxM2r3HoCR0vd1j9r1FZUZZmz3NZhsL6L50m0iQqk4zrZiDdkOM12NAHCv5WuZSaUUJUGb10U34gi
	Tklp34oNTExdYlnt+JUcgI5R5sDAMYLfupSdz1n/NqAipOriJLO+l3V99UA/Mx3o6p/ph20jYGb/C
	sweE8d1zLpInZCmCV6FIu281Gt5LbtLkyRP0AAUUeqVKJVO087kSIYzroq/QyQXBS3O5rK85egTqg
	Phu9u3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaT-00000005eUX-1VeU;
	Mon, 17 Aug 2026 08:20:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaO-00000005eOx-0gYa
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 08:20:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso30396165e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 01:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954846; x=1787559646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=eRk8MT87b8Yl6Jc/sAO1ZKexTPvdElosOGEIzuzYRegpLr9Kq2ndHnY2Iopftr9oa+
         NpkspSQIs4FRMxkaSg/dkaLDoeHS8pU7ObKeSY3fbddJDfJxAi7zIFf6FTnsqYQOMlq6
         CAdHOsoMNLLGQWgUyg3V9pfm0u0BV31cBIBwogHq9pY1y+fVazvYpIPGKYokiisZ98Ak
         17mArBtPE0DoKPZR4bu8+nfz7DlTtDYunLyU66ERvZKUKWwlZ+fMUv7b5NTtIvDkgVh1
         1Q2miItxp4Umnmdj5VqfViSUqi8X2S9Uf0he3gnTtFPvkA8637Pki7+WLpd/G54YpNtU
         zP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954846; x=1787559646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=p5cp6jchS4QK3pbWmMyDDb2WVhuEbfFv7xyvMsVVdO5ecdxVfWO8TUV2Iwhj9klac6
         XMrsr2HhHW4055MZrJGuPpdih8Mg8ynbs2gSqiPnoxu7lV3Ko8SzE6J8oQtNqP9qF9Y+
         hf+sjS2MxF1eapLP3arK2t3e6mIlnp4HW94aDEZQInjKkhb7gbtMpOm2uqprUUxijFv0
         BbPbfs4RA+iA7acEXBY5pztsjB5gu3WJ8NQYa07mWQxnL6mxpYuJ5eThDiJzLOJqfycH
         QflLlKB3JmddSO0AhZ2QkltMABxJTrcxvah8grg+4gKICmBKhqrPaDJBlCwRBVOs+/h8
         bVjA==
X-Forwarded-Encrypted: i=1; AHgh+RrSpIe2ZdgbUJdcb/2tnbT7YCLccTP0HTwhRtk7XO/aDws6KzofzYh9g506gNQh01gAzEKCntHBeZizkL24DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUGwH+1//EXGCnLTrwyqTa92dSC8j8MGtfp6wxnhbmGTDfXOFU
	4H1AAWJpLb0k3tBFGZl+8tJQeCnnuyiof5CGgG+L3NQKDlzfPbdYFAWm
X-Gm-Gg: AR+sD102IxqXKJBgmfRR9x06UsrOGmANbFZ7l8QlRl7j72+cDE3/vtaGoVZAMsUDquU
	ee4XMenZwsXn6Pwdqbq2mo24t4t/QPuRvLX6RIr9uN0TXp/AAVcFroAuo18p49t24Ln9WTOGwf6
	d3hgscuV3XXPRyDs5yC4Np5V6qsiH/ocQpVEUGz3s2Uz/DX0kjn0rJ6VO6vuaxGcnKJnmjNA9Wh
	MLepaPAvWi9i6u0EPlsW3msh0VMnu9HHb3nZhtXk2t0xBvuRH9qP8jNTnzXaTUdx+ZCExOxv3AJ
	RVl6Q3PhBEnFd0Bk4xMQXEWgf6pCkvQMnUk2jqxfOpOfs9Hcfiy2V7gXzCbjg9xjb02FOf55g5w
	dHQRAIGkIfkPiv73fUOr5W7K7R1HitEQGGTKA8N1kfM9d2HzHaJ9xQT2vkr4LuY5nrlqInYmR6g
	M6eLvk9R9UClCDk1WDmFYIoaTTP0Wr+vVXPGQmIUFwzTtxbBEFa0DqKn367vdWnvwgteV/ABF/6
	ssOQi5E4vojAAYiv1tOQ/IVw0ny8FduwPEzgVLJdyrIphtDTD48Q27m
X-Received: by 2002:a7b:c5ce:0:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499879bb9e5mr253882715e9.19.1786954846434;
        Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
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
Subject: [PATCH net-next v20 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 17 Aug 2026 10:20:23 +0200
Message-ID: <20260817082034.20326-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012048_249898_58FA21DD 
X-CRM114-Status: GOOD (  15.00  )
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


