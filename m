Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0315CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 07:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQwmK9zP0iYx1tQj5f+A+gM3HaRz4UBzu1DbMyl1PT0=; b=3uwgHunqMLiGxz
	RxvL4CMCwUsPJe3nQ/4PP4vyu7eSLBStE9mnargTdZE9oMkqnO6Wd/f6+HSBUaCt6TD1oiMETjlbr
	wskT1GcM5oPqNi9e/KI70KP3EV6gcayeDUnkpJ8LK2ocLgVypNTjCwZlPpBc8BK3uU09TyK3aProf
	HAYkwG8h18g6/KV/sxys/o0svhVF16n4lBjMH96ALUNGtp0vNSEffknoDFqm6jzPJUpKvuQDCUoPq
	axnSKKL/fvbzJyICoG5Cr8dlnmYZMAUSBV3m2M3rlpzlyvTeBXkXQuecI+IiawyFFLnkt5WrEcrfK
	c+sKcbb/vnVgSJ26o14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nARTd-009AFm-An; Thu, 20 Jan 2022 07:03:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nARSx-0099tw-TW; Thu, 20 Jan 2022 07:02:41 +0000
X-UUID: b3c300f9baf84e71aa83ed748309724e-20220120
X-UUID: b3c300f9baf84e71aa83ed748309724e-20220120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 645272363; Thu, 20 Jan 2022 00:02:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 23:02:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 20 Jan 2022 15:02:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Jan 2022 15:02:31 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>
CC: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, "John
 Crispin" <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Biao Huang <biao.huang@mediatek.com>,
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH net-next v1 2/9] net: ethernet: mtk-star-emac: modify IRQ
 trigger flags
Date: Thu, 20 Jan 2022 15:02:19 +0800
Message-ID: <20220120070226.1492-3-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120070226.1492-1-biao.huang@mediatek.com>
References: <20220120070226.1492-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_230240_006840_367F2FC5 
X-CRM114-Status: GOOD (  12.44  )
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

If the flags in request_irq() is IRQF_TRIGGER_NONE, the trigger method
is determined by "interrupt" property in dts.
So, modify the flag from IRQF_TRIGGER_FALLING to IRQF_TRIGGER_NONE.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 26f5020f2e9c..7c2af775d601 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -959,7 +959,7 @@ static int mtk_star_enable(struct net_device *ndev)
 
 	/* Request the interrupt */
 	ret = request_irq(ndev->irq, mtk_star_handle_irq,
-			  IRQF_TRIGGER_FALLING, ndev->name, ndev);
+			  IRQF_TRIGGER_NONE, ndev->name, ndev);
 	if (ret)
 		goto err_free_skbs;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
