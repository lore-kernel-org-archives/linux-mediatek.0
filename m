Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBDFC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 04:09:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0FC420B1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 04:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GpuY6u0A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eTPDNR0k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0FC420B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QczYVrDRBc4lNDBcnrCRPnj/bq8B1C1SXrJSFSZU2ec=; b=GpuY6u0A2lLyVwCOkts96R+b8
	JKNX6VN0KoDdXGhnzKUlmuLz0YMIqhh0La9i523lVsUwEDZPgliM27ymYYKmalmfxcCm5/0eI/LRC
	Xz0fl+FeHd3P+RsO1ZmXOasc87Aaf1cwwYluk4sHCP+ca+FvqdG8pjik9bVMfLfXcxw4smBA/iBdn
	8e8troBvjIgIYR2SQBLj+CJmtrMZH/V9MmcWxpK+iNtNR2zqYwcKj2mFdJkk4klbF4h60W2vFQwVi
	0SSKvnYsicp8tbqvJpCWOIyEcg2D9JVp1C/fjZrsCQKxhgMeHAv96hQs/5SS9c2A13Iz/5a4BWpPk
	h/2/bRYZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxjag-0004jx-5w; Tue, 21 Jul 2020 04:09:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxjab-0004jF-Fk; Tue, 21 Jul 2020 04:09:14 +0000
X-UUID: 07de086dc3c84b3eb9ebebba72ff0675-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2RA0I88lr0d0hGwKF//MrgxKAUGZdVtcyAh7Z0um5Ig=; 
 b=eTPDNR0kdG5R3f+/dtnzxVA5eVH16q81XpFb1uwpldYJIdkqPvUBmi7xRiZW2rB9QJfyOdpOW77cmB3M2C/FmOF64V1palSQIv8UcK3PdiSurLwgHsncct7TlHB3e5bEsUBQCm2md0DvhfvpPJoF87DC94IxjWOlMbZZONNtQsc=;
X-UUID: 07de086dc3c84b3eb9ebebba72ff0675-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1315575795; Mon, 20 Jul 2020 20:09:04 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 20:59:40 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 11:59:33 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Jul 2020 11:59:33 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: devapc: add bindings for mtk-devapc
Date: Tue, 21 Jul 2020 11:59:30 +0800
Message-ID: <1595303971-8793-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595303971-8793-1-git-send-email-neal.liu@mediatek.com>
References: <1595303971-8793-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_000913_747134_B22C975E 
X-CRM114-Status: GOOD (  13.72  )
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
