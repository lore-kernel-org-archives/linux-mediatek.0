Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D7l49E0Wq6nMDK1Wi+27uLjuKNVdUIam5m9KLWDlRqY=; b=MyryIQb9AaqWg6
	CQ6pfUGOxvAVAQdaQXe55DjKriy5aDYB4C6vNArs76wRMAGV63fOC9iTGdfHvMl8ES7WBRlP9TJZT
	GCFpRHTHC21UsXStyCKiTbnpOtuB0OiMnarI9s8ToUkJz3tbXEcYw1ZK3YLiRRv2S8wh4PNJJV/Bd
	UHpTcqX4Dtx+doJ1s6ToArup6oU+zbq1UXiRqr1VZYvXWv7D6Bcwf9ST0tq8g+Fg5Jq9whSoQi114
	3LuQYBaO5GPzHmeVwYX0qEG48JaVs2JOPO86T3YgN2xiBllmGXP9aDo/qN5yLt5yYgyvIVN/Jv5gB
	/6Nck79nXnjLSb3USzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCu4R-00E0nQ-Am; Thu, 27 Jan 2022 01:59:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCu45-00E0cR-1z; Thu, 27 Jan 2022 01:59:10 +0000
X-UUID: c8a84ac7328349cb887ebb806a032f49-20220126
X-UUID: c8a84ac7328349cb887ebb806a032f49-20220126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 116316734; Wed, 26 Jan 2022 18:59:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 17:59:01 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 27 Jan 2022 09:58:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 09:58:58 +0800
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
Subject: [PATCH net-next v2 0/9] add more features for mtk-star-emac
Date: Thu, 27 Jan 2022 09:58:48 +0800
Message-ID: <20220127015857.9868-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_175909_149623_5F87603C 
X-CRM114-Status: UNSURE (   7.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes in v2:
1. fix coding style as Bartosz's comments.
2. add reviewed-by as Bartosz's comments.

This series add more features for mtk-star-emac:
1. add reference clock pad selection for RMII;
2. add simple timing adjustment for RMII;
3. add support for MII;
4. add support for new IC MT8365;
5. separate tx/rx interrupt handling.

Biao Huang (8):
  net: ethernet: mtk-star-emac: modify IRQ trigger flags
  net: ethernet: mtk-star-emac: add support for MT8365 SoC
  dt-bindings: net: mtk-star-emac: add support for MT8365
  net: ethernet: mtk-star-emac: add clock pad selection for RMII
  net: ethernet: mtk-star-emac: add timing adjustment support
  dt-bindings: net: mtk-star-emac: add description for new  properties
  net: ethernet: mtk-star-emac: add support for MII interface
  net: ethernet: mtk-star-emac: separate tx/rx handling with two NAPIs

Fabien Parent (1):
  net: ethernet: mtk-star-emac: store bit_clk_div in compat structure

 .../bindings/net/mediatek,star-emac.yaml      |  17 +
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 477 ++++++++++++------
 2 files changed, 341 insertions(+), 153 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
