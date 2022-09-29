Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21513C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lenYjv1geOFUZJdmgFq5riQxkkqjCdvBwevLP67S8hs=; b=4S09GVJWCqukNb8UgIqpeZwH/Z
	BkWERN/tkvTv96JmTqyiWQlf+ki+jqZS7YHPimPYRtNYRAQJTc2MS7fnFKjee2ryQo3zPTgDG9Ad+
	oxAcgkCp1qaI3uqshB78aE8jwqSlStconrOrANM5xW5zPdaCDNbjxYmy0C3vqa069HuxhHBe1YfIU
	BK93LcaZJoCVX4rZ47ATy7lGEYMParoIC/BMTng3P7BPQvk/ioY5FspqGYTT/SLBlqJT2bKW77zQ+
	YHP8OCEf2YmQbCMGYKYom2/TvBBE204YMAMMH5NeKViWZcQLmHdgjS82DHthX5G6/ollWy6d5Hpq7
	e2m2+9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odsT1-002tKM-NK; Thu, 29 Sep 2022 12:16:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odsSz-002tJV-Ba; Thu, 29 Sep 2022 12:16:38 +0000
X-UUID: c7f8c77921d44f7d8dc3f162338a7dc2-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lenYjv1geOFUZJdmgFq5riQxkkqjCdvBwevLP67S8hs=;
	b=p2JupJ+5kL/T3+oPkly432A0455T2StN87arfKQGynuqVaqT4TyEkjxLIgPV1KmKX63bf5Tr+c3aTnLJs42spTEtNZUO2WEQKqV6wjPihO2cuYnIMhE8Lvxvt5a1CqiS0agv/UBRaBFmWKc+kRyxCXDKxOwaFf3cDXwF2vSrggc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f437eb03-2664-446b-bb27-9c258fc7b386,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:39a5ff1,CLOUDID:4ba781a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c7f8c77921d44f7d8dc3f162338a7dc2-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1851392864; Thu, 29 Sep 2022 05:16:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Sep 2022 19:46:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Sep 2022 19:46:29 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<kuan-hsin.lee@mediatek.com>, <yu-chang.wang@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>
Subject: [PATCH v3 2/4] dt-bindings: arm: mediatek: Add new bindings of MediaTek frequency hopping
Date: Thu, 29 Sep 2022 19:46:22 +0800
Message-ID: <20220929114624.16809-3-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220929114624.16809-1-johnson.wang@mediatek.com>
References: <20220929114624.16809-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_051637_423207_4BA36DE6 
X-CRM114-Status: GOOD (  14.08  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the new binding documentation for MediaTek frequency hopping
and spread spectrum clocking control.

Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 .../arm/mediatek/mediatek,mt8186-fhctl.yaml   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
new file mode 100644
index 000000000000..258dff7ce6bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-fhctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek frequency hopping and spread spectrum clocking control
+
+maintainers:
+  - Edward-JW Yang <edward-jw.yang@mediatek.com>
+
+description: |
+  Frequency hopping control (FHCTL) is a piece of hardware that control
+  some PLLs to adopt "hopping" mechanism to adjust their frequency.
+  Spread spectrum clocking (SSC) is another function provided by this hardware.
+
+properties:
+  compatible:
+    const: mediatek,mt8186-fhctl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Phandles of the PLL with FHCTL hardware capability.
+    minItems: 1
+    maxItems: 30
+
+  mediatek,hopping-ssc-percent:
+    description: The percentage of spread spectrum clocking for one PLL.
+    minItems: 1
+    maxItems: 30
+    items:
+      default: 0
+      minimum: 0
+      maximum: 8
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8186-clk.h>
+    fhctl: fhctl@1000ce00 {
+        compatible = "mediatek,mt8186-fhctl";
+        reg = <0x1000c000 0xe00>;
+        clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
+        mediatek,hopping-ssc-percent = <3>;
+    };
-- 
2.18.0


