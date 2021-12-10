Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2262FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0muWzoXDENbnSaUZbhJqt63iVjenF7zTIZBBFFioVU=; b=F/dvxcUcG8kb4L
	+dVUd+h0YFMdqoNAVn4PjeRABKdhgmTHkCeEHdbqxPYCQa5uL5odM/8CBDZeYFhpQuaorxDuCkADS
	AhQcraX9QowJLp1ZpC+cjph2eAbKuXfoYxyHX//dpgMwhaLJQY5cLLUiwcB1r4EbenOTILUUg+JsC
	dBj+gCN8cnQvJRcQyOAnWRXbbVtiPyukjrqMQ8xWPYpa1z1OHpNNODzw1sQz6woNtEjUjB3q2+8eI
	jsBVR0DaEpHxLPXprYiGNRZKIpBElv09xyiag9y4PDYZavf71z0lVzisnJO2MtBiT0p3zLVurs3ud
	hfedvmM2eMDQAK48IIow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvk6I-0031lR-Iy; Fri, 10 Dec 2021 17:54:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvk4X-0030rn-2z; Fri, 10 Dec 2021 17:52:42 +0000
X-UUID: 2c7c9cb6a74a4d989d68475102a9799f-20211210
X-UUID: 2c7c9cb6a74a4d989d68475102a9799f-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 774194457; Fri, 10 Dec 2021 10:52:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:52:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:36 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 07/12] arm64: dts: mt8195: Add APU mtk-apu-mailbox node
Date: Sat, 11 Dec 2021 01:52:18 +0800
Message-ID: <20211210175223.31131-8-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210175223.31131-1-flora.fu@mediatek.com>
References: <20211210175223.31131-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_095241_179959_30A5BF1E 
X-CRM114-Status: UNSURE (   8.50  )
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

Add mtk-apu-mailbox for mt8195 SOC.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 6e60c4a38495..7e31e64e6b39 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1360,6 +1360,13 @@
 			#clock-cells = <1>;
 		};
 
+		apu_mailbox: apu_mailbox@19000000 {
+			compatible = "mediatek,mtk-apu-mailbox";
+			reg = <0 0x19000000 0 0x100>;
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+		};
+
 		apu_conn: syscon@19020000 {
 			compatible = "mediatek,mt8195-apu-conn", "syscon";
 			reg = <0 0x19020000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
