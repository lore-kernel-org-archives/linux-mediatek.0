Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A24FC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 07:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1685A60F9E
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 07:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1685A60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8Clce1Zjzk7vwtHGVs0wPVE8Dkvq+66R2d5dOCOWp0=; b=D7xdgekzQoyIL2
	7VPQRb85OFuvrEXgHcY8YUTL48wjm1QYxohhV059eYGPi8cQOcL6LURQusMNorwYgi79jU6jpinOL
	G1YVRPUXNAprYzwMJo/h9cgHPiHtUKJRfxTZiNDO1ZlgoLIUqX/+6NR6Gxb9gNxDtrFhYvRsWXmGA
	SNW8fqKmPoxlQuiKy8o0KpBh9OoJ6XzV+yddLBr4CmPucT+1V7dhpWtffaBQI1mrzbOPNilm3PT/K
	OXVvxSc2vodt76+2TKdNEGI7bMUlYa8TfGBoZsBGJmDnFl/vSIwDtytdlRUxyLXDWd2VEgMegQ6aN
	QjJvDZX9ePYoHyxTPJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8eTd-00HPje-A4; Wed, 28 Jul 2021 07:59:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8eTA-00HPRt-1N; Wed, 28 Jul 2021 07:59:13 +0000
X-UUID: f2607cf8a5c445589addc5b1d82f6bd5-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Gs4P3d9sOZuvkwDo9y8uyfE3bKIK5jKgIasGESrnUGw=; 
 b=goeOi54K1qbclmGUUuWuhL4ygWitMfQk1mUV75mtJ6855guQXTCPbF2lQgwd0PRK/OF35YgvXsp43LT7UVf959d7V9oSs3B7Hn39fIf5Bbhe4RhsLIT8N5EkOAz+8tHKqBKscckiYiBcUqm6SznJCu58yIwXre0LjGhqY+bGlnc=;
X-UUID: f2607cf8a5c445589addc5b1d82f6bd5-20210728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 658259098; Wed, 28 Jul 2021 00:59:09 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 00:59:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 15:59:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 15:59:05 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 4/9] phy: phy-mtk-tphy: print error log using child device
Date: Wed, 28 Jul 2021 15:58:26 +0800
Message-ID: <1627459111-2907-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_005912_106567_500F598B 
X-CRM114-Status: GOOD (  12.89  )
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
