Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509B6E70713
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiDnZtY6cwV361LcZ7m+N5mtgP8eBTPgg9luo5U0MI0=; b=qkOVs2DktD3EE0d1DjBOiLBAJE
	jtiLqSC/K92bP02v58+J/PZmTZ1P0nwMDPeo4GDeg5UIV/PNSlN7g2jiLWuMKIEBEO4HURQSAi92E
	zO4W2IQpKt/rhiZIlA8vdvbhwYqwzFT9tVWL2fvEBrs5Bd5ajPcjBiLN51eDCACKv4LeezfjcMZng
	ipkEwHvQ85lSSXszf33Hzg4G+kb/3yYYbi0YKXKEQUeZ0ttbGVv16IR4Pib1QW4rrF6ruUOXNaH2v
	lJ+9YbpxsYK7zZ27q6zbDUK09DlPsZq9XjWyl64PlbBx2N84LO2VE4Sla7U4tOfmeoo0mXA0VQgG1
	aQ4xP8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjH9y-005qbN-1C;
	Thu, 21 Sep 2023 10:43:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjH9v-005qav-2q
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 10:43:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 27F3EB81FF8;
	Thu, 21 Sep 2023 10:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76470C3279B;
	Thu, 21 Sep 2023 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695293024;
	bh=CafFfhS++g5ES5lGvZKA5DFr08N/n5bxoMaqXT+Ze0A=;
	h=From:To:Cc:Subject:Date:From;
	b=QG8EUP1NJZ8AGMWliG2Piz983BGGzHDm4dPrrbrDR/fcxSWyE9hLkyT7qLrTiZy9x
	 v/WaPgbnnr2a+XBHZatdusD+tVzxid1n98hGRqt6k9lXRVCu3aYvXETHarpPX5pf0x
	 diEY7agkkmsVKXPolMT7bY9aDlYMg35rpCsm9htJQwVOmdBxkPwXXJ6wxtxj69++2t
	 7jNgVSB9XTrby+svUpdrrlstFUnl+TCeQ0SbZWderZAz9gA0+A3jrGT4mjTP7lY0pr
	 yVnboGYYZaRUEEe96Iwlm1ApF4KiAJkP4e4dPXChf7p94+8d6AklZa99Aa/U8om59D
	 MtAhGCPKtWKCg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/9] wifi: mt7996: add wed support
Date: Thu, 21 Sep 2023 12:43:29 +0200
Message-ID: <cover.1695292502.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_034348_082588_A2C8EB77 
X-CRM114-Status: UNSURE (   7.85  )
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

Similar to MT7915, introduce Wireless Ethernet Dispatcher (WED)
support for MT7996 driver to offload transmitted/received traffic.

Bo Jiao (1):
  wifi: mt76: mt7996: add wed rx support

Lorenzo Bianconi (7):
  wifi: mt76: mmio: move mt76_mmio_wed_{init,release}_rx_buf in common
    code
  wifi: mt76: move mt76_mmio_wed_offload_{enable,disable} in common code
  wifi: mt76: move mt76_net_setup_tc in common code
  wifi: mt76: introduce mt76_queue_is_wed_tx_free utility routine
  wifi: mt76: introduce wed pointer in mt76_queue
  wifi: mt76: increase MT_QFLAG_WED_TYPE size
  wifi: mt76: dma: introduce __mt76_dma_queue_reset utility routine

Sujuan Chen (1):
  wifi: mt76: mt7996: add wed tx support

 drivers/net/wireless/mediatek/mt76/dma.c      | 219 ++++++++++-----
 drivers/net/wireless/mediatek/mt76/dma.h      |  12 +
 drivers/net/wireless/mediatek/mt76/mac80211.c |  19 +-
 drivers/net/wireless/mediatek/mt76/mmio.c     |  97 +++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     | 102 ++++++-
 .../net/wireless/mediatek/mt76/mt7603/dma.c   |   9 +-
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |   3 +-
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |   5 +-
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |   5 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  18 +-
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  16 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 107 +-------
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 258 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 156 ++++++++++-
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  72 ++++-
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  42 +++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   |  13 +-
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  | 208 ++++++++++++--
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  67 ++++-
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  72 +++--
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  65 ++++-
 24 files changed, 1276 insertions(+), 299 deletions(-)

-- 
2.41.0


