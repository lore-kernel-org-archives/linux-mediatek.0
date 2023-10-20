Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F146CDB474
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=phX7zoNmQ4vjkVmy9mNoa9A7qxze2JuzGhv7Ze0dzzs=; b=SnIHPcmXe3w+3QrB+2J6AeA/iX
	J7KV9BPYJsg4Y4h1OfJMK+lN8BUFSDgNEQwo1aISOt4wbHNqxR72ZJQBWlqtQy0pcGEx+49noD4eQ
	dctp6WRe1ymH5lYpI/Rj7OlGxTO8JsP4KbOB9e9HnubGfIUYasQ9naBoFHJrA/+M7jZMZ2pPxIwi4
	HxkDQtQfXwELVj05QUvIv16OGYiBNLVVpxdk5RAlgdpyhE+PYst18DSUu1FYlC/4evVUljhIG7IKh
	F3h1UOwGoqaoFdwdSnP3aSWMcI5Avd/A3Vobp9K79zCm6UguLqiyaR7yNAMUFEYH5yG18t2csPUop
	ZbwfMETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmmr-001mLT-1d;
	Fri, 20 Oct 2023 10:31:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmmp-001mKk-0f
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 10:31:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3821EB83052;
	Fri, 20 Oct 2023 10:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4398DC433C8;
	Fri, 20 Oct 2023 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697797880;
	bh=QG0eqApJv057ZhUcrZWheMwZD0XE0lTlkrDwaucJpqk=;
	h=From:To:Cc:Subject:Date:From;
	b=doOaSRLpZMJzggL6jVoa8LczUhdPDxKgghOhWEAAEQ6N9cIx+6JPLuagVPdgniFDf
	 Mv2ROcU+avVJQyrW+SFw2zv7hT7Y+XWH9iR6QHi1SE1flpQsiMcjDXuEaEVxTepaAY
	 v195HEop5kBSf6Y6JpZaOLZn2IDmMmoEtLwTkLQ8tKlwMQIjXaa6rMzDO9P3OHNBOm
	 p3v/MyaPS3N/B2IM0jLnEnUSCe47WBtAKQbC8E0gJx36AcfPkvGqMwB+Q5dMCFROsn
	 9Ap2HGu2T8x+zGMVfKjwqK5ApijAfdpy1RZesDg+LYDDKnIYciTmWh11nrXUu55+Bl
	 oh2UJC1WjV95A==
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
Subject: [PATCH v3 00/13] wifi: mt7996: add wed support
Date: Fri, 20 Oct 2023 12:30:47 +0200
Message-ID: <cover.1697797422.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_033123_532754_C84CE0D4 
X-CRM114-Status: UNSURE (   8.84  )
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

Changes since v2:
- fix compilation errors if wed is not enabled
- add RRO garbage collector patch to the series

Changes since v1:
- add wed reset support
- unmap rro buffer on module unload
- check ind reason to check if the rx buffer must be discarded

Bo Jiao (1):
  wifi: mt76: mt7996: add wed rx support

Lorenzo Bianconi (11):
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
  wifi: mt76: mt7996: add wed rro delete session garbage collector

Sujuan Chen (1):
  wifi: mt76: mt7996: add wed tx support

 drivers/net/wireless/mediatek/mt76/dma.c      | 246 +++++++++++-----
 drivers/net/wireless/mediatek/mt76/dma.h      |  52 ++++
 drivers/net/wireless/mediatek/mt76/mac80211.c |  19 +-
 drivers/net/wireless/mediatek/mt76/mmio.c     | 105 +++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  96 +++++-
 .../net/wireless/mediatek/mt76/mt7603/dma.c   |   9 +-
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |   3 +-
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |   5 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   1 +
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |   5 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  46 +--
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  16 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 116 +-------
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 276 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 256 +++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 122 +++++++-
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  42 +++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 115 +++++++-
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  37 +++
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  | 245 ++++++++++++++--
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  79 ++++-
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  61 ++--
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  78 ++++-
 26 files changed, 1695 insertions(+), 345 deletions(-)

-- 
2.41.0


