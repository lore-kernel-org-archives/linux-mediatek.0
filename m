Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5A7C43466
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:59:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5FB221789
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JN+GOA/G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vDQJmZQi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5FB221789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B9Un1oBh+nSdgksCTu/llQJ8lBRME3/6DI11kV/YE1Q=; b=JN+GOA/GaHulkHCOGCMK0hBNu
	s6p/q2J4yw1/2JBrFUaxYszRBoNJhPJ9xPDVZHWMR5FCnmmKU+9eITQQUw9iGN3d7Dmg47U8AnL7G
	yK4udhbfjrexRaOVG9CrnP6+6PzTRXyUS1fxAylwP+7Zw41f/KNpmw7kTsK1aLuPnXwgW6xjS8Mmu
	FD8DtrbVNhS7HNebTHYqjcyku27cmiys5EwqHupREoVHtKTeMnyDSIOejukMwUhRzXYMCXJgu4N1L
	Hwdgt+VzMtoKo62MXhzU/2/XVm7ZZJRsAKLyGZLVQb8F/4JKbKr9dP1o39dH4O97kTYvEuHCuBvtP
	9128mBjGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKKTT-00032Z-Dl; Mon, 21 Sep 2020 11:59:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKKT4-0002qa-Hm; Mon, 21 Sep 2020 11:58:53 +0000
X-UUID: 177c240c60cc4243acca40977a706e65-20200921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tRi3js+Gy/NZgybzQ4GIcrcP/WGytrUzG0WiYDDq2nc=; 
 b=vDQJmZQiiUcdLTTwEkLT9VsOGtx8FO2US2tbRmhcH4zjFS2/YeDyLi7RdRFQq6NbyiRqEgm1gj812r6QNpVCWCG8LtBDxUnPbALhttmE99JVBA3S45qP3vfRWEXsrh3aFfaU9XjC7B3k2u6+FTckLBvW95LqulexFj9YzTu5XQg=;
X-UUID: 177c240c60cc4243acca40977a706e65-20200921
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1140495487; Mon, 21 Sep 2020 03:58:42 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 04:48:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 19:48:40 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Sep 2020 19:48:40 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 8/8] arm64: dts: mt6359: add PMIC MT6359 related nodes
Date: Mon, 21 Sep 2020 19:48:15 +0800
Message-ID: <1600688895-9238-9-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1600688895-9238-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1600688895-9238-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_075850_803722_7E0BE8C6 
X-CRM114-Status: GOOD (  14.64  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Wen Su <wen.su@mediatek.com>

add PMIC MT6359 related nodes which is for MT6779 platform

Signed-off-by: Wen Su <wen.su@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 296 +++++++++++++++++++++++++++++++
 1 file changed, 296 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
new file mode 100644
index 0000000..bba8e2f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6359";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6359codec: mt6359codec {
+			compatible = "mediatek,mt6359-sound";
+		};
+
+		mt6359regulator: mt6359regulator {
+			compatible = "mediatek,mt6359-regulator";
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
+	};
+};
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
