Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7D6C83F01
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+UbBF/3JQZviCPlK4rdr2SHoBvRwTsrx1RlcHa0xCM=; b=0ysUV/2KPNTNoKS3F7g+eLgMay
	Pgcdlcj4RH5aoqHbOGzNxPOZwZD+yJ9FNtn+BpxGbGQoiArQ0dMJunT1X4cQcoX4wIf+sR0Z2fD24
	97DNCp94gh0LVTzmr4KAPiGT8oyqli3rX+mjKfd/lfg+7K5dRawdXxa5dzeZ8yQ9Rj+9ooiwZqJyL
	CBPeQbRJBnY3q0/ryzEoQJVLQ4GECJdMYmMxrH1hXtjvyCXkobN4kLLG5UEhJtlw25QjtfviVgD4N
	znTb0h5V41lbtOPU132qxYVkmBSnw1lOAfhYHRKUiplNycVFsaFWtWECM6D3SLt5nldYZspzBaL0y
	1St/Vm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJBO-00DN3z-1h;
	Wed, 30 Aug 2023 11:16:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJBL-00DN3N-0F;
	Wed, 30 Aug 2023 11:16:20 +0000
X-UUID: a34a035c472611ee912e1518a6540028-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=n+UbBF/3JQZviCPlK4rdr2SHoBvRwTsrx1RlcHa0xCM=;
	b=a1gkRO1Mfv7CrW9jZunZ2GHTC7NMUgNKY1ru6uXI7hRLfFp8DJ4cIb+mx8iX1KK5UTDtHILJ0464iqW+JrxBTE6fNfjnA3qVqqfJdH8hurl5kQwr0Tf4YId4La+QuoLxkI8EAEzyDQ3sizPLRAmwFWxHK/tBoqmRocv4yyeiIes=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:56eeb770-ea1a-4716-bc65-74c0dda48760,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:f46c1eef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a34a035c472611ee912e1518a6540028-20230830
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 150980690; Wed, 30 Aug 2023 04:16:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Aug 2023 19:15:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Aug 2023 19:15:42 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Fabien Parent
	<fparent@baylibre.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 3/4] arm64: dts: mediatek: mt6360: add PMIC MT6360 related nodes
Date: Wed, 30 Aug 2023 19:15:31 +0800
Message-ID: <20230830111532.9048-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230830111532.9048-1-macpaul.lin@mediatek.com>
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230830111532.9048-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_041619_120974_D306522B 
X-CRM114-Status: GOOD (  13.07  )
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

MT6360 is the secondary PMIC for MT8195.
It supports USB Type-C and PD functions.
Add MT6360 related common nodes which is used for MT8195 platform, includes
 - charger
 - ADC
 - LED
 - regulators

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6360.dtsi | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6360.dtsi

Change for v2:
 - Remove the following properties according to Chen-Yu Tsai's suggestion
  - regulator-name
  - regulator-min-microvolt
  - regulator-max-microvolt

diff --git a/arch/arm64/boot/dts/mediatek/mt6360.dtsi b/arch/arm64/boot/dts/mediatek/mt6360.dtsi
new file mode 100644
index 000000000000..a89fd43d0f1f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6360.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 MediaTek Inc.
+ */
+
+#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+
+&mt6360 {
+	interrupt-controller;
+	interrupt-parent = <&pio>;
+	interrupt-names = "IRQB";
+
+	charger {
+		compatible = "mediatek,mt6360-chg";
+		richtek,vinovp-microvolt = <14500000>;
+
+		otg_vbus_regulator: usb-otg-vbus-regulator {
+			regulator-compatible = "usb-otg-vbus";
+		};
+	};
+
+	adc {
+		compatible = "mediatek,mt6360-adc";
+		#io-channel-cells = <1>;
+	};
+
+	led {
+		compatible = "mediatek,mt6360-led";
+	};
+
+	regulator {
+		compatible = "mediatek,mt6360-regulator";
+		LDO_VIN3-supply = <&mt6360_emi_vddq_buck2_reg>;
+
+		mt6360_emi_vdd2_buck1_reg: buck1-emi-vdd2 {
+			regulator-compatible = "BUCK1";
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP
+						   MT6360_OPMODE_ULP>;
+		};
+
+		mt6360_emi_vddq_buck2_reg: buck2-emi-vddq {
+			regulator-compatible = "BUCK2";
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP
+						   MT6360_OPMODE_ULP>;
+		};
+
+		mt6360_tp1_p3v0_ldo1_reg: ldo1-tp1-p3v0 {
+			regulator-compatible = "LDO1";
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_panel1_p1v8_ldo2_reg: ldo2-panel1-p1v8 {
+			regulator-compatible = "LDO2";
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_vmc_pmu_ldo3_reg: ldo3-vmc-pmu {
+			regulator-compatible = "LDO3";
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_vmch_pmu_ldo5_reg: ldo5-vmch-pmu {
+			regulator-compatible = "LDO5";
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_ldo6_reg: ldo6-mt6360 {
+			regulator-compatible = "LDO6";
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_emi_vmddr_en_ldo7_reg: ldo7-emi-vmddr-en {
+			regulator-compatible = "LDO7";
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+	};
+};
-- 
2.18.0


