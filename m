Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3A1C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:06:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD9D22D04
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD9D22D04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vO2DCimWFPCInEpsoZPow9vuGEHpToYqGs7l6aia/14=; b=UGD3LCOBCKUI9XAzn6Vm43dKC
	g/c3mJACZLN3szqCWm3PJHrly0jAdwzi2XrXHizVY+ME8ihUNHJ1PRYrWBVdRiqyQTcApLxXZXvvN
	jwjWP4tHGb3Zw4rJx0nlqOY9mi/Q3BfiUr54sSLEjRaByI2+YECwZILbkKVTjx3899gajqsTXiWpe
	FT+V0EdsqU6SNx3/8O8/yrQg6c3Eku2dxsQAHMHUfDscEI+vDvJMYOZpuylNBcrYJrkPelghV7ICB
	zjGDB5HxO3zWRXzlhMQ+Vrl0AvvIb02db/gt5L5+G5irbe79vyXIFmXiUN34yjwiC06OOqo5YRSrN
	2dwfn8pyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4JMM-0007EJ-4R; Tue, 26 Jan 2021 08:05:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4JKd-0006L4-Dp; Tue, 26 Jan 2021 08:04:15 +0000
X-UUID: 83a89d0defb34553a7ea76fc48df8b81-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=W6cUiDaZ4xvwrwbBQpNMk9IyjHMRwYp79UaqO0DS0zM=; 
 b=HZEXpeDKiR7PbHiA/dmBYUAz1Mk/24kmkP3YEi1hig/QWy8/F+q7RjW5/oOsdWunSUX8VvZl1wfODuA+mmV7OAnUADGjsWe/tN6MvugixQHaTFMejc7o2dSHdGl7gx+rcRN0WeUjGBUZ7q20DPEET95v0+qKv0v+ltK//4AgAYc=;
X-UUID: 83a89d0defb34553a7ea76fc48df8b81-20210126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 185911087; Tue, 26 Jan 2021 00:04:04 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 00:04:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 16:03:55 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Jan 2021 16:03:55 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Subject: [PATCH V8 01/12] dt-bindings: soc: Add dvfsrc driver bindings
Date: Tue, 26 Jan 2021 16:03:43 +0800
Message-ID: <1611648234-15043-2-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
References: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_030411_694747_0ED3045A 
X-CRM114-Status: GOOD (  16.60  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the binding for enabling dvfsrc on MediaTek SoC.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 67 ++++++++++++++++++++++
 include/dt-bindings/interconnect/mtk,mt8183-emi.h  | 21 +++++++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
 create mode 100644 include/dt-bindings/interconnect/mtk,mt8183-emi.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
new file mode 100644
index 0000000..0b746a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/dvfsrc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek dynamic voltage and frequency scaling resource collector (DVFSRC)
+
+description: |
+  The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
+  HW module which is used to collect all the requests from both software and
+  hardware and turn into the decision of minimum operating voltage and minimum
+  DRAM frequency to fulfill those requests.
+
+maintainers:
+  - henryc.chen <henryc.chen@mediatek.com>
+
+properties:
+  reg:
+    description: DVFSRC common register address and length.
+
+  compatible:
+    enum:
+      - mediatek,mt6873-dvfsrc
+      - mediatek,mt8183-dvfsrc
+      - mediatek,mt8192-dvfsrc
+
+  '#interconnect-cells':
+    const: 1
+
+patternProperties:
+  dvfsrc-vcore:
+    type: object
+    description:
+      The DVFSRC regulator is modelled as a subdevice of the DVFSRC.
+      Because DVFSRC can request power directly via register read/write, likes
+      vcore which is a core power of mt8183. As such, the DVFSRC regulator
+      requires that DVFSRC nodes be present.
+    $ref: /schemas/regulator/regulator.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#interconnect-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/mtk,mt8183-emi.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dvfsrc@10012000 {
+            compatible = "mediatek,mt8183-dvfsrc";
+            reg = <0 0x10012000 0 0x1000>;
+            #interconnect-cells = <1>;
+            dvfsrc_vcore: dvfsrc-vcore {
+                    regulator-name = "dvfsrc-vcore";
+                    regulator-min-microvolt = <725000>;
+                    regulator-max-microvolt = <800000>;
+                    regulator-always-on;
+            };
+        };
+    };
diff --git a/include/dt-bindings/interconnect/mtk,mt8183-emi.h b/include/dt-bindings/interconnect/mtk,mt8183-emi.h
new file mode 100644
index 0000000..dfd143f
--- /dev/null
+++ b/include/dt-bindings/interconnect/mtk,mt8183-emi.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT8183_EMI_H
+#define __DT_BINDINGS_INTERCONNECT_MTK_MT8183_EMI_H
+
+#define MT8183_SLAVE_DDR_EMI			0
+#define MT8183_MASTER_MCUSYS			1
+#define MT8183_MASTER_GPU			2
+#define MT8183_MASTER_MMSYS			3
+#define MT8183_MASTER_MM_VPU			4
+#define MT8183_MASTER_MM_DISP			5
+#define MT8183_MASTER_MM_VDEC			6
+#define MT8183_MASTER_MM_VENC			7
+#define MT8183_MASTER_MM_CAM			8
+#define MT8183_MASTER_MM_IMG			9
+#define MT8183_MASTER_MM_MDP			10
+
+#endif
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
