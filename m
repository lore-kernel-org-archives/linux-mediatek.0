Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19875C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 02:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ux+NipZJgmbBF0i5xlWNhi8/XQ/muPNwqMXnIQb1I9A=; b=3duPvR2d2afGET
	AKVXP47UB8bX71GIZUc8hr4BsaKvr1k8HKe74TysokoOi3b9YQ0BDHbvrbsjdtoN1AzBeoa+Ylpkl
	X+O2nOYsk+W98Vx1IQXeU2f1/OAPPpiMMU+IzV5z5wqNUVoU7WQgiTMHbUgRoJuqlFDd20L77nXEW
	9OY2Wl5U/zL/JmptshulOnzxCejigKHTN4gaH1irjpBA5p9gj1WUXDo3XNNDsJZG0bDXilbxU8/p6
	mrmBjRFuFWl8OSD8XB6dQpSwAko1Y4nYVxjYc/wH6iQgcOQvIlYBjUe78t02OZ4+6eFDeO3dfFRAq
	WweqHiuTZb5CXBcnypsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nepcM-003XMX-8m; Thu, 14 Apr 2022 02:53:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nepcI-003XKJ-HQ; Thu, 14 Apr 2022 02:53:57 +0000
X-UUID: 091ed1af4fd9467d8136723d5aa44090-20220413
X-UUID: 091ed1af4fd9467d8136723d5aa44090-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 862470510; Wed, 13 Apr 2022 19:53:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 19:53:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Apr 2022 10:53:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 10:53:43 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 2/2] arm64: dts: mt8192: Add node for the Mali GPU
Date: Thu, 14 Apr 2022 10:50:23 +0800
Message-ID: <20220414025023.11516-2-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220414025023.11516-1-Nick.Fan@mediatek.com>
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_195354_610694_9232BC4A 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>, wenst@chromium.org,
 Nick Fan <Nick.Fan@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a basic GPU node for mt8192.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
This patch depends on MediaTek power and regulator support.

Listed as following.

[1]https://patchwork.kernel.org/project/linux-mediatek/patch/1612678457-11548-4-git-send-email-hsin-hsiung.wang@mediatek.com/
[2]https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/
[3]https://patchwork.kernel.org/project/linux-mediatek/patch/20220318144534.17996-3-allen-kh.cheng@mediatek.com/
[4]https://patchwork.kernel.org/project/linux-mediatek/patch/1605700894-32699-6-git-send-email-hsin-hsiung.wang@mediatek.com/
---
---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   7 ++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 124 ++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 3369cd962f11..e232089688b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8192.dtsi"
+#include "mt6359.dtsi"
 
 / {
 	model = "MediaTek MT8192 evaluation board";
@@ -69,6 +70,12 @@
 	};
 };
 
+&gpu {
+	supply-names = "mali","sram";
+	mali-supply = <&mt6315_7_vbuck1>;
+	sram-supply = <&mt6359_vsram_others_ldo_reg>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 6150f99a9b87..5514f31f1aa2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -899,6 +899,130 @@
 			#clock-cells = <1>;
 		};
 
+		gpu: mali@13000000 {
+			compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
+			reg = <0 0x13000000 0 0x4000>;
+			interrupts =
+				<GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names =
+				"gpu",
+				"mmu",
+				"job";
+
+			clocks =
+				<&apmixedsys CLK_APMIXED_MFGPLL>,
+				<&topckgen CLK_TOP_MFG_PLL_SEL>,
+				<&topckgen CLK_TOP_MFG_REF_SEL>,
+				<&mfgcfg CLK_MFG_BG3D>;
+			clock-names =
+				"clk_main_parent",
+				"clk_mux",
+				"clk_sub_parent",
+				"subsys_mfg_cg";
+
+			power-domains =
+				<&spm MT8192_POWER_DOMAIN_MFG2>,
+				<&spm MT8192_POWER_DOMAIN_MFG3>,
+				<&spm MT8192_POWER_DOMAIN_MFG4>,
+				<&spm MT8192_POWER_DOMAIN_MFG5>,
+				<&spm MT8192_POWER_DOMAIN_MFG6>;
+			power-domain-names = "core0",
+					     "core1",
+					     "core2",
+					     "core3",
+					     "core4";
+
+			operating-points-v2 = <&gpu_opp_table>;
+			#cooling-cells = <2>;
+
+			gpu_opp_table: opp_table0 {
+				compatible = "operating-points-v2";
+				opp-shared;
+
+				opp-358000000 {
+					opp-hz = /bits/ 64 <358000000>;
+					opp-microvolt = <606250>, <750000>;
+				};
+
+				opp-399000000 {
+					opp-hz = /bits/ 64 <399000000>;
+					opp-microvolt = <618750>, <750000>;
+				};
+
+				opp-440000000 {
+					opp-hz = /bits/ 64 <440000000>;
+					opp-microvolt = <631250>, <750000>;
+				};
+
+				opp-482000000 {
+					opp-hz = /bits/ 64 <482000000>;
+					opp-microvolt = <643750>, <750000>;
+				};
+
+				opp-523000000 {
+					opp-hz = /bits/ 64 <523000000>;
+					opp-microvolt = <656250>, <750000>;
+				};
+
+				opp-564000000 {
+					opp-hz = /bits/ 64 <564000000>;
+					opp-microvolt = <668750>, <750000>;
+				};
+
+				opp-605000000 {
+					opp-hz = /bits/ 64 <605000000>;
+					opp-microvolt = <681250>, <750000>;
+				};
+
+				opp-647000000 {
+					opp-hz = /bits/ 64 <647000000>;
+					opp-microvolt = <693750>, <750000>;
+				};
+
+				opp-688000000 {
+					opp-hz = /bits/ 64 <688000000>;
+					opp-microvolt = <706250>, <750000>;
+				};
+
+				opp-724000000 {
+					opp-hz = /bits/ 64 <724000000>;
+					opp-microvolt = <725000>, <750000>;
+				};
+
+				opp-748000000 {
+					opp-hz = /bits/ 64 <748000000>;
+					opp-microvolt = <743750>, <750000>;
+				};
+
+				opp-772000000 {
+					opp-hz = /bits/ 64 <772000000>;
+					opp-microvolt = <750000>, <750000>;
+				};
+
+				opp-795000000 {
+					opp-hz = /bits/ 64 <795000000>;
+					opp-microvolt = <762500>, <762500>;
+				};
+
+				opp-819000000 {
+					opp-hz = /bits/ 64 <819000000>;
+					opp-microvolt = <775000>, <775000>;
+				};
+
+				opp-843000000 {
+					opp-hz = /bits/ 64 <843000000>;
+					opp-microvolt = <787500>, <787500>;
+				};
+
+				opp-866000000 {
+					opp-hz = /bits/ 64 <866000000>;
+					opp-microvolt = <800000>, <800000>;
+				};
+			};
+		};
+
 		mfgcfg: clock-controller@13fbf000 {
 			compatible = "mediatek,mt8192-mfgcfg";
 			reg = <0 0x13fbf000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
