Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zgE9g3CMN4Vv8gzMxsM3Mt+vS+cLNfh5asjW6jzgjhg=; b=C1aiXwBwyVrYK1
	F3a1MwCn9Wlh6+VgI05itgGhotaxSqnstk29aUeJ0Li3XlP4nD3lovgt/ifFCFednRwYXhgwe+HE3
	WwCR6YHtv8HlvOaryLeY+y+OBRSVauFjwg8UPsAL5BrPmXGcb/an7zL5t0DwaGMFymR+g/jrjCSo4
	4IzNBgXHYEMAMnA/XzK0SU8THe5Krlxr3dZ1AkDoXg6kQMQiTRGj831x7Fx3Hpluy9gTBgYzaWJzO
	2xLe3xMHQ+DGRy/YIFXWI90fWucbNdB34yCzaJ9kgWfOOv2R6YtKrZRcVhjTTzP30BmB/7hr1OfjL
	i9CsSOjS37oPYmM0tNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTNf4-002mCf-JB; Sun, 13 Mar 2022 12:49:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTNf1-002mBg-Ec
 for linux-mediatek@lists.infradead.org; Sun, 13 Mar 2022 12:49:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43512B8009F;
 Sun, 13 Mar 2022 12:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80112C340E8;
 Sun, 13 Mar 2022 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647175759;
 bh=JXuGDn4nZcF36whCtPHWaQTYGuLhBuWoCCeGHtanIYs=;
 h=From:To:Cc:Subject:Date:From;
 b=ghb3b+GDUDfCFZ9bvoqLqceSlWtp4Hck/khGh2/ygZL11yZdzNwcZ3GPHFlgYhZQ5
 KgnKSR6Fq/Df7Th0KYM0oLJmWoKjzBYRnSmPdZSXKGMv01SJzd4eXBPRb6dsMemQZS
 rHSxAbNDy0TxX90x2YpvvuSx5BJmPKJzFV5adrxOlGcCaHTf//1VK0qbkUTQJcLcXx
 0p8XW4UeR9NZEXWDadoLRiMywYU30i1W08DDit0NgrmBjMXqxvTNsoLwwkck4RX34m
 IPDiLds7gfRxHu6mjkjCs0+YWKTSFp2ZC52Yc161t8meZlrt0LBAtawMgpOB/ovxa/
 Ymh+zKMp3+1PQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/9] introduce mt7921u driver
Date: Sun, 13 Mar 2022 13:48:50 +0100
Message-Id: <cover.1647175554.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_054923_680342_05C0B6C6 
X-CRM114-Status: UNSURE (   9.03  )
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

Changes since v2:
- implemented full reset support in mt7921u_mac_reset routine

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
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  36 ++-
 .../net/wireless/mediatek/mt76/mt7921/regs.h  |  50 ++-
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |   6 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  |  83 -----
 .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/usb.c   | 305 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/usb_mac.c   | 252 +++++++++++++++
 drivers/net/wireless/mediatek/mt76/usb.c      | 125 +++----
 19 files changed, 874 insertions(+), 195 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/usb.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/usb_mac.c

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
