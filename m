Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2971C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3I7qIu0URYZb11lbf+H1Ipds2Erv5vxzGCDbkXQFHc4=; b=XASH/wm2fFEp1pZghMyqqUQ07/
	eApBpruk88eAf864VX6vh+Ufyhq430I9/nRcKF5tfNGGnuu4TiLxNQXuiQPEXmtctpR5P0umGWrsC
	OLB4DnkQ6LX47Rd09Mlepk5an+Rs/hVgv87gu4UAZlcgwKlWvMAZY0u6WsIKd0XGWf3XNGWtOA0lJ
	jWyFGd1VG93mtDnamS2PYhLULwrb5/zmCWzO60fng2aCE7kjT8YqZT6Y6iR/bX/a67uGsASNcNxov
	kfm/mFp5/Mwpdx6b/nk2wlA4lQAVMvSp6yJjEMOUF607QBaTYwhRTsB/6vhhtKaifrbGi5EWBrLGv
	WNwJSLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2ev-00BZU8-H8; Mon, 21 Nov 2022 09:00:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2es-00BZIh-VB
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 09:00:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D130BCE0F31;
	Mon, 21 Nov 2022 09:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9113C433D6;
	Mon, 21 Nov 2022 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669021200;
	bh=MVcO3ogxAd/KcHMWx684Sc9JzdpDv0NfQ0bb44ZRPKg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZZTwf31oNK+xdYrwCPNbeKvC0eaT9ZD3bbg9uBgWiLmXj+1GnJ6UTicTUo+WACi0D
	 +NCp73Tp9VxmOjYCxod0kZ8L1BxvD26X1qXALYTcUm3yoQ2mzym+4Y/y8CkCYkNJYL
	 jpSeAhIXDBhbpqVMtsic7vfa8q7N/v2kPYvS7keMNaKnF/OnJ1gwIMQi9tM2O6ynjY
	 T3C3vrPArSuVP+hBXnV4VJQazW+1yPBen9qB+X/2Qw9qqcf3+3iFTlNC5DKXKZfmOZ
	 ft1J81CS+HSv9nO2SYRFoem+k/iKgf/wTRawP3iPWvWqhPndevcT2dYY/6KQa3CpPV
	 qPaWPDGwNxWGA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 0/5] refactor mtk_wed code to introduce SER support
Date: Mon, 21 Nov 2022 09:59:20 +0100
Message-Id: <cover.1669020847.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_010007_214653_B384F040 
X-CRM114-Status: UNSURE (   7.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Refactor mtk_wed support in order to introduce proper integration for hw reset
between mtk_eth_soc/mtk_wed and mt76 drivers.

Lorenzo Bianconi (5):
  net: ethernet: mtk_wed: return status value in mtk_wdma_rx_reset
  net: ethernet: mtk_wed: move MTK_WDMA_RESET_IDX_TX configuration in
    mtk_wdma_tx_reset
  net: ethernet: mtk_wed: update mtk_wed_stop
  net: ethernet: mtk_wed: add mtk_wed_rx_reset routine
  net: ethernet: mtk_wed: add reset to tx_ring_setup callback

 drivers/net/ethernet/mediatek/mtk_wed.c      | 279 ++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_wed_regs.h |   9 +
 drivers/net/wireless/mediatek/mt76/dma.c     |   2 +-
 include/linux/soc/mediatek/mtk_wed.h         |  12 +-
 4 files changed, 220 insertions(+), 82 deletions(-)

-- 
2.38.1


