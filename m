Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97345C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUxlHD+a1J8sBI7vgDjPGHHXUtrSDGBz1FB6UP61BtE=; b=kIoWLWx6HkI9yf
	LXXAjs/OqTVuhClez9e2aERhOLKfRyZw8PghSk9Ujk/uHMFJtwPDz2nsb2J9Av0gl3M46YNsRJ8ru
	Z31tRCigDAiTlcfe18Q8xWPI4F0sT3RzSpaZwqzrZhGZreNkmhUuEn0IBBZoDLOrZELtHdy85RROZ
	MVOAKvewCkVwKNKvs+VFZaDZFEFSh7xtaRnxosNV1+xWXzLW8UaZVeRPlbWseq7r1WYYmKbwYMbS4
	OUMT7lH58Blv+8PPx85rT5wbiirfmJ+N1jNWYGr/btg0xgCo++WgBPDHcL/nU7KGRw6BFDtQil32n
	ybjhovsqlS/RtFg9twaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nch5Y-00F7lB-SD; Fri, 08 Apr 2022 05:23:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nch5V-00F7k3-Ji; Fri, 08 Apr 2022 05:23:15 +0000
X-UUID: 5536329c1a7e4cab97c059558f428ae6-20220407
X-UUID: 5536329c1a7e4cab97c059558f428ae6-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1591556801; Thu, 07 Apr 2022 22:23:09 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 22:23:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Apr 2022 13:23:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 13:23:05 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>
CC: <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: devfreq: mediatek: Add mtk cci devfreq
 dt-bindings
Date: Fri, 8 Apr 2022 13:21:49 +0800
Message-ID: <20220408052150.22536-2-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408052150.22536-1-johnson.wang@mediatek.com>
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_222313_687605_97CB310B 
X-CRM114-Status: GOOD (  13.89  )
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

Add devicetree binding of mtk cci devfreq on MediaTek SoC.

Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
---
 .../devicetree/bindings/devfreq/mtk-cci.yaml  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mtk-cci.yaml

diff --git a/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
new file mode 100644
index 000000000000..ef4ea951025c
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/devfreq/mtk-cci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Cache Coherent Interconnect (CCI) frequency and voltage scaling
+
+maintainers:
+  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
+
+description: |
+  MediaTek Cache Coherent Interconnect (CCI) uses the software devfreq module
+  to scale the clock frequency and adjust the voltage. MediaTek CCI shares
+  the same power supplies with CPU, so the scheduling involves with CPUfreq.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-cci
+      - mediatek,mt8186-cci
+
+  clocks:
+    items:
+      - description:
+          The multiplexer for clock input of CPU cluster.
+      - description:
+          A parent of "cpu" clock which is used as an intermediate clock source
+          when the original CPU is under transition and not stable yet.
+
+  clock-names:
+    items:
+      - const: cci
+      - const: intermediate
+
+  operating-points-v2:
+    description:
+      For details, please refer to
+      Documentation/devicetree/bindings/opp/opp-v2.yaml
+
+  proc-supply:
+    description:
+      Phandle of the regulator for CCI that provides the supply voltage.
+
+  sram-supply:
+    description:
+      Phandle of the regulator for sram of CCI that provides the supply
+      voltage. When it presents, the cci devfreq driver needs to do
+      "voltage tracking" to step by step scale up/down Vproc and Vsram to fit
+      SoC specific needs. When absent, the voltage scaling flow is handled by
+      hardware, hence no software "voltage tracking" is needed.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - operating-points-v2
+  - proc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    cci: cci {
+      compatible = "mediatek,mt8183-cci";
+      clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+               <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+      clock-names = "cci", "intermediate";
+      operating-points-v2 = <&cci_opp>;
+      proc-supply = <&mt6358_vproc12_reg>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
