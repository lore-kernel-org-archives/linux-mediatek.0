Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB801C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 06:23:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A523C206F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 06:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ie1MN1bE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gDTRxokq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A523C206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bg6c+hC7sLVmyF8PI7LLN3232l9dFzEnLBTDS4HP8E8=; b=Ie1MN1bEgC6Mot
	OM33pTFWZJ/53kKVJClsLBUhSAVaVGeL6qdlJ6j4Y5MtTuJF0bUJCh/4g0vCTsVlW2+lmCVbtKtvT
	0J7veOYAui/yoszDaeXmlny4OBAWjPF7qXBEAaS4/U26WxDCxH7oun4Qz38gyzftFvTE8xVE/I01G
	Y1UDM2SWyKB/hhSLyc6T6M53wvjFvaAlLwQeJNeDbjcbi+oTJ9xUfnqAqbp1o1SCzR3wO6PKVdi/u
	qjuKSFZ+gjwG0gn9dxhrEBoi5CjprJBSBn2TpITE5oUMQF+Gs7SJUFOS9F2awxba4ot032lid5f84
	pRhK9O8v+QzFPlkt8tQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ7H4-00073w-F7; Thu, 14 May 2020 06:23:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ7Gf-0006dV-5V; Thu, 14 May 2020 06:22:54 +0000
X-UUID: f86e428ca7be45aa999c70ed912de7c9-20200513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=g8W9y18PJpcWaE0KJN5g8QQdm9DCrONWR8ew1MlbhCw=; 
 b=gDTRxokqtDWI2U7AGoQjwaPlPknmUVSdaCcnDz6d3O4mi1YQOGG+CM3/cWP7t1pa0mx++ZDYNT4pXxnlgtFg2FknVFuQsPqN3PG89XgJPEtcP8jVJMRCuGRvIZ91t8NoLoWEJGcQSwboo4NbQmaR6Rrp9uJcmp/IafxcM4SQRSk=;
X-UUID: f86e428ca7be45aa999c70ed912de7c9-20200513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 489531263; Wed, 13 May 2020 22:22:47 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 May 2020 23:21:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 14:21:18 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 14:21:18 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v7 1/3] dt-bindings: Add keypad devicetree documentation
Date: Thu, 14 May 2020 14:17:46 +0800
Message-ID: <20200514061747.25466-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514061747.25466-1-fengping.yu@mediatek.com>
References: <20200514061747.25466-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_232253_215165_9E49C894 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: "fengping.yu" <fengping.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Add Mediatek matrix keypad dt-binding doc as yaml schema.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 .../devicetree/bindings/input/mtk-kpd.yaml    | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml

diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
new file mode 100644
index 000000000000..8f594fe0bfc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
@@ -0,0 +1,102 @@
+%YAML 1.2
+---
+version: 1
+
+$id: http://devicetree.org/schemas/input/mtk-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek's Keypad Controller device tree bindings
+
+maintainer:
+  - Fengping Yu <fengping.yu@mediatek.com>
+
+description: |
+  Mediatek's Keypad controller is used to interface a SoC with a matrix-type
+  keypad device. The keypad controller supports multiple row and column lines.
+  A key can be placed at each intersection of a unique row and a unique column.
+  The keypad controller can sense a key-press and key-release and report the
+  event using a interrupt to the cpu.
+
+properties:
+  compatible:
+      constraint: |
+        "mediatek,mt6779-keypad"
+        "mediatek, kp"
+
+    clock-names:
+	description: Names of the clocks listed in clocks property in the same order
+
+    clocks:
+	description: Must contain one entry, for the module clock
+	refs: devicetree/bindings/clocks/clock-bindings.txt for details.
+
+    interrupts:
+	description: A single interrupt specifier
+
+    linux,keymap:
+	description: The keymap for keys as described in the binding document
+	refs: devicetree/bindings/input/matrix-keymap.txt
+
+    pinctrl-0:
+	description: Specify pin control groups used for this controller
+	refs: devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+    pinctrl-names:
+	description: Names for optional pin modes
+
+    reg:
+	description: The base address of the Keypad register bank
+
+    wakeup-source:
+	description: use any event on keypad as wakeup event
+
+    keypad,num-columns:
+	description: Number of column lines connected to the keypad controller,
+ 	it is not equal to PCB columns number, instead you should add required value
+ 	for each IC
+
+    keypad,num-rows:
+	description: Number of row lines connected to the keypad controller, it is
+ 	not equal to PCB rows number, instead you should add required value for each IC
+
+    mediatek,debounce-us:
+	description: Debounce interval in microseconds
+	maximum: 256000
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mediatek,debounce-us
+  - keypad,num-rows
+  - keypad,num-columns
+  - linux,keymap
+  - pinctrl
+  - clocks
+  - clock-names
+
+optional:
+  - wakeup-source:
+
+examples:
+  - |
+
+    keypad: kp@10010000 {
+	compatible = "mediatek,kp";
+	reg = <0 0x10010000 0 0x1000>;
+	wakeup-source;
+	interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+	clocks = <&clk26m>;
+	clock-names = "kpd";
+    };
+
+    &keypad {
+	mediatek,debounce-us = <32000>;
+	keypad,num-rows = <8>;
+	keypad,num-columns = <9>;
+	linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&kpd_gpios_def_cfg>;
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
