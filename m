Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5943BC43219
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmSqc2PgYprzLfV9CWQI90TJg70LiKjzPHpTno0H8F0=; b=OinI6o+ZSxKfVT
	Pc/c8Ta1FaEs1ZT+cAMkpTwswviQBaL92cl3twLTCAkN/jf4UWdk1vzzd6mk4pes1b6E+9RLqJ4SE
	Sow6jB4rHcUJmoGM7GS5J7K6FiP6jTbi2sd+hqktxD6Khy2/b6urIsYuZN9RYx4nGk3DMWWLIm81B
	wRZBpppxFEgh+FttlH+BKf8Dsvq3bEE3RzzdqZ5EJLhqyB36tbRD5mWnAlNvp6+G+HsZdMiXFMFZ6
	ph9e/oYS0EKjO/qxAp/jolrCHOCfRdtbPeLF6sj1NpKbg7GaYQkiNJUgzjuK1fEThrFR2fr6pJvXj
	pXKwWdXq+IXzaCK07mBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjq8-002twN-Fu; Fri, 10 Dec 2021 17:37:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjpM-002tgR-Jk; Fri, 10 Dec 2021 17:37:01 +0000
X-UUID: 8eabd9e12c4d4482bbf58f5026484e46-20211210
X-UUID: 8eabd9e12c4d4482bbf58f5026484e46-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1751843089; Fri, 10 Dec 2021 10:36:55 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:26:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:26:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:51 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>
Subject: [PATCH 15/17] arm64: dts: mt8192: Add APU power nodes
Date: Sat, 11 Dec 2021 01:26:03 +0800
Message-ID: <20211210172605.30618-16-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_093700_683873_DD0534BB 
X-CRM114-Status: UNSURE (   9.31  )
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

Add APU power node for MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index de73fbf0cb90..f95d381ff1cc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -996,6 +996,67 @@
 			};
 		};
 
+		apusys_power: apusys_power@190f1000 {
+			compatible = "mediatek,mt8192-apu-power";
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
