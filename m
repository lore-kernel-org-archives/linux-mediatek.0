Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F375C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 07:53:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4729E23129
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 07:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4729E23129
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aivgx61xFbLuf/JRKmeW3SV9+/1fKy77fmztljmxj0I=; b=Fef5k79FD7HinxNC4RLIRGGTe
	BiJJvPrVtbyoOUcxLS/gwv89QI67Hys3oJZKn5jxHm1M8U4kmqXlStOdvJDqzP1Z3HX4nmQAgjSdR
	cAivA8AAWC4sxUtxGY7Upc2iOOhYu4Ot+i2UPGXCOwweylM6+bTGm5aRtXujKZM6YKGx18FBzSf5K
	ak73fUqQ7cxCiJWf8MEPkxlSx+xlRTYWpOyWyW7lsqZBtkUZyiE8HDoPFc0S2CbiPSdEH1rDqO2HX
	y7vLOvMRYHpiZdUqc+Vv2pjuDJbJXNioOuZjiPEWrvH4Q+a6/n2VoJIRymcV5w99au5z1rQKppg8p
	F23ieFs+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kshuY-0004tY-2d; Fri, 25 Dec 2020 07:53:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kshuN-0004oa-5E; Fri, 25 Dec 2020 07:53:08 +0000
X-UUID: 0b0d00402a2e42aca70fcad3e1632856-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2N5TteKGk4SYr7QOeEEzXLkdcCCL33/deiGTpG1RkX8=; 
 b=AlUaOywGT7i1c0o3m0y9Y19wyCrncFVdjGf54mMPCzwEx/9UMQl7JTzGwl1zHdiXkWt3rL6KmDGEtTRU5Ru3lglSnE5wh78Q4eJTkB6ZTktVtfpCnHLgM2owEasXZGk8kOwiUQzj2y+OaJa8E2WUZktO3mUihUyaMt4npbHaUnc=;
X-UUID: 0b0d00402a2e42aca70fcad3e1632856-20201224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 780998932; Thu, 24 Dec 2020 23:53:03 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 23:53:01 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 15:53:00 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Dec 2020 15:52:58 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 07/11] dt-bindings: phy: convert MIPI DSI PHY binding to
 YAML schema
Date: Fri, 25 Dec 2020 15:52:54 +0800
Message-ID: <20201225075258.33352-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_025307_451323_F2F53DE8 
X-CRM114-Status: GOOD (  17.76  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay
 Abraham I <kishon@ti.com>, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
v5: add Reviewed-by Rob & Chun-Kuang

v4:
  1. add maintainer Philipp add support mt8183 suggested by Chun-Kuang
  2. use keyword multipleOf suggested by Rob
  3. fix typo of 'MIPI' in title

v3: new patch
---
 .../display/mediatek/mediatek,dsi.txt         | 18 +---
 .../bindings/phy/mediatek,dsi-phy.yaml        | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+), 17 deletions(-)
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
index 000000000000..71d4acea1f66
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -0,0 +1,85 @@
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
+  - Philipp Zabel <p.zabel@pengutronix.de>
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
+      - mediatek,mt8183-mipi-tx
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
+    description: adjust driving current
+    multipleOf: 200
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
