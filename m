Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63553C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 10:15:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D92B60FD9
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 10:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D92B60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dE1y4voiAjPJtMlmRSM0d7ueil0Wt7RPCjLoHDczi4=; b=26sGv00vqsPdlg
	rNy1NHNpIzyFSvEItPjCH3wcWu3ZXp+P/00CxmBUghBeME+/u0Hbug4GMhFRt2ZqPmjvpm9r3GZfg
	zDAy5fbOXOlQRTA8EBE98EmGGR4mJY+03mHzAYP86TOtMNihVMbjKJOePV2fv0hk/CJ227EqNAbR4
	lsH5rByo3g+fT1c3AJY/cR823nEcjLCZS9CoticD5znuQnNji45kry4lF4hpJIRh3OSrC4hSAitk4
	8gd6VeQUFgbvIYIZ6Roaa9fXOChCZZ57pZJgqM3eBuzjOLoAYuLmL9iA69UbvPiemS4PdCBQpXQ0J
	OH3wUXdxc9J7KQ86V1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meE3o-00CXWG-4Z; Sat, 23 Oct 2021 10:15:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meE2q-00CWxa-Lw; Sat, 23 Oct 2021 10:14:34 +0000
X-UUID: cb505f310a0b40d3af6de42c1c02df4e-20211023
X-UUID: cb505f310a0b40d3af6de42c1c02df4e-20211023
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 706710381; Sat, 23 Oct 2021 03:14:24 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 03:14:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 18:14:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 18:14:20 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, "Chun-Jie
 Chen" <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v3 7/7] arm64: dts: mt8192: Add APU power domain node
Date: Sat, 23 Oct 2021 18:13:34 +0800
Message-ID: <20211023101334.27686-8-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023101334.27686-1-flora.fu@mediatek.com>
References: <20211023101334.27686-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_031432_765391_C37821C2 
X-CRM114-Status: GOOD (  11.21  )
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

Add APU power domain node to MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
Note:
This patch depends on mt8192/mt6359 dts patches which haven't yet been accepted.
This series is based on MT8192 clock[1][2] and MT8193/PMIC[3][4] patches.
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521655
[2] https://patchwork.kernel.org/patch/12134935
[3] https://patchwork.kernel.org/patch/12140237
---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |  7 ++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 27 +++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 808be492e970..5d9e108e41f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -28,3 +28,10 @@
 &uart0 {
 	status = "okay";
 };
+
+&apuspm {
+	vsram-supply = <&mt6359_vsram_md_ldo_reg>;
+	apu_top: power-domain@0 {
+		domain-supply = <&mt6359_vproc1_buck_reg>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 72bbc3b4abf9..7014082637b0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -928,6 +928,33 @@
 			#clock-cells = <1>;
 		};
 
+		apuspm: power-domain@190f0000 {
+			compatible = "mediatek,mt8192-apu-pm", "syscon";
+			reg = <0 0x190f0000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#power-domain-cells = <1>;
+			mediatek,scpsys = <&scpsys>;
+			mediatek,apu-conn = <&apu_conn>;
+			mediatek,apu-vcore = <&apu_vcore>;
+			apu_top: power-domain@0 {
+				reg = <0>;
+				#power-domain-cells = <0>;
+				clocks = <&topckgen CLK_TOP_DSP_SEL>,
+					 <&topckgen CLK_TOP_IPU_IF_SEL>,
+					 <&clk26m>,
+					 <&topckgen CLK_TOP_UNIVPLL_D6_D2>;
+				clock-names = "clk_top_conn",
+					      "clk_top_ipu_if",
+					      "clk_off",
+					      "clk_on_default";
+				assigned-clocks = <&topckgen CLK_TOP_DSP_SEL>,
+						  <&topckgen CLK_TOP_IPU_IF_SEL>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+							 <&topckgen CLK_TOP_UNIVPLL_D6_D2>;
+			};
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8192-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
