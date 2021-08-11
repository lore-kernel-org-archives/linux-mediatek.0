Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6674C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:39:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7C560F22
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E7C560F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pBhetX9evkacq0whrUaqGQOcTrKBpWbR1YMw3+8xHo=; b=zQDDf4eLPyjwh3
	PmkbKi93tLOfwouG92Uo4VI+D+I0/AUFNscSrKIX/9VvTCnuk/WgiimjExXFHQkHT8eEoxbkJI+/A
	R9WQYor+gVu0kqex6s5MGESN42xFCD4cRs66yQQt3bN6aAdJys8x8U8h0QVq/dvbZ1kZGPTs/N2mp
	LwxWD4ZFD1tVUikkP2ko6g1m44wN4gl15HJYRK8RDPjzOSbrF1Xs+H29AFlKlPsuCrYuvax5sHSyB
	bsm846YSG86IUHGKFS6sQT7xSmvABefxfl2S9gxwIGHajeQiY7j7U4Zq3vmyAYMb6MV9960uWVzn0
	/qDo5uk9At3hK9F0CZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkhw-006Mca-AD; Wed, 11 Aug 2021 09:39:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkS5-006Gsf-Hi; Wed, 11 Aug 2021 09:23:13 +0000
X-UUID: d889001f895e4501a823c9296c43673d-20210811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CaWPx0AJEbLcs/wzlHXqbDb+ffsTkO4NWyrKLQWLPxw=; 
 b=eRvnveXQFAoZ6xtUsPmHNf0ycCWOSJVrrM/l9qR7/xFfOc20VoM7/wdm2PvwcyJ4qYCNxV1ZWUlELGnISjU0QSMiQe3ZenifJM3OpoTqU6J/omnU1Gs45PwWE6DV2RLi1hKfSpGKYf6hn8u/wVE4BbfQByL79PjcfiXWevAZLjI=;
X-UUID: d889001f895e4501a823c9296c43673d-20210811
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1257539725; Wed, 11 Aug 2021 02:23:04 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 02:19:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 11 Aug 2021 17:19:29 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Aug 2021 17:19:28 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/9] phy: phy-mtk-tphy: use clock bulk to get clocks
Date: Wed, 11 Aug 2021 17:18:33 +0800
Message-ID: <1628673520-23537-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628673520-23537-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628673520-23537-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_022309_647371_DA6F15F6 
X-CRM114-Status: GOOD (  15.96  )
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
v2: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 43 +++++++++--------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 33000b38fd1b..3259210f08a1 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -280,6 +280,8 @@
 #define RG_CDR_BIRLTD0_GEN3_MSK		GENMASK(4, 0)
 #define RG_CDR_BIRLTD0_GEN3_VAL(x)	(0x1f & (x))
 
+#define TPHY_CLKS_CNT	2
+
 enum mtk_phy_version {
 	MTK_PHY_V1 = 1,
 	MTK_PHY_V2,
@@ -318,8 +320,7 @@ struct mtk_phy_instance {
 		struct u2phy_banks u2_banks;
 		struct u3phy_banks u3_banks;
 	};
-	struct clk *ref_clk;	/* reference clock of (digital) phy */
-	struct clk *da_ref_clk;	/* reference clock of analog phy */
+	struct clk_bulk_data clks[TPHY_CLKS_CNT];
 	u32 index;
 	u8 type;
 	int eye_src;
@@ -974,18 +975,9 @@ static int mtk_phy_init(struct phy *phy)
 	struct mtk_tphy *tphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	ret = clk_prepare_enable(instance->ref_clk);
-	if (ret) {
-		dev_err(tphy->dev, "failed to enable ref_clk\n");
+	ret = clk_bulk_prepare_enable(TPHY_CLKS_CNT, instance->clks);
+	if (ret)
 		return ret;
-	}
-
-	ret = clk_prepare_enable(instance->da_ref_clk);
-	if (ret) {
-		dev_err(tphy->dev, "failed to enable da_ref\n");
-		clk_disable_unprepare(instance->ref_clk);
-		return ret;
-	}
 
 	switch (instance->type) {
 	case PHY_TYPE_USB2:
@@ -1003,8 +995,7 @@ static int mtk_phy_init(struct phy *phy)
 		break;
 	default:
 		dev_err(tphy->dev, "incompatible PHY type\n");
-		clk_disable_unprepare(instance->ref_clk);
-		clk_disable_unprepare(instance->da_ref_clk);
+		clk_bulk_disable_unprepare(TPHY_CLKS_CNT, instance->clks);
 		return -EINVAL;
 	}
 
@@ -1047,8 +1038,7 @@ static int mtk_phy_exit(struct phy *phy)
 	if (instance->type == PHY_TYPE_USB2)
 		u2_phy_instance_exit(tphy, instance);
 
-	clk_disable_unprepare(instance->ref_clk);
-	clk_disable_unprepare(instance->da_ref_clk);
+	clk_bulk_disable_unprepare(TPHY_CLKS_CNT, instance->clks);
 	return 0;
 }
 
@@ -1211,6 +1201,7 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	port = 0;
 	for_each_child_of_node(np, child_np) {
 		struct mtk_phy_instance *instance;
+		struct clk_bulk_data *clks;
 		struct phy *phy;
 
 		instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
@@ -1247,20 +1238,12 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		phy_set_drvdata(phy, instance);
 		port++;
 
-		instance->ref_clk = devm_clk_get_optional(&phy->dev, "ref");
-		if (IS_ERR(instance->ref_clk)) {
-			dev_err(dev, "failed to get ref_clk(id-%d)\n", port);
-			retval = PTR_ERR(instance->ref_clk);
+		clks = instance->clks;
+		clks[0].id = "ref";     /* digital (& analog) clock */
+		clks[1].id = "da_ref";  /* analog clock */
+		retval = devm_clk_bulk_get_optional(&phy->dev, TPHY_CLKS_CNT, clks);
+		if (retval)
 			goto put_child;
-		}
-
-		instance->da_ref_clk =
-			devm_clk_get_optional(&phy->dev, "da_ref");
-		if (IS_ERR(instance->da_ref_clk)) {
-			dev_err(dev, "failed to get da_ref_clk(id-%d)\n", port);
-			retval = PTR_ERR(instance->da_ref_clk);
-			goto put_child;
-		}
 	}
 
 	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
