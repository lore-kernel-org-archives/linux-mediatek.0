Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BC1C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:17:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8A86196C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8A86196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NRosxpuwdf2aws3v+YgXArPCWmRa8aNU69Ox1UMgJis=; b=laQjmKeTNMRUi+VlJ56NBQ5uP
	bjKf22fFYwU+P5cOiPkMpwtO3Q4rvCLqmZo7jV8iCZXNWonvU371Ex3awtA+zReS8YgeQHwwMO44A
	piuYV2+HBpTnaaUNzcUSeOXbPpGE96yVVorgylLgdlIr8LPpIjbqRpRs1T9cQvI+Ih96cyntbAqO7
	rjWDc8HunnC/JfJdKUGlpfRf/KdNXCYC0OHaGl0onb1Yn53OrYFO+mHP7vxYYf8gYSuErlgK47EAv
	C8OhUdkkZk5CAwr7ONIhfpwjJmbSWXIUCIvb2pAnOTaKRN5TZJ6gThzxju7EW1RDi/3aWkUUt2taE
	sAlLg605Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRYqB-006PNQ-2q; Wed, 31 Mar 2021 11:16:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRYca-006KBY-Aw; Wed, 31 Mar 2021 11:02:54 +0000
X-UUID: a0d1bdc6dd184276a7f8a72b643b4e8f-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7WlJT02suLPyGpu+jH5XN1yi1jm2zNwKqnvfie7238o=; 
 b=f/EcMtiXxVHon8RD5rs2ZOTP7WeBGI0H0+1xNhD53QVnEFxog6Sondt6qRN3x0f1hZaKUsRAhZfgzJk9Z2Nm0/5PRiqxGxUGSfphBNsZ7BFosRI0pLKfz2PDTRZvrHkpzOlJemaYt7IHvBwJZtpCNhRtUsUuxddO/KEdO+LHcwI=;
X-UUID: a0d1bdc6dd184276a7f8a72b643b4e8f-20210331
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1141724883; Wed, 31 Mar 2021 04:02:29 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 04:02:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 19:02:19 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 31 Mar 2021 19:02:19 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Fei Shao <fshao@chromium.org>
CC: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Wen Su
 <wen.su@mediatek.com>
Subject: [PATCH v7 8/8] arm64: dts: mt6359: add PMIC MT6359 related nodes
Date: Wed, 31 Mar 2021 19:02:07 +0800
Message-ID: <1617188527-3392-9-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 90F6410DAB878DBB3F453681DC3BDC6ECC1F1C9BE4FE4CAFBAA306415CE71AB92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_120249_179869_32C0BB8E 
X-CRM114-Status: GOOD (  15.72  )
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

From: Wen Su <wen.su@mediatek.com>

add PMIC MT6359 related nodes which is for MT6779 platform

Signed-off-by: Wen Su <wen.su@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
changes since v6:
- update the regulator node.
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi    | 298 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   1 +
 2 files changed, 299 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
new file mode 100644
index 000000000000..18c0d5325c22
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6359";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6359codec: mt6359codec {
+		};
+
+		regulators {
+			mt6359_vs1_buck_reg: buck_vs1 {
+				regulator-name = "vs1";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-always-on;
+			};
+			mt6359_vgpu11_buck_reg: buck_vgpu11 {
+				regulator-name = "vgpu11";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <5000>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vmodem_buck_reg: buck_vmodem {
+				regulator-name = "vmodem";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-ramp-delay = <10760>;
+				regulator-enable-ramp-delay = <200>;
+			};
+			mt6359_vpu_buck_reg: buck_vpu {
+				regulator-name = "vpu";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <5000>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vcore_buck_reg: buck_vcore {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vs2_buck_reg: buck_vs2 {
+				regulator-name = "vs2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1600000>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-always-on;
+			};
+			mt6359_vpa_buck_reg: buck_vpa {
+				regulator-name = "vpa";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3650000>;
+				regulator-enable-ramp-delay = <300>;
+			};
+			mt6359_vproc2_buck_reg: buck_vproc2 {
+				regulator-name = "vproc2";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <7500>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vproc1_buck_reg: buck_vproc1 {
+				regulator-name = "vproc1";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <7500>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vcore_sshub_buck_reg: buck_vcore_sshub {
+				regulator-name = "vcore_sshub";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+			};
+			mt6359_vgpu11_sshub_buck_reg: buck_vgpu11_sshub {
+				regulator-name = "vgpu11_sshub";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+			};
+			mt6359_vaud18_ldo_reg: ldo_vaud18 {
+				regulator-name = "vaud18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vsim1_ldo_reg: ldo_vsim1 {
+				regulator-name = "vsim1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+			};
+			mt6359_vibr_ldo_reg: ldo_vibr {
+				regulator-name = "vibr";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+			};
+			mt6359_vrf12_ldo_reg: ldo_vrf12 {
+				regulator-name = "vrf12";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1300000>;
+			};
+			mt6359_vusb_ldo_reg: ldo_vusb {
+				regulator-name = "vusb";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <960>;
+				regulator-always-on;
+			};
+			mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
+				regulator-name = "vsram_proc2";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <7500>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+			mt6359_vio18_ldo_reg: ldo_vio18 {
+				regulator-name = "vio18";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+				regulator-enable-ramp-delay = <960>;
+				regulator-always-on;
+			};
+			mt6359_vcamio_ldo_reg: ldo_vcamio {
+				regulator-name = "vcamio";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+			};
+			mt6359_vcn18_ldo_reg: ldo_vcn18 {
+				regulator-name = "vcn18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vfe28_ldo_reg: ldo_vfe28 {
+				regulator-name = "vfe28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+			mt6359_vcn13_ldo_reg: ldo_vcn13 {
+				regulator-name = "vcn13";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1300000>;
+			};
+			mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
+				regulator-name = "vcn33_1_bt";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3500000>;
+			};
+			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
+				regulator-name = "vcn33_1_wifi";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3500000>;
+			};
+			mt6359_vaux18_ldo_reg: ldo_vaux18 {
+				regulator-name = "vaux18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+			mt6359_vsram_others_ldo_reg: ldo_vsram_others {
+				regulator-name = "vsram_others";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <5000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vefuse_ldo_reg: ldo_vefuse {
+				regulator-name = "vefuse";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <2000000>;
+			};
+			mt6359_vxo22_ldo_reg: ldo_vxo22 {
+				regulator-name = "vxo22";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-always-on;
+			};
+			mt6359_vrfck_ldo_reg: ldo_vrfck {
+				regulator-name = "vrfck";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1700000>;
+			};
+			mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
+				regulator-name = "vrfck";
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1600000>;
+			};
+			mt6359_vbif28_ldo_reg: ldo_vbif28 {
+				regulator-name = "vbif28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vio28_ldo_reg: ldo_vio28 {
+				regulator-name = "vio28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+			mt6359_vemc_ldo_reg: ldo_vemc {
+				regulator-name = "vemc";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <3300000>;
+			};
+			mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
+				regulator-name = "vemc";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+			mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
+				regulator-name = "vcn33_2_bt";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3500000>;
+			};
+			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
+				regulator-name = "vcn33_2_wifi";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3500000>;
+			};
+			mt6359_va12_ldo_reg: ldo_va12 {
+				regulator-name = "va12";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+			};
+			mt6359_va09_ldo_reg: ldo_va09 {
+				regulator-name = "va09";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1200000>;
+			};
+			mt6359_vrf18_ldo_reg: ldo_vrf18 {
+				regulator-name = "vrf18";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1810000>;
+			};
+			mt6359_vsram_md_ldo_reg: ldo_vsram_md {
+				regulator-name = "vsram_md";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <10760>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vufs_ldo_reg: ldo_vufs {
+				regulator-name = "vufs";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+			};
+			mt6359_vm18_ldo_reg: ldo_vm18 {
+				regulator-name = "vm18";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+				regulator-always-on;
+			};
+			mt6359_vbbck_ldo_reg: ldo_vbbck {
+				regulator-name = "vbbck";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1200000>;
+			};
+			mt6359_vsram_proc1_ldo_reg: ldo_vsram_proc1 {
+				regulator-name = "vsram_proc1";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <7500>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+			mt6359_vsim2_ldo_reg: ldo_vsim2 {
+				regulator-name = "vsim2";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+			};
+			mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
+				regulator-name = "vsram_others_sshub";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+			};
+		};
+
+		mt6359rtc: mt6359rtc {
+			compatible = "mediatek,mt6358-rtc";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 0205837fa698..808be492e970 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8192.dtsi"
+#include "mt6359.dtsi"
 
 / {
 	model = "MediaTek MT8192 evaluation board";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
