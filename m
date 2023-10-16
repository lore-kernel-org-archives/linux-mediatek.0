Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A77CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vSglymElyon5W2lwkOSo8ouNBcE5i5/LjW99Fm/FhWo=; b=F6TPO0hi5fx7vhV+io9FjsnnlI
	VZYZzRIu7QlWX3FGkS2tpJ5jp0nBfBB2jXOo685V/xOpuqskiOvUFYkD+5Qcg2d5F2/PJWMsU//N1
	f3/pUxpW1KDNa+OcckmAX+ZKSmIVriu4thfM8PYXQ8sO95kf5UHBsVRCzWWwXInXcQH9cnANxtuxy
	yGnl6PCRYuTfYbMkTJSeQApPmVTnPeUtJpLswzUbJ1OK+GukwvgpGalT7KowhbiHw99PLramU6uoI
	FdfF8RJmGbnF0IbokcLz/Ntp6KdU1opDMC8I3hDoqZGqWjiRXyajZY4LqmFoeQ2/RIriqivcLc4GC
	wgTrW/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJbg-008wDM-3C;
	Mon, 16 Oct 2023 09:09:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJbe-008wD0-06
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 09:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC8B960CF5;
	Mon, 16 Oct 2023 09:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309A1C433C8;
	Mon, 16 Oct 2023 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697447384;
	bh=AZTY/i+I4+tZzBoiN/FhUSGFC5oRh4WQ/neI1Uwcp9c=;
	h=From:To:Cc:Subject:Date:From;
	b=JU88PuwAtT4Mdf8qYNYChZixeKpOThnxanS5ENidkgDNiROWpC+nEhVxWgOI6Xzj1
	 SCOQ5PxCVvUCRenXkOyByssfOW6O1C3sV7o9yH+/w4C7k2pPz+JhqmcJ0OFNoum7yO
	 bE1KeOd3sKF4LGgK4rf1lFlxRS+YlLLKzb2Ep65aX5oY/MQLpX+q7PYqQRPCktiBWN
	 6bsyKCCDDGCx88CBybACNbsNO12JXiHhPzleK+3VFeue7rM3O3nj/I+i3gEoPwqzkD
	 SN2C7OJDj+lmDULcP+6cjwrwrlHJyqfDwBjBudMIlesVnq+fOKnfocRkuk/Iaq3ELn
	 OZNxSnTMAPzHg==
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
Subject: [PATCH v2 00/12] wifi: mt7996: add wed support
Date: Mon, 16 Oct 2023 11:03:33 +0200
Message-ID: <cover.1697445995.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_020946_130474_A9CB5296 
X-CRM114-Status: UNSURE (   7.65  )
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

Changes since v1:
- add wed reset support
- unmap rro buffer on module unload
- check ind reason to check if the rx buffer must be discarded

Bo Jiao (1):
  wifi: mt76: mt7996: add wed rx support

Lorenzo Bianconi (10):
  wifi: mt76: mmio: move mt76_mmio_wed_{init,release}_rx_buf in common
    code
  wifi: mt76: move mt76_mmio_wed_offload_{enable,disable} in common code
  wifi: mt76: move mt76_net_setup_tc in common code
  wifi: mt76: introduce mt76_queue_is_wed_tx_free utility routine
  wifi: mt76: introduce wed pointer in mt76_queue
  wifi: mt76: increase MT_QFLAG_WED_TYPE size
  wifi: mt76: dma: introduce __mt76_dma_queue_reset utility routine
  wifi: mt76: mt7996: use u16 for val field in mt7996_mcu_set_rro
    signature
  mt76: move wed reset common code in mt76 module
  mt76: mt7996: add wed reset support

Sujuan Chen (1):
  wifi: mt76: mt7996: add wed tx support

 drivers/net/wireless/mediatek/mt76/dma.c      | 246 +++++++++++-----
 drivers/net/wireless/mediatek/mt76/dma.h      |  52 ++++
 drivers/net/wireless/mediatek/mt76/mac80211.c |  19 +-
 drivers/net/wireless/mediatek/mt76/mmio.c     | 105 +++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     | 103 ++++++-
 .../net/wireless/mediatek/mt76/mt7603/dma.c   |   9 +-
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |   3 +-
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |   5 +-
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |   5 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  46 +--
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  16 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 116 +-------
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 276 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 204 ++++++++++++-
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 119 +++++++-
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  42 +++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   |  26 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |   2 +
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  | 245 ++++++++++++++--
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  69 ++++-
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  72 +++--
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  72 ++++-
 25 files changed, 1517 insertions(+), 345 deletions(-)

-- 
2.41.0


