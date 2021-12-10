Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FDFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qe8iBdFiKSH+jNhQYDzFPSjEaL57gLCgrNz6cGry9oQ=; b=MtCjZKY15EypZW
	gxGt4pXT9JDNjoXFlx7eb+DqhSfDBw7xGQIPhAAQnWb6YUP4ML15PgPmgvAKZXyx5oWfQkWnEZzuZ
	0aTpoRXFiqYdSg0+UUi8+FmtRyXH0STJqe6lBgmi2PGALVI4G3yjYYYeprB5EuGvgOt9QRsd2zEoA
	j2DRuQfRJrfYanzCepMgfirxEEo7kRWI8NAExqtXS5Nd5eHo6Ijt26opyxuCu5fJelE4ekQGMrmJU
	QauonV8Mtagu6GM7UTTZFjNwCnJiE6dbESdu+QugRAsr8H4119x5dY9EWENjJDFlk/Lvh5tf+IBov
	uZZNDyJY1v49dtNybHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjRU-002kf5-UX; Fri, 10 Dec 2021 17:12:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjR3-002kWS-JY; Fri, 10 Dec 2021 17:11:55 +0000
X-UUID: 7a8387daef2240f58d012ddcee862d3c-20211210
X-UUID: 7a8387daef2240f58d012ddcee862d3c-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1962996377; Fri, 10 Dec 2021 10:11:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:01:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:01:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:01:38 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "Yong
 Wu" <yong.wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v4 2/8] clk: mediatek: mt8192: Add APU clocks support
Date: Sat, 11 Dec 2021 01:01:07 +0800
Message-ID: <20211210170113.30063-3-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210170113.30063-1-flora.fu@mediatek.com>
References: <20211210170113.30063-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_091153_756644_9EBDA2CB 
X-CRM114-Status: UNSURE (   9.82  )
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

Add APU clocks support on MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>

---
 drivers/clk/mediatek/clk-mt8192.c | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index cbc7c6dbe0f4..8bc4e85780c6 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -244,6 +244,65 @@ static const char * const ccu_parents[] = {
 	"univpll_d6_d2"
 };
 
+static const char * const dsp_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp1_parents[] = {
+	"clk26m",
+	"npupll_ck",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3",
+	"apupll_ck"
+};
+
+static const char * const dsp1_npupll_parents[] = {
+	"dsp1_sel",
+	"npupll_ck"
+};
+
+static const char * const dsp2_parents[] = {
+	"clk26m",
+	"npupll_ck",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3",
+	"apupll_ck"
+};
+
+static const char * const dsp2_npupll_parents[] = {
+	"dsp2_sel",
+	"npupll_ck"
+};
+
+static const char * const dsp5_parents[] = {
+	"clk26m",
+	"apupll_ck",
+	"univpll_d4_d2",
+	"mainpll_d4",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp5_apupll_parents[] = {
+	"dsp5_sel",
+	"apupll_ck"
+};
+
 static const char * const dsp7_parents[] = {
 	"clk26m",
 	"mainpll_d4_d2",
@@ -255,6 +314,17 @@ static const char * const dsp7_parents[] = {
 	"mmpll_d4"
 };
 
+static const char * const ipu_if_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"univpll_d5",
+	"mainpll_d4",
+	"tvdpll_ck",
+	"univpll_d4"
+};
+
 static const char * const mfg_ref_parents[] = {
 	"clk26m",
 	"clk26m",
@@ -734,9 +804,26 @@ static const struct mtk_mux top_mtk_muxes[] = {
 			     cam_parents, 0x030, 0x034, 0x038, 16, 4, 23, 0x004, 10),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_CCU_SEL, "ccu_sel",
 			     ccu_parents, 0x030, 0x034, 0x038, 24, 4, 31, 0x004, 11),
+	/* CLK_CFG_3 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP_SEL, "dsp_sel",
+			     dsp_parents, 0x040, 0x044, 0x048, 0, 3, 7, 0x004, 12),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP1_SEL, "dsp1_sel",
+			     dsp1_parents, 0x040, 0x044, 0x048, 8, 3, 15, 0x004, 13),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP1_NPUPLL_SEL, "dsp1_npupll_sel",
+			dsp1_npupll_parents, 0x040, 0x044, 0x048, 11, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP2_SEL, "dsp2_sel",
+			     dsp2_parents, 0x040, 0x044, 0x048, 16, 3, 23, 0x004, 14),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP2_NPUPLL_SEL, "dsp2_npupll_sel",
+			dsp2_npupll_parents, 0x040, 0x044, 0x048, 19, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP5_SEL, "dsp5_sel",
+			     dsp5_parents, 0x040, 0x044, 0x048, 24, 3, 31, 0x004, 15),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP5_APUPLL_SEL, "dsp5_apupll_sel",
+			dsp5_apupll_parents, 0x040, 0x044, 0x048, 27, 1, -1, -1),
 	/* CLK_CFG_4 */
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP7_SEL, "dsp7_sel",
 			     dsp7_parents, 0x050, 0x054, 0x058, 0, 3, 7, 0x004, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPU_IF_SEL, "ipu_if_sel",
+			     ipu_if_parents, 0x050, 0x054, 0x058, 8, 3, 15, 0x004, 17),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
 			     mfg_ref_parents, 0x050, 0x054, 0x058, 16, 2, 23, 0x004, 18),
 	MUX_CLR_SET_UPD(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel",
@@ -1175,6 +1262,10 @@ static const struct mtk_pll_data plls[] = {
 	      0, 0, 32, 0x031c, 24, 0x0040, 0x000c, 0, 0x0320, 0),
 	PLL_B(CLK_APMIXED_APLL2, "apll2", 0x032c, 0x033c, 0x00000000,
 	      0, 0, 32, 0x0330, 24, 0, 0, 0, 0x0334, 0),
+	PLL_B(CLK_APMIXED_APUPLL, "apupll", 0x03a0, 0x03ac, 0xff000001,
+	      HAVE_RST_BAR, BIT(23), 22, 0x03a4, 24, 0, 0, 0, 0x03a4, 0),
+	PLL_B(CLK_APMIXED_NPUPLL, "npupll", 0x03b4, 0x03c0, 0x00000001,
+	      0, 0, 22, 0x03b8, 24, 0, 0, 0, 0x03b8, 0),
 };
 
 static struct clk_onecell_data *top_clk_data;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
