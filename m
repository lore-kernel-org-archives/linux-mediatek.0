Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780BBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 02:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Q5kRH18gt6Y/pbwXFl9/gu+4070qb8aRhjVye5Kcvw=; b=Aaup0qLACq+kMRMQFjhZXi98IP
	MChGyCkOrENPIln5KOEnaiPmGmZRexcWlfOuJ480r4UuT60TSHpBt72OIBi0QdQnw+q/XbykQHe5s
	wKysSQDInwBMcLQff8BSH5MqCfhB3YPz9wSB51Z5hJj71lSyvBFJL/tTPRKT6eECLXYjHQS6tfKtt
	E3LcWNJwhFnUsPVTqRMJDfkqDi1WB999FnyJKi4MK4o5wL+5mBGWZt4ydAhSaCkXsFwKkBvrf+WMC
	tgiMqJk+SnkAaJo6HVTIY4ESYGTTz5Q/8jN/jx5FUbAjA8GrnMK38+vtqXAyI2dIsqP8OJefeQn2P
	dXlAou7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oineI-00AFOC-5p; Thu, 13 Oct 2022 02:08:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oineB-00AFGW-AL; Thu, 13 Oct 2022 02:08:35 +0000
X-UUID: e5adba18d6354bc29afd0e0b9fe5141e-20221012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0Q5kRH18gt6Y/pbwXFl9/gu+4070qb8aRhjVye5Kcvw=;
	b=D5uYOHeUQVJ/NehsKYzoqOKK/B8uQe+k4vRupYd3ncWIcWQkYyPq2MjXqxGe5Fhhh/QN/ugofg6r1yY8qK4UCo2SCloLbf1qHiA2A5fXOkVkJ0zrxyCpLfkIyKmD0T83aYrrrm5yrKwPf4QDE3P8rCep87KvbCWdR9yEfaV/6Cs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2ce01fe9-fb98-4c39-8687-644dd6cb096e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:729d5101-cdeb-479d-93af-53f947adce9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e5adba18d6354bc29afd0e0b9fe5141e-20221012
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 83630917; Wed, 12 Oct 2022 19:03:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 13 Oct 2022 10:03:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 13 Oct 2022 10:03:30 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 4/8] arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS
Date: Thu, 13 Oct 2022 10:03:25 +0800
Message-ID: <20221013020329.8800-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221013020329.8800-1-moudy.ho@mediatek.com>
References: <20221013020329.8800-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_190831_405744_06966EC6 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In MT8195, the MMSYS has two Video Processor Pipepline Subsystems
named VPPSYS0 and VPPSYS1, each with specific MUTEX to control
Start of Frame(SOF) and End of Frame (EOF) signals.
Before working with them, the addresses, interrupts, clocks and power
domains need to be set up in dts.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 1bb6054531c1..4888d5ff9df7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1483,6 +1483,15 @@
 			#clock-cells = <1>;
 		};
 
+		mutex@1400f000 {
+			compatible = "mediatek,mt8195-vpp-mutex";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xf000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MUTEX>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
 		smi_sub_common_vpp0_vpp1_2x1: smi@14010000 {
 			compatible = "mediatek,mt8195-smi-sub-common";
 			reg = <0 0x14010000 0 0x1000>;
@@ -1589,6 +1598,15 @@
 			#clock-cells = <1>;
 		};
 
+		mutex@14f01000 {
+			compatible = "mediatek,mt8195-vpp-mutex";
+			reg = <0 0x14f01000 0 0x1000>;
+			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x1000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
 		larb5: larb@14f02000 {
 			compatible = "mediatek,mt8195-smi-larb";
 			reg = <0 0x14f02000 0 0x1000>;
-- 
2.18.0


