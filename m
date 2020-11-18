Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCF3C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:23:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E28D221F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PpDh1N+M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ifqxqCSh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E28D221F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gkn6rg/8PgG4HVnqwp8fubVVE9Mxaa8DBxA1uftSAos=; b=PpDh1N+MeRBzaoMZz501E6cOo
	JXHpUfkqY0Frr++mJkQHjMLOWMlptzOHt9901VQlPiZkppGt+rtC2nBWw3V0aC6ZftJvU0pjs7jHb
	3lDCIZjiDfuwGUfWUewCLRUKajfN84BgYJOBiiIj0MFEX1wfOW3MO3UfPLTeQShBx0HMPgv2jJRIY
	VKroR6q23xwYCKLtmoE+pWdih2zxpvuD0BMds7UaPiYnLBkEYoqgvdvbNXfAGMGzNla3Tea2+FG11
	Kxdp09LE1DLf3F0wb6IhOKM6WJsLIlr9p94HWQIJpwaPdAcu0/vIPbHMjN2dBK0fLqN5J9Ss0t+p0
	tkRWV8RiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfIkD-0008Kc-Si; Wed, 18 Nov 2020 08:23:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfIk0-0008Fp-PZ; Wed, 18 Nov 2020 08:23:02 +0000
X-UUID: 8fafd77940014a6a8b4a75d83d4c06c1-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cdZ2/xmvKpJPVx7GABj6M9bP7mJTdyS74fXr8bilqKY=; 
 b=ifqxqCSheO+b5QKlsCJ0d+32DRP+plRuKZQTY2GUg8aj+pqAZLwl3R/r0i47CEyVCtINRCgmRMyo+1pvMNT0fc+eVN1to8sFw14entNAo29a2ntYlCsbArs59EH2Nst6YzbzfdpbRnxAGmZVU/OxEJQjbg6yzslt+tgopNe/CVY=;
X-UUID: 8fafd77940014a6a8b4a75d83d4c06c1-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1114976226; Wed, 18 Nov 2020 00:22:45 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 00:21:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 16:21:46 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Nov 2020 16:21:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 06/11] dt-bindings: phy: convert HDMI PHY binding to YAML
 schema
Date: Wed, 18 Nov 2020 16:21:21 +0800
Message-ID: <20201118082126.42701-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_032301_007617_3CDCEE82 
X-CRM114-Status: GOOD (  16.88  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod
 Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert HDMI PHY binding to YAML schema mediatek,hdmi-phy.yaml

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3: add Reviewed-by Rob
v2: fix binding check warning of reg in example
---
 .../display/mediatek/mediatek,hdmi.txt        | 18 +---
 .../bindings/phy/mediatek,hdmi-phy.yaml       | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
index 6b1c586403e4..b284ca51b913 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
@@ -53,23 +53,7 @@ Required properties:
 
 HDMI PHY
 ========
-
-The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
-output and drives the HDMI pads.
-
-Required properties:
-- compatible: "mediatek,<chip>-hdmi-phy"
-- the supported chips are mt2701, mt7623 and mt8173
-- reg: Physical base address and length of the module's registers
-- clocks: PLL reference clock
-- clock-names: must contain "pll_ref"
-- clock-output-names: must be "hdmitx_dig_cts" on mt8173
-- #phy-cells: must be <0>
-- #clock-cells: must be <0>
-
-Optional properties:
-- mediatek,ibias: TX DRV bias current for <1.65Gbps, defaults to 0xa
-- mediatek,ibias_up: TX DRV bias current for >1.65Gbps, defaults to 0x1c
+See phy/mediatek,hdmi-phy.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
new file mode 100644
index 000000000000..96700bb8bc00
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek High Definition Multimedia Interface (HDMI) PHY binding
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: |
+  The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
+  output and drives the HDMI pads.
+
+properties:
+  $nodename:
+    pattern: "^hdmi-phy@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - mediatek,mt2701-hdmi-phy
+      - mediatek,mt7623-hdmi-phy
+      - mediatek,mt8173-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PLL reference clock
+
+  clock-names:
+    items:
+      - const: pll_ref
+
+  clock-output-names:
+    items:
+      - const: hdmitx_dig_cts
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+  mediatek,ibias:
+    description:
+      TX DRV bias current for < 1.65Gbps
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0xa
+
+  mediatek,ibias_up:
+    description:
+      TX DRV bias current for >= 1.65Gbps
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0x1c
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-output-names
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    hdmi_phy: hdmi-phy@10209100 {
+        compatible = "mediatek,mt8173-hdmi-phy";
+        reg = <0x10209100 0x24>;
+        clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
+        clock-names = "pll_ref";
+        clock-output-names = "hdmitx_dig_cts";
+        mediatek,ibias = <0xa>;
+        mediatek,ibias_up = <0x1c>;
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
