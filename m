Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07979C369A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TobQFyc4j8DBuybngmaAYoZ3A0AaTym3zvMPjl2XMsM=; b=02FNNnonz9pu0Fq3PbFeccHtVp
	hi1c/xh8O7Ywo9ACS8uKuCO/xAmj5ktKRUnSulrN9xtPBL0fuhIBaMEVMUB/KHKxy0lgwn/v3dx9j
	cWaLxFdDGyLX+dvNl8cl4M9JcBU+MZVesAa/keoEdRUHAvB8hXt4Jyn/AIc1EMOrbHX39nf6ezZQu
	Aa9yl7nTKVj3phXPiGlT6WzK1p/RGkcue7/gPXxVrJElSFSCN18gUQ+sfo7KW81V5yblgAZrXVQct
	U6RXi5zxj0eLfeNK7UBbXr/9giSj5JFigDGkwr9eFOJYuRVIMhcn43outAuhjIOQzF3ViRCUJ8n6Q
	9l3dFGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OLH-000000034Av-0VGy;
	Mon, 14 Apr 2025 18:15:35 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OHq-000000033Sg-2eim;
	Mon, 14 Apr 2025 18:12:03 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u4OHk-000000003yA-45o4;
	Mon, 14 Apr 2025 18:11:57 +0000
Date: Mon, 14 Apr 2025 19:11:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Bo-Cun Chen <bc-bocun.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 2/5] net: ethernet: mtk_eth_soc: correct the max weight
 of the queue limit for 100Mbps
Message-ID: <1de9eee56354294f04abec64215c7c5d99cb325e.1744654076.git.daniel@makrotopia.org>
References: <08498e31e830cf0ee1ceb4fc1313d5c528a69150.1744654076.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08498e31e830cf0ee1ceb4fc1313d5c528a69150.1744654076.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_111202_670850_36AC6D39 
X-CRM114-Status: GOOD (  10.78  )
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

From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>

Without this patch, the maximum weight of the queue limit will be
incorrect when linked at 100Mbps due to an apparent typo.

Fixes: f63959c7eec31 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index fd643cc1b7dd2..6dff483d4e3aa 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -734,7 +734,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
 		case SPEED_100:
 			val |= MTK_QTX_SCH_MAX_RATE_EN |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
-			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3);
+			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3) |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
 			break;
 		case SPEED_1000:
@@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
 		case SPEED_100:
 			val |= MTK_QTX_SCH_MAX_RATE_EN |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
-			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
+			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
 			break;
 		case SPEED_1000:
-- 
2.49.0

