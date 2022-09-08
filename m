Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEB8C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d2EUzV+G3uC3ePCWYbk593/JpZ+RvbGfmhip3I9rPIw=; b=rIYulJmIiIGSIVX3jo+8rL3oBu
	rq73/cuDqwkmMLmNgtZI1F1fW8lBgL9SF6SXOz8nkWDymK12s6bL4IBbAvHqPqve77PMWBkWu1W9U
	UMUsUXchZ8HCbXuNs4maAB8seksYJS0dIp1f36mjQczhkDk72l2+0f5IYSfVeaqohHvYNP1saEvhJ
	e32uTMZP+Q2ONa3Xf58GRFC8nZ/Kg0bxwUs0LhN7qAPtYSvujyhAirO1/HWWNH8SAXOEZN0U8g3SW
	5a4sbVCEvAVm2mJIQ6lRp511a+ghGLhI9rCChPR+8qbqxnhBD2ZSYVEX79bnzjy6fTpTvCqAb9eDo
	FbnrhWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWNIr-007gt9-Vh; Thu, 08 Sep 2022 19:35:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWNIp-007gqs-K4
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 19:35:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD46D61DE7;
	Thu,  8 Sep 2022 19:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDA1C433C1;
	Thu,  8 Sep 2022 19:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662665700;
	bh=BioAyTQYLotc4j+JLo7fzrrs4D6BavNTrHJbE7RcGyw=;
	h=From:To:Cc:Subject:Date:From;
	b=hLpkvCTxYqlA1cxFmtMeoA6e4w45k9DzrRjkemHJjM6RWcEvj5Way0YuuNC+KxT5j
	 +hG8ml6sfYiOpoeMieixXQk4/gaxjZgBbq+H2P6H0g6V5dl7d7xaQiOhrjwjqKV7Ln
	 TuQNPyjfhGEgWqgNNOu75unCe5XGLax51wmVQfym9ISCEKQjp3pcrhh958qBXKapjQ
	 dysQxCQFlYjzE0UB2v4G0hgJ0XxnLzKzV2xTg1HRFFCWII+sgkwPT8pKaUb+X3uPZR
	 kJCq5sxWmhlt4nGhI/B6yj8MtXkORoODBrRWRjEm/r/iJSaRwPt1NhRL5+VSfJcG5y
	 9saTY62Bb0JEQ==
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
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH net-next 00/12] Add WED support for MT7986 chipset
Date: Thu,  8 Sep 2022 21:33:34 +0200
Message-Id: <cover.1662661555.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_123507_738062_CD8C99D3 
X-CRM114-Status: GOOD (  10.28  )
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

Similar to MT7622, introduce Wireless Ethernet Dispatch (WED) support
for MT7986 chipset in order to offload to the hw packet engine traffic
received from LAN/WAN device to WLAN nic (MT7915E).

Lorenzo Bianconi (12):
  arm64: dts: mediatek: mt7986: add support for Wireless Ethernet
    Dispatch
  dt-bindings: net: mediatek: add WED binding for MT7986 eth driver
  net: ethernet: mtk_eth_soc: move gdma_to_ppe and ppe_base definitions
    in mtk register map
  net: ethernet: mtk_eth_soc: move ppe table hash offset to mtk_soc_data
    structure
  net: ethernet: mtk_eth_soc: add the capability to run multiple ppe
  net: ethernet: mtk_eth_soc: move wdma_base definitions in mtk register
    map
  net: ethernet: mtk_eth_soc: add foe_entry_size to mtk_eth_soc
  net: ethernet: mtk_eth_soc: add foe info in mtk_soc_data structure
  net: ethernet: mtk_eth_wed: add mtk_wed_configure_irq and
    mtk_wed_dma_{enable/disable}
  net: ethernet: mtk_eth_wed: add wed support for mt7986 chipset
  net: ethernet: mtk_eth_wed: add axi bus support
  net: ethernet: mtk_eth_soc: introduce flow offloading support for
    mt7986

 .../devicetree/bindings/net/mediatek,net.yaml |   9 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  20 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 184 ++++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  45 +-
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 271 ++++++----
 drivers/net/ethernet/mediatek/mtk_ppe.h       |  54 +-
 .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |  10 +-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |  62 ++-
 drivers/net/ethernet/mediatek/mtk_ppe_regs.h  |   8 +
 drivers/net/ethernet/mediatek/mtk_wed.c       | 473 ++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_wed.h       |   8 +-
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |   3 +
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  |  85 +++-
 include/linux/soc/mediatek/mtk_wed.h          |  15 +
 14 files changed, 955 insertions(+), 292 deletions(-)

-- 
2.37.3


