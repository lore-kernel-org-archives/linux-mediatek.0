Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11376C00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 00:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lm1AQw3YFZZlPESa4lMip8VKuSZLiDNwaOiCz0WcwXc=; b=nl0pgeEuSOSaexhNSNgyUNJmdE
	Sf+ruOGyccOnPoTyHUh69l16bIegjZSfFR+KmwAvnF4RivXs2bbp/ffr6auCVpRt3AJ1F7MIBPK0m
	ZO4MJU8dxEkRMgUdoz/C99uB2hxC+/9Y9/T2/fyxcRBTQKC6KjwcfsK3ALXrCNuAY73g20o9uinLP
	1TjFQWm6Mz2EjNWLjh5zgq21r/jZkbVB/ed9A+Wjn48J6tjWzKs5WSsoE8rxCi+cc4x7RHyNAyAlY
	fnp+xSwH7WyEnYfuQ3qPonLe4nynmWCF12VSTpTewEyg7hNG4n57yGSg4GIoTNX1aFddfR2gjoK/b
	YmRNWImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNkgi-008Bxh-3F; Tue, 16 Aug 2022 00:44:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNkgf-008Bu2-11
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 00:44:06 +0000
X-UUID: e3fa7f5ccd214c109b823bd7c6277207-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Lm1AQw3YFZZlPESa4lMip8VKuSZLiDNwaOiCz0WcwXc=;
	b=VSMCgO+btMY61zeH/VpbLm4auohuvGrujdCKitxz9eO3x+Nshw6ofTbjExF22agvHe0G/t4KUxbUj0gMgJ3zRmfp7N9mi1oiG+oGlt1AFa+p6d8QOF2am5ghGRC+fRbRpaUVSBfVh+zNV2fdaXc2yJX3UEWnVfjXBhAF8He8BaU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:19b5fd51-e6b1-4ca6-9e20-850aeb53024a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:6dfabe9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e3fa7f5ccd214c109b823bd7c6277207-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 51267039; Mon, 15 Aug 2022 17:43:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 08:03:53 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 08:03:53 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Sean
 Wang <objelf@gmail.com>
Subject: [PATCH 0/9] wifi: mt76: mt7921: introduce chanctx support
Date: Tue, 16 Aug 2022 08:03:38 +0800
Message-ID: <cover.1660606893.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_174405_283244_D38179A4 
X-CRM114-Status: GOOD (  13.22  )
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

From: Sean Wang <objelf@gmail.com>

The patchset introduces chanctx support to enable the capability
on the newer firmware to manage the channel context scheduling on multiple 
roles running on the device including Station, AP, and P2P GC/GO mode
(will be extended based on the patchset in the future) to help users share
the network with others on a single device.
 
The things to be noted is that
1) The newer firmware is able to support the channel chanctx up to 2
interfaces simultaneously running on the different channels.

2) Before the driver is going sent out the management frames, the driver
has to get the privilege from the firmware to acquire the current channel
context for the frame until the frame handshake is completed and then get
the privilege back to the firmware.

3) The patchset has to rely on
("mt76: mt7921: fix the firmware version report")
("mt76: mt7921: add mt7921_mutex_acquire at mt7921_[start, stop]_ap")

Quan Zhou (1):
  wifi: mt76: mt7921: add unified ROC cmd/event support

Sean Wang (8):
  wifi: mac80211: allow enabling chanctx until hw registration
  wifi: mt76: connac: add mt76_connac_mcu_uni_set_chctx
  wifi: mt76: connac: rely on mt76_connac_mcu_uni_set_chctx
  wifi: mt76: mt7921: add chanctx parameter to
    mt76_connac_mcu_uni_add_bss signature
  wifi: mt76: mt7921: drop ieee80211_[start, stop]_queues in driver
  wifi: mt76: connac: accept hw scan request at a time
  wifi: mt76: mt7921: introduce remain_on_channel support
  wifi: mt76: mt7921: introduce chanctx support

 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |   2 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 152 ++++++------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  16 +-
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  74 +++++-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 225 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 151 +++++++++++-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  54 +++++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  13 +-
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  11 +-
 .../net/wireless/mediatek/mt76/mt7921/usb.c   |   1 +
 net/mac80211/main.c                           |   8 +
 12 files changed, 620 insertions(+), 89 deletions(-)

-- 
2.25.1


