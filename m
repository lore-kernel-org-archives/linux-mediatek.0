Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D585C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 11:52:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E336E20714
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 11:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aOTsFRRa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fnkHOM1P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E336E20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gf2VonRn9fTYctt3BvoQimbattYZxBOPmtfQhdA7deU=; b=aOTsFRRadSgAPP
	406Oj3yfYJE2v5WGT2Oe9h5psycEnoD3ktKwMzYW4kj1yr3qM3XEnJzo7xxrNR2W8y7qojAa+6rpD
	vg29Ll25GEN8lBW8h731KFs/ns97ghjerNL0h5VtY762GN/RCIn2uEvNVQhCtB4J8wpL9UK0EZA2X
	rdIXFITFVnmvEoMKRPXCncnflIRi36ZwFcJo88oMbeCIAXnsHZVGoN3W9RX70ER71MlgttxSoFzC0
	iNBOLJgDm8J+H2UI8STITerlq1Azz4zv76p36jl8n6eCWLHiElWW/KhM6W/YntJNz/pwXiku/OiVg
	kUDhltRRniKIS7SZeeyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jknfU-0001cn-Gb; Mon, 15 Jun 2020 11:52:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jknfR-0001cB-1f; Mon, 15 Jun 2020 11:52:46 +0000
X-UUID: 67e7021615d64388b9f436bfb1fc2d49-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0U69Py6xJu6ZqvOVIJg86E3EGgWobmy8WriwC3AL97U=; 
 b=fnkHOM1PAc+vpc+pbqnxnrJpByBttazQw+wTV4TbPw3EIBUFJ5UQtozepmFfffZMG1q7VKRHfJwbm4qMdeGuv4Xbl87jUsVJtV3xu1riernjT3ivAj/NziZsf1pEk8CCKUU/4WaUCVdtTgvhKg3psXk4gMMduZWbP6xy3njwRYw=;
X-UUID: 67e7021615d64388b9f436bfb1fc2d49-20200615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 446090815; Mon, 15 Jun 2020 03:52:40 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 04:42:36 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 19:42:34 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jun 2020 19:42:35 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Yingjoe
 Chen" <yingjoe.chen@mediatek.com>, Pavel Machek <pavel@ucw.cz>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings:Add vibrator devicetree documentation
Date: Mon, 15 Jun 2020 19:42:02 +0800
Message-ID: <20200615114203.116656-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200615114203.116656-1-fengping.yu@mediatek.com>
References: <20200615114203.116656-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0DC18458E007A158A151B82AFBFCE9BB1DEF7D379C90BCBB88EF689AA94A8F732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_045245_099863_E9B23E53 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: "fengping.yu" <fengping.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Add Mediatek regulator vibrator dt-bindings doc as yaml schema

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 .../bindings/input/regulator-vibrator.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/regulator-vibrator.yaml

diff --git a/Documentation/devicetree/bindings/input/regulator-vibrator.yaml b/Documentation/devicetree/bindings/input/regulator-vibrator.yaml
new file mode 100644
index 000000000000..6511a8a80aff
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/regulator-vibrator.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+version: 1
+
+$id: http://devicetree.org/schemas/input/regulator-vibrator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek's regulator vibrator device tree bindings
+
+maintainer:
+  - Fengping Yu <fengping.yu@mediatek.com>
+
+description: |
+  Registers a regulator device as vibrator, where the on/off capability is controlled by a regulator.
+
+properties:
+  compatible:
+      const: "regulator-vibrator"
+
+	vibr-supply:
+		description: Power supply to the vibrator.
+		refs:Documentation/devicetree/bindings/regulator/regulator.txt for details.
+
+  max-volt:
+    description: The maximum voltage value supplied to the vibrator regulator.
+    						 The unit of the voltage is micro.
+
+  min-volt:
+    description: The minimum voltage value supplied to the vibrator regulator.
+    						 The unit of the voltage is micro.
+
+  min-limit:
+    description: The minimum duration time in ms for vibrator, default is 15ms.
+    						 If user request smaller duration, the default value will be used
+    						 instead. The default value comes from the smallest unit that can
+    						 be sensored.
+
+  max-limit:
+    description: The maximum duration time in ms for vibrator. If not set, it means
+    						 no max limitation.
+
+required:
+  - compatible
+  - min-volt
+  - max-volt
+
+examples:
+  - |
+
+	mt6359_vibr_ldo_reg: ldo_vibr {
+		regulator-name = "vibr";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <240>;
+	};
+
+  regulator_vibrator {
+    compatible = "regulator-vibrator";
+    min-volt = <2300000>;
+    max-volt = <3200000>;
+    min-limit = <25>;
+		max-limit = <15000>;
+		vib-supply = <&mt6359_vibr_ldo_reg>;
+  };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
