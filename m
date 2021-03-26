Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1673C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 07:34:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E8261A2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 07:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E8261A2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Urh+4msIkDkXIjEIhCx0jD/k7EiMn9X1WLupr1x0kI=; b=OX9/l12xl3RUGDwoZCz+BrXPCn
	/PGh7D+po26sa3Pe1rBWQnyfG8EKOsTVpN0aHjJf/qwsbvV3AHhtVAcDCJjII1z3pm9X2RcZ/QnbP
	GB2drpgRwCfvd+uqgeZqtgTC2a2bESKUw0BeBOMfEJP+/+6ckehkOWcJmU+W1mlP1YBpqksn1LGj+
	FWxWIsDYYKx38pRqLE/fEqh3YxhQBAiTbLDXz3cwV4mK+/jA6cw+GlRGMLbMQnTOQiAeqVClOdARg
	BxUr5xxkbHQBcFc9w8tb6jLzZYWwhWe2nC814bW1hMUn0azVFYCTtxZsc9BPJbW2lLoh+gCWFq9nN
	AN+3t5FQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPgyY-002xwr-Iq; Fri, 26 Mar 2021 07:33:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPgyM-002xvl-SZ; Fri, 26 Mar 2021 07:33:44 +0000
X-UUID: 727513e6f30b42d6a5ad5911aa096b6b-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gWy12iimMUoa2ZqKooJcpgbWNbQ2hoE5zxx6YuR7JQo=; 
 b=MtJ5H2JECZ+76NLRLjgFKE+ATUthhd/jRtvmQKqcTvgQEgQ4KTq7ZhcPTYcmvGEg1Tt+EsNR8dlEu1JasXqgQijGp7B88JxxFf8dPrUwglqZ7m7g3euNfPbsMfJ9zAtFTG2iQ8TfXHL/de8zUW6XzJL5W8+XS+kUP5PKMIj3LSE=;
X-UUID: 727513e6f30b42d6a5ad5911aa096b6b-20210325
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1957266613; Thu, 25 Mar 2021 23:33:23 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 00:33:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 15:33:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Mar 2021 15:33:19 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Nina Wu <Nina-CM.Wu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: devapc: Update bindings
Date: Fri, 26 Mar 2021 15:31:10 +0800
Message-ID: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_073335_657778_CE1D6334 
X-CRM114-Status: GOOD (  10.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Nina Wu <Nina-CM.Wu@mediatek.com>

To support newer hardware architecture of devapc,
update device tree bindings.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/devapc.yaml   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
index 31e4d3c..489f6a9 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -20,9 +20,27 @@ properties:
   compatible:
     enum:
       - mediatek,mt6779-devapc
+      - mediatek,mt8192-devapc
+
+  version:
+    description: The version of the hardware architecture
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+    maxItems: 1
+
+  slave_type_num:
+    description: The number of the devapc set
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 4]
+    maxItems: 1
 
   reg:
     description: The base address of devapc register bank
+    maxItems: 4
+
+  vio_idx_num:
+    description: The number of the devices controlled by devapc
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     maxItems: 1
 
   interrupts:
@@ -39,7 +57,10 @@ properties:
 
 required:
   - compatible
+  - version
+  - slave_type_num
   - reg
+  - vio_idx_num
   - interrupts
   - clocks
   - clock-names
@@ -53,8 +74,28 @@ examples:
 
     devapc: devapc@10207000 {
       compatible = "mediatek,mt6779-devapc";
+      version = <1>;
+      slave_type_num = <1>;
       reg = <0x10207000 0x1000>;
+      vio_idx_num = <511>;
       interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
       clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
       clock-names = "devapc-infra-clock";
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8192-clk.h>
+
+    devapc: devapc@10207000 {
+        compatible = "mediatek,mt8192-devapc";
+        version = <2>;
+        slave_type_num = <4>;
+        reg = <0 0x10207000 0 0x1000>,
+            <0 0x10274000 0 0x1000>,
+            <0 0x10275000 0 0x1000>,
+            <0 0x11020000 0 0x1000>;
+        vio_idx_num = <367 292 242 58>;
+        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
+        clock-names = "devapc-infra-clock";
+    };
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
