Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0567FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 13:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8058F61090
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 13:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8058F61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R9uAeOikUeY78M4ZlHs/ilFWsa6ZbfAFoX0ru8c9TI0=; b=Dg+GwMfuzfapLZ
	//3nxiwQWfFEESw3sswI1QsThfu0tSpMg4DArbMrNTJgkqGKDxdxOxgo+w7B4pCIu2pFXReZf1G3X
	PshJa6v202zh6EGBik9syamb6jjGRNZwqCe84iukHXUVUZsSBkVNTeQ04fos4dlLmdHY4KfFEFwK5
	+Lpbo7aRGpSiCRAYdrNCMYpDkA6WlMd8US4OsSffh1Q5HB5a9LxlkpYcmt/y9vDefJJX2pvz2ZKjG
	W2ZcDHrDEYpvY5IwFz2qUZK9qOY4SOvp5hUzp6MZRoHkNH9WyVAN97WieM4Nk3sGzNlFnIPl7HC/4
	E261lcGiqeRBB2Eg0x/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYT6r-00HRCb-Mv; Thu, 07 Oct 2021 13:06:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYT6o-00HRCE-HE; Thu, 07 Oct 2021 13:06:52 +0000
X-UUID: 6e15034fbe334b77863d347a68688ef9-20211007
X-UUID: 6e15034fbe334b77863d347a68688ef9-20211007
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1559932498; Thu, 07 Oct 2021 06:06:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 06:06:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 7 Oct 2021 21:06:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Oct 2021 21:06:44 +0800
From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH] dt-bindings: mediatek: add adsp-mbox document
Date: Thu, 7 Oct 2021 21:06:41 +0800
Message-ID: <20211007130641.3589-1-Allen-KH.Cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_060650_596145_F4A87D1B 
X-CRM114-Status: GOOD (  12.31  )
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

This patch adds document for mediatek adsp mbox

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 .../bindings/mailbox/mtk,adsp-mbox.yaml       | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
new file mode 100644
index 000000000000..d45b93025428
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ADSP mailbox
+
+maintainers:
+  - Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
+
+description: |
+  The MTK ADSP mailbox Inter-Processor Communication (IPC) enables the SoC
+  to ommunicate with ADSP by passing messages through two mailbox channels.
+  The MTK ADSP mailbox IPC also provides the ability for one processor to
+  signal the other processor using interrupts.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-adsp-mbox
+
+  "#mbox-cells":
+    const: 1
+
+  reg:
+    items:
+      - description: adsp mbox0 registers
+      - description: adsp mbox1 registers
+
+  reg-names:
+    items:
+      - const: reg_mbox0 
+      - const: reg_mbox1
+
+  interrupts:
+    items:
+      - description: adsp mbox0 interrupt
+      - description: adsp mbox1 interrupt
+
+  interrupt-names:
+    items:
+      - const: irq_mbox0 
+      - const: irq_mbox1
+
+required:
+  - compatible
+  - "#mbox-cells"
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    adsp_mailbox@adsp_mailbox@10816000 {
+        compatible = "mediatek,mt8195-adsp-mbox";
+        #mbox-cells = <1>;
+        reg = <0 0x10816000 0 0x1000>,
+              <0 0x10817000 0 0x1000>;
+        reg-names = "reg_mbox0", "reg_mbox1";
+        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>,
+                 <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "irq_mbox0", "irq_mbox0";
+    };
+
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
