Return-Path: <SRS0=5qoa=NT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78E5C4320A
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Aug 2021 15:02:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69148606A5
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Aug 2021 15:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69148606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taajDdq2eRggVow0jqpDKLlzwpMP3IywudCQ8Wk5EQE=; b=RhKU4cSLmKmNkH
	0FnRLrgqCA6Nx/+PhF6TIGGZRWr9d+4skCJ7e5UMTjHlAFDgxeJYGICJ/a91DXw95MocegJ1tWzYb
	TGhDiEL0EiNGwzCCsVcbeIGNxnjeEClE94w83SoB8dkksDyw5KGzr6L0ANaGHALay3Ezfl1QT9EMa
	Z9OLICC3tgi+rlgoqc4Wx61G+bk0mFVKCFBiubLZ7qJE3SDRkMet51RXwgja/h9/Yf24kYdSwoZ8f
	HGEjdaZZrbzw24SOr2Jk8zYk1R3+e0uGNSeg691/Uxdq11xYSPJQj88IS0x3qhO9HavBM7suKlH8L
	7JDT90hq/PJf4Lz5e58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJzqF-00ENcD-2l; Sat, 28 Aug 2021 15:01:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJzpm-00ENX5-4T; Sat, 28 Aug 2021 15:01:30 +0000
X-UUID: e9af15d36a5b4316994f970b0e89c7ca-20210828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DRyeCUv7TWiMVRHwxcWgboMuFmnkE6FAK0XKTA0OlqI=; 
 b=PTcZnd67nA9hAwuewrC/w7jJ8l9iNiXjyjEYh8zhhN/M6edexj0SOnHY7pSGATz7chVIXSr9g+9umDkZcklM0NBRaX1eDiHqvxD/1F+g9yJ6FBkon5uLUK7FVHFpI1ZK0uqdHei7Em+vzFXpPzeEvFsSjkGEzBPrcNZE6KJE4E4=;
X-UUID: e9af15d36a5b4316994f970b0e89c7ca-20210828
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1150135041; Sat, 28 Aug 2021 08:01:19 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 28 Aug 2021 08:01:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 28 Aug 2021 23:01:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 28 Aug 2021 23:01:16 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
 <hector.yuan@mediatek.com>
Subject: [PATCH v14 1/3] ndings: cpufreq: add bindings for MediaTek cpufreq HW
Date: Sat, 28 Aug 2021 23:01:10 +0800
Message-ID: <1630162872-25452-2-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1630162872-25452-1-git-send-email-hector.yuan@mediatek.com>
References: <1630162872-25452-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_080126_235519_C33E5A65 
X-CRM114-Status: GOOD (  13.52  )
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

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Add devicetree bindings for MediaTek HW driver.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   70 ++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
new file mode 100644
index 0000000..9cd42a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
@@ -0,0 +1,70 @@
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
+  CPUFREQ HW is a hardware engine used by MediaTek SoCs to
+  manage frequency in hardware. It is capable of controlling
+  frequency for multiple clusters.
+
+properties:
+  compatible:
+    const: mediatek,cpufreq-hw
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description:
+      Addresses and sizes for the memory of the HW bases in
+      each frequency domain. Each entry corresponds to
+      a register bank for each frequency domain present.
+
+  "#performance-domain-cells":
+    description:
+      Number of cells in a performance domain specifier.
+      Set const to 1 here for nodes providing multiple
+      performance domains.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#performance-domain-cells"
+
+additionalProperties: false
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
+                performance-domains = <&performance 0>;
+                reg = <0x000>;
+            };
+    };
+
+    /* ... */
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        performance: performance-controller@11bc00 {
+            compatible = "mediatek,cpufreq-hw";
+            reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
+
+            #performance-domain-cells = <1>;
+        };
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
