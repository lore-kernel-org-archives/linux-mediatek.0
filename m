Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46AEC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 10:07:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFE222253
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 10:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y7moU3s1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Nuc575SQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BFE222253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DjoJiOCABg3S6rDBXNX9zF2HKsXVr3YYgRGq2iIH+to=; b=Y7moU3s1Jh1F4r3KADmBuqHdg
	hvRndtphn0SHoifozN/dTjoUSty6TBRNe9yRIdUiCEHwqwvBlAWtOltunRlVoIDQ3kvprRLPtkQ4D
	kYLyD4px2jp/SzjVRVT4fXYSme+uWseHjSJXkcQ9wUXvc8FwaSauOlo/UTceo3ZVVKmmivcZ/A1C7
	mpOsnVlRZ2UA+lb+wCsA+QgZY4edZ4Z4HICw7sVnWJKVEnxXHNd11IyMe+JZOD4XWbN+SqXyJCCot
	GpM7fX1q7+cqzt6Fwi8dFANiamAYHIJAsZnf0y1HQHjXv2433ruyEkCSUpsZ+85eFsqVeg0Mg4RAN
	+LE+hvJWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUoYU-00077l-Q4; Tue, 20 Oct 2020 10:07:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUoYI-00073f-60; Tue, 20 Oct 2020 10:07:35 +0000
X-UUID: 23c00f315be44323b9323db87abb7880-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qfBpt2yRRSl7Y0IIx6HSJ15aOq766nROGum9UitxWik=; 
 b=Nuc575SQsxnuwXRrX4xkEOcy2vroV4iJ5kghR30jzXmhiGq5KOY8c4T3fHRz7NX7w/dOTtPhb/64chs7fwK/lMX9AErZLnn0SqdBF3+gu9DE1mF+3H6SfP3xpS3P8lLR+PzacPybMUi3C7/Mh7/cnVNIliykuvVDLgCVZ0Z8zbU=;
X-UUID: 23c00f315be44323b9323db87abb7880-20201020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1096577569; Tue, 20 Oct 2020 02:07:29 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 02:57:27 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 17:57:24 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Oct 2020 17:57:26 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: regulator: document binding for MT6315
 regulator
Date: Tue, 20 Oct 2020 17:56:49 +0800
Message-ID: <1603187810-30481-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_060734_453353_4AC5415A 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hsin-Hsiung
 Wang <hsin-hsiung.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device tree binding information for MT6315 regulator driver.
Example bindings for MT6315 are added.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 .../regulator/mtk,mt6315-regulator.yaml       | 88 +++++++++++++++++++
 include/dt-bindings/regulator/mtk,mt6315.h    | 17 ++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mtk,mt6315.h

diff --git a/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
new file mode 100644
index 000000000000..457606800d5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mtk,mt6315-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6315 Regulator
+
+maintainers:
+  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
+
+description: |
+  The MT6315 is a power management IC (PMIC) configurable with SPMI.
+  that contains 4 BUCKs output which can combine with each other
+  by different efuse settings.
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  $nodename:
+    pattern: "mt6315@[0-9]"
+  compatible:
+    enum:
+      - mediatek,mt6315_3-regulator
+      - mediatek,mt6315_6-regulator
+      - mediatek,mt6315_7-regulator
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: List of regulators and its properties
+
+    patternProperties:
+      "^vbuck[1-4]$":
+        type: object
+
+        properties:
+          regulator-name:
+            pattern: "^vbuck[1-4]$"
+            description:
+              should be "vbuck1", ..., "vbuck4"
+
+          mtk,combined-regulator:
+            $ref: "/schemas/types.yaml#/definitions/uint32-array"
+            description: |
+              defines other bucks combined with this buck, must contain the following
+              values MT6315_VBUCK1, MT6315_VBUCK2, MT6315_VBUCK3, MT6315_VBUCK4
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    /* This example shows that buck2 and buck4 are combined into buck1. */
+    #include <dt-bindings/regulator/mtk,mt6315.h>
+
+    mt6315@6 {
+      compatible = "mediatek,mt6315_6-regulator";
+      reg = <0x6 0 0xb 1>;
+
+      regulators {
+        vbuck1 {
+          regulator-compatible = "vbuck1";
+          regulator-min-microvolt = <300000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-enable-ramp-delay = <256>;
+          regulator-allowed-modes = <0 1 2 4>;
+          mtk,combined-regulator = <MT6315_VBUCK2 MT6315_VBUCK4>;
+        };
+
+        vbuck3 {
+          regulator-compatible = "vbuck3";
+          regulator-min-microvolt = <300000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-enable-ramp-delay = <256>;
+          regulator-allowed-modes = <0 1 2 4>;
+        };
+      };
+    };
diff --git a/include/dt-bindings/regulator/mtk,mt6315.h b/include/dt-bindings/regulator/mtk,mt6315.h
new file mode 100644
index 000000000000..6ed9b2b121db
--- /dev/null
+++ b/include/dt-bindings/regulator/mtk,mt6315.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_REGULATOR_MTK_MT6315_H
+#define _DT_BINDINGS_REGULATOR_MTK_MT6315_H
+
+/* Regulator ID */
+#define MT6315_VBUCK1	1
+#define MT6315_VBUCK2	2
+#define MT6315_VBUCK3	3
+#define MT6315_VBUCK4	4
+#define MT6315_VBUCK_MAX	5
+
+#endif /* _DT_BINDINGS_REGULATOR_MTK_MT6315_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
