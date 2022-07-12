Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3nLD248E1JKtjZeqvBx+2yULyee6dM0K0FCO2T7zFA=; b=bGxOSMVLpNcssyXy+jpVfK2wlF
	AbR6c8XFdTNspEDyapNiazgtedieU0bE89ejBg9cs4Og5lXcg1Vh22ydETyKMJuLakDEs9tGZqNe+
	5rrzReGSnraGg2tsCK44PLgKY65xtBPnPVPI9obQiEof7J8s6TfU3Zd0Pg7vpR9FDs//DdnwOGxj/
	JOGVm08LH4tmYZ6KU2gsQMy1UM22y6Zz5N4V5PUfHgPsTXP+w6Sw3J0S1KokIfBQfigZc+fKK0nFb
	SO1SHjMU+ughvfCRvwqL/5YoU8WvLZ8fc5k+JiNVMjRgxD98L1FoobjEs3qM/qehz6UrxBR3MIIrQ
	sIVmiURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBNFD-00Es29-G9; Tue, 12 Jul 2022 21:16:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBNFA-00ErtR-7k
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 21:16:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76BB7B81BE7;
	Tue, 12 Jul 2022 21:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF18C3411C;
	Tue, 12 Jul 2022 21:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657660589;
	bh=AbUcC72Ah9hQ2GlOEd5+kOaYu7/y5h2BxO/b/U1a5nA=;
	h=From:To:Cc:Subject:Date:From;
	b=CkDgr5I6RaJVvfkDnqlsYIh9e1yynkfROfTMvZIX9p9yghbCp+f4LgqHR9lxQGPKE
	 uEknR9NgRn5hHc3vusoma34k8KNx4lAZggBSAZH97WWINDz5+sl23cyEaJfxeiRks6
	 p2C/ik9+9jG0uIYTSnFMoZlX5N+QafGeHuxLJZX7EQTyPb0GZdYR0dFQaaSOVZWlhD
	 n+zSkKbZx5M/kW1dRLkxFYl7sis7yB6SX9hRI+qBWLt2Chy9t/YBC1HQ94JIlLW5i5
	 UfqkWaA7V+SyeheYxfbxtlbn1SD8B+MwewPfNvLdasfT9DJxGOPAOq84SoBz1pjznL
	 AzLOFrBndAkdQ==
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
Subject: [PATCH v2 net-next 0/4] mtk_eth_soc: add xdp support
Date: Tue, 12 Jul 2022 23:16:13 +0200
Message-Id: <cover.1657660277.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_141632_451216_9D76C714 
X-CRM114-Status: UNSURE (   9.57  )
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
- do not allocate mtk_xdp_stats array on the stack in mtk_rx_poll
- add rcu annotation to bpf program

Lorenzo Bianconi (4):
  net: ethernet: mtk_eth_soc: rely on page_pool for single page buffers
  net: ethernet: mtk_eth_soc: add basic XDP support
  net: ethernet: mtk_eth_soc: introduce xdp ethtool counters
  net: ethernet: mtk_eth_soc: add xmit XDP support

 drivers/net/ethernet/mediatek/Kconfig       |   1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 524 +++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  34 +-
 3 files changed, 491 insertions(+), 68 deletions(-)

-- 
2.36.1


