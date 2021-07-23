Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0ACC4320E
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 08:30:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9E5960E77
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 08:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9E5960E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQSAWvdHO7sKMwvF6RsI0jp6ym4av1GYN36bpwWtMfE=; b=QcUhUcEC9Wo52R
	rZ06IvvYQ1R1DNgdJVneXV0vNH89Lk5H3twAmAEoa4hDPgYHcCEaCnPqzPc2fC+pMD3hChnPcfYUO
	K7Q8hpn15qqYREMHajRKB/ggHN4SJ2t0Km2Izq38TYRyzHa2URXA4AQ/9QUgEiinopLWbFa1B8qDT
	8zhzbN69Cb6CcxhmJj1FDPYPEI2nVbc1xAPuVTnDPglAvqIGVv0/v4BvbkSuCY1QtS19c34RMJvGA
	+RgXOvWAFIJ3Ip5d6zVQo/+BiE99rfsaHkCB1aZmY2kYM5KlPFvlX5AXVZ/timBQBP8k7bBZ4lAhR
	q2ksVUuekE3xdkkjXgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6qZF-003w2r-Ol; Fri, 23 Jul 2021 08:30:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6qZC-003w1X-9d; Fri, 23 Jul 2021 08:30:00 +0000
X-UUID: b8557d56e25d41278bda160292771d1c-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2FWNveqMxWtprLuL1JriNnAl8Hzgw6xMLUZQNJ+CatU=; 
 b=jDXpAUvvJKzRlyq82hPJuEB9PHELb9CNfCj/BsJeTxqhbwiHOeeYhEY5p1momp3OY3VFnVq+8J7O+bhYxe8sr3PwcN4+dUHGaOAcXHdWg/QX6g2PmAYHgAF9PvCgmbAGIh1OgKxBqoDo4JS2GDnI/Ck8iORIQJDQ1fhTnbIzk/s=;
X-UUID: b8557d56e25d41278bda160292771d1c-20210723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1769079039; Fri, 23 Jul 2021 01:29:54 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 01:23:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 16:23:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 16:23:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v4 3/3] phy: phy-mtk-tphy: add support mt8195
Date: Fri, 23 Jul 2021 16:22:42 +0800
Message-ID: <1627028562-23584-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1627028562-23584-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1627028562-23584-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_012958_374443_36980270 
X-CRM114-Status: GOOD (  15.80  )
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

The controller is designed to use use PLL integer mode, but
in fact used fractional mode for some ones on mt8195, this
causes signal degradation (e.g. eye diagram test fail), fix
it by switching PLL to 26Mhz from default 48Mhz to improve
signal quality.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4:
    1. add comments suggested by Vinod
    2. move u2_phy_pll_26m_set() into u2_phy_instance_init()

v2~3: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 42a1174da6cc..33000b38fd1b 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -41,6 +41,8 @@
 
 #define U3P_USBPHYACR0		0x000
 #define PA0_RG_U2PLL_FORCE_ON		BIT(15)
+#define PA0_USB20_PLL_PREDIV		GENMASK(7, 6)
+#define PA0_USB20_PLL_PREDIV_VAL(x)	((0x3 & (x)) << 6)
 #define PA0_RG_USB20_INTR_EN		BIT(5)
 
 #define U3P_USBPHYACR1		0x004
@@ -52,6 +54,8 @@
 #define PA1_RG_TERM_SEL_VAL(x)	((0x7 & (x)) << 8)
 
 #define U3P_USBPHYACR2		0x008
+#define PA2_RG_U2PLL_BW			GENMASK(21, 19)
+#define PA2_RG_U2PLL_BW_VAL(x)		((0x7 & (x)) << 19)
 #define PA2_RG_SIF_U2PLL_FORCE_EN	BIT(18)
 
 #define U3P_USBPHYACR5		0x014
@@ -73,6 +77,14 @@
 #define P2C_USB20_GPIO_MODE		BIT(8)
 #define P2C_U2_GPIO_CTR_MSK	(P2C_RG_USB20_GPIO_CTL | P2C_USB20_GPIO_MODE)
 
+#define U3P_U2PHYA_RESV		0x030
+#define P2R_RG_U2PLL_FBDIV_26M		0x1bb13b
+#define P2R_RG_U2PLL_FBDIV_48M		0x3c0000
+
+#define U3P_U2PHYA_RESV1	0x044
+#define P2R_RG_U2PLL_REFCLK_SEL	BIT(5)
+#define P2R_RG_U2PLL_FRA_EN		BIT(3)
+
 #define U3D_U2PHYDCR0		0x060
 #define P2C_RG_SIF_U2PLL_FORCE_ON	BIT(24)
 
@@ -277,6 +289,12 @@ enum mtk_phy_version {
 struct mtk_phy_pdata {
 	/* avoid RX sensitivity level degradation only for mt8173 */
 	bool avoid_rx_sen_degradation;
+	/*
+	 * workaround only for mt8195, HW fix it for others of V3,
+	 * u2phy should use integer mode instead of fractional mode of
+	 * 48M PLL, fix it by switching PLL to 26M from default 48M
+	 */
+	bool sw_pll_48m_to_26m;
 	enum mtk_phy_version version;
 };
 
@@ -456,6 +474,33 @@ static void u3_phy_instance_init(struct mtk_tphy *tphy,
 	dev_dbg(tphy->dev, "%s(%d)\n", __func__, instance->index);
 }
 
+static void u2_phy_pll_26m_set(struct mtk_tphy *tphy,
+	struct mtk_phy_instance *instance)
+{
+	struct u2phy_banks *u2_banks = &instance->u2_banks;
+	void __iomem *com = u2_banks->com;
+	u32 tmp;
+
+	if (!tphy->pdata->sw_pll_48m_to_26m)
+		return;
+
+	tmp = readl(com + U3P_USBPHYACR0);
+	tmp &= ~PA0_USB20_PLL_PREDIV;
+	tmp |= PA0_USB20_PLL_PREDIV_VAL(0);
+	writel(tmp, com + U3P_USBPHYACR0);
+
+	tmp = readl(com + U3P_USBPHYACR2);
+	tmp &= ~PA2_RG_U2PLL_BW;
+	tmp |= PA2_RG_U2PLL_BW_VAL(3);
+	writel(tmp, com + U3P_USBPHYACR2);
+
+	writel(P2R_RG_U2PLL_FBDIV_26M, com + U3P_U2PHYA_RESV);
+
+	tmp = readl(com + U3P_U2PHYA_RESV1);
+	tmp |= P2R_RG_U2PLL_FRA_EN | P2R_RG_U2PLL_REFCLK_SEL;
+	writel(tmp, com + U3P_U2PHYA_RESV1);
+}
+
 static void u2_phy_instance_init(struct mtk_tphy *tphy,
 	struct mtk_phy_instance *instance)
 {
@@ -515,6 +560,9 @@ static void u2_phy_instance_init(struct mtk_tphy *tphy,
 	tmp |= PA6_RG_U2_SQTH_VAL(2);
 	writel(tmp, com + U3P_USBPHYACR6);
 
+	/* Workaround only for mt8195, HW fix it for others (V3) */
+	u2_phy_pll_26m_set(tphy, instance);
+
 	dev_dbg(tphy->dev, "%s(%d)\n", __func__, index);
 }
 
@@ -1094,10 +1142,16 @@ static const struct mtk_phy_pdata mt8173_pdata = {
 	.version = MTK_PHY_V1,
 };
 
+static const struct mtk_phy_pdata mt8195_pdata = {
+	.sw_pll_48m_to_26m = true,
+	.version = MTK_PHY_V3,
+};
+
 static const struct of_device_id mtk_tphy_id_table[] = {
 	{ .compatible = "mediatek,mt2701-u3phy", .data = &tphy_v1_pdata },
 	{ .compatible = "mediatek,mt2712-u3phy", .data = &tphy_v2_pdata },
 	{ .compatible = "mediatek,mt8173-u3phy", .data = &mt8173_pdata },
+	{ .compatible = "mediatek,mt8195-tphy", .data = &mt8195_pdata },
 	{ .compatible = "mediatek,generic-tphy-v1", .data = &tphy_v1_pdata },
 	{ .compatible = "mediatek,generic-tphy-v2", .data = &tphy_v2_pdata },
 	{ .compatible = "mediatek,generic-tphy-v3", .data = &tphy_v3_pdata },
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
