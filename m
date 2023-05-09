Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4BDC77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 01:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zeqDFAMBKmoT/g81hl2hQIeucwKvcq8VOvv07+thxgU=; b=yCqxQSau6IbPiRwE7cfsEZTxnh
	bDutX1AFVKJ9tvW9tq553r/Erkvjkg0I4dU7S3VQdmm8TTW/w8anvFzFCj4L0sPCaxSFbzprMY1eb
	NeMTpRZrkTq9gMMElj3EKPBEJ5r+haYniRcN0ePybwGQBEcKJCmHvBMtsGCM31p6ipE6KL1PbHtTP
	6PMhLOUv7ccH/GG1qGtgdtxAu/sg4Qu1ZekQxqQk9m8MMuDPS4U41ecSDjJmDlRGGwI11oRqvJfr2
	0iNrpwaozI5hd+rvp8o/KTGUT/RvlaCrijRG3K/pHgkd+QgV0Of/kRu9bHxsXGhV2kiNuherwFS9K
	5eeFv7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwC3R-001yMX-0Y;
	Tue, 09 May 2023 01:22:13 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwC3O-001yKL-35;
	Tue, 09 May 2023 01:22:12 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwC3G-00022c-03;
	Tue, 09 May 2023 01:22:02 +0000
Date: Tue, 9 May 2023 03:20:06 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix NULL pointer dereference
Message-ID: <ZFmfxpsd8Fiqc7K_@pidgin.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_182211_011122_68C78504 
X-CRM114-Status: GOOD (  11.68  )
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

Check for NULL pointer to avoid kernel crashing in case of missing WO
firmware in case only a single WEDv2 device has been initialized, e.g. on
MT7981 which can connect just one wireless frontend.

Fixes: 86ce0d09e424 ("net: ethernet: mtk_eth_soc: use WO firmware for MT7981")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 4c205afbd230..985cff910f30 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -654,7 +654,7 @@ __mtk_wed_detach(struct mtk_wed_device *dev)
 					   BIT(hw->index), BIT(hw->index));
 	}
 
-	if (!hw_list[!hw->index]->wed_dev &&
+	if ((!hw_list[!hw->index] || !hw_list[!hw->index]->wed_dev) &&
 	    hw->eth->dma_dev != hw->eth->dev)
 		mtk_eth_set_dma_device(hw->eth, hw->eth->dev);
 
-- 
2.40.0


