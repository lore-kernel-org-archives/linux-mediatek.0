Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80522C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+fIp6X6W+AyU23B11coh5p51zqspQ7fCn39U2Hx59A=; b=W8TSWVObyQxW3V
	GxdMSU54jJndA+6IGJs6UzuVgAdxDryB14+UrZuSQoinSxVDhT6LA+H5YZCUfxZYL6BoBq1GrX9zN
	Q1FaaJPu4+mzwHaHuabrj6ZW0bfE2iABrhV0Kp0gt8yog3q8oiVNlKN6ZUDaR8WwzhQwLy5KaLbSR
	O7F3r6eNMfdvj3fyg7aJbUmuGct9akHwDI7SxnCnjpZccQF8nUA0vf4rvGO33/FSoOz3wD9pka6wx
	nU/TL6s52d43iaGP5yQFGqN+pZoebwX70j/k9EYT43Tr5M0WjmKhczpd/DZ3qiXiPdg8HamYT+DMu
	sVNUyW+wuEHY5oJcQzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpKo-002TLS-Bv; Tue, 05 Apr 2022 19:59:26 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpJe-002Sah-GQ; Tue, 05 Apr 2022 19:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ZFTEBC50mhc9NZ1AdGDIcklV5epX+TBR7wn/4sHSsA=; b=nCz0PcqeDtwxrNP6xu+aPkukmo
 WkXu6B3ykehXx8wDlYxkTJRrvrEwA7/YDoO+fgDdjKGEhvE9ky5PzFxifDcSpHZmfk/CIJzmNzzzX
 bvIyLGhUNDbBw+hFz13GGpIUyY6gSHCOi3YLa/QXliE3aHtPxq8s0flQJ+fxqH2nsv3c=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nbpJS-00035V-6F; Tue, 05 Apr 2022 21:58:02 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/14] dt-bindings: arm: mediatek: document the pcie mirror
 node on MT7622
Date: Tue,  5 Apr 2022 21:57:46 +0200
Message-Id: <20220405195755.10817-6-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405195755.10817-1-nbd@nbd.name>
References: <20220405195755.10817-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_125814_781495_CE2A676A 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

This patch adds the pcie mirror document bindings for MT7622 SoC.
The feature is used for intercepting PCIe MMIO access for the WED core
Add related info in mediatek-net bindings.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../mediatek/mediatek,mt7622-pcie-mirror.yaml | 42 +++++++++++++++++++
 .../devicetree/bindings/net/mediatek-net.txt  |  2 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
new file mode 100644
index 000000000000..9fbeb626ab23
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek PCIE Mirror Controller for MT7622
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The mediatek PCIE mirror provides a configuration interface for PCIE
+  controller on MT7622 soc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7622-pcie-mirror
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      pcie_mirror: pcie-mirror@10000400 {
+        compatible = "mediatek,mt7622-pcie-mirror", "syscon";
+        reg = <0 0x10000400 0 0x10>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index 1c8dc44bbb52..f18d70189375 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -48,6 +48,8 @@ Optional properties:
 	various clocks and reset to the system.
 - mediatek,wed: a list of phandles to wireless ethernet dispatch nodes for
 	MT7622 SoC.
+- mediatek,pcie-mirror: phandle to the mediatek pcie-mirror controller for
+	MT7622 SoC.
 
 * Ethernet MAC node
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
