Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F325C9832A
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=; b=uckrFMow18z6Q6pAKBOXKJ/bN8
	ZKXz9vXrEIT+ga7qkmwI6jkrKPFyeEqQinC3TtWsjpVSbCoKsSQWhE4Me107LaJfLPESUGthHO1hw
	OKmpVqJZTN7FppMF3Rj+B82SsK+xtKbO6/PNquIJJp+8AyfPPZDfDNDGBodiOgSXsWS2GnMDK2GIe
	qDvRn8FKpMZUQk7UgaaauSGCUbl3UfE+eAD4S1rKDiNXHGLVIbvgG9FHWzZQ9kgwuO8QdjKqSq8ce
	lP7dp/uvNoooAFrEgpBwkgqXgQDsSBCkbjByZCtpA5kotSK/FkywgW/j9nAXMNqBYbgtyzEEHdvpa
	LI8yNlBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbR-0000000E85T-2SKj;
	Fri, 25 Sep 2026 18:24:57 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbN-0000000E83S-33ll
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 18:24:55 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so4393935e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360692; x=1790965492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=f/esiJG+WFQLiNEm4f5gnHqgKZLhaR1Z+e87JkbbAkrprRoaA/zZb/SVopACSRb3DL
         eEh+Cd2k5r6QMOQ00DXxRHeZsxxr5Kt9IgZuF4RH3gvjQYdsz2ZsO/rxjZkaZCS1h5+2
         Ri3MKT2dlbacbBxL5TYEyfoscdPSX11/EpXv5NtlVnBJhjC7alyEIAPyFixFfZLujaca
         bzLJXPsRd2xfFClAyJG9CtTe+5P+BPIbLrqyIc7Hii/9URWa8FjlfVEPvgwkC09fUSZP
         boMzf2j5I3pb0YiN8oSeKVvjp97qFdQeGpJlixaKo/hJLmnIDvz+Xpt+qOogIzLvuiU8
         kiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360692; x=1790965492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=xnDKyodg0qVVh1gFS0RPQqzkuCMNrv/xSG3m8NW8QFsy94EnGp4vfyNQll6KPXVI2V
         +sEJCw5i8Gt05dMF3EUEYaSlCo1MHlndRiMc2XCunO16k6Zv7Uhtf6tPnTXmwTzw7LMv
         bq9TXJrpuXnlMObsjyvVxUd52QrkNTR6XN1x3sf8b6k41dalWYddu056bblgORI5FoAy
         sPDUyT43AyfEJgGlX9fcB5ujui77JP+8gbX4jNcSfILqsKyi5tXCqMhbduDHiO+BAEyY
         fi3SOJOq5bGa8UFLy0y5hJU3PfKdZHWoIUfgO0CY7xY5kNpvJyZB8uYySiqyML6x8ga9
         HQpg==
X-Forwarded-Encrypted: i=1; AKwUvByBQKPVSvJsOpbU7VMz86iKBLIEdgofMQ0+whe2rTjjSVBQ5ycfDksPQTzEI8bTeo1fx2y3AQxYIn38r9e+Zg==@lists.infradead.org
X-Gm-Message-State: AFuF++n3dd9rSsA/Lwdak1NN/HbfZ5eRzQpoW0PlxAXkM9r41fF1YbF5
	L9t8GCE7EDJ6L9iwylv/gYWhxnstGhtaBGo53Y+mV4NHBgNR0rxmNSxx
X-Gm-Gg: AYBFou0XQFUi2tsfYNuvctH5nFDyCV3wTnUuxRrry0/yKuXVdEdpzCmwM17vTGb8H5n
	XVV3ULyoMnVAT1UsvyMWBCQYJwVhzfIbcyyvnDlggVxKug5LWgU51deG94p/CvdycNan0eKD83D
	jIOABrvBKcd7hL3XBmqNpZaPVi4sl7+D4AAjDbG6ObsH4epffhibWFSQQ4SGZFO7yFzjU1P62gQ
	Z0S4ndmwsm3QB5ZpBNiFkjzut8LJKYwPxSLwGKNaAYeBoOwPwRhM2SvLUqk1Z21L1FlTmrJamIr
	udWoJkUA/jro5Lr/ZZ7BAb+UKQT6VtqVocdHYdMBybVg9+d+mVpOjn+vHeePbBD2S6hlhdb7OB4
	CXLtpWHlfU4hniczUni2ppxzqtahH/+2R2FAEVrnTuqzDSC97OfeqIksF5C5BDRC5/rQ8dveJYQ
	F3I8zAuPJoBmL+nyVxRXy6Uum+Md9iOiMTAh+CqTzjxauEyP7JV9FFqQcRLFg4w0LDjxO5lX8yI
	YTSsZBqpsmMMp3KiHGdG6YI5zjDFDSE6VJKu7t6/Ksk4XuI+MGvAvGEJ4lVJICoxw==
X-Received: by 2002:a05:600c:630f:b0:49f:d69a:1a04 with SMTP id 5b1f17b1804b1-49fe6704682mr112960035e9.16.1790360691982;
        Fri, 25 Sep 2026 11:24:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:24:51 -0700 (PDT)
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
Subject: [PATCH net-next v23 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Fri, 25 Sep 2026 20:24:23 +0200
Message-ID: <20260925182435.21207-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_112454_361622_4B3A90AF 
X-CRM114-Status: GOOD (  13.55  )
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


