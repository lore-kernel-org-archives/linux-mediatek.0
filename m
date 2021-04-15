Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F0FC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 06:03:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D4D6144B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 06:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D4D6144B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hh59t1lYAc1ys/ud3KV9EWkEXthAkxeUzxKTbJx/4Js=; b=Lr0E5SvqbuKzzHtepKEU1BwgP
	WA935ZRlFAJX6Y3FFcTix2S147kepliT3Wkom6VX8DRq4OD0Ss82pHGuG5sAY1SnqMOOFmtqkYUBp
	d8VaKyTiQF0uhgNl1ltKUVAiz9g6JXAp0vjznm1ky99GJr6pydAskmny94DvGH/V3u1AFs+SU28S3
	s70L5cXeo43k9uOYlV3VpnrAYxPZA4bs8ma6REVzEYKQ4UM7c5H2A+PN8hFryI3clI72ar0RlGGQk
	ygHJLx9fT4F7ssqAaXBdK8/7QAF3r9nN8HtY1tMsYIp2XL2TcsowXkdl4nWxiCh7CwbdNDCkMbdlK
	/ufkAQOOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWv5R-00EzNj-50; Thu, 15 Apr 2021 06:02:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv4M-00Ez87-Lj; Thu, 15 Apr 2021 06:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=uhryOuPuEs7VpVhtnSY1XoY42wLcI/yzC+ShSY894nU=; b=PblQyFChnSZud2frH2Y+kts59e
 LvdR7++U3L/sQK7vYgw8bKSlKGXBjhdQuFH4P76/VXZQWB6umUg1N+Ok7iZTRn/MQGl05C3gFO7mn
 SRIM7c0xI7S97IYTKD/mnJ/EA9ELYPcfDWFimIRZW6u2NeAhdaFp2jZx9nWlmod2ItmixzOqhjUoZ
 UNjixuouqus3G6eD93K1MocJpOWk1hU2HNFKP4NlkwvuOtyBvcPLmoURQtmPJCtcByYHSAVRi03G4
 u3/AFeP90PB0DWi2AWFLgsMqEiKCU964DPww4Dx6XUgavRj1F8KU2JPyf2ISIGDaEESxC1iChIFR0
 JKR8dc0g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv4J-008IPa-V6; Thu, 15 Apr 2021 06:01:37 +0000
X-UUID: db352344709e4928ba3570db75261892-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uhryOuPuEs7VpVhtnSY1XoY42wLcI/yzC+ShSY894nU=; 
 b=A2NA2vR+NtW+yK+TrlIAndGR6WVW286luWR88Op0LED0l28zkhZ4bl+VdsSYMEchYKdL/SZV2EmT63t/RK9YWatxCZjDCOicElJFw7Z6k3h6h0YZ/FmZj/AOxTnb33aXW9sxtwEMcgO7FCryO6lReCl1PwEqrC1DZTGoOUkwOgc=;
X-UUID: db352344709e4928ba3570db75261892-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1242225444; Wed, 14 Apr 2021 23:01:27 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 22:52:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 13:52:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 13:52:54 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, 
 Chiawen Lee <chiawen.lee@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 7/7] arm64: dts: mt8192: Add APU power domain node
Date: Thu, 15 Apr 2021 13:52:40 +0800
Message-ID: <1618465960-3013-8-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9D8029BC1D72AC5253A108D378D8BE10E10239E313A5DFE914921084B05E37CD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_230136_028254_719FB15C 
X-CRM114-Status: GOOD (  10.84  )
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
This patch depends on MT8192 clock[1] and PMIC[2] patches which haven't yet been accepted.
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210324104110.13383-7-chun-jie.chen@mediatek.com/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/1617188527-3392-9-git-send-email-hsin-hsiung.wang@mediatek.com/
---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |  7 ++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 28 +++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 1769f3a9b510..688c97c46d44 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -65,3 +65,10 @@
 &mt6359_vrf12_ldo_reg {
 	regulator-always-on;
 };
+
+&apuspm {
+	vsram-supply = <&mt6359_vsram_md_ldo_reg>;
+	apu_top: power-domain@0 {
+		domain-supply = <&mt6359_vproc1_buck_reg>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 561025d2ebab..90436757386e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1033,6 +1033,34 @@
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
+
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
 		larb13: larb@1a001000 {
 			compatible = "mediatek,mt8192-smi-larb";
 			reg = <0 0x1a001000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
