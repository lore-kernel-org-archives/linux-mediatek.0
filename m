Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B086C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQKAnr/pQ8rnle+jk72xtEvIX6/xdjlirzKoVDpJxjA=; b=lBJtaWNZvRIMNI
	MTcIvLdIW0YZSlYsKMaIzqffiQ9ixgEDrwjwBGRjq00f+qHh90gyolB4e5YrXT7e1asVxwffyCB/Q
	QrYY57190K46gFgj81OAv49xb8WxxIGcyNaCpILbK3uzUoEMaetQYuG5nc9kPqHQJ/D71hD59DtT5
	NptVaQdfwT5mmp7KMPt6WGmSkux7S0yfx8nSo2E7KbhZRHqCMWjwFUR/C5JZOYuLaY5hlmN6AcG9V
	khtlEBxgCpjfWDWeIRSEdZ/ga3guz7JUxJt4Xwp73WL8DavAr1c3plpyFlMEuX64Og92uBIohx42y
	CuqgyHVqWIz+FZ22tigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQWUe-00DTT4-NR; Sat, 05 Mar 2022 15:38:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQWUZ-00DTSE-S5
 for linux-mediatek@lists.infradead.org; Sat, 05 Mar 2022 15:38:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17089B80AF6;
 Sat,  5 Mar 2022 15:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A070C004E1;
 Sat,  5 Mar 2022 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646494723;
 bh=zxvHvr27s0mGN1RkZiqCVZJvjw0t85N6ds69F5b781A=;
 h=From:To:Cc:Subject:Date:From;
 b=iN4nFl3fetdvAK6cdPAC/4tBC31SsH5HdXHwfVr7xsbAvQ0ncP4FrZnG0QjP+dKXs
 xL5Rj+q2v86I4S73oE77VS+N1MyH/kvR58t+FMi6I29vyoK0xFVOnGlzlb5IJ6DY+E
 w9rfkqI9KE20rfLsSBBHsFatnZIqSmRlrUESFU2UWTUhAd49jxwcnsxWk0xbNktylE
 62jAu31KCEgneMJxRjJUNLeyuhj07XHTxeqvx1xdNaTvT/on0Q/olN9hfXVtKpSxA4
 i+VSp4Ca01LP8fgmv8tkb2x1jHsvfEltTML9tQkuRtyaT+CdAbcf2uptyML/LLNWDm
 fQUc2i4JAN11w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/9] introduce mt7921u driver
Date: Sat,  5 Mar 2022 16:38:10 +0100
Message-Id: <cover.1646494452.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_073848_114433_188A541A 
X-CRM114-Status: UNSURE (   9.64  )
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

Introduce support for MT7921U 802.11ax 2x2:2SS wireless devices.

Changes since v1:
- implement wfsys reset support
- fixed power on procedure
- fixed module unload

Lorenzo Bianconi (9):
  mt76: usb: add req_type to ___mt76u_rr signature
  mt76: usb: add req_type to ___mt76u_wr signature
  mt76: usb: introduce __mt76u_init utility routine
  mt76: mt7921: disable runtime pm for usb
  mt76: mt7921: update mt7921_skb_add_usb_sdio_hdr to support usb
  mt76: mt7921: move mt7921_usb_sdio_tx_prepare_skb in common mac code
  mt76: mt7921: move mt7921_usb_sdio_tx_complete_skb in common mac code.
  mt76: mt7921: move mt7921_usb_sdio_tx_status_data in mac common code.
  mt76: mt7921: add mt7921u driver

 drivers/net/wireless/mediatek/mt76/mt76.h     |  12 +-
 .../net/wireless/mediatek/mt76/mt7615/usb.c   |  68 +++-
 .../net/wireless/mediatek/mt76/mt76x0/usb.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt76x2/usb.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/Kconfig |  11 +
 .../wireless/mediatek/mt76/mt7921/Makefile    |   2 +
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |   6 +
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  12 +-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  91 ++++++
 .../net/wireless/mediatek/mt76/mt7921/mac.h   |   1 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   3 +-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  34 +-
 .../net/wireless/mediatek/mt76/mt7921/regs.h  |  50 ++-
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |   6 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  |  83 -----
 .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/usb.c   | 304 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/usb_mac.c   | 195 +++++++++++
 drivers/net/wireless/mediatek/mt76/usb.c      | 125 +++----
 19 files changed, 814 insertions(+), 195 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/usb.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/usb_mac.c

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
