Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA1CECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytrQnG/V2K/tHDXLg23WgbWOqrdF6GfQmTo0wBuNhXg=; b=FAIvNUHiQP5ODUbvtM4RrHu9qW
	fR1IgANdwF26U9XBjkq4VtuUtj+dCyHG9TMC7s7KSesU8gCtu8k/dDuEJ+JZprwfuzI0kAbLv2vvi
	GHt4zHgaM6HpJ9tYM2yruqiSPyEH/UWpMQL6PxBauDKHw1MW85eNseOZ4Tc2kPhACAkk5gWRp10/y
	W0/ZlifEIM7syvIctlgAa4h4tnFO0kj/j2Pla/apOYo36EuZSAepjYOMfH3LLE/ecqbmDBBH9qZXP
	x75kAmVCYfqgWmVjBxy8ESgLVXZQPbKD6pmt5rzwS17s6Bs3dQ6h7AgcyB1TxcGfPptkWQpy7SHVS
	aL8ZeqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ9x-0029nu-5t; Tue, 20 Sep 2022 09:03:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8X-0028zl-Te; Tue, 20 Sep 2022 09:01:51 +0000
X-UUID: 5e6552c3416046068e59a18428f22d1d-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ytrQnG/V2K/tHDXLg23WgbWOqrdF6GfQmTo0wBuNhXg=;
	b=c+4Xc8c8BALLKRwjzzdrOYQ/fmvBy79nnt4H32mOgXnMN7vHnr3bkW/9c9cG/2hiMYntuJCQ65EJLMW276m1r+jyMR5I8bvXWPMZRuteX/eZ5fwqC9Ggz1KKfgtf4dFcmo0ptwTkYNG6zkLLO6WUpJ82aGTrYTdgryWQrVO30fc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:54ebe7f9-ff55-4313-bc55-ce261882524d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:31f403f7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5e6552c3416046068e59a18428f22d1d-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 747773846; Tue, 20 Sep 2022 02:01:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 09/18] phy: mediatek: hdmi: mt8173: use GENMASK to generate bits mask
Date: Tue, 20 Sep 2022 17:00:29 +0800
Message-ID: <20220920090038.15133-10-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020149_998029_88544F03 
X-CRM114-Status: UNSURE (   8.01  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use GENMASK() macro to generate bits mask

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 88 +++++++++++-----------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index 6cdfdf5a698a..55fe97f5465d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -8,38 +8,38 @@
 
 #define HDMI_CON0		0x00
 #define RG_HDMITX_PLL_EN		BIT(31)
-#define RG_HDMITX_PLL_FBKDIV		(0x7f << 24)
+#define RG_HDMITX_PLL_FBKDIV		GENMASK(30, 24)
 #define PLL_FBKDIV_SHIFT		24
-#define RG_HDMITX_PLL_FBKSEL		(0x3 << 22)
+#define RG_HDMITX_PLL_FBKSEL		GENMASK(23, 22)
 #define PLL_FBKSEL_SHIFT		22
-#define RG_HDMITX_PLL_PREDIV		(0x3 << 20)
+#define RG_HDMITX_PLL_PREDIV		GENMASK(21, 20)
 #define PREDIV_SHIFT			20
-#define RG_HDMITX_PLL_POSDIV		(0x3 << 18)
+#define RG_HDMITX_PLL_POSDIV		GENMASK(19, 18)
 #define POSDIV_SHIFT			18
-#define RG_HDMITX_PLL_RST_DLY		(0x3 << 16)
-#define RG_HDMITX_PLL_IR		(0xf << 12)
+#define RG_HDMITX_PLL_RST_DLY		GENMASK(17, 16)
+#define RG_HDMITX_PLL_IR		GENMASK(15, 12)
 #define PLL_IR_SHIFT			12
-#define RG_HDMITX_PLL_IC		(0xf << 8)
+#define RG_HDMITX_PLL_IC		GENMASK(11, 8)
 #define PLL_IC_SHIFT			8
-#define RG_HDMITX_PLL_BP		(0xf << 4)
+#define RG_HDMITX_PLL_BP		GENMASK(7, 4)
 #define PLL_BP_SHIFT			4
-#define RG_HDMITX_PLL_BR		(0x3 << 2)
+#define RG_HDMITX_PLL_BR		GENMASK(3, 2)
 #define PLL_BR_SHIFT			2
-#define RG_HDMITX_PLL_BC		(0x3 << 0)
+#define RG_HDMITX_PLL_BC		GENMASK(1, 0)
 #define PLL_BC_SHIFT			0
 #define HDMI_CON1		0x04
-#define RG_HDMITX_PLL_DIVEN		(0x7 << 29)
+#define RG_HDMITX_PLL_DIVEN		GENMASK(31, 29)
 #define PLL_DIVEN_SHIFT			29
 #define RG_HDMITX_PLL_AUTOK_EN		BIT(28)
-#define RG_HDMITX_PLL_AUTOK_KF		(0x3 << 26)
-#define RG_HDMITX_PLL_AUTOK_KS		(0x3 << 24)
+#define RG_HDMITX_PLL_AUTOK_KF		GENMASK(27, 26)
+#define RG_HDMITX_PLL_AUTOK_KS		GENMASK(25, 24)
 #define RG_HDMITX_PLL_AUTOK_LOAD	BIT(23)
-#define RG_HDMITX_PLL_BAND		(0x3f << 16)
+#define RG_HDMITX_PLL_BAND		GENMASK(21, 16)
 #define RG_HDMITX_PLL_REF_SEL		BIT(15)
 #define RG_HDMITX_PLL_BIAS_EN		BIT(14)
 #define RG_HDMITX_PLL_BIAS_LPF_EN	BIT(13)
 #define RG_HDMITX_PLL_TXDIV_EN		BIT(12)
-#define RG_HDMITX_PLL_TXDIV		(0x3 << 10)
+#define RG_HDMITX_PLL_TXDIV		GENMASK(11, 10)
 #define PLL_TXDIV_SHIFT			10
 #define RG_HDMITX_PLL_LVROD_EN		BIT(9)
 #define RG_HDMITX_PLL_MONVC_EN		BIT(8)
@@ -47,64 +47,64 @@
 #define RG_HDMITX_PLL_MONREF_EN		BIT(6)
 #define RG_HDMITX_PLL_TST_EN		BIT(5)
 #define RG_HDMITX_PLL_TST_CK_EN		BIT(4)
-#define RG_HDMITX_PLL_TST_SEL		(0xf << 0)
+#define RG_HDMITX_PLL_TST_SEL		GENMASK(3, 0)
 #define HDMI_CON2		0x08
-#define RGS_HDMITX_PLL_AUTOK_BAND	(0x7f << 8)
+#define RGS_HDMITX_PLL_AUTOK_BAND	GENMASK(14, 8)
 #define RGS_HDMITX_PLL_AUTOK_FAIL	BIT(1)
 #define RG_HDMITX_EN_TX_CKLDO		BIT(0)
 #define HDMI_CON3		0x0c
-#define RG_HDMITX_SER_EN		(0xf << 28)
-#define RG_HDMITX_PRD_EN		(0xf << 24)
-#define RG_HDMITX_PRD_IMP_EN		(0xf << 20)
-#define RG_HDMITX_DRV_EN		(0xf << 16)
-#define RG_HDMITX_DRV_IMP_EN		(0xf << 12)
+#define RG_HDMITX_SER_EN		GENMASK(31, 28)
+#define RG_HDMITX_PRD_EN		GENMASK(27, 24)
+#define RG_HDMITX_PRD_IMP_EN		GENMASK(23, 20)
+#define RG_HDMITX_DRV_EN		GENMASK(19, 16)
+#define RG_HDMITX_DRV_IMP_EN		GENMASK(15, 12)
 #define DRV_IMP_EN_SHIFT		12
 #define RG_HDMITX_MHLCK_FORCE		BIT(10)
 #define RG_HDMITX_MHLCK_PPIX_EN		BIT(9)
 #define RG_HDMITX_MHLCK_EN		BIT(8)
-#define RG_HDMITX_SER_DIN_SEL		(0xf << 4)
+#define RG_HDMITX_SER_DIN_SEL		GENMASK(7, 4)
 #define RG_HDMITX_SER_5T1_BIST_EN	BIT(3)
 #define RG_HDMITX_SER_BIST_TOG		BIT(2)
 #define RG_HDMITX_SER_DIN_TOG		BIT(1)
 #define RG_HDMITX_SER_CLKDIG_INV	BIT(0)
 #define HDMI_CON4		0x10
-#define RG_HDMITX_PRD_IBIAS_CLK		(0xf << 24)
-#define RG_HDMITX_PRD_IBIAS_D2		(0xf << 16)
-#define RG_HDMITX_PRD_IBIAS_D1		(0xf << 8)
-#define RG_HDMITX_PRD_IBIAS_D0		(0xf << 0)
+#define RG_HDMITX_PRD_IBIAS_CLK		GENMASK(27, 24)
+#define RG_HDMITX_PRD_IBIAS_D2		GENMASK(19, 16)
+#define RG_HDMITX_PRD_IBIAS_D1		GENMASK(11, 8)
+#define RG_HDMITX_PRD_IBIAS_D0		GENMASK(3, 0)
 #define PRD_IBIAS_CLK_SHIFT		24
 #define PRD_IBIAS_D2_SHIFT		16
 #define PRD_IBIAS_D1_SHIFT		8
 #define PRD_IBIAS_D0_SHIFT		0
 #define HDMI_CON5		0x14
-#define RG_HDMITX_DRV_IBIAS_CLK		(0x3f << 24)
-#define RG_HDMITX_DRV_IBIAS_D2		(0x3f << 16)
-#define RG_HDMITX_DRV_IBIAS_D1		(0x3f << 8)
-#define RG_HDMITX_DRV_IBIAS_D0		(0x3f << 0)
+#define RG_HDMITX_DRV_IBIAS_CLK		GENMASK(29, 24)
+#define RG_HDMITX_DRV_IBIAS_D2		GENMASK(21, 16)
+#define RG_HDMITX_DRV_IBIAS_D1		GENMASK(13, 8)
+#define RG_HDMITX_DRV_IBIAS_D0		GENMASK(5, 0)
 #define DRV_IBIAS_CLK_SHIFT		24
 #define DRV_IBIAS_D2_SHIFT		16
 #define DRV_IBIAS_D1_SHIFT		8
 #define DRV_IBIAS_D0_SHIFT		0
 #define HDMI_CON6		0x18
-#define RG_HDMITX_DRV_IMP_CLK		(0x3f << 24)
-#define RG_HDMITX_DRV_IMP_D2		(0x3f << 16)
-#define RG_HDMITX_DRV_IMP_D1		(0x3f << 8)
-#define RG_HDMITX_DRV_IMP_D0		(0x3f << 0)
+#define RG_HDMITX_DRV_IMP_CLK		GENMASK(29, 24)
+#define RG_HDMITX_DRV_IMP_D2		GENMASK(21, 16)
+#define RG_HDMITX_DRV_IMP_D1		GENMASK(13, 8)
+#define RG_HDMITX_DRV_IMP_D0		GENMASK(5, 0)
 #define DRV_IMP_CLK_SHIFT		24
 #define DRV_IMP_D2_SHIFT		16
 #define DRV_IMP_D1_SHIFT		8
 #define DRV_IMP_D0_SHIFT		0
 #define HDMI_CON7		0x1c
-#define RG_HDMITX_MHLCK_DRV_IBIAS	(0x1f << 27)
-#define RG_HDMITX_SER_DIN		(0x3ff << 16)
-#define RG_HDMITX_CHLDC_TST		(0xf << 12)
-#define RG_HDMITX_CHLCK_TST		(0xf << 8)
-#define RG_HDMITX_RESERVE		(0xff << 0)
+#define RG_HDMITX_MHLCK_DRV_IBIAS	GENMASK(31, 27)
+#define RG_HDMITX_SER_DIN		GENMASK(25, 16)
+#define RG_HDMITX_CHLDC_TST		GENMASK(15, 12)
+#define RG_HDMITX_CHLCK_TST		GENMASK(11, 8)
+#define RG_HDMITX_RESERVE		GENMASK(7, 0)
 #define HDMI_CON8		0x20
-#define RGS_HDMITX_2T1_LEV		(0xf << 16)
-#define RGS_HDMITX_2T1_EDG		(0xf << 12)
-#define RGS_HDMITX_5T1_LEV		(0xf << 8)
-#define RGS_HDMITX_5T1_EDG		(0xf << 4)
+#define RGS_HDMITX_2T1_LEV		GENMASK(19, 16)
+#define RGS_HDMITX_2T1_EDG		GENMASK(15, 12)
+#define RGS_HDMITX_5T1_LEV		GENMASK(11, 8)
+#define RGS_HDMITX_5T1_EDG		GENMASK(7, 4)
 #define RGS_HDMITX_PLUG_TST		BIT(0)
 
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
-- 
2.18.0


