Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927ADC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 03:36:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 323B6613A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 03:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 323B6613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2mpeWoPRvxNi1BXyZxo2YMXGBfGcu/6MKLzSrCNZZDg=; b=oMTklD36BTlr4h0IOQ+4q5vD/
	oP3KhHWBVmchXF6dIFpErcWt/tJ8bwXJe2w/XHpm8zhDREZ8KuY4jMACbk1fJotrkgF2N3v+04R3T
	D34WvIx3AMiD/RnEAQ9aKZD2d63M37PINp/eYIrFOrefUOPrt6WCGGXVfUF/7qwtno2NqiKv3a4k6
	s/iilAFyvYL68BA1MeoAh101qoASWbpdNxBqArZ6u/+gGLVTtdy9bNAsKY72RcQhZ2zVOg49gZ5NQ
	cAVzTieHr2xOBKjn7AzAssaQX4v5iFFmHVLOObSVMV2XoZ6KtecK7l1OfQYThoJBi0UruNOmO+BdH
	Xb2mzQiUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTyzO-003xYO-Is; Wed, 07 Apr 2021 03:36:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTyzC-003xVD-NG; Wed, 07 Apr 2021 03:36:13 +0000
X-UUID: fa75ab90f48f4d8fb42e7539102e9e54-20210406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZYW7jMSCumQI7gAuhFPLbvlMWQ2oJ0DpIFk67ufHqmU=; 
 b=FDWnuTiYiUt2khIt+o0+i00Um4bxV3K4SE0diRVq8va4jZdX/ysck2enX3jOAeCihw8F/9zbpQ5wz/xaXtk53KB7xnbkQhKavpC8xK3OSHo/NT7cjz1zSDj3W/WITA4vXKDEiw8PSao0V7KPMl5zOoWKMsQl29idll7YDD3Lo9E=;
X-UUID: fa75ab90f48f4d8fb42e7539102e9e54-20210406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1289695108; Tue, 06 Apr 2021 20:36:02 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 20:29:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 11:28:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Apr 2021 11:28:58 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>
CC: Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH 8/8] arm64: dts: mt8192: Add APU power domain node
Date: Wed, 7 Apr 2021 11:28:06 +0800
Message-ID: <1617766086-5502-9-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_043611_265730_D77C4D4C 
X-CRM114-Status: GOOD (  12.17  )
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
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |  7 +++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 29 +++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 1769f3a9b510..9e89efb3dc8a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -65,3 +65,10 @@
 &mt6359_vrf12_ldo_reg {
 	regulator-always-on;
 };
+
+&apuspm {
+	vsram-supply = <&mt6359_vsram_md_ldo_reg>;
+	power-domain@MT8192_POWER_DOMAIN_APUSYS_TOP {
+		domain-supply = <&mt6359_vproc1_buck_reg>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index b1467ccbe5aa..546c058ef560 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/memory/mt8192-larb-port.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
 #include <dt-bindings/power/mt8192-power.h>
+#include <dt-bindings/power/mt8192-apu-power.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -1033,6 +1034,34 @@
 			#clock-cells = <1>;
 		};
 
+		apuspm: power-domain@190f0000 {
+			compatible = "mediatek,mt8192-apu-pm", "syscon";
+			reg = <0 0x190f0000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#power-domain-cells = <1>;
+			mediatek,scpsys = <&scpsys>;
+			mediatek,apu_conn = <&apu_conn>;
+			mediatek,apu_vcore = <&apu_vcore>;
+
+			power-domain@MT8192_POWER_DOMAIN_APUSYS_TOP {
+				reg = <MT8192_POWER_DOMAIN_APUSYS_TOP>;
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
 		larb13: larb@1a001000 {
 			compatible = "mediatek,mt8192-smi-larb";
 			reg = <0 0x1a001000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
