Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 07:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ANWZhwuT3XXK0KK/Db0Mf0PfAqClNr0zp/B3czW25vE=; b=Td5gFfq/38VZCf
	jifOGwKC7nfcoeHtp1Amqy7rP+wfgmHPrKfd6KlCo9+a7r2YRVRjWV5Nw+n6qMk+Zq/9zHKmcVTws
	E2yM2+9iuL5UogZLBVHqs3xr8UJ08bIfqOJQ8t8Twhg1dStBKBUtJU3fXTYYwsBoY0gURXU3M89We
	OT8bl2kQ92iW0teitYi+R/Goy45HpS3YUM+RU1uOQR1ZKY6SUSakLqj/Y6f3p48abd3Mf1QXNAr2X
	RvjGq/uEhMX3DiEm3cvcNRMC6xo0asp2rIzCUkmmDd5J8aNMYJdndNWnGQeP190uBF4vJ9S0LDK5m
	byq0lZn8Hb0dVpQpAm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6EZ-00BJDI-UP; Tue, 29 Mar 2022 07:25:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6EX-00BJCl-La; Tue, 29 Mar 2022 07:25:42 +0000
X-UUID: a0e0f237f0c7428b9567aa66a88a0cf8-20220329
X-UUID: a0e0f237f0c7428b9567aa66a88a0cf8-20220329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1027999080; Tue, 29 Mar 2022 00:25:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 00:15:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 15:15:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 15:15:32 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 "allen-kh . cheng" <allen-kh.cheng@mediatek.com>
Subject: [PATCH RFC] dt-bindings: PCI: mediatek-gen3: Remove clock-names
Date: Tue, 29 Mar 2022 15:15:26 +0800
Message-ID: <20220329071526.10298-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_002541_721201_AF3D60E0 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

Some SoC may have different clocks (e.g. MT8192 uses clock 'top_133m',
but MT8195 use clock 'peri_mem' instead), since these clocks do not have
any timing dependencies and the PCIe controller driver uses
'devm_clk_bulk_get_all' to gets all of them, remove 'clock-names' in
dt-bindings file for compatible with different SoCs.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml   | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 0499b94627ae..dc261c3d2570 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -77,15 +77,6 @@ properties:
   clocks:
     maxItems: 6
 
-  clock-names:
-    items:
-      - const: pl_250m
-      - const: tl_26m
-      - const: tl_96m
-      - const: tl_32k
-      - const: peri_26m
-      - const: top_133m
-
   assigned-clocks:
     maxItems: 1
 
@@ -157,8 +148,6 @@ examples:
                      <&infracfg 97>,
                      <&infracfg 99>,
                      <&infracfg 111>;
-            clock-names = "pl_250m", "tl_26m", "tl_96m",
-                          "tl_32k", "peri_26m", "top_133m";
             assigned-clocks = <&topckgen 50>;
             assigned-clock-parents = <&topckgen 91>;
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
