Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9629C3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaCx4GPrx89E/9c/EnzITbJJBX/TbYcU6esy3AWOiYI=; b=bRNJ6oSxd8X23+R5KQ/kMPswdt
	/j/nDyue4V/g71feT6V+L9NzZMJX2mOjsKGbfjXbNvEOb3klDIRCfPo5NnvKNWJ+s17yQXv/Qz3H7
	1JZb7DIua8FKqPmMQdLzmL27WMpDkfww3Ir1s1OTuVRs4uS42EJHN4vxomXSlb6Shfz0OF0SIV+tM
	qrVNgax+ZvECq0mgt9Z6TUdD3WXrbI+LlOq2HcER7TKHPGW+iY4/TR4HWooCntxc6eUJi9JGKLw5l
	0+2kaIwdECp1SlHpMhJiNbbpZg8soOBB0iaAI9180EL93PIhpO3w3sjPolRo0QX0fZGgxq57CFDBV
	Vqi7ogLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVH6-005Ik7-1b;
	Fri, 25 Aug 2023 11:46:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVH0-005IdV-0Y;
	Fri, 25 Aug 2023 11:46:44 +0000
X-UUID: 0a265eec433d11ee83ed1395ce914268-20230825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oaCx4GPrx89E/9c/EnzITbJJBX/TbYcU6esy3AWOiYI=;
	b=fXLqDKU5DlRNt2ZK7OFjZSYW9wFR42nKV9HmDbkhs2AYHYQe07qOmiF6S0Ad0LesodrWqyntPw+cyzWV2tz+AykQMZvZpfSdb1isJq2KAgai8Pa83ZV2zTEEeyJ+XsisA5FBShDZTevkDR/3iPb5QeHWv39TFhU+AVDLumU6OO4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:b6459711-cebf-41e9-969d-d57f1165c827,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:b6459711-cebf-41e9-969d-d57f1165c827,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:de76f2ee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:23082519463610CR8H4I,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_FAS
X-UUID: 0a265eec433d11ee83ed1395ce914268-20230825
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 438635203; Fri, 25 Aug 2023 04:46:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Aug 2023 19:46:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Aug 2023 19:46:31 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Fabien Parent
	<fparent@baylibre.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 3/4] arm64: dts: mediatek: mt6360: add PMIC MT6360 related nodes
Date: Fri, 25 Aug 2023 19:46:22 +0800
Message-ID: <20230825114623.16884-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230825114623.16884-1-macpaul.lin@mediatek.com>
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_044642_259950_670525E1 
X-CRM114-Status: GOOD (  13.38  )
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
 arch/arm64/boot/dts/mediatek/mt6360.dtsi | 112 +++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6360.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6360.dtsi b/arch/arm64/boot/dts/mediatek/mt6360.dtsi
new file mode 100644
index 000000000000..e841f4e5a54b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6360.dtsi
@@ -0,0 +1,112 @@
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
+			regulator-name = "usb-otg-vbus";
+			regulator-min-microvolt = <4425000>;
+			regulator-max-microvolt = <5825000>;
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
+		LDO_VIN3-supply = <&mt6360_buck2>;
+
+		mt6360_buck1: buck1 {
+			regulator-compatible = "BUCK1";
+			regulator-name = "mt6360,buck1";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP
+						   MT6360_OPMODE_ULP>;
+		};
+
+		mt6360_buck2: buck2 {
+			regulator-compatible = "BUCK2";
+			regulator-name = "mt6360,buck2";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP
+						   MT6360_OPMODE_ULP>;
+		};
+
+		mt6360_ldo1: ldo1 {
+			regulator-compatible = "LDO1";
+			regulator-name = "mt6360,ldo1";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_ldo2: ldo2 {
+			regulator-compatible = "LDO2";
+			regulator-name = "mt6360,ldo2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_ldo3: ldo3 {
+			regulator-compatible = "LDO3";
+			regulator-name = "mt6360,ldo3";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_ldo5: ldo5 {
+			regulator-compatible = "LDO5";
+			regulator-name = "mt6360,ldo5";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_ldo6: ldo6 {
+			regulator-compatible = "LDO6";
+			regulator-name = "mt6360,ldo6";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <2100000>;
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+
+		mt6360_ldo7: ldo7 {
+			regulator-compatible = "LDO7";
+			regulator-name = "mt6360,ldo7";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <2100000>;
+			regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+						   MT6360_OPMODE_LP>;
+		};
+	};
+};
-- 
2.18.0


