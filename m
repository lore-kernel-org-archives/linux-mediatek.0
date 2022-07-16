Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33CBC43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WT8yiBow8o5KH51TR2mM+Cs4kXpTYVtING5hZlvCNls=; b=alGssWRLNH6HFpnmTInUx0PRN9
	V11TB9fLZSa35em5dNe+rwZnt8XlH9hXqATFd18CqhMgcKe3bXJCt+hdE69N1hQOdGQrVy769hqhy
	fQsl9+hDo9WwEVwsc3yEY9ZqQ9ZK+TzDL4yAuHK4Gz+v2zX/kIPANMoTUzyAaqp+0SI64nEb/9OsP
	eDJlX8BRZFToU24gUGHOicISpOJdsAFCGObWTmO5tzuTfHGocw4yfixoVsj7T0essz2AzzldNmB7/
	Wn7UqrDasL7VGMTcV0uIrBV5BImDkRyKDRGZF1mKkXlLeHE/O3BCmpTVywOY3gsts7Zd/QKn3by7/
	eZ3We3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcKB-00ESzw-C8; Sat, 16 Jul 2022 07:34:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcK9-00ESxN-DV
	for linux-mediatek@lists.infradead.org; Sat, 16 Jul 2022 07:34:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0669B82F34;
	Sat, 16 Jul 2022 07:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9C3C34114;
	Sat, 16 Jul 2022 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657956884;
	bh=aXcypMJ8Aw9aRI5gpgw0Ik52pfX90PV8mAPwawjM6Vo=;
	h=From:To:Cc:Subject:Date:From;
	b=scVCqwaB45yPcObm48WyqO30zp677bBvfG1a8Q2fdILkGJ8mRVcH5S5/8NCanxMMn
	 x5CimiOoA1na6j87VOTuEO4cFMcQDPVWuX5hz5M25gGog5x/B0SGx3rdfVMnjGdgFu
	 j3Wdx0RPvA2cCpIrM9D28C2N/aa7Ogd7X1PBlhxpkoktYn4XFKkIeI8+pXHpVrQB54
	 ok4Buy13OcbCv7w58zdOtxNQ7NqaoalrvlYeNfh0VCyYaSo7emAq00wA62p5UJqB5V
	 GvLoIwCIKn+S8ixzemKFxPcgWA+iMP/7qXl1I7NgZ1xLcnOsA+aZK6IitrBV3LGOWS
	 GSpjZUuWIObqg==
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
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH v3 net-next 0/5] mtk_eth_soc: add xdp support
Date: Sat, 16 Jul 2022 09:34:26 +0200
Message-Id: <cover.1657956652.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_003449_621858_2A8C9D75 
X-CRM114-Status: UNSURE (   9.20  )
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

Introduce XDP support for mtk_eth_soc driver if rx hwlro is not
enabled in the chipset (e.g. mt7986).
Supported XDP verdicts:
- XDP_PASS
- XDP_DROP
- XDP_REDIRECT
- XDP_TX
- ndo_xdp_xmit
Rely on page_pool allocator for single page buffers in order to keep
them dma mapped and add skb recycling support.

Changes since v2:
- fix leftover sparse warning
- add page_pool ethtool stats

Changes since v1:
- do not allocate mtk_xdp_stats array on the stack in mtk_rx_poll
- add rcu annotation to bpf program

Lorenzo Bianconi (5):
  net: ethernet: mtk_eth_soc: rely on page_pool for single page buffers
  net: ethernet: mtk_eth_soc: add basic XDP support
  net: ethernet: mtk_eth_soc: introduce xdp ethtool counters
  net: ethernet: mtk_eth_soc: add xmit XDP support
  net: ethernet: mtk_eth_soc: add support for page_pool_get_stats

 drivers/net/ethernet/mediatek/Kconfig       |   2 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 564 +++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  34 +-
 3 files changed, 529 insertions(+), 71 deletions(-)

-- 
2.36.1


