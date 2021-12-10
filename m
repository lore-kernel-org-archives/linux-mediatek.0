Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01CC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijUbp0pNl+NuTsHg/eR7cM6JKIlWJay3Cc8/CSeuBCw=; b=kJiz3eoSEc2Ln/
	eOpoJEwebO6SWk3pZD/HfAqBq8wrX3maZjoHR1Z6PZlcVGYsSsDEeeo46XLh9fJBXt49biinhbhxT
	pYA8b/tRSMAdoWWsYU/EV/w0d6yoo+kVL6hKkKgf1K7PWvr3hLHDDLbF41us+0gXlvuJ0uamkGIUo
	ffNeTqrWYj2+NdHNSGrjz/O1qGPT/cOL0XHMS+9JOEgadOEZoqtNppAlKxRIjZcVTZ53TbyF6tc6/
	jBAIRecCUdyZ/mEF3T/R3ZzqNvrr1MV0xEKY0jPISzzO0Me5yS1TRCZFbELkTcXVWo5K32l+NzMGK
	Ww2G95h4QKFIafPrrbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjfL-002olG-88; Fri, 10 Dec 2021 17:26:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjf5-002ogy-T7; Fri, 10 Dec 2021 17:26:25 +0000
X-UUID: ed31a9b9618146499ce4015136fc1f8f-20211210
X-UUID: ed31a9b9618146499ce4015136fc1f8f-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 422318249; Fri, 10 Dec 2021 10:26:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:26:19 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 11 Dec 2021 01:26:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:17 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>
Subject: [PATCH 01/17] dt-bindings: mailbox: mediatek: Add APU mailbox
 compatible
Date: Sat, 11 Dec 2021 01:25:49 +0800
Message-ID: <20211210172605.30618-2-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_092623_968078_6729220E 
X-CRM114-Status: GOOD (  12.09  )
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

Add the mailbox compatible for the MediaTek APU.
The MT8192 and MT8195 SOC will use it.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../mailbox/mediatek,apu-mailbox.yaml         | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
new file mode 100644
index 000000000000..ffd0e1623955
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2021 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,apu-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AI Processing Unit mailbox controller bindings
+
+description:
+  The APU mailbox controller provides access from the
+  application processor to the MediaTek AI Processing Unit.
+
+maintainers:
+  - Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mtk-apu-mailbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    apu_mailbox: apu_mailbox@19000000 {
+      compatible = "mediatek,mtk-apu-mailbox";
+      reg = <0x19000000 0x100>;
+      interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH 0>;
+      #mbox-cells = <1>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
