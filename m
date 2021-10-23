Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E02C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B599B60FD8
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B599B60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpWLOLgno2o6zf559wsfTTkmI12EYnkPOYQtkHV8vB4=; b=eRf/OeJvWalLTl
	dXj3yubidDyWAe4A78elCQV4x1SNYHkajSsG8Hfx8Bs14dnwL5xWvMl70AgePoco7z0nlvPLBCnfG
	76/JdH0j5KcqPEoCfbP0nfGiiqStFUz6pQM6UnH3+7LMQwQmsQMn1B/7hJN6wd7x8EoiOs2pJUZ06
	IAVHkcTwvGveLBd17eyvZITGxvh1zKTFH8qz9jqcTRS5DqwedoOh4/jHNnUdo8E2h8NhZol3Pz7qU
	zERMrVrov09OR8LRg/b6bEPgDQeenxmVZjX+HXbIYcovYoWMWdMvEpB0fppfZyj8iThmUJ/kjj4WU
	EoYSvhGlsN8xOUUPvQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meF9B-00CgMz-03; Sat, 23 Oct 2021 11:25:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meF98-00CgMT-6W; Sat, 23 Oct 2021 11:25:07 +0000
X-UUID: 9e9ff560dd1e4765a5e3f108ed10cc58-20211023
X-UUID: 9e9ff560dd1e4765a5e3f108ed10cc58-20211023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 982351954; Sat, 23 Oct 2021 04:25:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 04:15:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 19:15:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:15:00 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 11/13] arm64: dts: mt8192: Add apu power nodes
Date: Sat, 23 Oct 2021 19:14:07 +0800
Message-ID: <20211023111409.30463-12-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_042506_274811_8793DCE7 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

Add apu power node.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index d5e417a512a7..c505c6926839 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -964,6 +964,68 @@
 			};
 		};
 
+		apusys_power: apusys_power@190f1000 {
+			compatible = "mediatek,apusys-power",
+				     "mediatek,mt8192-apu-power";
+			reg = <0 0x190f1000 0 0x1000>,
+			      <0 0x19000600 0 0x100>;
+			reg-names = "apu_pcu",
+				    "apu_spare";
+			power-domains = <&apuspm 0>;
+			clocks = <&topckgen CLK_TOP_DSP_SEL>,
+				<&topckgen CLK_TOP_DSP1_SEL>,
+				<&topckgen CLK_TOP_DSP1_NPUPLL_SEL>,
+				<&topckgen CLK_TOP_DSP2_SEL>,
+				<&topckgen CLK_TOP_DSP2_NPUPLL_SEL>,
+				<&topckgen CLK_TOP_DSP5_SEL>,
+				<&topckgen CLK_TOP_DSP5_APUPLL_SEL>,
+				<&topckgen CLK_TOP_IPU_IF_SEL>,
+				<&clk26m>,
+				<&topckgen CLK_TOP_MAINPLL_D4_D2>,
+				<&topckgen CLK_TOP_UNIVPLL_D4_D2>,
+				<&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				<&topckgen CLK_TOP_MMPLL_D6>,
+				<&topckgen CLK_TOP_MMPLL_D5>,
+				<&topckgen CLK_TOP_MMPLL_D4>,
+				<&topckgen CLK_TOP_UNIVPLL_D5>,
+				<&topckgen CLK_TOP_UNIVPLL_D4>,
+				<&topckgen CLK_TOP_UNIVPLL_D3>,
+				<&topckgen CLK_TOP_MAINPLL_D6>,
+				<&topckgen CLK_TOP_MAINPLL_D4>,
+				<&topckgen CLK_TOP_MAINPLL_D3>,
+				<&topckgen CLK_TOP_TVDPLL>,
+				<&topckgen CLK_TOP_APUPLL>,
+				<&topckgen CLK_TOP_NPUPLL>,
+				<&apmixedsys CLK_APMIXED_APUPLL>,
+				<&apmixedsys CLK_APMIXED_NPUPLL>;
+			clock-names = "clk_top_dsp_sel",
+				"clk_top_dsp1_sel",
+				"clk_top_dsp1_npupll_sel",
+				"clk_top_dsp2_sel",
+				"clk_top_dsp2_npupll_sel",
+				"clk_top_dsp5_sel",
+				"clk_top_dsp5_apupll_sel",
+				"clk_top_ipu_if_sel",
+				"clk_top_clk26m",
+				"clk_top_mainpll_d4_d2",
+				"clk_top_univpll_d4_d2",
+				"clk_top_univpll_d6_d2",
+				"clk_top_mmpll_d6",
+				"clk_top_mmpll_d5",
+				"clk_top_mmpll_d4",
+				"clk_top_univpll_d5",
+				"clk_top_univpll_d4",
+				"clk_top_univpll_d3",
+				"clk_top_mainpll_d6",
+				"clk_top_mainpll_d4",
+				"clk_top_mainpll_d3",
+				"clk_top_tvdpll_ck",
+				"clk_top_apupll_ck",
+				"clk_top_npupll_ck",
+				"clk_apmixed_apupll_rate",
+				"clk_apmixed_npupll_rate";
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
