Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF9DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/uJwCMGUcz2WggOcesKZXsszeXmQSyToJBZZ+KeGxHg=; b=CbEkGFMX/t3vdM
	X0nZSbN5qMMstziWYVTst4UVlZ8m5e4FF1bdfdPwRN3iDaoiRfB+gjzcbfqfxwdumz6rTnVelBdbX
	/qqkWtcoTk+YXKM+0j1qPEIzsmkCtPqddUAGDsg4C+GbOmpQrubvcOIjPn2iRmz/NgT/iY/4lL84H
	pYAsFDqEuTV3BzLA4FPLBe3F795cnZ/Ynpuivz9mjqiLzN/ILVKGazcqJFu2vxEEB+0fLO1AhxnE1
	x5yEvTnLleIAaxtZrTHr41pANDB5mXDNFcv+1+7BnYMfZH3jqCzehHag6GdrLEhUWieCCC40V85Kc
	TJXQWTvHhxInMOoKIzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTmLa-005mFW-7V; Mon, 14 Mar 2022 15:10:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTmLV-005mDi-VK
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 15:10:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3D7761281;
 Mon, 14 Mar 2022 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD82C340E9;
 Mon, 14 Mar 2022 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647270651;
 bh=7R/zaik3KG886DXjov4eTtkyArdUyZgzK5qTyMuQdpw=;
 h=From:To:Cc:Subject:Date:From;
 b=pxfBs0HyFTH5YJpaQoY/LZJPWeOh2XZuO8aluzNK/+JUeVvViRICehWVeusf/IY9B
 g7pZqupK2ZSeK4h4Bai7WHFF/iMhnRk9NUVYHumYKJ35qzMi3BN9DqmtJ+x2vDrunB
 ks41daNRpxko28AojdCCAyIyMFl8GLfgSk0sxGJNrhZ8khVQgRkZrLkCWzrdiKoawl
 SYd29BCFHZ0mTwNUPMaEVQcFzT9b68t6viZUkhVL5EHsDzmW4VTr9vTTUZH15l4mU5
 iOvFb3yXWbbZoT8rl4j2Sd20nLqCyiig16eFcYB/isZlnPjOqNn91AY5XR25nT4iSx
 SqZry4bhGK2pQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 0/9] introduce mt7921u driver
Date: Mon, 14 Mar 2022 16:10:22 +0100
Message-Id: <cover.1647270525.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_081054_183401_3B942D41 
X-CRM114-Status: UNSURE (   9.71  )
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

Changes since v4:
- Rebase on top of mt76 master

Changes since v3:
- Fix compilation error

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
