Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65248C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 06:53:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8EF22AAF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 06:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8EF22AAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z5voJJ83wAznJLUBPlmz3yMft7ulUBNOMJIhgQYMXEA=; b=uO9g4+lTAUZ4v8or1Rf803FbD
	xdY6XZvThmuKgUILlnmtGcGAtVCiLerIqFqem0k5k6nb0f7LK2IirZUownXMBfp/54XRqC7rDNZym
	H9Q5PfXcRIXXxDzrI2GiYyq6p39Z9yVH4jdp8pfpg6Kg74cYppHezpo2SrhFAONmpzysmBmbOOcAc
	wHG3dd7acXmgta2wi7Z7opA8ZZKDM2BcRIHmsTj06Hf+uqSCnOJNxs7eX3IL22Jjg+XpOoOQERpJk
	na7WDU3k5gBWbXjq+HZ0mtKBvLJZcfq/Wu4t5e7nFLgSvCepYkpjb3yWMzGyT8oAcM2sNJ5IdqO71
	E5heLIPog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzDYj-0007or-T5; Tue, 12 Jan 2021 06:53:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzDYg-0007nB-IZ; Tue, 12 Jan 2021 06:53:40 +0000
X-UUID: 874339443f634e53801e1edbf4ab5a51-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gh0u8lvXq4YvImgRp+2ZHh7ZexSSH7ovOgCdlzJUblg=; 
 b=jpVLeCeDRAt2y3lFyH4nRDal4ok4YDFqth3NcqYLLSlm0ny03iW4pCTJNmB286YY9s2b9ZLZPpBJC+JTgKuNHqMMXSMkuyuuJZXSEwlVH+PRpdbEMhlqaEKpBvANTZM2NsYp+999SXLGkTB+pk43715mWF89J79R/WobuoFJzGM=;
X-UUID: 874339443f634e53801e1edbf4ab5a51-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 148281443; Mon, 11 Jan 2021 22:53:36 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 22:49:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 14:49:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 Jan 2021 14:49:36 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: mt8192: Add node for the Mali GPU
Date: Tue, 12 Jan 2021 14:49:33 +0800
Message-ID: <20210112064933.12951-2-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210112064933.12951-1-Nick.Fan@mediatek.com>
References: <20210112064933.12951-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_015338_858316_1EC8A224 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Nick Fan <Nick.Fan@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a basic GPU node for mt8192.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
This patch depends on Mediatek power and regulator support.

Listed as following.

[1]https://lore.kernel.org/patchwork/patch/1336293/
[2]https://patchwork.kernel.org/project/linux-mediatek/list/?series=374013
[3]https://lore.kernel.org/patchwork/patch/1356037/
[4]https://patchwork.kernel.org/project/linux-mediatek/list/?series=405777
[5]https://lore.kernel.org/patchwork/patch/1356175/
[6]https://patchwork.kernel.org/project/linux-mediatek/patch/1605700894-32699-6-git-send-email-hsin-hsiung.wang@mediatek.com/
[7]https://patchwork.kernel.org/project/linux-mediatek/patch/1608104827-7937-10-git-send-email-hsin-hsiung.wang@mediatek.com/
---
---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   7 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 172 ++++++++++++++++++++
 2 files changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 6c1e2b3e8a60..48c0e240dd92 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8192.dtsi"
+#include "mt6359.dtsi"
 
 / {
 	model = "MediaTek MT8192 evaluation board";
@@ -70,6 +71,12 @@
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
index d6a4ad242a33..9abba13df68e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -822,6 +822,178 @@
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
+		};
+
+		gpu_opp_table: opp_table0 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-358000000 {
+				opp-hz = /bits/ 64 <358000000>;
+				opp-hz-real = /bits/ 64 <358000000>,
+					      /bits/ 64 <358000000>;
+				opp-microvolt = <606250>,
+						<750000>;
+			};
+
+			opp-399000000 {
+				opp-hz = /bits/ 64 <399000000>;
+				opp-hz-real = /bits/ 64 <399000000>,
+					      /bits/ 64 <399000000>;
+				opp-microvolt = <618750>,
+						<750000>;
+			};
+
+			opp-440000000 {
+				opp-hz = /bits/ 64 <440000000>;
+				opp-hz-real = /bits/ 64 <440000000>,
+					      /bits/ 64 <440000000>;
+				opp-microvolt = <631250>,
+						<750000>;
+			};
+
+			opp-482000000 {
+				opp-hz = /bits/ 64 <482000000>;
+				opp-hz-real = /bits/ 64 <482000000>,
+					      /bits/ 64 <482000000>;
+				opp-microvolt = <643750>,
+						<750000>;
+			};
+
+			opp-523000000 {
+				opp-hz = /bits/ 64 <523000000>;
+				opp-hz-real = /bits/ 64 <523000000>,
+					      /bits/ 64 <523000000>;
+				opp-microvolt = <656250>,
+						<750000>;
+			};
+
+			opp-564000000 {
+				opp-hz = /bits/ 64 <564000000>;
+				opp-hz-real = /bits/ 64 <564000000>,
+					      /bits/ 64 <564000000>;
+				opp-microvolt = <668750>,
+						<750000>;
+			};
+
+			opp-605000000 {
+				opp-hz = /bits/ 64 <605000000>;
+				opp-hz-real = /bits/ 64 <605000000>,
+					      /bits/ 64 <605000000>;
+				opp-microvolt = <681250>,
+						<750000>;
+			};
+
+			opp-647000000 {
+				opp-hz = /bits/ 64 <647000000>;
+				opp-hz-real = /bits/ 64 <647000000>,
+					      /bits/ 64 <647000000>;
+				opp-microvolt = <693750>,
+						<750000>;
+			};
+
+			opp-688000000 {
+				opp-hz = /bits/ 64 <688000000>;
+				opp-hz-real = /bits/ 64 <688000000>,
+					      /bits/ 64 <688000000>;
+				opp-microvolt = <706250>,
+						<750000>;
+			};
+
+			opp-724000000 {
+				opp-hz = /bits/ 64 <724000000>;
+				opp-hz-real = /bits/ 64 <724000000>,
+					      /bits/ 64 <724000000>;
+				opp-microvolt = <725000>,
+						<750000>;
+			};
+
+			opp-760000000 {
+				opp-hz = /bits/ 64 <760000000>;
+				opp-hz-real = /bits/ 64 <760000000>,
+					      /bits/ 64 <760000000>;
+				opp-microvolt = <743750>,
+						<750000>;
+			};
+
+			opp-795000000 {
+				opp-hz = /bits/ 64 <795000000>;
+				opp-hz-real = /bits/ 64 <795000000>,
+					      /bits/ 64 <795000000>;
+				opp-microvolt = <762500>,
+						<762500>;
+			};
+
+			opp-831000000 {
+				opp-hz = /bits/ 64 <831000000>;
+				opp-hz-real = /bits/ 64 <831000000>,
+					      /bits/ 64 <831000000>;
+				opp-microvolt = <781250>,
+						<781250>;
+			};
+
+			opp-855000000 {
+				opp-hz = /bits/ 64 <855000000>;
+				opp-hz-real = /bits/ 64 <855000000>,
+					      /bits/ 64 <855000000>;
+				opp-microvolt = <793750>,
+						<793750>;
+			};
+
+			opp-902000000 {
+				opp-hz = /bits/ 64 <902000000>;
+				opp-hz-real = /bits/ 64 <902000000>,
+					      /bits/ 64 <902000000>;
+				opp-microvolt = <818750>,
+						<818750>;
+			};
+
+			opp-950000000 {
+				opp-hz = /bits/ 64 <950000000>;
+				opp-hz-real = /bits/ 64 <950000000>,
+					      /bits/ 64 <950000000>;
+				opp-microvolt = <843750>,
+						<843750>;
+			};
+		};
+
 		mfgcfg: syscon@13fbf000 {
 			compatible = "mediatek,mt8192-mfgcfg", "syscon";
 			reg = <0 0x13fbf000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
