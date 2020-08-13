Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A86C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 03:38:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FEAC20715
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 03:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wezM58G6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t+mGcLs4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FEAC20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QczYVrDRBc4lNDBcnrCRPnj/bq8B1C1SXrJSFSZU2ec=; b=wezM58G6E5Vu2XdvQjgx2MUUN
	IGQr5S5KWmXMk9gIG9K5suxNZaWKTNnngX5hUVbSZigXGmgEJCPe4ahwpx7rGu5vUX5Bo4Q3t8+TL
	7kRjCmyzS+ql5LPCFrugJBsdFQAhTFOhJMJLiIOvIzr2EUEIJFF7Ka2Mky9/ovw2ub9rOzBGzpp3H
	wYJUo8de516WTKC74qjZak7sFGyutvdX4EAq3EAHYzEywG2nhhtiUGx8KFQkqN4rZCE7yEopS90pt
	HtKZqDYZ9HuMt7DsiGSYgOH0oiTCCkHoQjK4Knq6iYIqBJmc+tWyIw5EuE8SaBqAd9d+vjkP+WoXd
	ucBB8Lsyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k644X-0001Q1-7K; Thu, 13 Aug 2020 03:38:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k644R-0001OV-6E; Thu, 13 Aug 2020 03:38:28 +0000
X-UUID: 4308b41641974be39954b889c3dc7dfa-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2RA0I88lr0d0hGwKF//MrgxKAUGZdVtcyAh7Z0um5Ig=; 
 b=t+mGcLs4qr8yQZqMbji0L1hPsyILNR1ZEK012/nUlVQyEWTInYN6BZyatnAS6MaJDWYCenRcPvLZ/d+cU5zFKa6Rzc2ofJu77ipxMSDzTTwFx05srHTPimrwqxz6pO/uOEz8p/8JN1+DHcauds3f0LYs5iXQ4bMKrON3y+IyHHU=;
X-UUID: 4308b41641974be39954b889c3dc7dfa-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 455442446; Wed, 12 Aug 2020 19:38:21 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 20:32:48 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 11:32:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Aug 2020 11:32:45 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 1/2] dt-bindings: devapc: add bindings for mtk-devapc
Date: Thu, 13 Aug 2020 11:32:43 +0800
Message-ID: <1597289564-17030-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1597289564-17030-1-git-send-email-neal.liu@mediatek.com>
References: <1597289564-17030-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 14B51AB0D27EF23E40AD7A93FACC370BC251B4A5A0321C04356A09D49039A5062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_233827_382044_77599FF0 
X-CRM114-Status: GOOD (  14.86  )
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
 .../devicetree/bindings/soc/mediatek/devapc.yaml   |   58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
new file mode 100644
index 0000000..6c763f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -0,0 +1,58 @@
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
+    #include <dt-bindings/clock/mt6779-clk.h>
+
+    devapc: devapc@10207000 {
+      compatible = "mediatek,mt6779-devapc";
+      reg = <0x10207000 0x1000>;
+      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+      clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
+      clock-names = "devapc-infra-clock";
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
