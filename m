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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E58CC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:26:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF50241A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCMQa7FM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MHV7BH8n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF50241A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NNgIGBalG0ROOo87QAkSQF5EgXnCKwzI5TMUPLKiU0k=; b=WCMQa7FMuZBCkhpIHgM0nkMjw
	DpaC+lD/m3ObzV0VOCHYuI9W36dU1u4PG0/zIfpIi3zDvGv94b476HrBxszmUGONFutM1o2HXHl/9
	BkkKVMCxs3ez/pGTksEQ2PsiYgEgcHQTQ8RT2lEVs/iAVij8jtXcZbAZzZiiaOL4KqzMmDJYK/M08
	TOuXMzsAbVN7f2Jk2Djui8VIorWuLAKAC+txRrir+9UyB5+wPLX/bOkHYfYwVDHV95szOfh070usG
	ln/Qe5gWKrgHRJRbwFNqgCdPVHHwJ3Dfzkv08RCbZ+J2JoWQ8GhbzV552atIOmVAKUSmJLn1sRFty
	E4n7j2h6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfIn6-00019M-Pq; Wed, 18 Nov 2020 08:26:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfImW-0000rA-Rt; Wed, 18 Nov 2020 08:25:38 +0000
X-UUID: 4432c5f4563e4bb0828386e0ab650206-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iMuAYPyR81KlSeb8qJZe1eW7RW7FAqULcaCiXkofBlc=; 
 b=MHV7BH8nS1BSBN8Z35B3oOE3jMKNEr7X54sy/xufjanDTq5t8G69gHVOfSihlnSZ9mYoT9UUrSFi2WAOuNn2EW1nM8UNQcogYnf/r5Xly718dHFPhtJNqs062y4PZ6AIO39egb+1fYH37uQtE+cS9hA4PhCvGGMwRehGtMJBtlc=;
X-UUID: 4432c5f4563e4bb0828386e0ab650206-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 331047260; Wed, 18 Nov 2020 00:25:27 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 00:21:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 16:21:45 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Nov 2020 16:21:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 07/11] dt-bindings: phy: convert MIP DSI PHY binding to
 YAML schema
Date: Wed, 18 Nov 2020 16:21:22 +0800
Message-ID: <20201118082126.42701-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_032537_114527_8EE6174A 
X-CRM114-Status: GOOD (  18.19  )
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

Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: new patch
---
 .../display/mediatek/mediatek,dsi.txt         | 18 +---
 .../bindings/phy/mediatek,dsi-phy.yaml        | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index f06f24d405a5..8238a86686be 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -22,23 +22,7 @@ Required properties:
 MIPI TX Configuration Module
 ============================
 
-The MIPI TX configuration module controls the MIPI D-PHY.
-
-Required properties:
-- compatible: "mediatek,<chip>-mipi-tx"
-- the supported chips are mt2701, 7623, mt8173 and mt8183.
-- reg: Physical base address and length of the controller's registers
-- clocks: PLL reference clock
-- clock-output-names: name of the output clock line to the DSI encoder
-- #clock-cells: must be <0>;
-- #phy-cells: must be <0>.
-
-Optional properties:
-- drive-strength-microamp: adjust driving current, should be 3000 ~ 6000. And
-						   the step is 200.
-- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
-               unspecified default values shall be used.
-- nvmem-cell-names: Should be "calibration-data"
+See phy/mediatek,dsi-phy.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
new file mode 100644
index 000000000000..87f8df251ab0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MIPI Display Serial Interface (DSI) PHY binding
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: The MIPI DSI PHY supports up to 4-lane output.
+
+properties:
+  $nodename:
+    pattern: "^dsi-phy@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - mediatek,mt2701-mipi-tx
+      - mediatek,mt7623-mipi-tx
+      - mediatek,mt8173-mipi-tx
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PLL reference clock
+
+  clock-output-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+  nvmem-cells:
+    maxItems: 1
+    description: A phandle to the calibration data provided by a nvmem device,
+      if unspecified, default values shall be used.
+
+  nvmem-cell-names:
+    items:
+      - const: calibration-data
+
+  drive-strength-microamp:
+    description: adjust driving current, the step is 200.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2000
+    maximum: 6000
+    default: 4600
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-output-names
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    dsi-phy@10215000 {
+        compatible = "mediatek,mt8173-mipi-tx";
+        reg = <0x10215000 0x1000>;
+        clocks = <&clk26m>;
+        clock-output-names = "mipi_tx0_pll";
+        drive-strength-microamp = <4000>;
+        nvmem-cells= <&mipi_tx_calibration>;
+        nvmem-cell-names = "calibration-data";
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
