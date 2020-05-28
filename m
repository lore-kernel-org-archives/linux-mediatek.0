Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BBAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 09:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634262088E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 09:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BCj5U20y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DDmH7qYr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 634262088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ops9ExjGHP8cEYqClJTAqrEwwlIeASPRb2aQjRuDLck=; b=BCj5U20y+ml9qC
	axAyv3MZZFBgSJEy6cFrXXWyR+d4lMtTPhrMjurR2NNWYVAGcwHEbODD68vst6daiCJopboB615/2
	Y6/F1DehFq0rRaPxloGPrk7URnh4/Aaxf3Xnl/cPWglPxTQaU2DoogLwTooL8Cb3atywE3EoV0I9P
	CUcurpMPb3HJcJ+7AtfklUFIultBiY1utIUee55O93CxQSfxF9Zld3LMunNd+O48UkXINVJ4JiQWz
	lr2jP4YNDLABCi7bYdj87e2JHPMO280NrGBXgYlhh9RIFTyVyqwhhepN7aLfBk/mTHwXvTP/6QwJF
	e/BPNh6r5eX4CiAY6ucA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeER8-00020o-QA; Thu, 28 May 2020 09:02:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeER5-000201-Of; Thu, 28 May 2020 09:02:49 +0000
X-UUID: 9bce3428b4464e7fb4a1b62e53df1811-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oNstLS6/mgWfRRhO8NpB9m5XZk3fhAC/bhZ2MdifWIU=; 
 b=DDmH7qYrOacIUgr+Bg9Ft7KdKpbRr6anK9q/dCL9gE0E1VfU4HflYfbohLNIUY4tSlRVb+F+4vHvcEee2JW0M8lFPIUTTGobDLFid1V4aKsRKqxInr5IX79Uo4APUMNablfw+7vsLPrLeVO7KO778ocfntas4aqH/K3RQH/f6iY=;
X-UUID: 9bce3428b4464e7fb4a1b62e53df1811-20200528
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1339272091; Thu, 28 May 2020 01:02:46 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 02:02:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 17:02:40 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 17:02:39 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: [RESEND PATCH v11 1/3] dt-bindings: Add keypad devicetree
 documentation
Date: Thu, 28 May 2020 17:01:44 +0800
Message-ID: <20200528090144.54033-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200528090144.54033-1-fengping.yu@mediatek.com>
References: <20200528090144.54033-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 198BD1496B5F195DB161F64570F71CCFDF3079FE3796B63F2F4B3E19D42B9CBA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_020247_808570_EF73CF36 
X-CRM114-Status: GOOD (  12.37  )
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Add Mediatek matrix keypad dt-bindings doc as yaml schema.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 .../devicetree/bindings/input/mtk-kpd.yaml    | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml

diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
new file mode 100644
index 000000000000..586cd196dd00
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    oneOf:
+      - const: "mediatek,mt6779-keypad"
+      - const: "mediatek,mt6873-keypad"
+
+  clock-names:
+    description: Names of the clocks listed in clocks property in the same order
+    maxItems: 1
+
+  clocks:
+    description: Must contain one entry, for the module clock
+    refs: devicetree/bindings/clocks/clock-bindings.txt for details.
+
+  interrupts:
+    description: A single interrupt specifier
+    maxItems: 1
+
+  linux,keymap:
+    description: The keymap for keys as described in the binding document
+    refs: devicetree/bindings/input/matrix-keymap.txt
+    minItems: 1
+    maxItems: 16
+
+  pinctrl-0:
+    description: Specify pin control groups used for this controller
+    refs: devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+  pinctrl-names:
+    description: Names for optional pin modes
+    maxItems: 1
+
+  reg:
+    description: The base address of the Keypad register bank
+    maxItems: 1
+
+  wakeup-source:
+    description: use any event on keypad as wakeup event
+    type: boolean
+
+  keypad,num-columns:
+    description: Number of column lines connected to the keypad controller,
+    it is not equal to PCB columns number, instead you should add required value
+    for each IC
+
+  keypad,num-rows:
+    description: Number of row lines connected to the keypad controller, it is
+    not equal to PCB rows number, instead you should add required value for each IC
+
+  mediatek,debounce-us:
+    description: Debounce interval in microseconds
+    maximum: 256000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - linux,keymap
+  - pinctrl
+  - clocks
+  - clock-names
+
+examples:
+  - |
+
+  keypad: kp@10010000 {
+    compatible = "mediatek,mt6779-keypad";
+    reg = <0 0x10010000 0 0x1000>;
+    linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
+    interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+    clocks = <&clk26m>;
+    clock-names = "kpd";
+    pinctrl-names = "default";
+    pinctrl-0 = <&kpd_gpios_def_cfg>;
+  };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
