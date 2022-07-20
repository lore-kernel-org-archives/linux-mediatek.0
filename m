Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycg0rEx7cKF5nVvCNpJ36fw4Evn7hHGl7T9IwG6fbFw=; b=Jrr9+w++OYjyjD8It5kNM8PJwW
	3YUmyBx0uUvtEH5B4DtIlGBivtux4aL7GzXdotrBsRu5YaFVhFoqA+DPIqOh9VFDex41MUj74wcSY
	f13VV8wubLOf7VBxYKj/N6Do3dXPKS4lU4Fajvtk2jIZW84uxB+F7/1sSxZsxzp8Y+Jtu5eXkZ3FQ
	18tOt1zvIdNquq9SDozfSjR3w22zdMUvKrRRXKyC7Z8tKpZf8IJ1DPFm4MxhalsYa5JOtu2Y2xcbe
	rU8ZaLsrzMcVHoxjSjxGMUoaOw7UL4op4Wjr3E8cozDKugtf7K95sH2QDrMROaMSpNP5qNTipXKR2
	seWNPwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE8xE-005N8t-S0; Wed, 20 Jul 2022 12:37:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE8rp-005IAd-Kd; Wed, 20 Jul 2022 12:31:55 +0000
X-UUID: d399fb4866934c9f97136ebc1c4ca6c4-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ec8c2584-fa28-4169-8414-2494b374b549,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:165a7d33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d399fb4866934c9f97136ebc1c4ca6c4-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 686378343; Wed, 20 Jul 2022 05:31:48 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 20 Jul 2022 20:30:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Jul 2022 20:30:26 +0800
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
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Henry Chen
	<henryc.chen@mediatek.com>
Subject: [PATCH v3 14/21] arm64: dts: mt8195: Add spmi node
Date: Wed, 20 Jul 2022 20:30:16 +0800
Message-ID: <20220720123023.13500-15-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220720123023.13500-1-tinghan.shen@mediatek.com>
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_053153_757758_AA1C7CB4 
X-CRM114-Status: GOOD (  10.24  )
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

Add spmi node to mt8195.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 07affd663768..16a854031431 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -697,6 +697,21 @@
 			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
 		};
 
+		spmi: spmi@10027000 {
+			compatible = "mediatek,mt8195-spmi";
+			reg = <0 0x10027000 0 0x000e00>,
+			      <0 0x10029000 0 0x000100>;
+			reg-names = "pmif", "spmimst";
+			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
+				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
+				 <&topckgen CLK_TOP_SPMI_M_MST>;
+			clock-names = "pmif_sys_ck",
+				      "pmif_tmr_ck",
+				      "spmimst_clk_mux";
+			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC>;
+			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
+		};
+
 		scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8195-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
-- 
2.18.0


