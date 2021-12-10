Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9Bf4hDx9ZfF13diaQBqJds3CDjt2pkjW6Y/ZyZ2cQk=; b=QavUVdEXBKjGpa
	8iQ3lqTdLTNWvBHGb8NeircnKqyzUTVOKAzm5nP2dXkggPxBdS/EmaJBc7/uuF/cy+yP9onzxpZvZ
	mvKXiu3NDY33oTmEXf2BW/Sz/1F52W2F+io5sWiVvkq15viE0ztVLur81iVVgQTtJ278g7NMngdcO
	bhBZakfkeoyumyxRUXvrEVqxbIgYQwyHn3YcZZqAVdWO/k4YrTWt0Dml5hU9M6ZoU4auzlH5JMk0p
	ymbolftQMdZOEvDJCjIJ++Z3axRq+Toc8+lXjvZIeb1HtUXt43RjlzU5apYRNbJfMMRNM6yYyBOLG
	Yvlwd//k+EFGzPUgIzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjhG-002pxg-NL; Fri, 10 Dec 2021 17:28:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjfY-002otL-Tc; Fri, 10 Dec 2021 17:26:55 +0000
X-UUID: ea24d52d67064061935539e3fdf5d089-20211210
X-UUID: ea24d52d67064061935539e3fdf5d089-20211210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1119300135; Fri, 10 Dec 2021 10:26:45 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:26:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 11 Dec 2021 01:26:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:41 +0800
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
Subject: [PATCH 05/17] dt-bindings: soc: mediatek: apu: Add apu logger
 compatible
Date: Sat, 11 Dec 2021 01:25:53 +0800
Message-ID: <20211210172605.30618-6-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_092653_023185_29A448A8 
X-CRM114-Status: GOOD (  11.68  )
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

Add new document for apu logger compatible.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../soc/mediatek/mediatek,apu-logger.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-logger.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-logger.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-logger.yaml
new file mode 100644
index 000000000000..9e56fb3b8080
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-logger.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2021 (C) MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/mediatek,apu-logger.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek APU Logger for debug into microprocessor
+
+description: |
+  The APU logger is for debug usage. The APU remote microprocessor's logs
+  will be output to the mapped memory and application processor can read
+  logs from the dedicated reserved registers.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,apu-sw-logger
+  reg:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/memory/mt8192-larb-port.h>
+    apusys_sw_logger@19000040 {
+      compatible = "mediatek,apu-sw-logger";
+      reg = <0x19000040 0x10>;
+      iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
