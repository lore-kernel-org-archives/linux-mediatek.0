Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE78AC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 08:00:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C28A60F9E
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 08:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C28A60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BKLDUFKFm6vgY+qoizp5Y5AotVt10/qIf6M1s9VH8w=; b=HxbNo99Vm05HTV
	KLMvQNkV7lb4iz1r6vF5p8X28iXkPSzPA6hOHtgTLgEhbYtqAdqo++1bf2nm7FCn+iK0vA+HfDVQ2
	eF+HUs1FPyBMCzsbJcjiqAugaZudCpsHokU/rujf0U/UJam4evXOIDQHbSsTXgxtzv9m2Gm3dSHwj
	mVruCjwvdBVJGxk1Fc3ku+yV2RY8K7PLE4+Ml85h2iZ0BhcWpPyA6vE+9UYj4CEqYH9FqsFAODT4D
	VtuyO6AY0TAo9YuR5MKzsIfgU+WRtnjJjSQAE+mw6nmVT5+Q8cfDXylZVTc8mGM1Dx0QYK3fsRzEJ
	cymE9Oj4BcLwxQprw39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8eTt-00HPqq-9Y; Wed, 28 Jul 2021 07:59:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8eTG-00HPVU-69; Wed, 28 Jul 2021 07:59:20 +0000
X-UUID: af95aec13ab0424b9d83e6e5874532cb-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aRtx51kvv9bqZaKnWKbokdAeOQtkzfxo0sTNLR3QBJg=; 
 b=swV2CgBrOQZdtbS0J4oF/oJ7S1asIXvMStG7WAtIEUNPBn+aPtftGRXXNUgqJnOCQUgZoqLauPUC927vPXBpw0pWiN/HR1ILOWAl5co6dknAx7MdZwEz8q+SlECMW0+Bu88zoA8msBIKZnehKW4/oZvL9dDkWXXXUcgzBTjlzM0=;
X-UUID: af95aec13ab0424b9d83e6e5874532cb-20210728
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 350767861; Wed, 28 Jul 2021 00:59:11 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 00:59:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 15:59:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 15:59:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 6/9] phy: phy-mtk-ufs: use clock bulk to get clocks
Date: Wed, 28 Jul 2021 15:58:28 +0800
Message-ID: <1627459111-2907-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_005918_354296_227E2017 
X-CRM114-Status: GOOD (  14.26  )
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

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
