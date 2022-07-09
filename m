Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B24C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jul 2022 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/q+kPv631Xey6G/TjLra7zpgQ0Db9Ij8YbwMnTAu/+E=; b=2amOM0WpyMRpG/5UBPbzlrgrMB
	fpLxD9SU8W0OFMz040JM5ERFCEZ9xygDAnfsRjcPj5RGrDDF//pllRLkx+QC596I5wkJENC7272TI
	rACKuihLddrh66w/4bt1nTzj/HN2095G27Qb3nP4OGpR7V/s8S+KKgQSqELJa+0eJ2/oCM16SrBhd
	lzEHvVxK/qcZp3WPfLuE4S0qVxb8xW+7ZaUljap+6Qf//gYKsHvZ7pm1HMZNqsEy8XP04XkNHb9KC
	9gsI7kTipqf/V+KNhQAHArVsL/IG3Y+uijEYiDPisEqGPUGEKirG6xVp7C0j1nnVmY/be/bzcvgC0
	aOqjmPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oACha-008Xbr-Hc; Sat, 09 Jul 2022 15:49:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAChX-008XaL-QM
	for linux-mediatek@lists.infradead.org; Sat, 09 Jul 2022 15:49:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5C3DBB81B84;
	Sat,  9 Jul 2022 15:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B95DC3411C;
	Sat,  9 Jul 2022 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657381736;
	bh=sqhl2+qpAkvEcbSeL7R8DIr884GD434thtHF8xdUfZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=IO8mbt/rGmWcs1q7/c3JhwDzl/A1Laif8i+N5ouhM2yFyCYQYBM9h5EMmVbkwEG08
	 hrs8lQXR/3/0woVigIdgtE2C9B/eHmxFzRQoG7baJ8qAv4+G+So5Qu7E3dnZo0BiI4
	 RcYx6cV0owGJE/AwV62czyQ0xonW79Llxb18008nhUcmn7j4OP4tmF2OaHQI7ueoAi
	 HHiGH2Fp+bDMz3fW6cYXEmMCoLSKqgJ8g/FQ1PA/KYmNvfUrLItFGgCrb/kAp4/X/q
	 KoyqrgXZu/tjB4U9flBF4dDUE4ycYA03PFEwqHGWVzddygQbabyBfymi6Yfm+yuPG3
	 N7wPhwG7JCjzQ==
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
Subject: [PATCH net-next 0/4] mtk_eth_soc: add xdp support
Date: Sat,  9 Jul 2022 17:48:28 +0200
Message-Id: <cover.1657381056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_084900_037230_B3D6F252 
X-CRM114-Status: UNSURE (   7.62  )
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

Lorenzo Bianconi (4):
  net: ethernet: mtk_eth_soc: rely on page_pool for single page buffers
  net: ethernet: mtk_eth_soc: add basic XDP support
  net: ethernet: mtk_eth_soc: introduce xdp ethtool counters
  net: ethernet: mtk_eth_soc: add xmit XDP support

 drivers/net/ethernet/mediatek/Kconfig       |   1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 546 +++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  34 +-
 3 files changed, 513 insertions(+), 68 deletions(-)

-- 
2.36.1


