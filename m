Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7844BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eYbQH/vs7qjxRAMGAZTGgynd/Fy3662p28ZpQPg57k8=; b=2YD4J9twKWqmL/zzqz59hYwwXA
	HGEDZpaU1cAcryYNtaarB6bmNZ+xV4NQYT2rBXUXJ8GEY3pWtydGYSmn23y97yF8PRDf3GTgQTRAi
	/WItALGPVTAOhwZYXdHQVfBmrKxW0fVHLcNg7M5DILgYmUQXCW39Mda6JShXxbjTowMuFqu7bOdnw
	bejzLGkPvOu+MLFtVwnJJGSRmfPi4g5buHJN7QqAtqjSTFW6c38wQy5TsQuXSw0rLVOhxtFFE7vjb
	G/qhnTdsms8N60bCGxXDigXSxjmiIVEJYnLDdOy0Gacrvg2haEi7ECM3/452a1GYfbdSRL9LU214f
	LfeShb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPxI-003DGj-1P;
	Mon, 30 Oct 2023 10:57:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPxF-003DG2-1Y;
	Mon, 30 Oct 2023 10:57:10 +0000
X-UUID: 0e51ec52771311ee9b7791016c24628a-20231030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eYbQH/vs7qjxRAMGAZTGgynd/Fy3662p28ZpQPg57k8=;
	b=XVqKuo1e2ub9+1hehuU8F73JWY6hv7WgBvy/NZ3zrfh/fQ6DZU3z/JMztMk9ms1BzxuKnMnZbEqQ4owA0Kdl1zs+W7Fz6dKT4vCAoC4cgCpaX4MmNJqteKSz9trxv4ztdTxH6YSIQ505Lv718LxpvFYDb7xfljsvvbAWFHvJ1dw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:a2607b92-08e1-45ea-ad4e-369e716e9b9d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:2aa2effb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0e51ec52771311ee9b7791016c24628a-20231030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1755973205; Mon, 30 Oct 2023 03:57:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Oct 2023 18:56:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Oct 2023 18:56:59 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>, "Garmin . Chang" <Garmin.Chang@mediatek.com>
Subject: [PATCH] clk: mediatek: mt8188: Set clock parent for TOP_EDP and TOP_DP
Date: Mon, 30 Oct 2023 18:56:56 +0800
Message-ID: <20231030105656.7288-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_035709_535510_D80CC6EE 
X-CRM114-Status: GOOD (  14.81  )
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

Modify MT8188 edp, dp clock and add .determine_rate() callback to
dynamically set parent for TOP_EDP and TOP_DP. By separating tvdpll
output into different interval, we can make sure VCO operate at optimal
condition.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

---
 drivers/clk/mediatek/clk-mt8188-topckgen.c | 74 +++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8188-topckgen.c b/drivers/clk/mediatek/clk-mt8188-topckgen.c
index e330a4f9a0c3..921fb31fe4b1 100644
--- a/drivers/clk/mediatek/clk-mt8188-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8188-topckgen.c
@@ -487,6 +487,74 @@ static const char * const dp_parents[] = {
 	"tvdpll2_d16"
 };
 
+#define VCO_OPP_LOW	7000000
+#define VCO_OPP_MEDIUM	200000000
+
+enum dp_edp_parent_index {
+	PLL_D4 = 2,
+	PLL_D8,
+	PLL_D16
+};
+
+static int dp_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	const char *clk_hw_name = clk_hw_get_name(hw);
+	unsigned int pow, parent_id, is_edp = 0;
+	struct clk_rate_request parent_req = *req;
+	struct clk_hw *parent_hw = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent_hw);
+	int ret = 0;
+
+	if (!strncmp(clk_hw_name, "top_edp", 7))
+		is_edp = 1;
+
+	if (req->rate < VCO_OPP_LOW)
+		pow = PLL_D16;
+	else if (req->rate < VCO_OPP_MEDIUM)
+		pow = PLL_D8;
+	else
+		pow = PLL_D4;
+
+	if (is_edp)
+		parent_id = (pow << 1) - 1;
+	else
+		parent_id = pow << 1;
+
+	/* re-parenting and determine rate */
+	if (clk_hw_can_set_rate_parent(hw)) {
+		parent_hw = clk_hw_get_parent_by_index(hw, parent_id);
+		ret = __clk_determine_rate(parent_hw, &parent_req);
+		if (ret)
+			return ret;
+
+		req->best_parent_hw = parent_hw;
+		req->rate = req->best_parent_rate = parent_req.rate;
+	} else {
+		req->best_parent_hw = parent_hw;
+		req->rate = req->best_parent_rate = parent_rate;
+	}
+
+	return ret;
+}
+
+static struct clk_ops dp_clk_ops;
+
+static void dp_clk_ops_init(void)
+{
+	dp_clk_ops = mtk_mux_gate_clr_set_upd_ops;
+	dp_clk_ops.determine_rate = dp_clk_determine_rate;
+}
+
+#define DP_MUX(_id, _name, _parents, _mux_ofs, _mux_set_ofs,	\
+		 _mux_clr_ofs, _shift, _width, _gate, _upd_ofs, \
+		 _upd)	\
+	GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
+		_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+		_gate, _upd_ofs, _upd, CLK_SET_RATE_PARENT,	\
+		dp_clk_ops)
+
+
 static const char * const edp_parents[] = {
 	"clk26m",
 	"tvdpll1_d2",
@@ -1038,9 +1106,9 @@ static const struct mtk_mux top_mtk_muxes[] = {
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSPM, "top_sspm",
 			     sspm_parents, 0x080, 0x084, 0x088, 24, 4, 31, 0x08, 3),
 	/* CLK_CFG_9 */
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_DP, "top_dp",
+	DP_MUX(CLK_TOP_DP, "top_dp",
 			     dp_parents, 0x08C, 0x090, 0x094, 0, 4, 7, 0x08, 4),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_EDP, "top_edp",
+	DP_MUX(CLK_TOP_EDP, "top_edp",
 			     edp_parents, 0x08C, 0x090, 0x094, 8, 4, 15, 0x08, 5),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI, "top_dpi",
 			     dpi_parents, 0x08C, 0x090, 0x094, 16, 4, 23, 0x08, 6),
@@ -1267,6 +1335,8 @@ static int clk_mt8188_topck_probe(struct platform_device *pdev)
 		goto free_top_data;
 	}
 
+	dp_clk_ops_init();
+
 	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
 					top_clk_data);
 	if (r)
-- 
2.18.0


