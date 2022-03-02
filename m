Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ADAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nnIcaqD8q2hmP4cCeuplMXFISnWpbCIeym6I86dtwoM=; b=0a5SJ6OnGpiq5i
	GEnLghH7dMpZenMWsVGl8T4LijklagzgFQHdp2Niv+0pX77IdWoXyD+2K0xYnOgp/kwFBMmVSx3Wm
	y9vtaUzHpOL0Q0BpEw7Zoyr4tFnlqTsArynuIj+Yt482EyY3nlwH4Gi3magmdUAqP5hmL8A9KejMN
	jvbxXwW5Ma2H+TMeBZa5AeB98TzMGIdH3ZSeatkP6n27CtndjqBz5OGjKgqKVHZe/hSsuFI6CycWg
	JUuuhou9zW2KMMm+4VnQ5GNpWa1JrJcEyjNGbSkbefB1LYaTV7gms4oQEVPgK2hpvJ5N+12RaMY2p
	J3xw44nRmqOwl8hROYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPRDL-003DZg-Rk; Wed, 02 Mar 2022 15:48:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPRDI-003DYZ-QZ
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 15:48:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CFC17CE21D5;
 Wed,  2 Mar 2022 15:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F38C340F5;
 Wed,  2 Mar 2022 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646236103;
 bh=bk491uNw6Qku/SW8n0xK17WRvkzi4HfmcwBQ9zlYy7w=;
 h=From:To:Cc:Subject:Date:From;
 b=q32lpFBFvS4l/igvOMcurf8Dw7MMiw0HfRS0yFWp25YcPyLHPzCWqUV8xOvBn1A5k
 AixujlnpQR6lBC1Z1K5nlDEwRy3vypao2g0ICvAHrxLfWdsLR891cTerF5yvgmvjy2
 q65y9lvv/EonTJlhPqmND+rlHfOGdrLtnTe7NE9CIQsJCPQoBbgaccPU7eNip2S2+8
 HiC6FXY+bTotgI/yky8jU0trMMo5ndxcGdqbEmDWGvWutCpc56HsHZZJYgyjy7OQCZ
 fszUcPMAAZAxeTets20NM7kYYYVMQIKeOExtZGp9W/cuXtrAwtMZLOcmQSIp0L2qII
 wmh3g/b5A4Ciw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 0/9] introduce mt7921u driver
Date: Wed,  2 Mar 2022 16:48:04 +0100
Message-Id: <cover.1646235785.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_074829_073201_F7332CE2 
X-CRM114-Status: UNSURE (   8.79  )
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
 .../net/wireless/mediatek/mt76/mt7615/usb.c   |  68 ++-
 .../net/wireless/mediatek/mt76/mt76x0/usb.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt76x2/usb.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/Kconfig |  11 +
 .../wireless/mediatek/mt76/mt7921/Makefile    |   2 +
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |   6 +
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  12 +-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  91 ++++
 .../net/wireless/mediatek/mt76/mt7921/mac.h   |   1 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   3 +-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  25 +-
 .../net/wireless/mediatek/mt76/mt7921/regs.h  |  36 +-
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |   6 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  |  83 ----
 .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/usb.c   | 397 ++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/usb.c      | 125 ++----
 18 files changed, 689 insertions(+), 195 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/usb.c

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
