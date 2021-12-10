Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5905CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrM1mlW3+lkSI4jfNWsxisAvTfZEu2mRPUFNwHdam6A=; b=L4E2yJlICnLFNT
	97ZPCDJx9Bl3YJO8Z2op6BZ/7r+FIQxN2SZaARc0EwfWqKohf1iedLpTjOuNdApWAwITThzyLBlZp
	IA4XyKx6v0B5CZc9eNCsjBKSixSumnBMr209TOKQoS2xssJC6IWo+Dr/WyqrGs+C1jImTPRfJQjJZ
	TC4yZ1OPggUUiE0N0ijkQdSYj9Qt8OmtKu56xltWhScGEZahZWrMdINPmRP2ekvBU7b2vLy7tsRbM
	TaWXOUlpTsoVyoMHCAbA/dLm5sPg81RvOrydK0F99XrM9fsjVtG65Frcd7pW50Iu9jqAVxMeMp57x
	l5MV1gHvYAavY5HaRBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvk8J-003348-Tq; Fri, 10 Dec 2021 17:56:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvk4a-0030tt-9T; Fri, 10 Dec 2021 17:52:45 +0000
X-UUID: fc70e2ac15cc4b6997466d6aef803e69-20211210
X-UUID: fc70e2ac15cc4b6997466d6aef803e69-20211210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 976137987; Fri, 10 Dec 2021 10:52:40 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:38 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:52:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:37 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 10/12] arm64: dts: mt8195: Add APU power nodes
Date: Sat, 11 Dec 2021 01:52:21 +0800
Message-ID: <20211210175223.31131-11-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210175223.31131-1-flora.fu@mediatek.com>
References: <20211210175223.31131-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_095244_373312_C91E0FBD 
X-CRM114-Status: UNSURE (   8.85  )
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

Add APU power node for MT8195.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8f4f56e2f08c..5ab4b2fba0e9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1450,6 +1450,25 @@
 			};
 		};
 
+		apusys_power: apusys_power@190f1000 {
+			compatible = "mediatek,mt8195-apu-power";
+			reg = <0 0x190f1000 0 0x1000>,
+			      <0 0x19000600 0 0x100>;
+			reg-names = "apu_pcu",
+				    "apu_spare";
+			power-domains = <&apuspm 0>;
+
+			apu_combo_iommu0 {
+				compatible = "mediatek,apu_combo_iommu0";
+				iommus = <&iommu_apu0 IOMMU_PORT_APU_DATA>;
+			};
+
+			apu_combo_iommu1 {
+				compatible = "mediatek,apu_combo_iommu1";
+				iommus = <&iommu_apu1 IOMMU_PORT_APU_DATA>;
+			};
+		};
+
 		apusys_pll: clock-controller@190f3000 {
 			compatible = "mediatek,mt8195-apusys_pll";
 			reg = <0 0x190f3000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
