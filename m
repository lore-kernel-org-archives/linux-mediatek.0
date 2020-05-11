Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79A8C54E8E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7114120643
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZMQIc8b5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="QEUzmMOp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7114120643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVUhL1nCzbFMryJx1ChACGcb28fKI2TfemS6Nwp0+eQ=; b=ZMQIc8b5bM6Ly+
	Ccht4TCCF9IuETBphlgWU/Zos/CRwV8Z1A+JYzx8mmtnhN52FTdcA1OrIi/Q3sVp11Q6/0X3GIbJz
	LQDgE9D/NjTUQVRCifcqsDyYLlLUNN3Wkx/HbT5NkmZ05xk2YcjYlitovxqq3tz4BTHzL8VIa/HSC
	Q7Ij+BtOCh4H5rXCi65W8/IhOQdsOxa/yZOwC10ZbNcY5nuFQqCyIzoVWs37IsDvNqWSGD9tFrNvw
	xaGQqVJdoJk8T1EpS/IEI2dAy6BtnssnYK/LcNSPhxb1Y2OjPbouTicEWMMmmYRrRpF7QdDKRxwyJ
	2VdlMizGwAUzsUk/sERA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA3m-0003d6-SZ; Mon, 11 May 2020 15:09:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2a-0002I4-Ag
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id v12so11382388wrp.12
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RBYv7clwofuc4RomuNetMbXz5K8VN7BlCrpLgWGuKQ=;
 b=QEUzmMOpkuLBDn1i6mv2akyBNSjR1ykf/dDpY8muLvqY0EgXk2calkzNQUqycDd3tZ
 Vq52Ya3Uk3xcmjeqD4XPCjE06SMZvT43B+d3baVOEIBlIAHuSODNw7Vz8hN52jc4VMPM
 30sZl8kClQFaVhHbkM8CMsnQfsKyEKE2GofBXV/nkXzcVksDj/IMhaiUIMBo0zi2jXH9
 fyOzSkrRFnAwVEgvTmwNK8++fKTg67F+G7JzdrWpYfMCI7Hgf1/k1Nr8kC9Agq7rmAaG
 m4BeOJkfYm5HxPNtyPslH4OBoh0U+g4I1tMmnm5rqHAspXMzqntXPLvDJCmPXjRNGDuH
 A2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RBYv7clwofuc4RomuNetMbXz5K8VN7BlCrpLgWGuKQ=;
 b=oaXzN/h47py1Bis6x0iVhe2qAcLjSXoAzvZF/3ChlKdEESN4h1vlm6BxdV8SaUYkjx
 Oh5xC45Tu0KLGhlOHFRuCfb6qtR7eA8apnsWiVBAecz3dDOucDkPEZ6P/IgaC0MvUdCT
 FbmdcoPCcbHg9RNreW3VTqDPw6Et4S7KSyDy48MNpG6nSBi4o9UpiUFIyjLGA5fcJWWj
 /dBV8NCVM8YB/D5Fxwa1ZF4p8ojqyPFowmkr6t6ruJCi+lzQVocVHv3PW0Aisbs86jrH
 jQwV/X9PgRWISboM+Z9Q0HcLCORc8fFoyLrgIgRI5rG59kShPGz6E7DGRXy8xJ+yTTK5
 cfgQ==
X-Gm-Message-State: AGi0PuaqZHtMhgzUa4YcGbxMLtfZRwlN2R85OCaYAs4NVFHClXyga0z2
 w7ypStrVoyT6/RbqlF9zwYFRRw==
X-Google-Smtp-Source: APiQypLc0ablVe1skr4iCxYLHTZ5QzDJnCRmLkOSYNdEDYQvfMV6rr0vlRpnSTOJb8n8mwpIUQYYvw==
X-Received: by 2002:adf:fa91:: with SMTP id h17mr19349496wrr.111.1589209702442; 
 Mon, 11 May 2020 08:08:22 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 02/14] dt-bindings: net: add a binding document for
 MediaTek Ethernet MAC
Date: Mon, 11 May 2020 17:07:47 +0200
Message-Id: <20200511150759.18766-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080824_383791_C1E73BEC 
X-CRM114-Status: GOOD (  11.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds yaml DT bindings for the MediaTek Ethernet MAC present on the
mt8* family of SoCs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../bindings/net/mediatek,eth-mac.yaml        | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml

diff --git a/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml b/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
new file mode 100644
index 000000000000..7682fe9d8109
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/mediatek,eth-mac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Ethernet MAC Controller
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description:
+  This Ethernet MAC is used on the MT8* family of SoCs from MediaTek.
+  It's compliant with 802.3 standards and supports half- and full-duplex
+  modes with flow-control as well as CRC offloading and VLAN tags.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8516-eth
+      - mediatek,mt8518-eth
+      - mediatek,mt8175-eth
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    additionalItems: false
+    items:
+      - const: core
+      - const: reg
+      - const: trans
+
+  mediatek,pericfg:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description:
+      Phandle to the device containing the PERICFG register range.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - mediatek,pericfg
+  - phy-handle
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8516-clk.h>
+
+    ethernet: ethernet@11180000 {
+        compatible = "mediatek,mt8516-eth";
+        reg = <0 0x11180000 0 0x1000>;
+        mediatek,pericfg = <&pericfg>;
+        interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&topckgen CLK_TOP_RG_ETH>,
+                 <&topckgen CLK_TOP_66M_ETH>,
+                 <&topckgen CLK_TOP_133M_ETH>;
+        clock-names = "core", "reg", "trans";
+        phy-handle = <&eth_phy>;
+        phy-mode = "rmii";
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
