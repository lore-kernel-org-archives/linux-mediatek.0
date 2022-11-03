Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4375EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6//sMb3roxlwQ/ug5laiRTOUm7bAA0Lv2BXddUnKPs=; b=hALDl7JHiMTcoFeXGG1ef36Wcu
	Pt4H+tRNhmRkjYXU2fzYP02MLeDqmUpWySIXd0W+4faH7m3kRpnRbwpv06wDaXJ6xEEPHdr3L8fW7
	sb1jLW2NuobD9HMpCz1nQGRhr2TEnp1j9l9CEGBxR8O3567Fz/EMzE/karoVah65INAxDOUekQUdD
	W9Os9bIC6wVMu5/k+nENjJ9ifXB00V5lnn96ef3aHvUqqKDCc8t0NVRG2OUvbErHzrts0Bmu8jfG5
	Qq1cTLl00MGxTXUMaluACdZ60V2F5t74JkhpsmHbO6BJbQ4O7osRvmixlvXCcCUnXChTT8+4G3b3u
	eQYqQoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWZ9-00GwcB-JG; Thu, 03 Nov 2022 09:31:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWWj-00Gvch-MG
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 09:28:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0DE9FB82623;
	Thu,  3 Nov 2022 09:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CFEC433D6;
	Thu,  3 Nov 2022 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667467722;
	bh=I9mSsyI6n40XB9Lh0ez9uRU4qkTdwM8u62UijOFX84A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iVaERi2vyjNKENagsDzvwVPaBRVMk/xgR/+SvR5KdGk3qi7rWlPKnxuSfA694I0pr
	 y38TUd/f2m8J74AoIQkUWeVBMPbqdTw2Wn1HIMgr4NKPcshRYS3zI2+iWEA0HnNY4B
	 NshHc8hoiYitvA9OL1W2a72rdvpmpyw1mZYShyo1I6MnKEYNZNAZjsrWrMOGx+Sz3f
	 hPhJU2sq+FpA4JWFcL1c7CYWR3MR1wJV137SzxwlXRrgbMkJKvUe7IMGRs5SHvgD05
	 IX0VCLk+EO1pFKSiJdu4pmq3vvmOitFdaIqWACL/6wREzPVr5NXjgwZpiG53VIfX8o
	 aHnlZka16cXfg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 net-next 1/8] arm64: dts: mediatek: mt7986: add support for RX Wireless Ethernet Dispatch
Date: Thu,  3 Nov 2022 10:28:00 +0100
Message-Id: <4bd5f6626174ac042c0e9b9f2ffff40c3c72b88a.1667466887.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667466887.git.lorenzo@kernel.org>
References: <cover.1667466887.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_022846_039047_C4C68F4B 
X-CRM114-Status: GOOD (  11.02  )
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

Similar to TX Wireless Ethernet Dispatch, introduce RX Wireless Ethernet
Dispatch to offload traffic received by the wlan interface to lan/wan
one.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 72e0d9722e07..b0a593c6020e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mt7986-clk.h>
 #include <dt-bindings/reset/mt7986-resets.h>
+#include <dt-bindings/reset/ti-syscon.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -76,6 +77,31 @@ wmcpu_emi: wmcpu-reserved@4fc00000 {
 			no-map;
 			reg = <0 0x4fc00000 0 0x00100000>;
 		};
+
+		wo_emi0: wo-emi@4fd00000 {
+			reg = <0 0x4fd00000 0 0x40000>;
+			no-map;
+		};
+
+		wo_emi1: wo-emi@4fd40000 {
+			reg = <0 0x4fd40000 0 0x40000>;
+			no-map;
+		};
+
+		wo_ilm0: wo-ilm@151e0000 {
+			reg = <0 0x151e0000 0 0x8000>;
+			no-map;
+		};
+
+		wo_ilm1: wo-ilm@151f0000 {
+			reg = <0 0x151f0000 0 0x8000>;
+			no-map;
+		};
+
+		wo_data: wo-data@4fd80000 {
+			reg = <0 0x4fd80000 0 0x240000>;
+			no-map;
+		};
 	};
 
 	timer {
@@ -226,6 +252,12 @@ ethsys: syscon@15000000 {
 			 reg = <0 0x15000000 0 0x1000>;
 			 #clock-cells = <1>;
 			 #reset-cells = <1>;
+
+			ethsysrst: reset-controller {
+				compatible = "ti,syscon-reset";
+				#reset-cells = <1>;
+				ti,reset-bits = <0x34 4 0x34 4 0x34 4 (ASSERT_SET | DEASSERT_CLEAR | STATUS_SET)>;
+			};
 		};
 
 		wed_pcie: wed-pcie@10003000 {
@@ -240,6 +272,11 @@ wed0: wed@15010000 {
 			reg = <0 0x15010000 0 0x1000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&wo_emi0>, <&wo_ilm0>, <&wo_data>;
+			memory-region-names = "wo-emi", "wo-ilm", "wo-data";
+			mediatek,wo-ccif = <&wo_ccif0>;
+			mediatek,wo-boot = <&wo_boot>;
+			mediatek,wo-dlm = <&wo_dlm0>;
 		};
 
 		wed1: wed@15011000 {
@@ -248,6 +285,44 @@ wed1: wed@15011000 {
 			reg = <0 0x15011000 0 0x1000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&wo_emi1>, <&wo_ilm1>, <&wo_data>;
+			memory-region-names = "wo-emi", "wo-ilm", "wo-data";
+			mediatek,wo-ccif = <&wo_ccif1>;
+			mediatek,wo-boot = <&wo_boot>;
+			mediatek,wo-dlm = <&wo_dlm1>;
+		};
+
+		wo_ccif0: syscon@151a5000 {
+			compatible = "mediatek,mt7986-wo-ccif", "syscon";
+			reg = <0 0x151a5000 0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wo_ccif1: syscon@151ad000 {
+			compatible = "mediatek,mt7986-wo-ccif", "syscon";
+			reg = <0 0x151ad000 0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wo_dlm0: wo-dlm@151e8000 {
+			compatible = "mediatek,mt7986-wo-dlm";
+			reg = <0 0x151e8000 0 0x2000>;
+			resets = <&ethsysrst 0>;
+			reset-names = "wocpu_rst";
+		};
+
+		wo_dlm1: wo-dlm@151f8000 {
+			compatible = "mediatek,mt7986-wo-dlm";
+			reg = <0 0x151f8000 0 0x2000>;
+			resets = <&ethsysrst 0>;
+			reset-names = "wocpu_rst";
+		};
+
+		wo_boot: syscon@15194000 {
+			compatible = "mediatek,mt7986-wo-boot", "syscon";
+			reg = <0 0x15194000 0 0x1000>;
 		};
 
 		eth: ethernet@15100000 {
-- 
2.38.1


