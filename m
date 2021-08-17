Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC50C4320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE46C60F11
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE46C60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2mbpUNUtMc3WXDKuwVPojNRiLkYnh3paoROtHvXTNI=; b=aIVZMG0U8qw1mV
	umeB1Gp2KRywwy4clCTzZWzyjQrVppeIGiA70YsjwUFNU2/UC5HfOKgeUlxCw2hExrlZKrTfZFD9j
	s9LQktwMcWsuDrH58CbOz3TMmFIv7BSFeO5Ozr19420Q3VXi/q7bDzqphdYk0BBoIXMQrkZIswCV0
	LC5P++X/9KPeS06YetBi5wRkibZ3tNgExFKCQkQ3pKWy0BlaS8keX2cTLXHAVffOZUbDvT+fckqKR
	h89dFWWnwVNGzBA/lf4nj3gu2jMJut+3WCCeh99Rp15VjgDAEbdbW2YkLuTrqSj71/nXR2dOq3u0Z
	3sVFCmR/kXP35Y69qF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFvIP-001mc1-JG; Tue, 17 Aug 2021 09:22:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvGg-001lgM-W9; Tue, 17 Aug 2021 09:20:24 +0000
X-UUID: c8d89668da254d50a8b22ef2b6e77fe1-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cObFxxn9wyJF7psp/2qAb3QmpS4VJzKMWNNLGouJoP4=; 
 b=G/TevcCoUZCibQiT4MC3hUbAxU4BnsQXMsoAaECV42wNcfto1C0bKtZm3AOa9oz4IWz0jGs+tFKozyRSeiI2QzOwC/O1HCQQLMPsbyoihWu4CnMc2Xa90wCAE7ApXb4NEm4G8VV/bgBZsKNMEmbXDz6QjMWP1nA08Yb/BnNdnT0=;
X-UUID: c8d89668da254d50a8b22ef2b6e77fe1-20210817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 263976913; Tue, 17 Aug 2021 02:20:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 02:20:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 17 Aug 2021 17:20:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 17:20:11 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v3 6/9] phy: phy-mtk-ufs: use clock bulk to get clocks
Date: Tue, 17 Aug 2021 17:19:44 +0800
Message-ID: <1629191987-20774-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_022023_095269_0DA10CC4 
X-CRM114-Status: GOOD (  14.22  )
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

Use clock bulk helpers to get/enable/disable clocks

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: add reviewed-by Stanley
v2: no changes
---
 drivers/phy/mediatek/phy-mtk-ufs.c | 44 ++++++++----------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
index 769b00b038d8..a6af06941203 100644
--- a/drivers/phy/mediatek/phy-mtk-ufs.c
+++ b/drivers/phy/mediatek/phy-mtk-ufs.c
@@ -31,11 +31,12 @@
 #define FRC_CDR_ISO_EN              BIT(19)
 #define CDR_ISO_EN                  BIT(20)
 
+#define UFSPHY_CLKS_CNT    2
+
 struct ufs_mtk_phy {
 	struct device *dev;
 	void __iomem *mmio;
-	struct clk *mp_clk;
-	struct clk *unipro_clk;
+	struct clk_bulk_data clks[UFSPHY_CLKS_CNT];
 };
 
 static inline u32 mphy_readl(struct ufs_mtk_phy *phy, u32 reg)
@@ -74,20 +75,11 @@ static struct ufs_mtk_phy *get_ufs_mtk_phy(struct phy *generic_phy)
 static int ufs_mtk_phy_clk_init(struct ufs_mtk_phy *phy)
 {
 	struct device *dev = phy->dev;
+	struct clk_bulk_data *clks = phy->clks;
 
-	phy->unipro_clk = devm_clk_get(dev, "unipro");
-	if (IS_ERR(phy->unipro_clk)) {
-		dev_err(dev, "failed to get clock: unipro");
-		return PTR_ERR(phy->unipro_clk);
-	}
-
-	phy->mp_clk = devm_clk_get(dev, "mp");
-	if (IS_ERR(phy->mp_clk)) {
-		dev_err(dev, "failed to get clock: mp");
-		return PTR_ERR(phy->mp_clk);
-	}
-
-	return 0;
+	clks[0].id = "unipro";
+	clks[1].id = "mp";
+	return devm_clk_bulk_get(dev, UFSPHY_CLKS_CNT, clks);
 }
 
 static void ufs_mtk_phy_set_active(struct ufs_mtk_phy *phy)
@@ -150,26 +142,13 @@ static int ufs_mtk_phy_power_on(struct phy *generic_phy)
 	struct ufs_mtk_phy *phy = get_ufs_mtk_phy(generic_phy);
 	int ret;
 
-	ret = clk_prepare_enable(phy->unipro_clk);
-	if (ret) {
-		dev_err(phy->dev, "unipro_clk enable failed %d\n", ret);
-		goto out;
-	}
-
-	ret = clk_prepare_enable(phy->mp_clk);
-	if (ret) {
-		dev_err(phy->dev, "mp_clk enable failed %d\n", ret);
-		goto out_unprepare_unipro_clk;
-	}
+	ret = clk_bulk_prepare_enable(UFSPHY_CLKS_CNT, phy->clks);
+	if (ret)
+		return ret;
 
 	ufs_mtk_phy_set_active(phy);
 
 	return 0;
-
-out_unprepare_unipro_clk:
-	clk_disable_unprepare(phy->unipro_clk);
-out:
-	return ret;
 }
 
 static int ufs_mtk_phy_power_off(struct phy *generic_phy)
@@ -178,8 +157,7 @@ static int ufs_mtk_phy_power_off(struct phy *generic_phy)
 
 	ufs_mtk_phy_set_deep_hibern(phy);
 
-	clk_disable_unprepare(phy->unipro_clk);
-	clk_disable_unprepare(phy->mp_clk);
+	clk_bulk_disable_unprepare(UFSPHY_CLKS_CNT, phy->clks);
 
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
