Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73F8C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:02:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9905520739
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ShOA7sN9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QswppJNE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9905520739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8yynKm1esiqs/fE/KPNKKS5fq4auPM016yIyeTFCtY=; b=ShOA7sN9TJiojO
	IlQH0mzQLyxKefVK8gCIyvzptyjpDn7Wau50833sHkznuYlqTm1Ecn1fUVhoY63KaGlQdOk92Y/hS
	daHuMHKElaknnevZ+y/MzC2wFeh6JTTAR+MSJ00H3dTRTHLik4QTcnwqWlzas9gUao1Jfi3i5GwN/
	cMgLM9+E1g56orpDm09Bv27zljdWEh64xTfSPLaqH5X1PLhq0+j4mruGdEPBTfnvqJcUljeCMVQk7
	tAQWgGKMVnbTlMfpkN5PZCFGLKj/4XsnLPw8k3jsm3mh82XTO4NYsc36RgDByc9CSgxHy3NiFklfI
	QbuPMu7Yjyw3bsrwODug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmDXX-0005Wb-My; Fri, 19 Jun 2020 09:42:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmDXL-0005ME-3M; Fri, 19 Jun 2020 09:42:16 +0000
X-UUID: bae763d8d5284383a1462e4494f386ac-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h/UQEjXf6uvMc+oxKD1tqte0usDqTFwha7l55rvLaKo=; 
 b=QswppJNE8Ds+KTlNb4GTUjbx8Mwd1ZIxbpmoFoyOHYUXyHOIIwYqL8ynRW3GxH8zBjnuM1YgwGjf2KhNut+MBfyImRbeDnJ+Nu4q3pXCydo/Qn8JShmRu1SXVeq8e7lY5vcKREp3tjDwhWm4UpXbkVuHh53LoF+F7EkzZwf1AmA=;
X-UUID: bae763d8d5284383a1462e4494f386ac-20200619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 717118113; Fri, 19 Jun 2020 01:42:57 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 02:42:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 17:42:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Jun 2020 17:42:01 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: devapc: add bindings for devapc-mt6873
Date: Fri, 19 Jun 2020 17:41:59 +0800
Message-ID: <1592559720-8482-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592559720-8482-1-git-send-email-neal.liu@mediatek.com>
References: <1592559720-8482-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_024215_150512_34716A72 
X-CRM114-Status: GOOD (  10.15  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings for MT6873 devapc.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 .../soc/mediatek/devapc/devapc-mt6873.yaml         |   61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml
new file mode 100644
index 0000000..1deb7f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# # Copyright 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/devapc/devapc-mt6873.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek MT6873 Device Access Permission Control driver
+
+description: |
+  MediaTek MT6873 bus frabric provides TrustZone security support and data
+  protection to prevent slaves from being accessed by unexpected masters.
+  The security violations are logged and sent to the processor for further
+  analysis and countermeasures.
+
+maintainers:
+  - Neal Liu <neal.liu@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6873-devapc
+
+  reg:
+    description: The base address of devapc register bank
+    maxItems: 5
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8183-clk.h>
+    devapc: devapc@10207000 {
+            compatible = "mediatek,mt6873-devapc";
+            reg = <0 0x10207000 0 0x1000>,
+                  <0 0x10274000 0 0x1000>,
+                  <0 0x10275000 0 0x1000>,
+                  <0 0x11020000 0 0x1000>,
+                  <0 0x1020e000 0 0x1000>;
+            interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+            clock-names = "devapc-infra-clock";
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
