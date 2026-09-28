Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6FBCA5FA6
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 19:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=; b=vY8ZGTdtWhzixH8ErVaCOgRW3J
	DPU36Sw5uHf9G0Hzlmrwb9XU+1OlSy06my62zx3Ug+0ssOONzXlzssUe8Z/KViBawI3VI8A14wPAg
	fOSn3UHMn1/cpVEEPZVvWZpyK++dqPOoxsRsWmhrk83hA6bdkw+BKa9bcKllognR6sHwRIqsv3fgY
	frk8wtD4H71jXZYDVs8N460DrGtvsecs/bWEjDTJu089J7YQMJtsvNJC+uD5pwqHFJhPbS7bFzsrO
	g6rhADbljnNtar4P7rWkZWACpFF2LA3blqo/CQaZe8gipUMgCCVpDYi4kFRwSKvuNdSRNLkGf4KLi
	A4WZU0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIc-00000001UVA-45gg;
	Mon, 28 Sep 2026 19:46:06 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIS-00000001UMU-3KF5
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 19:46:00 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so2588382f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624755; x=1791229555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=fSCWK2qGXdbokPmH+iV+ZKMo0b9KGAMLir4/d63sYgHfuCncSf7Q73FWonXvSK5viI
         /f1Rz2Tyzjy8ZO89FncCEUZUV17i27xJn8xxdQKnOzo05mJn8oXE8b1wGlGZAR+paA7P
         3ULrIa3i/xFwSPb/5NJG2WEdlxTUHAVCVKG4qASHDIZHeC/4etIBeYP/S3Ly2Y9113Cf
         plLQxqkse/tLsMrEXePua98watmlhXam6ynnh1lJEun5OxrqIw1eBLpDSxmKAsSpXRmW
         7Q+d5sSIuv793I7wvIPWzIpZ+xxELXrvmETOCiMdiYp6rPYmTFoWQCyxUasWmxPYcQza
         LxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624755; x=1791229555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=YlnyTv84BNC0iD6HMVr4sf/80gDQjopN+CDERguVoTb7gT/Mdw68EeH3z5KDE9QPel
         OTlYWTCzlaomdDpYsmhcpuU2wZYTsie/+Yct79NRshh2E5WMrt2ODAUfyY+j+Xkw0NJN
         uYzzCmR2T/E6fQFBDPB3Jfl5w2HxXVBWPb/ZT+yZMHvhAU//EB60vejgtqGpDgqlZNhs
         RbgNRySq3Ubmrw0lDh7MvyP45dnvsI5ZMekQrUHNTe4IxSLgiOk/LynzWyG7EpDMV7m+
         N3pGwTQyI7oj8dVodC8d4mC7T5QvgU9+iyWmaJEMNVK/pKk8mWdQTosCorAFcob6PE/t
         RUdg==
X-Forwarded-Encrypted: i=1; AKwUvByMoYBjnsQFvwK/6xQqFY4xEVuxFeH5DcwuvN3pUWUiiaXbC9OEOZNeteQefn/2D/dnBbNuSLfBpfH+16gmQw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJLyyrwfVB7k3T7bD3g+YotA0n5oW4yuksnVfrb2SOPAkXE0npc
	8l6TLR4UgseI0IvBaiGqzP8XsFK3W8lvWZTlNzHwdMPDxQJ3r+187XSG
X-Gm-Gg: AYBFou1riIHlSzibkv8VcBUf7u5n0juqcf8hjL+QjUP2VIxst8NVZgxeAAXCEnKvtsz
	0xLqrs+6vyRUlmDHOJYBU7n9iamm4Yet5KU0FU5v0/Y8orlNV/tkYIlzsSvNJN5/WH2WRwaUaZM
	qypGNN6DuWhGsz225D/cEU2kNMEtafWVCg7sptWoD+W9HsUrpl8BHkEcjK6kmAucK5bYk6tKujs
	zay5aGyYvURgeMSyRfR/cWtqThiou8mO2NRSZKC6m/GyWtuO4xNjOZlnqFHT4A34FIryUkF71rh
	1DdIcaaJuKLfj4uOHxHdlnvddFdGoc8f8y07H+t60KIYC0XmzaCupMeQGFQXRxvXunbIpxP1X6v
	09XSAqfqVOwDsqdTpguBpQu0dTQYCzRH1QDJWKUjmhCthmPlhHQ4Ffug64uks8DySmaEDYMczTJ
	DI0T/dixmatl7kyky+YgYCnipa4Dfy6kqEUULrRRPuMzmW7b76oRlTvPhldZWi3ShhbIMJ8Q17k
	iVqdyFIOHLltapIlNKyiEyz461J22jDn8RTLI/gJjNoEBf8bdqk6QKmNp8UZzUo
X-Received: by 2002:a5d:5f49:0:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48af1fbe9demr313504f8f.21.1790624754940;
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
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
Subject: [PATCH net-next v24 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 28 Sep 2026 21:45:00 +0200
Message-ID: <20260928194511.41878-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124556_857351_583AFD48 
X-CRM114-Status: GOOD (  13.75  )
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.55.0


