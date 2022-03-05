Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 06:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gGgqUJbPXdQOHZylubwKn27SFoyPNSjfA4uwS6wAtA=; b=ZurHpBomRmBpMG
	DWSkjFKBj731rAhFcRaUFcbpUf/XDgidOHuyyCmfDC0Nl089fuKNvDDiznUtGgxOCQgWR/mNaaIsU
	RpOTCI/KXgdVf5FwQI/I5hAXj8npDqTNpIKZhMwoewRo+xPWfsXA7cPqX0ohoyqvA9Kjf4nVQ9H+T
	Tr406smFkkuw6HlcwANTrDVVfGbyK8TpKktDE13tGlOH5IFjY4F6JdScI6IlqwvGxwpMscKj3yw8K
	2g492T+eXyo+dV3dCbfsgS12afdsRggzma3vbSj4HEBRuMquihJlXNQX9CZFyRXtSogDDYQ9QTVHZ
	l1452UYh37EdpjtX6xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQNjF-00CqQ6-Fv; Sat, 05 Mar 2022 06:17:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQNjB-00CqPX-0p
 for linux-mediatek@lists.infradead.org; Sat, 05 Mar 2022 06:17:20 +0000
X-UUID: a8efa6f88a054319924c41a5b5779fb3-20220304
X-UUID: a8efa6f88a054319924c41a5b5779fb3-20220304
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1552065798; Fri, 04 Mar 2022 23:17:11 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 22:17:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Mar 2022 14:17:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Mar 2022 14:17:08 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <Deren.Wu@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 0/9] introduce mt7921u driver
Date: Sat, 5 Mar 2022 14:17:07 +0800
Message-ID: <1646461027-5374-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1646235785.git.lorenzo@kernel.org>
References: <cover.1646235785.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_221717_099378_A317406E 
X-CRM114-Status: GOOD (  10.30  )
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

From: Sean Wang <sean.wang@mediatek.com>

>Introduce support for MT7921U 802.11ax 2x2:2SS wireless devices.
>

Tested the whole series with sta and monitor mode and it is working well.

Tested-by: Sean Wang <sean.wang@mediatek.com>

>Lorenzo Bianconi (9):
>  mt76: usb: add req_type to ___mt76u_rr signature
>  mt76: usb: add req_type to ___mt76u_wr signature
>  mt76: usb: introduce __mt76u_init utility routine
>  mt76: mt7921: disable runtime pm for usb
>  mt76: mt7921: update mt7921_skb_add_usb_sdio_hdr to support usb
>  mt76: mt7921: move mt7921_usb_sdio_tx_prepare_skb in common mac code
>  mt76: mt7921: move mt7921_usb_sdio_tx_complete_skb in common mac code.
>  mt76: mt7921: move mt7921_usb_sdio_tx_status_data in mac common code.
>  mt76: mt7921: add mt7921u driver
>
> drivers/net/wireless/mediatek/mt76/mt76.h     |  12 +-
> .../net/wireless/mediatek/mt76/mt7615/usb.c   |  68 ++-
> .../net/wireless/mediatek/mt76/mt76x0/usb.c   |   2 +-
> .../net/wireless/mediatek/mt76/mt76x2/usb.c   |   2 +-
> .../net/wireless/mediatek/mt76/mt7921/Kconfig |  11 +
> .../wireless/mediatek/mt76/mt7921/Makefile    |   2 +
> .../wireless/mediatek/mt76/mt7921/debugfs.c   |   6 +
> .../net/wireless/mediatek/mt76/mt7921/init.c  |  12 +-
> .../net/wireless/mediatek/mt76/mt7921/mac.c   |  91 ++++
> .../net/wireless/mediatek/mt76/mt7921/mac.h   |   1 +
> .../net/wireless/mediatek/mt76/mt7921/main.c  |   3 +-
> .../wireless/mediatek/mt76/mt7921/mt7921.h    |  25 +-
> .../net/wireless/mediatek/mt76/mt7921/regs.h  |  36 +-
> .../net/wireless/mediatek/mt76/mt7921/sdio.c  |   6 +-
> .../wireless/mediatek/mt76/mt7921/sdio_mac.c  |  83 ----
> .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  |   2 +-
> .../net/wireless/mediatek/mt76/mt7921/usb.c   | 397 ++++++++++++++++++
> drivers/net/wireless/mediatek/mt76/usb.c      | 125 ++----
> 18 files changed, 689 insertions(+), 195 deletions(-)  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/usb.c
>
>--
>2.35.1
>
>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
