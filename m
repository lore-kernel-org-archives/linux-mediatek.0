Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3861C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C175206D7
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2DpTRu2r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nF9FOXiZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C175206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BHuAKwEyMWYMClIb9s27ZlRUdmzEreto7gw2MiiYwCU=; b=2DpTRu2r7ezSw3pykoT3Z/UtZ
	GKyHL+YZdEhlAiUgrfH9/igBWgH33uiKhJrW+c4lsPABnW0Wd1YybB0Tg/43WQSlR/T22ImlYlGMU
	QcX4veY4tm1MT+8eSwLjjPBiuGUKFnRzCDQmyINmq7o//kLmm3+K3vVCMAL7FKKb4ti6JslRhezqi
	ThQNGAryWS3GEp/B9+PAsHjgNTDVvGjrtKLC0Rxh3lVEKjNq58L3GwNrG59FHNg6PlaCqIVLPTslu
	jc/Q2sD250lTRUYduu7AJjxSVMmhZB+f0M8Xy2v2JSYkEZuRmRY04qoRd3jLseyH8jkUGsAB9fVy8
	/kbdrHHuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2U3V-0001OE-Ju; Mon, 03 Aug 2020 06:34:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2U3R-0001N3-Lo; Mon, 03 Aug 2020 06:34:39 +0000
X-UUID: df1060b07db44a6c92996f2d06ae3b4a-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uYfWyEBf09draA4+Bw+2HdPo7pH44w0XlSp71SGm5QA=; 
 b=nF9FOXiZW72aCluLjmqOBLh2yUslCQjpy3lUs7foLnB5UJMZ8z7HlDNWqdyydw/5swlIuXYiLPaZU6NwzqK8v8FI38pLwBm28ZgFH8dN1Z+zOqIeQiJqjNyZk78A2umgMbihU8p8Y7UIEKGww2X7Ldcqvisa33gIVtYQu882mww=;
X-UUID: df1060b07db44a6c92996f2d06ae3b4a-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 658787294; Sun, 02 Aug 2020 22:27:10 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 23:23:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 14:23:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 14:23:02 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: interrupt-controller: Add MT58XX interrupt
 controller
Date: Mon, 3 Aug 2020 14:22:14 +0800
Message-ID: <20200803062214.24076-3-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200803062214.24076-1-mark-pk.tsai@mediatek.com>
References: <20200803062214.24076-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_023437_939662_F9766520 
X-CRM114-Status: GOOD (  14.95  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding for MT58XX interrupt controller.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 .../mediatek,mt58xx-intc.yaml                 | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml
new file mode 100644
index 000000000000..23e04763ab86
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT58XX Interrupt Controller
+
+maintainers:
+  - Mark-PK Tsai <mark-pk.tsai@mediatek.com>
+
+description: |+
+  Mediatek DTV SoCs contain multiple legacy interrupt controllers that
+  routes interrupts to the GIC. All the mt58xx SoCs have this
+  controller, hence the name of binding.
+
+  The HW block exposes a number of interrupt controllers, each
+  can support up to 64 interrupts.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    - items:
+        - const: mediatek,mt58xx-intc
+
+  interrupt-controller: true
+
+  "#address-cells":
+    enum: [ 0, 1 ]
+  "#size-cells":
+    const: 1
+
+  "#interrupt-cells":
+    const: 3
+    description: |
+      Use the same format as specified by GIC in arm,gic.yaml.
+
+  reg:
+    description: |
+      Physical base address of the MT58xx interrupt controller
+      registers and length of memory mapped region.
+
+  mediatek,irqs-map-range:
+    description: |
+      The range of parent interrupt controller's interrupt lines
+      that are hardwired to MT58xx interrupt controller.
+
+  mediatek,intc-no-eoi:
+    description: |
+      Mark this controller has no End Of Interrupt(EOI) implementation.
+      This is a empty, boolean property.
+
+required:
+  - compatible
+  - reg
+  - mediatek,irqs-map-range
+
+examples:
+  - |
+    mt58xx_intc0: interrupt-controller@1f2032d0 {
+      compatible = "mediatek,mt58xx-intc";
+      interrupt-controller;
+      #interrupt-cells = <0x3>;
+      interrupt-parent = <&gic>;
+      reg = <0x0 0x1f2032d0 0x0 0x30>;
+      mediatek,irqs-map-range = <0 63>;
+    };
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
