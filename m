Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B98C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:34:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C347320758
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KsK/Y4ri";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L0GglRgr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C347320758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VDxLD/hWUowSe3ceHES3Qf18j2ZhS1XVyNl45PUiH7I=; b=KsK/Y4ribCKSb5S65hMwHMn1u
	lbwC1yRiNDK+Zbg/885ofWIOY0zJUTr469qoMmsB97xfJ9mLB/i/Q1gxshEf7Vn8Aqon+fSNYO8Kz
	2R21SUz1LNq1RRcwzyzCM7CP2dGJVfxpus2qw3ZmQw2XTPCBwhl7fSAHFZ/VXmmod2wlMAiaXMBGJ
	Bju0Lk0kL30DOCNTh6f+Sod1GaHMSkYs4r7yK45Gmmlxye1twtRI5itrdRwVcVCSLEGNZ0JsPtYXt
	jvOSl3ezXPkN7Eolh3Dkm9qBrHRkdxP8mY4IvsAE2HUsmsoxI3pm0+1Cj+NcuY/Gnr+CfZMqmUo5i
	woUvqjD0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMLh-0001tI-0B; Wed, 02 Sep 2020 06:34:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMLc-0001py-AV; Wed, 02 Sep 2020 06:34:21 +0000
X-UUID: 691249e71d06437ebfc1e0775f973734-20200901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=t/mmIReHAuUCSGNHgLFwXSx2t7ItYAk8SFunmzCQg/w=; 
 b=L0GglRgrtTVb+znavw1s5/tOgP2Lrkn+QNYIDyUgLRh1b7R+AZrAdQiHcAM2T5yk8yXDW3Mm90VdKt46VwX5SPGmAyw2b/LZungNDUa2L3a6D7UPfPBxZzK9EVJORG7BgZ8SiGujEjHwnDzqeA1/wGF9R0DV3HdBR9qbKsBHyNA=;
X-UUID: 691249e71d06437ebfc1e0775f973734-20200901
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1209470942; Tue, 01 Sep 2020 22:34:08 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 23:34:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 14:34:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Sep 2020 14:34:05 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 2/2] dt-bindings: interrupt-controller: Add MStar interrupt
 controller
Date: Wed, 2 Sep 2020 14:33:44 +0800
Message-ID: <20200902063344.1852-3-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200902063344.1852-1-mark-pk.tsai@mediatek.com>
References: <20200902063344.1852-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_023420_507750_AABD7B88 
X-CRM114-Status: GOOD (  14.87  )
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
 linux-mediatek@lists.infradead.org, mark-pk.tsai@mediatek.com,
 matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding for MStar interrupt controller.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 .../interrupt-controller/mstar,mst-intc.yaml  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
new file mode 100644
index 000000000000..bbf0f26cd008
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+  MStar, SigmaStar and Mediatek TV SoCs contain multiple legacy
+  interrupt controllers that routes interrupts to the GIC.
+
+  The HW block exposes a number of interrupt controllers, each
+  can support up to 64 interrupts.
+
+properties:
+  compatible:
+    const: mstar,mst-intc
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+    description: |
+      Use the same format as specified by GIC in arm,gic.yaml.
+
+  reg:
+    maxItems: 1
+
+  mstar,irqs-map-range:
+    description: |
+      The range <start, end> of parent interrupt controller's interrupt
+      lines that are hardwired to mstar interrupt controller.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      minItems: 2
+      maxItems: 2
+
+  mstar,intc-no-eoi:
+    description:
+      Mark this controller has no End Of Interrupt(EOI) implementation.
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
+      compatible = "mstar,mst-intc";
+      interrupt-controller;
+      #interrupt-cells = <3>;
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
