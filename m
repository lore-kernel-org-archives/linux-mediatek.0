Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3567C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:21:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89027600CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89027600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Gs2M7pemBFauhvYYQi485x6ZnCIatZIPR4AbDCPS18=; b=DWv7K/IYYmA2g5
	1zsJkn9Nxe2dhAceIyLzGO8csClgMn1PCl+GcGEJeYMA5ogDInTnx0H+B+3BRfkEZ/YXkGN+O7Bv/
	4FPg4NbddtmuR4hDNQ88fwTMZm8VKxHnfVgL/HqQ03VVSaADd9zt8WcpgHlkMWhzv2F8TYUpk1BAU
	pwpho9tq4W61IRU+IGE+hI4632ctX2Od52RZ/Ozlfz1xCXk2TMIxRE9M8LAtijFDbET1neEDQudbs
	Vhha1EumFLygdnE24LUS9JRkuOmXVao6JhtHx2oxdYThsFyV7xwHtPgtWwFbNcFAKakFmHSYTsPn8
	QjpfDw2YpC5dYexrl7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFvH6-001lta-79; Tue, 17 Aug 2021 09:20:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvGX-001lc8-P6; Tue, 17 Aug 2021 09:20:20 +0000
X-UUID: 61ca08be466b4f57a619af7444f28344-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hvNykDS94ldvi23eHhXkC+QCSDsszel79QCWy8sDLbM=; 
 b=QVLyEJ0porJvJEl3U1+LWQd2aLMzvfXbWNshJiqU/N6GTXpurrvxbpLAwwZP63HUdKHiOIw4mhLgQPt6b645bNR9BJ0poIKccx6QcNEhPm4iygtSj/MU7Jg5GG3lckNoLKt428WadtEUiO05nC2wSlMl7GcMscV9EpcDlfqXqqY=;
X-UUID: 61ca08be466b4f57a619af7444f28344-20210817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1193565696; Tue, 17 Aug 2021 02:20:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 02:20:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 17:20:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 17:20:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v3 4/9] phy: phy-mtk-tphy: print error log using child device
Date: Tue, 17 Aug 2021 17:19:42 +0800
Message-ID: <1629191987-20774-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_022013_865226_9858D4D4 
X-CRM114-Status: GOOD (  12.19  )
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

Print error log using child devices instead of parent device.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~3: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index a6502058a1a5..9d4b34298137 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -1278,6 +1278,7 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	for_each_child_of_node(np, child_np) {
 		struct mtk_phy_instance *instance;
 		struct clk_bulk_data *clks;
+		struct device *subdev;
 		struct phy *phy;
 
 		instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
@@ -1295,16 +1296,17 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 			goto put_child;
 		}
 
+		subdev = &phy->dev;
 		retval = of_address_to_resource(child_np, 0, &res);
 		if (retval) {
-			dev_err(dev, "failed to get address resource(id-%d)\n",
+			dev_err(subdev, "failed to get address resource(id-%d)\n",
 				port);
 			goto put_child;
 		}
 
-		instance->port_base = devm_ioremap_resource(&phy->dev, &res);
+		instance->port_base = devm_ioremap_resource(subdev, &res);
 		if (IS_ERR(instance->port_base)) {
-			dev_err(dev, "failed to remap phy regs\n");
+			dev_err(subdev, "failed to remap phy regs\n");
 			retval = PTR_ERR(instance->port_base);
 			goto put_child;
 		}
@@ -1317,7 +1319,7 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		clks = instance->clks;
 		clks[0].id = "ref";     /* digital (& analog) clock */
 		clks[1].id = "da_ref";  /* analog clock */
-		retval = devm_clk_bulk_get_optional(&phy->dev, TPHY_CLKS_CNT, clks);
+		retval = devm_clk_bulk_get_optional(subdev, TPHY_CLKS_CNT, clks);
 		if (retval)
 			goto put_child;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
