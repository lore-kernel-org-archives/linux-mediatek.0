Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37C5C41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 19:34:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31ADA206F4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 19:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AwMagBp4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31ADA206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FdbmJmzURu8mVTzPZ1hFR5bR75jYEtO4tjBeAFFYyzk=; b=AwMagBp4cW3z2cxS+hod7MEqM
	KQr0Gy11xIT2M+Hbgx6FnOHXsUmVYzUChNMoC2ZryigJhPVo3XBqtzZhDUr27CQAS84061T/XYD0k
	ZPkmCrq1DZcf38/sRmheRYeoJ1iAOoTiFBYFrAUnWZJdKBSMdXLosYx7NGCn1Cpsu7nq63WSHeFb3
	CYBvzbe91F0VIS/1PrZJwJZ5zspyL2hnyFrg2mTDSV28svjQrI7iQWafnHp/YlSMrWiEymAaWHU2A
	dmpPyA4wKN+SmBUGKBveKjbh6r/Dgl6EmNI34FURRpXvMeEpCLmNnGeH+hmWFWCvAhMSuXiC359Ui
	l7V2pAZkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPsij-0001cL-Mp; Tue, 06 Oct 2020 19:33:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPsiK-0001T7-W9; Tue, 06 Oct 2020 19:33:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 8D4FE29BD82
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] soc: mediatek: mmsys: Use an array for setting the
 routing registers
Date: Tue,  6 Oct 2020 21:33:20 +0200
Message-Id: <20201006193320.405529-5-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006193320.405529-1-enric.balletbo@collabora.com>
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_153333_226400_0AA26321 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

Actually, setting the registers for routing, use multiple 'if-else' for different
routes, but this code would be more and more complicated while we
support more and more SoCs. Change that and use a table per SoC so the
code will be more portable and clear.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mtk-mmsys.c | 393 +++++++++++++++++--------------
 1 file changed, 210 insertions(+), 183 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index da2de8f6969e..f00d6d08c9c5 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -42,39 +42,61 @@
 #define RDMA0_SOUT_DSI1				0x1
 #define RDMA0_SOUT_DSI2				0x4
 #define RDMA0_SOUT_DSI3				0x5
+#define RDMA0_SOUT_MASK				0x7
 #define RDMA1_SOUT_DPI0				0x2
 #define RDMA1_SOUT_DPI1				0x3
 #define RDMA1_SOUT_DSI1				0x1
 #define RDMA1_SOUT_DSI2				0x4
 #define RDMA1_SOUT_DSI3				0x5
+#define RDMA1_SOUT_MASK				0x7
 #define RDMA2_SOUT_DPI0				0x2
 #define RDMA2_SOUT_DPI1				0x3
 #define RDMA2_SOUT_DSI1				0x1
 #define RDMA2_SOUT_DSI2				0x4
 #define RDMA2_SOUT_DSI3				0x5
+#define RDMA2_SOUT_MASK				0x7
 #define DPI0_SEL_IN_RDMA1			0x1
 #define DPI0_SEL_IN_RDMA2			0x3
+#define DPI0_SEL_IN_MASK			0x3
 #define DPI1_SEL_IN_RDMA1			(0x1 << 8)
 #define DPI1_SEL_IN_RDMA2			(0x3 << 8)
+#define DPI1_SEL_IN_MASK			(0x3 << 8)
 #define DSI0_SEL_IN_RDMA1			0x1
 #define DSI0_SEL_IN_RDMA2			0x4
+#define DSI0_SEL_IN_MASK			0x7
 #define DSI1_SEL_IN_RDMA1			0x1
 #define DSI1_SEL_IN_RDMA2			0x4
+#define DSI1_SEL_IN_MASK			0x7
 #define DSI2_SEL_IN_RDMA1			(0x1 << 16)
 #define DSI2_SEL_IN_RDMA2			(0x4 << 16)
+#define DSI2_SEL_IN_MASK			(0x7 << 16)
 #define DSI3_SEL_IN_RDMA1			(0x1 << 16)
 #define DSI3_SEL_IN_RDMA2			(0x4 << 16)
+#define DSI3_SEL_IN_MASK			(0x7 << 16)
 #define COLOR1_SEL_IN_OVL1			0x1
 
 #define OVL_MOUT_EN_RDMA			0x1
 #define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
 #define BLS_TO_DPI_RDMA1_TO_DSI			0x2
+#define BLS_RDMA1_DSI_DPI_MASK			0xf
 #define DSI_SEL_IN_BLS				0x0
 #define DPI_SEL_IN_BLS				0x0
+#define DPI_SEL_IN_MASK				0x1
 #define DSI_SEL_IN_RDMA				0x1
+#define DSI_SEL_IN_MASK				0x1
+
+struct mtk_mmsys_routes {
+	u32 from_comp;
+	u32 to_comp;
+	u32 addr;
+	u32 mask;
+	u32 val;
+};
 
 struct mtk_mmsys_driver_data {
 	const char *clk_driver;
+	const struct mtk_mmsys_routes *routes;
+	const unsigned int num_routes;
 };
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
@@ -93,10 +115,6 @@ static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
 
-static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
-	.clk_driver = "clk-mt8173-mm",
-};
-
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
 };
@@ -106,180 +124,192 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
 };
 
-static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
-					  enum mtk_ddp_comp_id next,
-					  unsigned int *addr)
-{
-	unsigned int value;
-
-	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
-		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
-		value = OVL0_MOUT_EN_COLOR0;
-	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
-		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
-		value = OVL_MOUT_EN_RDMA;
-	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
-		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
-		value = OD_MOUT_EN_RDMA0;
-	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
-		value = UFOE_MOUT_EN_DSI0;
-	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
-		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
-		value = OVL1_MOUT_EN_COLOR1;
-	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
-		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
-		value = GAMMA_MOUT_EN_RDMA1;
-	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
-		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
-		value = OD1_MOUT_EN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI3;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI3;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI3;
-	} else {
-		value = 0;
-	}
-
-	return value;
-}
-
-static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
-					 enum mtk_ddp_comp_id next,
-					 unsigned int *addr)
-{
-	unsigned int value;
-
-	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
-		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
-		value = COLOR0_SEL_IN_OVL0;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI0_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI1_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI0_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI1_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI2_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI3_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI0_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI1_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI0_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI1_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI2_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI3_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
-		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
-		value = COLOR1_SEL_IN_OVL1;
-	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSI_SEL;
-		value = DSI_SEL_IN_BLS;
-	} else {
-		value = 0;
+static const struct mtk_mmsys_routes mt8173_mmsys_routing_table[] = {
+	{
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_OUT_SEL,
+		BLS_RDMA1_DSI_DPI_MASK, BLS_TO_DSI_RDMA1_TO_DPI1
+	}, {
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_DSI_SEL,
+		DSI_SEL_IN_MASK, DSI_SEL_IN_BLS
+	}, {
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_OUT_SEL,
+		BLS_RDMA1_DSI_DPI_MASK, BLS_TO_DPI_RDMA1_TO_DSI
+	}, {
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DSI_SEL,
+		DSI_SEL_IN_MASK, DSI_SEL_IN_RDMA
+	}, {
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DPI_SEL,
+		DPI_SEL_IN_MASK, DPI_SEL_IN_BLS
+	}, {
+		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
+		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN,
+		GAMMA_MOUT_EN_RDMA1, GAMMA_MOUT_EN_RDMA1
+	}, {
+		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
+		DISP_REG_CONFIG_DISP_OD_MOUT_EN,
+		OD_MOUT_EN_RDMA0, OD_MOUT_EN_RDMA0
+	}, {
+		DDP_COMPONENT_OD1, DDP_COMPONENT_RDMA1,
+		DISP_REG_CONFIG_DISP_OD_MOUT_EN,
+		OD1_MOUT_EN_RDMA1, OD1_MOUT_EN_RDMA1
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
+		OVL0_MOUT_EN_COLOR0, OVL0_MOUT_EN_COLOR0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN,
+		COLOR0_SEL_IN_OVL0, COLOR0_SEL_IN_OVL0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		DISP_REG_CONFIG_DISP_OVL_MOUT_EN,
+		OVL_MOUT_EN_RDMA, OVL_MOUT_EN_RDMA
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
+		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN,
+		OVL1_MOUT_EN_COLOR1, OVL1_MOUT_EN_COLOR1
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
+		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN,
+		COLOR1_SEL_IN_OVL1, COLOR1_SEL_IN_OVL1
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
+		RDMA0_SOUT_MASK, RDMA0_SOUT_DPI0
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
+		RDMA0_SOUT_MASK, RDMA0_SOUT_DPI1
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
+		RDMA0_SOUT_MASK, RDMA0_SOUT_DSI1
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
+		RDMA0_SOUT_MASK, RDMA0_SOUT_DSI2
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
+		RDMA0_SOUT_MASK, RDMA0_SOUT_DSI3
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
+		RDMA1_SOUT_MASK, RDMA1_SOUT_DPI0
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DPI_SEL_IN,
+		DPI0_SEL_IN_MASK, DPI0_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
+		RDMA1_SOUT_MASK, RDMA1_SOUT_DPI1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DPI_SEL_IN,
+		DPI1_SEL_IN_MASK, DPI1_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_DSIE_SEL_IN,
+		DSI0_SEL_IN_MASK, DSI0_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
+		RDMA1_SOUT_MASK, RDMA1_SOUT_DSI1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DSIO_SEL_IN,
+		DSI1_SEL_IN_MASK, DSI1_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
+		RDMA1_SOUT_MASK, RDMA1_SOUT_DSI2
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DSIE_SEL_IN,
+		DSI2_SEL_IN_MASK, DSI2_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
+		RDMA1_SOUT_MASK, RDMA1_SOUT_DSI3
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DSIO_SEL_IN,
+		DSI3_SEL_IN_MASK, DSI3_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
+		RDMA2_SOUT_MASK, RDMA2_SOUT_DPI0
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DPI_SEL_IN,
+		DPI0_SEL_IN_MASK, DPI0_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
+		RDMA2_SOUT_MASK, RDMA2_SOUT_DPI1
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DPI_SEL_IN,
+		DPI1_SEL_IN_MASK, DPI1_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_DSIE_SEL_IN,
+		DSI0_SEL_IN_MASK, DSI0_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
+		RDMA2_SOUT_MASK, RDMA2_SOUT_DSI1
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DSIO_SEL_IN,
+		DSI1_SEL_IN_MASK, DSI1_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
+		RDMA2_SOUT_MASK, RDMA2_SOUT_DSI2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DSIE_SEL_IN,
+		DSI2_SEL_IN_MASK, DSI2_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
+		RDMA2_SOUT_MASK, RDMA2_SOUT_DSI3
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DSIO_SEL_IN,
+		DSI3_SEL_IN_MASK, DSI3_SEL_IN_RDMA2
 	}
+};
 
-	return value;
-}
-
-static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
-				   enum mtk_ddp_comp_id cur,
-				   enum mtk_ddp_comp_id next)
-{
-	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
-		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-		writel_relaxed(DSI_SEL_IN_RDMA,
-			       config_regs + DISP_REG_CONFIG_DSI_SEL);
-		writel_relaxed(DPI_SEL_IN_BLS,
-			       config_regs + DISP_REG_CONFIG_DPI_SEL);
-	}
-}
+static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
+	.clk_driver = "clk-mt8173-mm",
+	.routes = mt8173_mmsys_routing_table,
+	.num_routes = ARRAY_SIZE(mt8173_mmsys_routing_table),
+};
 
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
-	unsigned int addr, value, reg;
-
-	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(mmsys->regs + addr) | value;
-		writel_relaxed(reg, mmsys->regs + addr);
-	}
-
-	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
-
-	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(mmsys->regs + addr) | value;
-		writel_relaxed(reg, mmsys->regs + addr);
-	}
+	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
+	u32 reg;
+	int i;
+
+	for (i = 0; i < mmsys->data->num_routes; i++)
+		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
+			reg = readl(mmsys->regs + routes[i].addr);
+			reg &= ~routes[i].mask;
+			reg |= routes[i].val;
+			writel(reg, mmsys->regs + routes[i].addr);
+		}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -288,19 +318,16 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id next)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
-	unsigned int addr, value, reg;
-
-	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(mmsys->regs + addr) & ~value;
-		writel_relaxed(reg, mmsys->regs + addr);
-	}
-
-	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(mmsys->regs + addr) & ~value;
-		writel_relaxed(reg, mmsys->regs + addr);
-	}
+	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
+	u32 reg;
+	int i;
+
+	for (i = 0; i < mmsys->data->num_routes; i++)
+		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
+			reg = readl(mmsys->regs + routes[i].addr);
+			reg &= ~routes[i].mask;
+			writel(reg, mmsys->regs + routes[i].addr);
+		}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
