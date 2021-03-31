Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05D5C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:15:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E6AF6195D
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E6AF6195D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ULSTBdHXYHR/UzamogvhHm0voNnL+ctSNNB8mPz17YI=; b=TwhPrj0gwH7xoirgYV5uFglBs
	ePa0rQ15GuiNZrHeGhDWVOTYjC+Rqyu3SOO+tP4jirSrdnCvHBYGqqkRaTky2/pKWlEY/9g6LK7tk
	WWGVFbe/OAZvpXOFMrYRUN0EBx1vAS2FtCSiWhMMbXyVzVoL67fAwX+OKW0Yfy/GRvCNx2PLmIqJw
	BX7QuZNFtGfpQK+XpCTkqacyfD1R7N0p1LX0T/RsQkO1Zwg2SyOjMkqyh+IYd17G99nZnlXtAhP65
	dqtKY02goB3PAjJ9gjum5DHDFxC6yrwKpMKYUJDBz7HSvsjDgcIIddGHnKHxsgdxIDA1DxBGFw3Am
	D5kfKHKJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRYoe-006OoZ-CY; Wed, 31 Mar 2021 11:15:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRYcU-006KCi-L9; Wed, 31 Mar 2021 11:02:47 +0000
X-UUID: 5f9fa50f27c143a08366cbbe384e6384-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mtU5J22Ag+EJNtoXY+14WMu9mMbZ2SY+Iiu/iD+lv6w=; 
 b=pzA0cpmfhAt8G7ttkVegQmQxkoXnB9bRAWLDBsWXH7qOS6XEXpMccnawrlPZAaRWT2iX5Zx8KrT+hqsG6sV4venqEQp86eQ43lTDEq8Ov4RJSSUIP8+hcx/JjxmFPaYRRpQuDBPEct5NqxZXUuCuWahWTextxKjE56NKSRNwbaU=;
X-UUID: 5f9fa50f27c143a08366cbbe384e6384-20210331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 861167920; Wed, 31 Mar 2021 04:02:22 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 04:02:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 19:02:19 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 31 Mar 2021 19:02:18 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 4/8] dt-bindings: regulator: Add document for MT6359
 regulator
Date: Wed, 31 Mar 2021 19:02:03 +0800
Message-ID: <1617188527-3392-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_120243_740084_A7D3C5CA 
X-CRM114-Status: GOOD (  15.88  )
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

add dt-binding document for MediaTek MT6359 PMIC

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
changes since v6:
- fix yaml error.
---
 .../bindings/regulator/mt6359-regulator.yaml  | 385 ++++++++++++++++++
 1 file changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
new file mode 100644
index 000000000000..8cc413eb482d
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -0,0 +1,385 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mt6359-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6359 Regulator from MediaTek Integrated
+
+maintainers:
+  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
+
+description: |
+  List of regulators provided by this controller. It is named
+  according to its regulator type, buck_<name> and ldo_<name>.
+  MT6359 regulators node should be sub node of the MT6397 MFD node.
+
+patternProperties:
+  "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(fe|bif|io)28$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(fe|bif|io)28$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(aud|io|aux|rf|m)18$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(aud|io|aux|rf|m)18$"
+
+    unevaluatedProperties: false
+
+  "^ldo_vsim[12]$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^vsim[12]$"
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        mt6359_vs1_buck_reg: buck_vs1 {
+          regulator-name = "vs1";
+          regulator-min-microvolt = <800000>;
+          regulator-max-microvolt = <2200000>;
+          regulator-enable-ramp-delay = <0>;
+          regulator-always-on;
+        };
+        mt6359_vgpu11_buck_reg: buck_vgpu11 {
+          regulator-name = "vgpu11";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <5000>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vmodem_buck_reg: buck_vmodem {
+          regulator-name = "vmodem";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1100000>;
+          regulator-ramp-delay = <10760>;
+          regulator-enable-ramp-delay = <200>;
+        };
+        mt6359_vpu_buck_reg: buck_vpu {
+          regulator-name = "vpu";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <5000>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vcore_buck_reg: buck_vcore {
+          regulator-name = "vcore";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1300000>;
+          regulator-ramp-delay = <5000>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vs2_buck_reg: buck_vs2 {
+          regulator-name = "vs2";
+          regulator-min-microvolt = <800000>;
+          regulator-max-microvolt = <1600000>;
+          regulator-enable-ramp-delay = <0>;
+          regulator-always-on;
+        };
+        mt6359_vpa_buck_reg: buck_vpa {
+          regulator-name = "vpa";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <3650000>;
+          regulator-enable-ramp-delay = <300>;
+        };
+        mt6359_vproc2_buck_reg: buck_vproc2 {
+          regulator-name = "vproc2";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vproc1_buck_reg: buck_vproc1 {
+          regulator-name = "vproc1";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vcore_sshub_buck_reg: buck_vcore_sshub {
+          regulator-name = "vcore_sshub";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+        };
+        mt6359_vgpu11_sshub_buck_reg: buck_vgpu11_sshub {
+          regulator-name = "vgpu11_sshub";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+        };
+        mt6359_vaud18_ldo_reg: ldo_vaud18 {
+          regulator-name = "vaud18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vsim1_ldo_reg: ldo_vsim1 {
+          regulator-name = "vsim1";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+        };
+        mt6359_vibr_ldo_reg: ldo_vibr {
+          regulator-name = "vibr";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <3300000>;
+        };
+        mt6359_vrf12_ldo_reg: ldo_vrf12 {
+          regulator-name = "vrf12";
+          regulator-min-microvolt = <1100000>;
+          regulator-max-microvolt = <1300000>;
+        };
+        mt6359_vusb_ldo_reg: ldo_vusb {
+          regulator-name = "vusb";
+          regulator-min-microvolt = <3000000>;
+          regulator-max-microvolt = <3000000>;
+          regulator-enable-ramp-delay = <960>;
+          regulator-always-on;
+        };
+        mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
+          regulator-name = "vsram_proc2";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <240>;
+          regulator-always-on;
+        };
+        mt6359_vio18_ldo_reg: ldo_vio18 {
+          regulator-name = "vio18";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+          regulator-enable-ramp-delay = <960>;
+          regulator-always-on;
+        };
+        mt6359_vcamio_ldo_reg: ldo_vcamio {
+          regulator-name = "vcamio";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+        };
+        mt6359_vcn18_ldo_reg: ldo_vcn18 {
+          regulator-name = "vcn18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vfe28_ldo_reg: ldo_vfe28 {
+          regulator-name = "vfe28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <120>;
+        };
+        mt6359_vcn13_ldo_reg: ldo_vcn13 {
+          regulator-name = "vcn13";
+          regulator-min-microvolt = <900000>;
+          regulator-max-microvolt = <1300000>;
+        };
+        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
+          regulator-name = "vcn33_1_bt";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3500000>;
+        };
+        mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
+          regulator-name = "vcn33_1_wifi";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3500000>;
+        };
+        mt6359_vaux18_ldo_reg: ldo_vaux18 {
+          regulator-name = "vaux18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <240>;
+          regulator-always-on;
+        };
+        mt6359_vsram_others_ldo_reg: ldo_vsram_others {
+          regulator-name = "vsram_others";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <5000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vefuse_ldo_reg: ldo_vefuse {
+          regulator-name = "vefuse";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <2000000>;
+        };
+        mt6359_vxo22_ldo_reg: ldo_vxo22 {
+          regulator-name = "vxo22";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <2200000>;
+          regulator-always-on;
+        };
+        mt6359_vrfck_ldo_reg: ldo_vrfck {
+          regulator-name = "vrfck";
+          regulator-min-microvolt = <1500000>;
+          regulator-max-microvolt = <1700000>;
+        };
+        mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
+          regulator-name = "vrfck";
+          regulator-min-microvolt = <1240000>;
+          regulator-max-microvolt = <1600000>;
+        };
+        mt6359_vbif28_ldo_reg: ldo_vbif28 {
+          regulator-name = "vbif28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vio28_ldo_reg: ldo_vio28 {
+          regulator-name = "vio28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-always-on;
+        };
+        mt6359_vemc_ldo_reg: ldo_vemc {
+          regulator-name = "vemc";
+          regulator-min-microvolt = <2900000>;
+          regulator-max-microvolt = <3300000>;
+        };
+        mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
+          regulator-name = "vemc";
+          regulator-min-microvolt = <2500000>;
+          regulator-max-microvolt = <3300000>;
+        };
+        mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
+          regulator-name = "vcn33_2_bt";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3500000>;
+        };
+        mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
+          regulator-name = "vcn33_2_wifi";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3500000>;
+        };
+        mt6359_va12_ldo_reg: ldo_va12 {
+          regulator-name = "va12";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <1300000>;
+          regulator-always-on;
+        };
+        mt6359_va09_ldo_reg: ldo_va09 {
+          regulator-name = "va09";
+          regulator-min-microvolt = <800000>;
+          regulator-max-microvolt = <1200000>;
+        };
+        mt6359_vrf18_ldo_reg: ldo_vrf18 {
+          regulator-name = "vrf18";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1810000>;
+        };
+        mt6359_vsram_md_ldo_reg: ldo_vsram_md {
+          regulator-name = "vsram_md";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <10760>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vufs_ldo_reg: ldo_vufs {
+          regulator-name = "vufs";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+        };
+        mt6359_vm18_ldo_reg: ldo_vm18 {
+          regulator-name = "vm18";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+          regulator-always-on;
+        };
+        mt6359_vbbck_ldo_reg: ldo_vbbck {
+          regulator-name = "vbbck";
+          regulator-min-microvolt = <1100000>;
+          regulator-max-microvolt = <1200000>;
+        };
+        mt6359_vsram_proc1_ldo_reg: ldo_vsram_proc1 {
+          regulator-name = "vsram_proc1";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <240>;
+          regulator-always-on;
+        };
+        mt6359_vsim2_ldo_reg: ldo_vsim2 {
+          regulator-name = "vsim2";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+        };
+        mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
+          regulator-name = "vsram_others_sshub";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+        };
+      };
+    };
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
