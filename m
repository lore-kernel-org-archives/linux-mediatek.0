Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9D2C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 08:20:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1FBF20878
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 08:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3OXTV28Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TJ3o+/g2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1FBF20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i0ybprs1JeL+Kng+nGFpbqKiOAh4g1UAnjosBTUxh50=; b=3OXTV28Zu6VaTlOV5si9kzELs
	+9NWLdkv5j4/HFioC4WyPiVCFXxgieCc54cbgwiVtv7QpCdyO2XvKBw1VPpmAxcmaf8yloT5gd98z
	GAqduLDUuuVfoGJFuTaWOc83o3Ea+OXctFUqaW76lIy6jDD8HzuHBIcb/MSMN0FZXu2MszQpeHdow
	lCF7TihQSivXWDJNwh6aVJeXga/zljNPCXO1REeYwQqaPrAYaIhwFdggVpFybXW93x7fvHszEqRCO
	ZKTLIXwhEPFbrQgWmbiptDvUGq8dDnOQE+WbBcFBamDcPHWBiLXEbtKFKx1kvkBcN8Q+o0MyAjra/
	U+dX/vQ7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWxjK-0006qc-7g; Mon, 26 Oct 2020 08:19:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWxjH-0006oc-2k; Mon, 26 Oct 2020 08:19:48 +0000
X-UUID: 7865d2d52e39417f9af34385473446f9-20201026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZvY3ebtojCqfX4voGnQGPEtZw2caPlgJvmfJsJzbufw=; 
 b=TJ3o+/g2NPRG1svH498Hbr7fWGD83kgUe0PccdpQuBEJLodBmfGpD3unT7E6oEuIIZWfIAMPmmehjh4ehFtzEHEAqzqIhuzLG9fVWif+661rZo+duCVz8kg55xpdxRX+bncsnVgXJWmso+alzKDmrKJf1bNJSO3hfmJTkOvwkzg=;
X-UUID: 7865d2d52e39417f9af34385473446f9-20201026
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 644438923; Mon, 26 Oct 2020 00:19:39 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 01:19:38 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 16:19:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 26 Oct 2020 16:19:14 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Maxime Ripard" <mripard@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, "Amit Kucheria" <amit.kucheria@linaro.org>, Stephen
 Boyd <sboyd@kernel.org>, "Ulf Hansson" <ulf.hansson@linaro.org>, Dave Gerlach
 <d-gerlach@ti.com>, "Florian Fainelli" <f.fainelli@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>, "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v8 3/3] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Date: Mon, 26 Oct 2020 16:19:09 +0800
Message-ID: <1603700349-5922-4-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
References: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F7CCB49E09000072F62F73DDE781F4FACB0C6ADFAD64C3EB4D0B72B91C61209A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_041947_321990_7BD312C8 
X-CRM114-Status: GOOD (  13.89  )
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
 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  113 ++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
new file mode 100644
index 0000000..32d2ad4
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
@@ -0,0 +1,113 @@
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
+required:
+  - compatible
+  - reg
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
+                mediatek,freq-domain = <&cpufreq_hw 0>;
+                reg = <0x000>;
+            };
+
+            cpu1: cpu@100 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mediatek,freq-domain = <&cpufreq_hw 0>;
+                reg = <0x100>;
+            };
+
+            cpu2: cpu@200 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mediatek,freq-domain = <&cpufreq_hw 0>;
+                reg = <0x200>;
+            };
+
+            cpu3: cpu@300 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mediatek,freq-domain = <&cpufreq_hw 0>;
+                reg = <0x300>;
+            };
+
+            cpu4: cpu@400 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mediatek,freq-domain = <&cpufreq_hw 1>;
+                reg = <0x400>;
+            };
+
+            cpu5: cpu@500 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a55";
+                enable-method = "psci";
+                mediatek,freq-domain = <&cpufreq_hw 1>;
+                reg = <0x500>;
+            };
+
+            cpu6: cpu@600 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a75";
+                enable-method = "psci";
+                mediatek,freq-domain = <&cpufreq_hw 1>;
+                reg = <0x600>;
+            };
+
+            cpu7: cpu@700 {
+                device_type = "cpu";
+                compatible = "arm,cortex-a75";
+                enable-method = "psci";
+                mediatek,freq-domain = <&cpufreq_hw 1>;
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
+        };
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
