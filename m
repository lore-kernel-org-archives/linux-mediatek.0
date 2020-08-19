Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A65C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 03:51:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D0292078B
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 03:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cuSKLuhz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RfSu+rcZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D0292078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H52dTxr3kujmcEMsW89sWSCsoWk09CW7vTqmwHzms2c=; b=cuSKLuhzk+yHDNJEeAk+EZLqf
	e18tKP+Y2DUhvxtoe0L4LbXcu7Ay8sMK9BeCf7WQkD3hZMnFWSynmr+Pejwq4YwULjdwlrQSGdgyH
	ibrpUZmH+oW0ojfR2GDo4bJmj2naNAuni5rpSdnf3h7CNQkCq3eWEdVRPt1xWsNtSLZ96IQwDxIIR
	0Ma8N4O3l5zwS6LsabkL5kNo8YVEDLjcGZ071YNMFemUMuraxYAuVRiwblkpZLM77mb0npAdFBy1Z
	pIqeqUhYuj7sRVWpKqNMtuki3vQnJ3brGCBeUvZztmY1jVlyaSabL0g4Ewl2dqCPwJNB1WGe+Cg7S
	zUwcBVyTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8F8a-0004wj-63; Wed, 19 Aug 2020 03:51:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8F8U-0004ue-3T; Wed, 19 Aug 2020 03:51:39 +0000
X-UUID: 1e36a9f7fb594d59abcaff7e16aa9929-20200818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kpBsxONTkkbc5bOYHR9hFMap17MiXFktP1dZs/pBlQA=; 
 b=RfSu+rcZUd3Cub/Xyz1jxH+TTd6MqM4ZtiXa3/zxdvv76GbCWgR25ZQ35bQz/wG0L+4OInFwm6XTG7K1ADSxbeQYBv0hhl/4SsyVGEOuGarLMt9RlMQKbKO4hmOFIo0lRk//LBHrIkXyvEBCXtrg30LGtwwra3NtPjCdbSLVEC4=;
X-UUID: 1e36a9f7fb594d59abcaff7e16aa9929-20200818
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 865665168; Tue, 18 Aug 2020 19:51:33 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 20:42:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 11:42:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Aug 2020 11:42:40 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>
Subject: [PATCH 2/2] dt-bindings: interrupt-controller: Add MStar interrupt
 controller
Date: Wed, 19 Aug 2020 11:42:31 +0800
Message-ID: <20200819034231.20726-3-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200819034231.20726-1-mark-pk.tsai@mediatek.com>
References: <20200819034231.20726-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_235138_377336_E1883A5A 
X-CRM114-Status: GOOD (  15.95  )
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
 yj.chiang@mediatek.com, daniel@0x0f.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, mark-pk.tsai@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding for MStar interrupt controller.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 .../interrupt-controller/mstar,mst-intc.yaml  | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
new file mode 100644
index 000000000000..6e383315e529
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mstar,mst-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar Interrupt Controller
+
+maintainers:
+  - Mark-PK Tsai <mark-pk.tsai@mediatek.com>
+
+description: |+
+  MStar, SigmaStar and Mediatek DTV SoCs contain multiple legacy
+  interrupt controllers that routes interrupts to the GIC.
+
+  The HW block exposes a number of interrupt controllers, each
+  can support up to 64 interrupts.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: mstar,mst-intc
+      - enum:
+          - mediatek,mt58xx-intc
+
+  interrupt-controller: true
+
+  "#address-cells":
+    enum: [ 0, 1, 2 ]
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+  "#interrupt-cells":
+    const: 3
+    description: |
+      Use the same format as specified by GIC in arm,gic.yaml.
+
+  reg:
+    description: |
+      Physical base address of the mstar interrupt controller
+      registers and length of memory mapped region.
+    minItems: 1
+
+  mstar,irqs-map-range:
+    description: |
+      The range of parent interrupt controller's interrupt lines
+      that are hardwired to mstar interrupt controller.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      minItems: 2
+      maxItems: 2
+
+  mstar,intc-no-eoi:
+    description: |
+      Mark this controller has no End Of Interrupt(EOI) implementation.
+      This is a empty, boolean property.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - mstar,irqs-map-range
+
+additionalProperties: false
+
+examples:
+  - |
+    mst_intc0: interrupt-controller@1f2032d0 {
+      compatible = "mstar,mst-intc", "mediatek,mt58xx-intc";
+      interrupt-controller;
+      #interrupt-cells = <3>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      interrupt-parent = <&gic>;
+      reg = <0x1f2032d0 0x30>;
+      mstar,irqs-map-range = <0 63>;
+    };
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
