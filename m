Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FDDC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 06:14:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B851164E83
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 06:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B851164E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1GZ3YZfVjL1/RjO43dyIZ+bz83DWQ7hSw++NpuVM8PI=; b=BtCvFFNghJQiTN88HmX1KcN9J
	N/uNX5XcvDUV+Ta2rwDN1NvGykb086XXcO3zPzgzUEVCKrxSfOb5nrx6GEBVgRKXczwOHw8sC7B+A
	7zkg5Nb/t209YvoxcPttStlY2WnVBZLKF/Ri2YUiirl0g7ETPlKNv47vYDyWD5J1ktfiy4ODf74Yu
	HfAzHgbpTRl2rNxvjmabyCBwA+3JUhWGFmfeth03eHpW9GEYnSehmm0fd08at2yhnc4neZXSnVNl3
	oVR5a2Xtdmp62hkihQLzGXVDNV+KuzMVhr55KthysmlTjEE8JJmXzr6Um7syS6BHE1MmogSq6cizS
	96wJD4Z1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8dL6-0008Ev-HJ; Sun, 07 Feb 2021 06:14:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8dL1-0008Dt-Af; Sun, 07 Feb 2021 06:14:30 +0000
X-UUID: f111a78e03ee491c839b4a1b6a584cb1-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ySHSQ2I8R2ENpBDfPJrE+s5u2V+oa46uhoO6zfN0QJ0=; 
 b=LcNmmIWsheGHJn1uA8dBfB5EPYvQpyEMPTyomBk+7xWiDZPvQPcpa4pbUw120AEATfkxEwcc3E099SGNLJt3n4ftg92BDw1dGgtBJxGnyle5owoGChN4K2P1Ezh5GWHtRZKRFo9xuad2mja9FKvVVZThJJAZ0awKp6m/60CU6Dw=;
X-UUID: f111a78e03ee491c839b4a1b6a584cb1-20210206
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 847428709; Sat, 06 Feb 2021 22:14:22 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 22:14:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 14:14:18 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 7 Feb 2021 14:14:19 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 <drinkcat@chromium.org>
Subject: [PATCH v4 1/3] dt-bindings: regulator: document binding for MT6315
 regulator
Date: Sun, 7 Feb 2021 14:14:15 +0800
Message-ID: <1612678457-11548-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1612678457-11548-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1612678457-11548-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_011427_836010_25291866 
X-CRM114-Status: GOOD (  13.67  )
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
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device tree binding information for MT6315 regulator driver.
Example bindings for MT6315 are added.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
changes since v3:
- correct the yaml file name.
- remove unused description.
- update the example.
---
 .../bindings/regulator/mt6315-regulator.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
new file mode 100644
index 000000000000..61dd5af80db6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
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
+properties:
+  compatible:
+    const: mediatek,mt6315-regulator
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
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^vbuck[1-4]$"
+
+    additionalProperties: false
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
+    pmic@6 {
+      compatible = "mediatek,mt6315-regulator";
+      reg = <0x6 0>;
+
+      regulators {
+        vbuck1 {
+          regulator-compatible = "vbuck1";
+          regulator-min-microvolt = <300000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-enable-ramp-delay = <256>;
+          regulator-allowed-modes = <0 1 2 4>;
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
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
