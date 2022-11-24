Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA09C43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 15:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c96Ul1/TL2U3SKdWaGX1MDNis5GBzk2e/zSXZs3N3TM=; b=XE3Em0y8eGgZrFb6LaF+4zNcDE
	LC4lPE1ErFjR+mggIi6U/foCxxBDD2hQjLoeYjvQ0loEXpNVZkpMOkZ/vOCQ6NageaX9Qb6e4AI3r
	6JJ93gUWZuCS+/o3PBb0hh2WyI6YTCM6d2L/qhWtNqI8V2a3kvgBSbu1J908Obep1UHbg829WW6Zh
	tr8ytkezHsJqjNm3D7SQe/hV693Hkh4KlSd+Gpjs8Z8lgI6G0M1HoCAhLKCYYlJkLBcSH+8a52Z7k
	P3x7APOGJsDwMRrbHENPSCibnwjtHvqTfduvbNVX7650Lg2RBAZsVmRL6kjaaqQqExcZvJ4vUcKCX
	+LVH2mTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4G-009ezj-MS; Thu, 24 Nov 2022 15:23:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4D-009ewx-6Q
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 15:23:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0E70AB8284E;
	Thu, 24 Nov 2022 15:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34022C433C1;
	Thu, 24 Nov 2022 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669303385;
	bh=gRYYTAEJr3fe2c9lFj3Q9D4ENhny0lOxwI/+OWY2074=;
	h=From:To:Cc:Subject:Date:From;
	b=G5P5s7hdRx9Adzn6NlYklNr5jJ+qnIe/FNwXbMRydzZssykK5oBLnoPcBnjU+3Jhq
	 B7eufUKVB8Lt1K5Ov5iEeFoj174Yw0fbnMo+VLqQe67AQBYjBj4RjPSXAchQMxtgMo
	 r8V0g6ZKs5zKYVpU6czQicLVqTlBQbwqdnKvY4Mb64DTSqndRWn3S0mR8+YzUby2ur
	 ShV0O98K1nS15xdTRHGwTrMnVAt8qQ8bl90utbVuVnuTxzl4K9tzPSgLoYcIUVC3GR
	 oCqMTL6tlzHrBND1mKCJkaUlyslOJ6SN0GdRm9PCMytk//Clj27cynLWMMD8V6m2VX
	 yZuv8cBIiEXSw==
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
Subject: [PATCH v2 net-next 0/5] refactor mtk_wed code to introduce SER support
Date: Thu, 24 Nov 2022 16:22:50 +0100
Message-Id: <cover.1669303154.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_072309_417018_47803BD3 
X-CRM114-Status: UNSURE (   7.93  )
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

Changes since v1:
- improve commit logs

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


