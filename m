Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC87C6FA92
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oD+Udm6jbro+HWMaZx++gezk561ohL6Fw5km/9fQXk8=; b=k0DryZeBr4LuzXGzyfrXNhszHK
	ob1zxrEsVBrg7a0tC+O2YirLdnVVNzgkWtAri0DgR3bKA/zi1uN++e+l4r3gdwPMrxcTi+Pnw2ngi
	n/oNndXMV0fTxfMAaNCHu2JYWuSFE+uFtTwB2XdWb69K0v73RF+KZABd6l4MLymGv6cirULpXYVpV
	XI0wjkT5OR7sJOSJFSR7LK+FFFxHri+2Zb656AZxW57qEuwr92ebVzvfq+6ggC0/NIEBKFNx0ZvTb
	esHhCbBvilh8D6D/ynVw7e8psMBNsS1hTqGAxwt9rY1ukxHc9zPSOuI6kdCJvKe81cyq8vUQv22ie
	VdsLjw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8a-00291k-D9; Tue, 20 Sep 2022 09:01:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8H-0028nF-1B; Tue, 20 Sep 2022 09:01:34 +0000
X-UUID: b52840a9e8684d2da8fd8897f005fb99-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oD+Udm6jbro+HWMaZx++gezk561ohL6Fw5km/9fQXk8=;
	b=q/wdKcz8EDeAowLm1YnAYbEbJgZoN81qHihtXvXYEFh2teEvqF6d+ENfgPXp8csLaceTKsYcr8lFZvnzSewuZbiOrr8s5M0l1iScJnHncy8m8TK+tTp16KH1ZfRzeefp3TBthOk2yz8GoAh3BmwYFjrPpMOf6EfgrGuhOk0AYeU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d7146dee-cd20-4223-a1cd-e6a1db4361e9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:61ef03f7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b52840a9e8684d2da8fd8897f005fb99-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 594343639; Tue, 20 Sep 2022 02:01:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jitao Shi
	<jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH 16/18] phy: mediatek: mipi: mt8183: use GENMASK to generate bits mask
Date: Tue, 20 Sep 2022 17:00:36 +0800
Message-ID: <20220920090038.15133-17-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020133_111997_65339383 
X-CRM114-Status: UNSURE (   8.81  )
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
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 99108426d57c..1ec71ba2407e 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -18,7 +18,7 @@
 #define RG_DSI_PAD_TIEL_SEL		BIT(8)
 
 #define MIPITX_VOLTAGE_SEL	0x0010
-#define RG_DSI_HSTX_LDO_REF_SEL		(0xf << 6)
+#define RG_DSI_HSTX_LDO_REF_SEL		GENMASK(9, 6)
 
 #define MIPITX_PLL_PWR		0x0028
 #define MIPITX_PLL_CON0		0x002c
@@ -26,7 +26,7 @@
 #define MIPITX_PLL_CON2		0x0034
 #define MIPITX_PLL_CON3		0x0038
 #define MIPITX_PLL_CON4		0x003c
-#define RG_DSI_PLL_IBIAS		(3 << 10)
+#define RG_DSI_PLL_IBIAS		GENMASK(11, 10)
 
 #define MIPITX_D2P_RTCODE	0x0100
 #define MIPITX_D2_SW_CTL_EN	0x0144
@@ -41,7 +41,7 @@
 #define AD_DSI_PLL_SDM_ISO_EN		BIT(1)
 
 #define RG_DSI_PLL_EN			BIT(4)
-#define RG_DSI_PLL_POSDIV		(0x7 << 8)
+#define RG_DSI_PLL_POSDIV		GENMASK(10, 8)
 
 static int mtk_mipi_tx_pll_enable(struct clk_hw *hw)
 {
-- 
2.18.0


