Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E76C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 04:41:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC4B207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 04:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWJpbalA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="K52JGkP7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAC4B207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UI4rRWpuB5uDNaqDPMrLOBBkuM8w/24PafcHO41LA+E=; b=mWJpbalAkBD2+xIHTOW9MxIIt
	Xf4IofiHeP9+ZHzJFaz6wCdHrLEcPyf3eJGf8WSocufaiPjPPb1L+qW5KwOZPXGyZCs0f897mLm/P
	ZIjbaThG+LriAaVff55Z8giBf1g4StlhaDXh2hsZYO/Wk2QbifSsnrGMkkbcaXGsWhANQV4KIYnS8
	z7EnGg6AfDXZrVciUmH//GYQDwSvq/YkDdZimZ5QmzBZlOgw7PgQNyPbAuzRp7vN4D1Ae6jGmgQKF
	oEBAaYJ5x4yN0kdFNMYf6bvNUJaYNgdISCNZztiD6Pb4DYvKLmGtqPRf6Y6NgW9BG22Bd3tTz+t7F
	ej8bwXUdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGEOl-0000Z3-IR; Thu, 10 Sep 2020 04:41:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGEOZ-0000S5-R0; Thu, 10 Sep 2020 04:41:18 +0000
X-UUID: d38d313d5aec468fba198bd8026dd078-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gd8IHDDlRyngneuXbVMKDrh2dBx36h1OwZpzKd/37SU=; 
 b=K52JGkP7ASbkMCc3MZffgql64SbXWkuhRAQz9MgyrXLElIQGKzphSBJzbXQ+746RzaLZB8VHX8pMHmFskG3dNm6V99YhyHqW4cgb1QOIYMN5/jiZZLy7u6a0fkavCcrfUgUfoEujQZAckEPqGp5Gaaii0n02vjpxMtNXy4xr8sY=;
X-UUID: d38d313d5aec468fba198bd8026dd078-20200909
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 255139201; Wed, 09 Sep 2020 20:41:10 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 21:31:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 12:31:06 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Sep 2020 12:31:06 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Date: Thu, 10 Sep 2020 12:31:02 +0800
Message-ID: <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_004116_079201_9FFD1B22 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: hector.yuan@mediatek.com, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Add devicetree bindings for MediaTek HW driver.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  141 ++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
new file mode 100644
index 0000000..118a163
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek's CPUFREQ Bindings
+
+maintainers:
+  - Hector Yuan <hector.yuan@mediatek.com>
+
+description:
+  CPUFREQ HW is a hardware engine used by MediaTek
+  SoCs to manage frequency in hardware. It is capable of controlling frequency
+  for multiple clusters.
+
+properties:
+  compatible:
+    const: "mediatek,cpufreq-hw"
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description: |
+      Addresses and sizes for the memory of the HW bases in each frequency domain.
+
+  reg-names:
+    items:
+      - const: "freq-domain0"
+      - const: "freq-domain1"
+    description: |
+      Frequency domain name. i.e.
+      "freq-domain0", "freq-domain1".
+
+  "#freq-domain-cells":
+    const: 1
+    description: |
+      Number of cells in a freqency domain specifier.
+
+  mtk-freq-domain:
+    maxItems: 1
+    description: |
+      Define this cpu belongs to which frequency domain. i.e.
+      cpu0-3 belong to frequency domain0,
+      cpu4-6 belong to frequency domain1.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#freq-domain-cells"
+
+examples:
+  - |
+    cpus {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            cpu0: cpu@0 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mtk-freq-domain = <&cpufreq_hw 0>;
+                reg = <0x000>;
+            };
+
+            cpu1: cpu@1 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mtk-freq-domain = <&cpufreq_hw 0>;
+                reg = <0x100>;
+            };
+
+            cpu2: cpu@2 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mtk-freq-domain = <&cpufreq_hw 0>;
+                reg = <0x200>;
+            };
+
+            cpu3: cpu@3 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mtk-freq-domain = <&cpufreq_hw 0>;
+                reg = <0x300>;
+            };
+
+            cpu4: cpu@4 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mtk-freq-domain = <&cpufreq_hw 1>;
+                reg = <0x400>;
+            };
+
+            cpu5: cpu@5 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mtk-freq-domain = <&cpufreq_hw 1>;
+                reg = <0x500>;
+            };
+
+            cpu6: cpu@6 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a75";
+                enable-method = "psci";
+                mtk-freq-domain = <&cpufreq_hw 1>;
+                reg = <0x600>;
+            };
+
+            cpu7: cpu@7 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a75";
+                enable-method = "psci";
+                mtk-freq-domain = <&cpufreq_hw 1>;
+                reg = <0x700>;
+            };
+    };
+
+    /* ... */
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        cpufreq_hw: cpufreq@11bc00 {
+            compatible = "mediatek,cpufreq-hw";
+            reg = <0 0x11bc10 0 0x8c>,
+               <0 0x11bca0 0 0x8c>;
+            reg-names = "freq-domain0", "freq-domain1";
+            #freq-domain-cells = <1>;
+        };
+    };
+
+
+
+
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
