Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6BBC2BA15
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 08:04:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA282073B
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 08:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sgmKtj4M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FAxAeBIN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA282073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sO0rVtGnpPZo4WTl+uD3y0nVsnuAuUJOsZkxtIrMsQk=; b=sgmKtj4MT5EtVC
	wj9lYJz2Ay5loU4y0G01lZjBnGvnRkBtzzp1Zj4w5Ve3Xw2P1yPG7XkBYvyy3zVlR3CKTwlV4u3Dr
	n00p013xI/7vA/tBuH6FbtKQOsbb8J8N8ywvZm0wCsAjG/xa5cdHtDIQVAKV7fUUDuSzupfi7TVZA
	jpLLLTENNCaDxCcjm435ZVdFYT6Yt/Wt3mP7iFYRkGx6dSNIQBqSqqqn9MwHmN35R9OW6XVOyO77s
	RekjRSp4xbyiglgtUblNVweHpSIHbNzn60ll9hQSNI9HaJdJAN81+Un4oOfQr5EuAflN+4fU552gM
	XiA8zAhcms8ndYRpC+9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKHJE-0003hc-JH; Fri, 03 Apr 2020 08:04:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKHJB-0003cx-Bc; Fri, 03 Apr 2020 08:04:11 +0000
X-UUID: f32318ed64a3467f9754e8200f24da85-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bYMc9OznLPrGLr6gJF9UOCWwJMxzT0GifD+9RfEVLu4=; 
 b=FAxAeBINdzhMA9BzMWX8Chf2H1i6XTbRt7WdO6zql7Q4y1J5cF35JslS+p7BGPKQTSl2FJUjCc4jPGfjMg1fBQod4PzxYOOR9nbKsolzsLm8us1vtNWOb7S7AscTv2vcn84iEzVCVzTiP53Oj0InxxlYBMyNQ3cplua8yUyqqsg=;
X-UUID: f32318ed64a3467f9754e8200f24da85-20200403
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1439951569; Fri, 03 Apr 2020 00:04:01 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Apr 2020 01:04:01 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 3 Apr 2020 16:03:58 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 3 Apr 2020 16:03:55 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 2/3] dt-bindings: display: mediatek: convert the document
 format from txt to yaml
Date: Fri, 3 Apr 2020 16:03:49 +0800
Message-ID: <20200403080350.95826-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200403080350.95826-1-jitao.shi@mediatek.com>
References: <20200403080350.95826-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A5FFD7C2E38A0D8BED24F226F9270500E1172E398269E27C6C5B807142774C3C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_010409_426562_67F4F5F7 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../display/mediatek/mediatek,dpi.txt         | 42 --------
 .../display/mediatek/mediatek,dpi.yaml        | 97 +++++++++++++++++++
 2 files changed, 97 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
deleted file mode 100644
index 77def4456706..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Mediatek DPI Device
-===================
-
-The Mediatek DPI function block is a sink of the display subsystem and
-provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
-output bus.
-
-Required properties:
-- compatible: "mediatek,<chip>-dpi"
-  the supported chips are mt2701 , mt8173 and mt8183.
-- reg: Physical base address and length of the controller's registers
-- interrupts: The interrupt signal from the function block.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "pixel", "engine", and "pll"
-- port: Output port node with endpoint definitions as described in
-  Documentation/devicetree/bindings/graph.txt. This port should be connected
-  to the input port of an attached HDMI or LVDS encoder chip.
-
-Optional properties:
-- pinctrl-names: Contain "default" and "sleep".
-
-Example:
-
-dpi0: dpi@1401d000 {
-	compatible = "mediatek,mt8173-dpi";
-	reg = <0 0x1401d000 0 0x1000>;
-	interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&mmsys CLK_MM_DPI_PIXEL>,
-		 <&mmsys CLK_MM_DPI_ENGINE>,
-		 <&apmixedsys CLK_APMIXED_TVDPLL>;
-	clock-names = "pixel", "engine", "pll";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&dpi_pin_func>;
-	pinctrl-1 = <&dpi_pin_idle>;
-
-	port {
-		dpi0_out: endpoint {
-			remote-endpoint = <&hdmi0_in>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
new file mode 100644
index 000000000000..effdaa96aec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek DPI Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek DPI function block is a sink of the display subsystem and
+  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
+  output bus.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-dpi
+      - mediatek,mt8173-dpi
+      - mediatek,mt8183-dpi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Pixel Clock
+      - description: Engine Clock
+      - description: DPI PLL
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: engine
+      - const: pll
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: sleep
+
+  port@0:
+    type: object
+    description:
+      Output port node with endpoint definitions as described in
+      Documentation/devicetree/bindings/graph.txt. This port should be connected
+      to the input port of an attached HDMI or LVDS encoder chip.
+
+    properties:
+      endpoint:
+        type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port@0
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    dpi0: dpi@1401d000 {
+        compatible = "mediatek,mt8173-dpi";
+        reg = <0 0x1401d000 0 0x1000>;
+        interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&mmsys CLK_MM_DPI_PIXEL>,
+             <&mmsys CLK_MM_DPI_ENGINE>,
+             <&apmixedsys CLK_APMIXED_TVDPLL>;
+        clock-names = "pixel", "engine", "pll";
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&dpi_pin_func>;
+        pinctrl-1 = <&dpi_pin_idle>;
+
+        port@0 {
+            dpi0_out: endpoint {
+                remote-endpoint = <&hdmi0_in>;
+            };
+        };
+    };
+
+...
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
