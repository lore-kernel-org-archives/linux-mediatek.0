Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D046C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3i4qUTUyUj1RDXigrpf2YxRNJx/ySaZtL8IE1mTPao=; b=LI05972dyCGoD8Co3gp7fwKwG0
	5F5KvsIPPHseQfgtSPxSukKY/skuiColfQYvw5+T42FLc12c1+rDo6mgH1vg3jQaeZmaicD5HoNc2
	yC70TJciMC4gEVeTWyjmUZwA//w+sT8vDqHwjyS/PTGmIP6xoZkSDL3tpTN9D8N6DhAKOxBoNs6kk
	yf5sk/d6UO23eVl4Iq7lrAKLoiuuW/gOevMsTgyLi5XApSv505lw44fMCczlDXRVQtmztowr7upbu
	0H0gkMNx2R/C5gPMt/xsLenIc1fH4r8fHb0JC+5OWe4DElDNNpr8CQk1va8aG74NDIC19hK9opulw
	hDwd8imw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE8zH-005Ona-SK; Wed, 20 Jul 2022 12:39:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE8rr-005ICL-I8; Wed, 20 Jul 2022 12:31:57 +0000
X-UUID: e82c8626bc4346f693478907dfed9427-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:c7b69568-c8a0-4872-b614-e947135a96ec,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:455a7d33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e82c8626bc4346f693478907dfed9427-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1989173242; Wed, 20 Jul 2022 05:31:49 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 20 Jul 2022 20:30:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Jul 2022 20:30:27 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v3 20/21] arm64: dts: mt8195: Add gce node
Date: Wed, 20 Jul 2022 20:30:22 +0800
Message-ID: <20220720123023.13500-21-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220720123023.13500-1-tinghan.shen@mediatek.com>
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_053155_693121_7687DC66 
X-CRM114-Status: GOOD (  11.31  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add gce node and gce alias to mt8195 device tree.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 7de162ba4d08..06fd03906f21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 #include <dt-bindings/clock/mt8195-clk.h>
+#include <dt-bindings/gce/mt8195-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8195-memory-port.h>
@@ -19,6 +20,11 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gce0 = &gce0;
+		gce1 = &gce1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -738,6 +744,22 @@
 			#iommu-cells = <1>;
 		};
 
+		gce0: mailbox@10320000 {
+			compatible = "mediatek,mt8195-gce";
+			reg = <0 0x10320000 0 0x4000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+		};
+
+		gce1: mailbox@10330000 {
+			compatible = "mediatek,mt8195-gce";
+			reg = <0 0x10330000 0 0x4000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
+		};
+
 		scp: scp@10500000 {
 			compatible = "mediatek,mt8195-scp";
 			reg = <0 0x10500000 0 0x100000>,
-- 
2.18.0


