Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B700ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WJfzgGyc/RdkhB8YoMvTc7KpSrhJc6zReOlwA2QmYY=; b=mL9pZrKa3oXQmTe16S9hrbenWj
	5/EuNyqVW8PqT9Ga9Xvl8gs/dBvpxwFLG/B6dJXvjhbcqSpAxwh9VZm4q5LXmoq2ULwJb6BLfjyN2
	RJJXXMMGkxVRKMBVH41AepMJJ1tqGplRKbY268JWBHvDfwn8aGIj12U4fgVSzWG/f66zovi/Vek+c
	nk9N+V+hji+/dJ3H36hK5xdx269758EDO6iEnGJRDtBlYYaOPoFl8Ffp8XQ5puZ0LDil6XgIF8NIv
	+hronkN213DJgSIWDl0EzorxAjMdu/xv1e0MzeGL+62PNzTFtWbNJsVGP0t1oXGmSYmFFREO9NL+H
	SwwG3L/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSIU-000fzB-Rd; Wed, 14 Sep 2022 13:19:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSHl-000fAb-5L; Wed, 14 Sep 2022 13:18:39 +0000
X-UUID: 0f626924d0384efe915008362f12666a-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1WJfzgGyc/RdkhB8YoMvTc7KpSrhJc6zReOlwA2QmYY=;
	b=jZY5xXyMKWPxY1DQW1/FtpDb8gj18U8hbUtXzmj2MhOlpUqhqjAHaqpKVDoYytzzu46HH79yVVXyaf661qdhI/qlw5dQrNjtEO2lI4F8EaQ77nYXJ+fNw/tHlmqwoEKxnTtEvLDgRsmvwwtJb/CLcCywUzwwDqmwE6sxhyAa2OY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e3d3aca3-a8e9-41ab-8c7f-6090b69add56,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:39a5ff1,CLOUDID:6b396cec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0f626924d0384efe915008362f12666a-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 585291252; Wed, 14 Sep 2022 06:16:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 20:45:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Sep 2022 20:45:53 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>
Subject: [PATCH v2 2/4] dt-bindings: arm: mediatek: Add new bindings of MediaTek frequency hopping
Date: Wed, 14 Sep 2022 20:45:50 +0800
Message-ID: <20220914124552.16964-3-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220914124552.16964-1-johnson.wang@mediatek.com>
References: <20220914124552.16964-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_061837_298996_7164AEB2 
X-CRM114-Status: GOOD (  13.82  )
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
 .../bindings/arm/mediatek/mediatek,fhctl.yaml | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
new file mode 100644
index 000000000000..7b0fd0889bb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml#
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
+
+  mediatek,hopping-ssc-percents:
+    description: The percentage of spread spectrum clocking for one PLL.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 8
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
+        mediatek,hopping-ssc-percents = <3>;
+    };
-- 
2.18.0


