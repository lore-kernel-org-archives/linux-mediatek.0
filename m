Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5712C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 09:13:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACA8206E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 09:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XYNdgMWV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VNy6BSxH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AACA8206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qYhA/0lA7ysmJ1e73FqOto9u/MPIzzQjTjUQkJMqZoc=; b=XYNdgMWVo/53aQkQ9k4Y+codH
	GMjVQ2SHjhDWBjjIAzn5kAGTgZTl/75T/5o2ctQ5u1EnY8baI2h2mHdSLZ7MEuwwjw84AFTg7hmjj
	6zgZurMqa67eggxUZWom2SMW2m02GOoY5y0MHXQgZDzjMHyXT3r9NKiJSIIWAvUFp7fmOnxBaOEqV
	KBndQm0MQ2R7As2f3hG0q4HwF2uTPo7siecc09qU1Ze1FVdKu3fiwTowaKBfq9jz24AzUOUqtPeVt
	rkhHBhAmcVnRxq78bDMlWo2QBDkJLQj3f+anldxrirF488NhbUh8V7tYnbwMnIaQu2jtJhZ9UQwNc
	hXVAb6R+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtSc1-0002jW-Ie; Thu, 09 Jul 2020 09:13:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtSbV-0002RE-UA; Thu, 09 Jul 2020 09:12:31 +0000
X-UUID: 10449be2ca704ce3a1322a6c67a20163-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qd/l2ng/0l+Gi9Tf+m12gtyHV45xTKoWAIi8K6LgRjc=; 
 b=VNy6BSxHnYazrySmA/dMhTYlhRv40eKlsB/J65eTLTbp8/aPKqfn537gPxKo0pHspLDEUzefx0PJSsjTODuke2a3PkGq+zziBbyLwMKrYjcTa+rSirFHTBeR4SBmRgo7ko8BsgClFLvARH8zxIB0aVlCxfVz5eqw1+bbMn96qKc=;
X-UUID: 10449be2ca704ce3a1322a6c67a20163-20200709
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1969847999; Thu, 09 Jul 2020 01:12:13 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 02:12:20 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 17:12:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 9 Jul 2020 17:12:18 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: devapc: add bindings for mtk-devapc
Date: Thu, 9 Jul 2020 17:12:06 +0800
Message-ID: <1594285927-1840-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0E15991C4C7F97952111FB4DE219BB39A44992477E5D35D7CD0F363BB37AF36B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_051230_117589_65243029 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings for mtk-devapc.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/devapc.yaml   |   82 ++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
new file mode 100644
index 0000000..f08243e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# # Copyright 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/devapc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Device Access Permission Control driver
+
+description: |
+  MediaTek bus fabric provides TrustZone security support and data
+  protection to prevent slaves from being accessed by unexpected masters.
+  The security violation is logged and sent to the processor for further
+  analysis and countermeasures.
+
+maintainers:
+  - Neal Liu <neal.liu@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6779-devapc
+
+  reg:
+    description: The base address of devapc register bank
+    maxItems: 1
+
+  interrupts:
+    description: A single interrupt specifier
+    maxItems: 1
+
+  clocks:
+    description: Contains module clock source and clock names
+    maxItems: 1
+
+  clock-names:
+    description: Names of the clocks list in clocks property
+    maxItems: 1
+
+  mediatek-slv_type_num:
+    description: Numbers of slave type in mediatek platform
+    maxItems: 1
+
+  mediatek-vio_dbgs:
+    description: The mask bit and start bit of devapc violation debug registers
+    maxItems: 5
+
+  mediatek-pds_offset:
+    description: The offset of devapc pds registers
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - mediatek-slv_type_num
+  - mediatek-vio_dbgs
+  - mediatek-pds_offset
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt6779-clk.h>
+
+    devapc: devapc@10207000 {
+      compatible = "mediatek,mt6779-devapc";
+      reg = <0x10207000 0x1000>;
+      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+      clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
+      clock-names = "devapc-infra-clock";
+
+      mediatek-slv_type_num = /bits/ 8 <1>;
+      mediatek-vio_dbgs = <0x0000FFFF 0x0>,
+                          <0x003F0000 0x10>,
+                          <0x00400000 0x16>,
+                          <0x00800000 0x17>,
+                          <0x0F000000 0x18>;
+      mediatek-pds_offset = <0x0 0x400 0x900 0x904
+                             0xF00 0xF10 0xF14 0xF20>;
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
