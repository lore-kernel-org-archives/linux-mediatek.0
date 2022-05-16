Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E77FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JNftjLzFYpRBXmh2h8DhGWCPgmt6j49TVh+w2Exprcc=; b=ImgjouxEf8mcWm
	1QqhhYfgTtIPAAxfheiB5bms8NLhjNrBo2v25njfreKQkK5tKExME6Fo6KRK8g4Tza1vyQhMYKMRZ
	HQ7guKS6XA49MRKq3QvwRaXtiQGaeOcW3lhzEBfALf8XLz4fQ+I8n+7aNygVtzMav22zmHNZWZ5Bu
	ez2gw0K3JaVMCAZjTppRCtWVEZo3A+QfxmD9KK/bSnnq1QugQ4LzXrleue5cNhV8zNOo6mPbF48Ho
	ZKMD/KVvHuDgmN5WRzG/M3r0grWJs3w5UHKar1Oc4kD9pffJGWsuzlX9++9L0CTtV4r6OxIKzU0wn
	T87U79EBupcxxkyF9Zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdG4-008rAb-13; Mon, 16 May 2022 16:07:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdG0-008r8P-MM
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:07:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8608B8124F;
 Mon, 16 May 2022 16:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9870CC385AA;
 Mon, 16 May 2022 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717257;
 bh=XOhhReOwl1Pta9qaV5a9VKBGR6h1O872iZhq1RArjgw=;
 h=From:To:Cc:Subject:Date:From;
 b=Z9w9vAvjqf6xTrUJzIy0ZmAp6aN/Ic2InydiMkWR/4TD/jbtEUV0S82Dteq1LiEFy
 Nx1TlzUXrGsFzDdgql3otFWH8E6BWCqzWIDebJU2WdJYNpSdv7I/hV81x8xLlcKpeK
 mKTFjhbEl2xsQMBWKzvn86RSrhqWyklyDSvWeatFt9Jk487L+urKUD4MuLwWW5X03q
 Gi4ObBCpeXGcNwk9J73OuUl8xC2mm7m+8geDFqRmq6vjx/qeT8zhpH+qCcTWrvphl3
 c4Pw5A6RzWEfIIVgx093C9yiRX2uu7AIdYKu9iVFk3DdbaLfIrVdONtAh8oT5LVCbr
 Z5zFQEt0dihHg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 00/15] introduce mt7986 ethernet support
Date: Mon, 16 May 2022 18:06:27 +0200
Message-Id: <cover.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090740_912730_73ED807C 
X-CRM114-Status: UNSURE (   7.45  )
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

Add support for mt7986-eth driver available on mt7986 soc.

Changes since v1:
- drop SRAM option
- convert ring->dma to void
- convert scratch_ring to void
- enable port4
- fix irq dts bindings
- drop gmac1 support from mt7986a-rfb dts for the moment

Lorenzo Bianconi (15):
  arm64: dts: mediatek: mt7986: introduce ethernet nodes
  dt-bindings: net: mediatek,net: add mt7986-eth binding
  net: ethernet: mtk_eth_soc: move tx dma desc configuration in
    mtk_tx_set_dma_desc
  net: ethernet: mtk_eth_soc: add txd_size to mtk_soc_data
  net: ethernet: mtk_eth_soc: rely on txd_size in
    mtk_tx_alloc/mtk_tx_clean
  net: ethernet: mtk_eth_soc: rely on txd_size in mtk_desc_to_tx_buf
  net: ethernet: mtk_eth_soc: rely on txd_size in txd_to_idx
  net: ethernet: mtk_eth_soc: add rxd_size to mtk_soc_data
  net: ethernet: mtk_eth_soc: rely on txd_size field in
    mtk_poll_tx/mtk_poll_rx
  net: ethernet: mtk_eth_soc: rely on rxd_size field in
    mtk_rx_alloc/mtk_rx_clean
  net: ethernet: mtk_eth_soc: introduce device register map
  net: ethernet: mtk_eth_soc: introduce MTK_NETSYS_V2 support
  net: ethernet: mtk_eth_soc: convert ring dma pointer to void
  net: ethernet: mtk_eth_soc: convert scratch_ring pointer to void
  net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset

 .../devicetree/bindings/net/mediatek,net.yaml | 141 +++-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |  74 ++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  39 ++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  70 ++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 630 +++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 328 +++++++--
 6 files changed, 1037 insertions(+), 245 deletions(-)

-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
