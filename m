Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803F9C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:12:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C9AF20707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xQPsAX3Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rD/I6SIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C9AF20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j5ayyPcruY5IwVP0TvQAjbpd5zTQVqkSwMl72scBCbI=; b=xQPsAX3YwdLJN8yGtY/sXUI+Q
	FTFK+Vw9nFvSCkjJ2xi5lsSYQJux7QclVvVDO+0vtvULN5BQSszV495T/1KV8GmzpinU3SFxa9xsy
	XVMVrkvoapoFc6VDOCfDOYieiTDLbJqpoXXIX/qK1Z4zSBUXp4mv5PFm/nGz0bvbCN50NDdRwGYGF
	o6r+rt/2mHXBJW2kreLDdLHR1+fk2+zpN3VaIr40CMIg27nkYOuD6IctYGPZfiyoC+sUx049h2Lys
	Vkhtv/5b1nPWZYM426Qc5wm79AyGOxAN4XumQRm3JfPWM06lQPJITAjqK5UYjXhau4ydmiPfttFjs
	LRDzaV8ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAvDm-0003mg-5O; Wed, 26 Aug 2020 13:12:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAvDi-0003lJ-WE; Wed, 26 Aug 2020 13:12:08 +0000
X-UUID: b6c24dcb362c4c5d908f5060f3b7812d-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CxyzFCyyAUAD9dzrQYeXJkejylJ8fCzMCpGiZ2fc9dM=; 
 b=rD/I6SIHcSYN6197sgB1VsqSANMyY0y/y8dYpJzbXw7kLFL9rjbezDlLxCwacem6eNILCkF8fs9RK+n4ny36CH2VZ7p9jGw9ZZTZ3zX493U4jYv4WuX2xreFZ0hEQWWk5UVaEiWwyy2lto31jQu66sw3I4Ea3u+PG63coxxevZg=;
X-UUID: b6c24dcb362c4c5d908f5060f3b7812d-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 499371317; Wed, 26 Aug 2020 05:12:03 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 06:02:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 21:01:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Aug 2020 21:01:59 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh
 Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Anson Huang <Anson.Huang@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v3 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Date: Wed, 26 Aug 2020 21:01:53 +0800
Message-ID: <1598446913-24325-3-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
References: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_091207_282008_0023E852 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: hector.yuan@mediatek.com, wsd_upstream@mediatek.com
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
index 0000000..5be5867
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
+    const: mediatek,cpufreq-hw
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
