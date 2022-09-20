Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B06ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QX+zsgCt4UHzplHNtbSC7dr/Ouj/pqLPeYAQTq2AnPI=; b=M9uyN9XsZOtFSHd1muEoolMJDB
	LL96nuKM4KexfaR7tcvZEu8vw9o4Tqt0vP0Heidh9igxsd1M5of/w7AoBDEPDpPjEbHwxtfefqoCF
	g8nHIY5cDv77XYWZXaKDfbEjmcTGIsBa+D5bsRwUV0ni30y03ICcLLtqVPEwH0gERELAJlnbUkYsR
	mA4epVLhnVz+HuMrQSEoUvPMYhkZUASvFy2OpjCVr8hPq8e+m4iA1Ao0RgaIJ7rrbiKjUILKhTIDu
	KF2CWfmCgGaNcs/Y1mhwKjqToRsfhmXwek3azcUxy5sACn41TSIy2ReiP46hs7nTaaBXuAXuZcLXQ
	D6xA6TNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZAX-002A9z-NU; Tue, 20 Sep 2022 09:03:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8Y-00290H-Ra; Tue, 20 Sep 2022 09:01:53 +0000
X-UUID: 159315ad53634b35863ce36af0876f15-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QX+zsgCt4UHzplHNtbSC7dr/Ouj/pqLPeYAQTq2AnPI=;
	b=B6L15IWQ2VyEyLJl25lxY+McAJLi6ztNFwg/i0VlvmE6oHrKL/0Ca71JZll2mE4R6lCVD3nWirptWvD0ZSUMh+7tYZQck6MpJHiWU00I+1CiaPyRNBIhlre/6WDRV92mJkMVKa5m91FHyJwSdARYAeuzatUfmKhcL5YzPF357h8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fc209bc7-300e-42bb-8d2d-aac21bfe9791,IP:0,U
	RL:0,TC:0,Content:46,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:46
X-CID-META: VersionHash:39a5ff1,CLOUDID:33f403f7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 159315ad53634b35863ce36af0876f15-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1024240074; Tue, 20 Sep 2022 02:01:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 06/18] phy: mediatek: hdmi: mt2701: use GENMASK and BIT to generate mask and bits
Date: Tue, 20 Sep 2022 17:00:26 +0800
Message-ID: <20220920090038.15133-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020150_956462_09507609 
X-CRM114-Status: UNSURE (   8.08  )
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

Use GENMASK() and BIT() macros to generate mask and bits

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 56 +++++++++++-----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index b74c65a1762c..ce36f37c698d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -8,62 +8,62 @@
 
 #define HDMI_CON0	0x00
 #define RG_HDMITX_DRV_IBIAS		0
-#define RG_HDMITX_DRV_IBIAS_MASK	(0x3f << 0)
+#define RG_HDMITX_DRV_IBIAS_MASK	GENMASK(5, 0)
 #define RG_HDMITX_EN_SER		12
-#define RG_HDMITX_EN_SER_MASK		(0x0f << 12)
+#define RG_HDMITX_EN_SER_MASK		GENMASK(15, 12)
 #define RG_HDMITX_EN_SLDO		16
-#define RG_HDMITX_EN_SLDO_MASK		(0x0f << 16)
+#define RG_HDMITX_EN_SLDO_MASK		GENMASK(19, 16)
 #define RG_HDMITX_EN_PRED		20
-#define RG_HDMITX_EN_PRED_MASK		(0x0f << 20)
+#define RG_HDMITX_EN_PRED_MASK		GENMASK(23, 20)
 #define RG_HDMITX_EN_IMP		24
-#define RG_HDMITX_EN_IMP_MASK		(0x0f << 24)
+#define RG_HDMITX_EN_IMP_MASK		GENMASK(27, 24)
 #define RG_HDMITX_EN_DRV		28
-#define RG_HDMITX_EN_DRV_MASK		(0x0f << 28)
+#define RG_HDMITX_EN_DRV_MASK		GENMASK(31, 28)
 
 #define HDMI_CON1	0x04
 #define RG_HDMITX_PRED_IBIAS		18
-#define RG_HDMITX_PRED_IBIAS_MASK	(0x0f << 18)
-#define RG_HDMITX_PRED_IMP		(0x01 << 22)
+#define RG_HDMITX_PRED_IBIAS_MASK	GENMASK(21, 18)
+#define RG_HDMITX_PRED_IMP		BIT(22)
 #define RG_HDMITX_DRV_IMP		26
-#define RG_HDMITX_DRV_IMP_MASK		(0x3f << 26)
+#define RG_HDMITX_DRV_IMP_MASK		GENMASK(31, 26)
 
 #define HDMI_CON2	0x08
-#define RG_HDMITX_EN_TX_CKLDO		(0x01 << 0)
-#define RG_HDMITX_EN_TX_POSDIV		(0x01 << 1)
+#define RG_HDMITX_EN_TX_CKLDO		BIT(0)
+#define RG_HDMITX_EN_TX_POSDIV		BIT(1)
 #define RG_HDMITX_TX_POSDIV		3
-#define RG_HDMITX_TX_POSDIV_MASK	(0x03 << 3)
-#define RG_HDMITX_EN_MBIAS		(0x01 << 6)
-#define RG_HDMITX_MBIAS_LPF_EN		(0x01 << 7)
+#define RG_HDMITX_TX_POSDIV_MASK	GENMASK(4, 3)
+#define RG_HDMITX_EN_MBIAS		BIT(6)
+#define RG_HDMITX_MBIAS_LPF_EN		BIT(7)
 
 #define HDMI_CON4	0x10
-#define RG_HDMITX_RESERVE_MASK		(0xffffffff << 0)
+#define RG_HDMITX_RESERVE_MASK		GENMASK(31, 0)
 
 #define HDMI_CON6	0x18
 #define RG_HTPLL_BR			0
-#define RG_HTPLL_BR_MASK		(0x03 << 0)
+#define RG_HTPLL_BR_MASK		GENMASK(1, 0)
 #define RG_HTPLL_BC			2
-#define RG_HTPLL_BC_MASK		(0x03 << 2)
+#define RG_HTPLL_BC_MASK		GENMASK(3, 2)
 #define RG_HTPLL_BP			4
-#define RG_HTPLL_BP_MASK		(0x0f << 4)
+#define RG_HTPLL_BP_MASK		GENMASK(7, 4)
 #define RG_HTPLL_IR			8
-#define RG_HTPLL_IR_MASK		(0x0f << 8)
+#define RG_HTPLL_IR_MASK		GENMASK(11, 8)
 #define RG_HTPLL_IC			12
-#define RG_HTPLL_IC_MASK		(0x0f << 12)
+#define RG_HTPLL_IC_MASK		GENMASK(15, 12)
 #define RG_HTPLL_POSDIV			16
-#define RG_HTPLL_POSDIV_MASK		(0x03 << 16)
+#define RG_HTPLL_POSDIV_MASK		GENMASK(17, 16)
 #define RG_HTPLL_PREDIV			18
-#define RG_HTPLL_PREDIV_MASK		(0x03 << 18)
+#define RG_HTPLL_PREDIV_MASK		GENMASK(19, 18)
 #define RG_HTPLL_FBKSEL			20
-#define RG_HTPLL_FBKSEL_MASK		(0x03 << 20)
-#define RG_HTPLL_RLH_EN			(0x01 << 22)
+#define RG_HTPLL_FBKSEL_MASK		GENMASK(21, 20)
+#define RG_HTPLL_RLH_EN			BIT(22)
 #define RG_HTPLL_FBKDIV			24
-#define RG_HTPLL_FBKDIV_MASK		(0x7f << 24)
-#define RG_HTPLL_EN			(0x01 << 31)
+#define RG_HTPLL_FBKDIV_MASK		GENMASK(30, 24)
+#define RG_HTPLL_EN			BIT(31)
 
 #define HDMI_CON7	0x1c
-#define RG_HTPLL_AUTOK_EN		(0x01 << 23)
+#define RG_HTPLL_AUTOK_EN		BIT(23)
 #define RG_HTPLL_DIVEN			28
-#define RG_HTPLL_DIVEN_MASK		(0x07 << 28)
+#define RG_HTPLL_DIVEN_MASK		GENMASK(30, 28)
 
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
-- 
2.18.0


