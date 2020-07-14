Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A73C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:34:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE8CA212CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="04B+gfUL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pK6hzCTb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE8CA212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UsVHR8BqSlN5FGGtLVCRt+MgCMtj93y6mTdV9qDFKI8=; b=04B+gfULaagaUXdx8nh9GU9zZ
	uwIPK4BkTux+97FEYzThv6Z5IxGBVGZtqdX4Io35SKzgmkvnCCDYMi79u9Ca+wT+2Ma1DIANVK/K3
	GGv0m+xoCXkLtrYSP3gW4B9//geftknrq2fYHuLJuTSczK+x7Q9DXHwkMTqHO4J/+lv8f2KImaibY
	QdnVD6Dkx/IXnp7weA1dmeGwMXjHEY90khRFFo2aIhcMXefTF+ERKzpeJ7ih/+2Z/e9XonImLRrgL
	AVu5yPllyJFo9Mkr68tuqB7hgQwUUKMSKovvWhDo+Fs83dGWXuxE+WLf5+0obYTBcW7U8/+lQjd4N
	dWLIrVr7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHKc-0003zR-M9; Tue, 14 Jul 2020 09:34:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHJJ-0003Jp-5D; Tue, 14 Jul 2020 09:33:16 +0000
X-UUID: cc43cc0f465b482795dd35ad6753fcd1-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=P6qGyud4eOgJWhAsBEK1RhIt5CRQoFPxA7k9GVZT1RM=; 
 b=pK6hzCTbPZ1sxBnfhCUtJ19SoIHEY2VG1pKNFVCqBXyBi5I9NHRpwkB0J4CuhZIgFxxZV+h1ik2VWpEoUUPNCCX43/4UwPufsTRPN7lT8b1EIPw5XqN0a6JCamSjvPigEf82+8WcgvmbN6sM10Yf9O2gZTpAZo5wm9FSJ/ZNGys=;
X-UUID: cc43cc0f465b482795dd35ad6753fcd1-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1198001772; Tue, 14 Jul 2020 01:33:08 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 02:23:04 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:23:02 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:23:02 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Marco Felsch
 <m.felsch@pengutronix.de>
Subject: [PATCH v14 1/3] dt-bindings: Add keypad devicetree documentation
Date: Tue, 14 Jul 2020 17:20:52 +0800
Message-ID: <20200714092053.16067-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200714092053.16067-1-fengping.yu@mediatek.com>
References: <20200714092053.16067-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0DC67976A24A6C8DA0B1CE823BB8663B55D3E6BD824FE4F4E4C6714C8C3C15872000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_053314_681906_A63780A8 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
 "fengping.yu" <fengping.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Add Mediatek matrix keypad dt-bindings doc as yaml schema.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 .../devicetree/bindings/input/mtk-kpd.yaml    | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml

diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
new file mode 100644
index 000000000000..3bf09e7395d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
@@ -0,0 +1,96 @@
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
+    description: Debounce interval in microseconds, if not specified, the default
+    value is 16000
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
