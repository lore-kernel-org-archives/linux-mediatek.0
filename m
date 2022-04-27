Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86775C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 03:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIne/NhQ77Km0IUNMiOrlMUcH7PeHSiUtqPE+UKt1pw=; b=jEEXCujatZGg4k
	iW5XEnlCOsthgiEkcurda69VVZLUYUkHtII7/dUUS4C6jhg+WZNO+OdB495JDECiGzEv0GRc+x087
	IXUL32YKaJNNhLRniqi2x/bqCy3jrKsLoNDBhJQ2IBVkVrf4FVJK9Wapwgvh3/caN6N7YPBi8qqDv
	kYnYYLnoQi3VQlXe1RMp4tZxoSzplt8XEkmMgkN+lCjBWR+zQZLYDs58/3w3T9qsQ08xu1qTiFdtv
	S27PPpfBmvJWDzwynGxu6Z9nqTCwGrHeEPzSq33cbJmJTEg6dcX4R0NsH7GTWwdhjtbgwQFTw2me2
	pXm4gCfcT+CW8I89+Fkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njY82-00H9gD-MX; Wed, 27 Apr 2022 03:14:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njY6Q-00H8gt-4Q; Wed, 27 Apr 2022 03:12:31 +0000
X-UUID: f80dc052dd7e41d88a0b333637cbdae7-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:be1f4787-ac46-44f5-8627-4cff95686c61, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e503d42e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f80dc052dd7e41d88a0b333637cbdae7-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2014949067; Tue, 26 Apr 2022 20:12:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 20:12:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 11:12:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 11:12:22 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V4 15/15] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
Date: Wed, 27 Apr 2022 11:09:50 +0800
Message-ID: <20220427030950.23395-16-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_201230_240736_D6A4CC6D 
X-CRM114-Status: GOOD (  11.70  )
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

We will use mediatek clock reset as infracfg_ao reset instead of ti-syscon.
To support this, remove the property of ti reset and add the property of
#reset-cells for mediatek clock reset.

Fixes: 4c78814a1f46ac0 (arm64: dts: Add mediatek SoC mt8195 and evaluation board)
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index b57e620c2c72..8e5ac11b19f1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -10,7 +10,6 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
-#include <dt-bindings/reset/ti-syscon.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -295,17 +294,7 @@
 			compatible = "mediatek,mt8195-infracfg_ao", "syscon", "simple-mfd";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
-
-			infracfg_rst: reset-controller {
-				compatible = "ti,syscon-reset";
-				#reset-cells = <1>;
-				ti,reset-bits = <
-					0x140 18 0x144 18 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* pcie */
-					0x120 0  0x124 0  0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* thermal */
-					0x730 10 0x734 10 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* thermal */
-					0x150 5  0x154 5  0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* svs gpu */
-				>;
-			};
+			#reset-cells = <1>;
 		};
 
 		pericfg: syscon@10003000 {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
