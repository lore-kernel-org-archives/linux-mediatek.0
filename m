Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFE2C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 02:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSrDKK2VvGqQtpqluQvHgKWlPzXe/21cXXxIDKt77ek=; b=ITqd7T9TCSduYjZgq4gKwMQ7F4
	AQFPMX4ZcbERheiv5TV9tdMInaYffnrA/HHmpyK2g0gZ0RiCY/tmiHy5CqkVxtgEePnNxxl22J4vO
	c7ZX9r8IPR66ECAifS8Qyl9GMWivH4aQ0sJ2a5FB+0i5o1ho2HW06dapHYGcYH/DoIonCrPYvzBo+
	HEb4lhSFz1GKyf/+kGv8XHZZ6nHOY3V+nTwhxbGA7aCtPg+ceZZx3BR7KlNwWCeQmFZZ9ZEIODPeC
	W8BKTuIgKQ0T+dl7yZaR9s91x0A3k/ThDh4fb8ZnTRMw8UMJQ248GcarTFm2lQfR8gvPrkogFaQoT
	FPntuHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9dhj-001KAV-No; Fri, 08 Jul 2022 02:26:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9dhg-001K2d-Ak; Fri, 08 Jul 2022 02:26:49 +0000
X-UUID: 37d9b99d2f374165a8cc61cc74f885bd-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:fb510504-fb77-4102-a1ca-f3b0ace35546,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:9550dc86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 37d9b99d2f374165a8cc61cc74f885bd-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 430477885; Thu, 07 Jul 2022 19:26:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 10:16:05 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 10:16:05 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bin.zhang@mediatek.com>,
	<benliang.zhao@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH V3 2/2] dt-bindings: mediatek: Add axi clock in mt8173 dts example
Date: Fri, 8 Jul 2022 10:15:48 +0800
Message-ID: <20220708021548.21453-3-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708021548.21453-1-xiangsheng.hou@mediatek.com>
References: <20220708021548.21453-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_192648_411308_BDD920F1 
X-CRM114-Status: GOOD (  10.30  )
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

For mt8173, it is needed to add the axi clock for dma mode.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 41e60fe4b09f..413b907eecf5 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -82,8 +82,8 @@ examples:
         compatible = "mediatek,mt8173-nor";
         reg = <0 0x1100d000 0 0xe0>;
         interrupts = <1>;
-        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
-        clock-names = "spi", "sf";
+        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>, <&pericfg CLK_PERI_NFI>;
+        clock-names = "spi", "sf", "axi";
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.25.1


