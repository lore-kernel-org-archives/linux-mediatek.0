Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE0FC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 12:14:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7831A2246B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 12:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7831A2246B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0CdC1FnvhnZMmhGvcv9bllvMdYIWm3CFNBu9Npq3pAg=; b=s8RntiuAOgEUtw9vleSRWfE1T
	ynOQPJy17St75F7/ZftuMKzcVqQwyZ+hVFQ37iZEUSGSW+Yp0LKdqnGcW/1+scGJB/7h9CZn/Z0mO
	25DpEdoEFUGWap9R4YCtXjb9mEdSQS5pwYmP39so4uJH7oYATeWEWYephrax4+9cCsK51KHh6Ap+p
	VYLuaMxvKo1PHGcYuymYytlshz9UWxJwhVghaUdgDMSh56maTAjXb/PNZNRwAz0Hi7jfON1LuE/df
	w029QsHGeomgswVTSTdJqaZNOzjmQzPTWljCiNRB2OEmr3S1H6z0xHWPEu8Gx5U5kO3wKArsHOcus
	zjOvY1Eog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks31q-0007Ai-E1; Wed, 23 Dec 2020 12:14:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks31f-00075i-MH; Wed, 23 Dec 2020 12:13:58 +0000
X-UUID: db15eed2e331484f8af9a4f8d71e1162-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=eSxyMxJ8YcOAaYkDNb+wJypvFjDq+exS8NZE+BOL1GY=; 
 b=r0iFiEPX8rMDV6cZ5FeMX7/hAzPMGWCBQIsZ4oEsdn4O3eXm38MOr0odanBgUOi8XDiTLXF1+c8rTQqSNgzT0+2hF5FUALoAIZeoFIne9Q7drgmwsmlADHHhZx3SVcUd9975RAOfYd6Rv0/KYLE0kP9BzaZVBvPqzwWK7HF5LrI=;
X-UUID: db15eed2e331484f8af9a4f8d71e1162-20201223
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 927367893; Wed, 23 Dec 2020 04:13:50 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 04:13:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 20:13:46 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 20:13:45 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 <drinkcat@chromium.org>
Subject: [PATCH v3 1/3] dt-bindings: regulator: document binding for MT6315
 regulator
Date: Wed, 23 Dec 2020 20:13:42 +0800
Message-ID: <1608725624-30594-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1608725624-30594-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608725624-30594-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_071356_200198_A0996498 
X-CRM114-Status: GOOD (  14.80  )
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
 .../bindings/regulator/mt6315-regulator.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
new file mode 100644
index 000000000000..15ce83a36174
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -0,0 +1,71 @@
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
+            description:
+              should be "vbuck1", ..., "vbuck4"
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
+      reg = <0x6 0 0xb 1>;
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
