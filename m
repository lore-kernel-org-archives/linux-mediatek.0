Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A63C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 07:08:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DCB20874
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 07:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qnwTtrsj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GW/3TiTt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67DCB20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LwzXTX1EWuCxmCaxTXVT2qBsoWPQGRchEhr1IIer7+k=; b=qnwTtrsjirZ+N2AXY1nyqkId0
	9jkIc4kHuZEnOAPhhy/7odJGzfP4PvSfmiVQhHROxjdRJL00IBlEOCBiEVqoUQTE0aHpPzTDQq3cF
	nvPTHfEUKC2vPwnt11dAbHTH7LCpBNZFishNAaWNPaKYctHHEkqTsZtx/dUXhL/3tdPymNzz0Bs6O
	qWYkHuRxX2uJtLPAkZd2qBYBXtzysxfTRH/lhhuWFz51Psmd8dn73NUh62a5dK+DL3QxZvppJ78If
	xe0eBSIUWZFJ7p/rKUyp7l2LX49t2wQ4NNWVJFUyblr9IlOlT94B/f+9p0wjQeHqTpa8dsC2M9pLW
	DsmORfqHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqtKe-0003I5-Hp; Thu, 02 Jul 2020 07:08:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqtKY-0003Fn-B5; Thu, 02 Jul 2020 07:08:23 +0000
X-UUID: 48c91235c0244e10945183a388004ab2-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=n0+3nalOnCe5kMDaPoGslleQoLkeFnp/IEmHOyucpjg=; 
 b=GW/3TiTtQBGR+W0bPTqqRJ8354WU+piTOHrka2NBgnXNzLt4uXWZ0oaFJHcbC3kAZi2awj1Itb+HldkgETDiM+ENIEFAgqCD3uE8tahKHn0xybX0SG5AiVLM2RSr2bulqMe4bNmoDWIBXkZx+Upn1Oeo9T6NC2KmEYD2XHhr8ZY=;
X-UUID: 48c91235c0244e10945183a388004ab2-20200701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 752761087; Wed, 01 Jul 2020 23:08:14 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 00:06:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 15:06:06 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Jul 2020 15:06:08 +0800
From: EastL Lee <EastL.Lee@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v6 1/4] dt-bindings: dmaengine: Add MediaTek Command-Queue DMA
 controller bindings
Date: Thu, 2 Jul 2020 15:06:01 +0800
Message-ID: <1593673564-4425-2-git-send-email-EastL.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1593673564-4425-1-git-send-email-EastL.Lee@mediatek.com>
References: <1593673564-4425-1-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F3A085BAD89C115B095C1B7865FA2C326AC77083018D7895F5C7BDECC91F38FB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_030822_894745_CC84C257 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 EastL Lee <EastL.Lee@mediatek.com>, dmaengine@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the devicetree bindings for MediaTek Command-Queue DMA controller
which could be found on MT6779 SoC or other similar Mediatek SoCs.

Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
---
 .../devicetree/bindings/dma/mtk-cqdma.yaml         | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
new file mode 100644
index 0000000..83ed742
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/mtk-cqdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Command-Queue DMA controller Device Tree Binding
+
+maintainers:
+  - EastL Lee <EastL.Lee@mediatek.com>
+
+description:
+  MediaTek Command-Queue DMA controller (CQDMA) on Mediatek SoC
+  is dedicated to memory-to-memory transfer through queue based
+  descriptor management.
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  "#dma-cells":
+    minimum: 1
+    maximum: 255
+    description:
+      Used to provide DMA controller specific information.
+
+  compatible:
+    oneOf:
+      - const: mediatek,mt6765-cqdma
+      - const: mediatek,mt6779-cqdma
+
+  reg:
+    minItems: 1
+    maxItems: 5
+    description:
+        A base address of MediaTek Command-Queue DMA controller,
+        a channel will have a set of base address.
+
+  interrupts:
+    minItems: 1
+    maxItems: 5
+    description:
+        A interrupt number of MediaTek Command-Queue DMA controller,
+        one interrupt number per dma-channels.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: cqdma
+
+  dma-channel-mask:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+       For DMA capability, We will know the addressing capability of
+       MediaTek Command-Queue DMA controller through dma-channel-mask.
+    items:
+      minItems: 1
+      maxItems: 63
+
+  dma-channels:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Number of DMA channels supported by MediaTek Command-Queue DMA
+      controller, support up to five.
+    items:
+      minItems: 1
+      maxItems: 5
+
+  dma-requests:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Number of DMA request (virtual channel) supported by MediaTek
+      Command-Queue DMA controller, support up to 32.
+    items:
+      minItems: 1
+      maxItems: 32
+
+required:
+  - "#dma-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dma-channel-mask
+  - dma-channels
+  - dma-requests
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt6779-clk.h>
+    cqdma: dma-controller@10212000 {
+        compatible = "mediatek,mt6779-cqdma";
+        reg = <0x10212000 0x80>,
+            <0x10212080 0x80>,
+            <0x10212100 0x80>;
+        interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>,
+            <GIC_SPI 140 IRQ_TYPE_LEVEL_LOW>,
+            <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&infracfg_ao CLK_INFRA_CQ_DMA>;
+        clock-names = "cqdma";
+        dma-channel-mask = <63>;
+        dma-channels = <3>;
+        dma-requests = <32>;
+        #dma-cells = <1>;
+    };
+
+...
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
