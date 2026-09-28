Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6B7CA5FA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 19:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=; b=lXQSsNU44x8oh8ZwjZleyRvzqg
	Ntftr3EZC5HuY7JAK4MzyrYezkG3WXIS5MGzxVAY6HHnayLJ4jlkZYleb/+sUjHON/lruZyhGx79W
	mAVySn2da3XxN/h+7BtS5AYf8wGGmF4RpiRmAItCKkc0NEzBxg1oYWdd9fReIU/HGiIzduESZaUQU
	6VoeoUOwuyo33paphKOVfx+o+3Pq8tZ/iSRY4z2+pVs7nvFY7wamajjVjXWvUjE2+3ULlB3anzN3/
	n4K9/fAtza4r1qkfj7OoO3bUVhvKNL3pzCtPwHt8a56UT0vQRICTiJyp54calBoaJfNGgPGUBj+aJ
	RBvx4Z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHId-00000001UVF-07Pq;
	Mon, 28 Sep 2026 19:46:07 +0000
Received: from mail-wr2-x26.google.com ([2a00:1450:4864:30::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIV-00000001UOh-12in
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 19:46:00 +0000
Received: by mail-wr2-x26.google.com with SMTP id ffacd0b85a97d-4843f22dc83so2927671f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 12:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624757; x=1791229557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=tHMixuvwjhiqeWGP+fFi4nCzZX1K5ZueEDqK9UlJ7yaKgSzFx1LiGfmYZEw7SQnXq/
         c/BlOOBGtifNwPIv/dA1QcNE/34Gqg08evHNqsLfR948kYlU9HopqdkDsuSA/M8h/c5U
         E08AmM7gDpfRkcwS8ytHxrWYRKbuZzTVPsYI9YNfdUXJNRlfM530hivdANeamMiYMD/M
         Pi9B/RaV4jryQvwanQFIffx/W6+jfmpw/OmO1utr4/pK7DO8gyupZpiQoBl87DowqYcz
         4kjc7ctIi0lr/+tcixSvdLyUbBUYQCgtk49JXkOUd8Eud9V20inKirtvozw29THBHIjj
         3iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624757; x=1791229557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=M5Mjx/vA2ANpo6rAZFGWfajxrE1UGi3Y7Mw9wqHkBgOHTSyVqA4kqrlwIAwRFx2nlE
         oh5g3SH7yowliztPpvCCCowXJ5OJ1s4/QqVpvCO4nNOttgCJoiIuWPJknVbO6AsX2v1e
         eVy3Ti+x4OTLwuc//PtXguoLO3n+aI5KmRLghRtFzQ0dl8qb5bzdQPBAmVOBMLm1MZ0J
         s9q3bp/4KpaRrshLYrvUMob11VPw9iaVCO+Oc3WxILaE1J+0G0FBufmzwTB7d8URN0y0
         B0MrCLVeeOTbDfp7urbHFFBcH/lYph5z+ZXMjC3BxZqXah5ec+puqHyhoXn+otF+2jIT
         9lTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOytohMKQsYvOuFs9t6fgNnSkLvTkA669M2UNw/Ia5Q+IuHoJ1lSllkWgJsClF4L5XnjpRVi4Uy41rHSINdg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJoTkcDshhr8ceA97whFrujbKTMqm0uNZcwLSXLHuK1JWjdjrE5
	dD/vSP1cRqpZ5asVS5kBKG/4zWMG4EMo/t2jP/KXsotYLJ8pYeMQKvGA
X-Gm-Gg: AYBFou3m2oDdWiStQUYj5OrH585Gwz6yygLi3RLIFOGKUEZdVhZjHox4LQg9KqY4Nt9
	ASHr5V1fOuppSSu1csb7JhcAcNRYC+tzAXyKBDfEI9+dTBVvY6TyWlyMss7F0Hq5dE+Lv/uSG5S
	lkJD+zcLrS1dUeQ0aKMb2d11sRl0QhUSUvMR66FaxBn3ESKx2VhMe0JDzB9qiN3SmxcVGAlEh4c
	2K7N++eQJKCNORMCWb//UeYhL1mB9Rcwmq0MkwmM1dkPYxpbDiCdRDQ7AjuqxFNdP6pFtPatuWJ
	ChnB9t+jhrybrqXVJm29Hc4xbPslUsICzzhARs1/LpS68+4iE6XrSd5JNUcpLAIjL9FUEsRU9DM
	khaWxMJ+QaKHsH4jUJLpvThjgNhA9NJgoBQZ3c3W+3LzQs6D7lMxd+HBBFPK65pAvv4wE49yK/N
	LOWQV8I9NY7/MnZvVs3pa6Y6VkFswxG7OMOSKW5B/jUpm9C9Vn7tzeHsI9K0LTHIjT9KPgrAFP8
	Cz2uE1bkMfJqViYkrZT4bYmGLWacqWptiPUP0KuyW/LTeWXy/Cd9cflEypqD3aA
X-Received: by 2002:adf:e188:0:b0:486:f980:2361 with SMTP id ffacd0b85a97d-48872ac750cmr24124073f8f.45.1790624757303;
        Mon, 28 Sep 2026 12:45:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 28 Sep 2026 21:45:01 +0200
Message-ID: <20260928194511.41878-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124559_388983_ECFCDF3A 
X-CRM114-Status: GOOD (  15.42  )
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


