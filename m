Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1129C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 05:34:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7262C2084C
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 05:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PAkFmbTs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g5UcW3C0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7262C2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ops9ExjGHP8cEYqClJTAqrEwwlIeASPRb2aQjRuDLck=; b=PAkFmbTswxVCh0
	NUPdf5WBFF6QY5lppQsVAFH12sje/bSeCEb9k00+eUO3WG7EZ93uo3jI2e4CaeKYBHCo3CzgzZTVM
	PPfb3Y/ovz4fUgLLP4pxfdKo5n9OVUjejK9KXz48rBDHZ66ZtT8ycqWr/as+mLeU6YWPLdICRgfiO
	htFGeZc5YQ2A0VlCkoWdOEHcGESFlhUKtIDqp3W7oHbKUROaOTH0eXpTqIqw1IJRJGhWLurjbJ+Qg
	0oXVGm66xFO0GVb10xNaJD3w5WpZuVL69MdCjkTNr4yZ4h8lGftQzH8KCvKbmb6loigxEGq+dDNAt
	Eg/l+h8MTKBMpzgX+zTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeBBP-0004Ep-7a; Thu, 28 May 2020 05:34:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeBBJ-0004C6-RY; Thu, 28 May 2020 05:34:21 +0000
X-UUID: ad374416fffc4e499656d82c1291699f-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oNstLS6/mgWfRRhO8NpB9m5XZk3fhAC/bhZ2MdifWIU=; 
 b=g5UcW3C0OQ8hs+oO6yeoWj4ZqSb2hW7hKMjzqt9CIz/8xkvPBOUe4tvniDSrji6q6zbvO1aGJW2GEVqDayTqmFYTabE+F96EpaUsTcd6Z5y5R+H9CvDQH4c3/NS/Xzz0zZ+ny2P15mBfusT8/T/dI/L8nKzjMz/zW28oIN8vK4k=;
X-UUID: ad374416fffc4e499656d82c1291699f-20200527
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 600273364; Wed, 27 May 2020 21:34:15 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 May 2020 22:34:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 13:34:02 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 13:34:01 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v10 1/3] dt-bindings: Add keypad devicetree documentation
Date: Thu, 28 May 2020 13:33:43 +0800
Message-ID: <20200528053344.25936-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200528053344.25936-1-fengping.yu@mediatek.com>
References: <20200528053344.25936-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D80CEEEB44AE2EABD5AC980782C07B4455CB92DAA779325FAD0955D5C832820F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_223417_933901_1AA91C7D 
X-CRM114-Status: GOOD (  12.47  )
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
