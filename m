Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75925ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlsAKWFXZ/9dbRG3H7ebgrS+7UFooxS66lZl8/6LpO4=; b=hAFI2+YzobwD1m7QHTR47RCYy5
	KdTZNnUZZ/pWkSMKmmrf3bmxYFnZmLN44hf78vpD/+gdyhW/4RstQRZD4GRn8Y2fjLVjnwaUnrDcV
	v8DqpQNeb/cAOq8CqDhfUth7c3/iTYi7bH0CFIYMc3IyFIVFvw1a4Qkq1xaedzf2YAAQkhN1FEv7K
	a5geABq9MRs3dYTE/68fC4Zgw53iGybE+CDwc+W0lVwJVXcQxmBMj9Lcqm2poutVu3oh7fr+OC6nC
	5nIoUabwFBujn2Z9qABEjJjU5y/f7YCzix8k8yQ2FK989FzFrkRBtmv0bELP2ZGQLY3NXFcThCl9y
	s5ZXgi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opY9g-00D9a4-Fb; Mon, 31 Oct 2022 17:00:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opY9d-00D9ZB-KE
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 17:00:55 +0000
X-UUID: d6bd184d4db54bd2819158c6cd6fd29b-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hlsAKWFXZ/9dbRG3H7ebgrS+7UFooxS66lZl8/6LpO4=;
	b=VxMMie01g/Yz9WofY3vRp+K2jCgTo7uTmqIli+D46kh3aScs0keuGbf1eyiq7qHqt8KZW/bfjz9MhwiOFqGKAhtmEKclt0+sobSVPOGoLz1+ncKMjPmOPrcEcVcGt4q9V7B8Wnl6AtlNgErrDbuIqRaGQIH991koNZIpHNnxwSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:13706273-74c7-4a23-9dd0-aedf8b40b5ad,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:98e2fcea-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d6bd184d4db54bd2819158c6cd6fd29b-20221031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1793713966; Mon, 31 Oct 2022 10:00:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 00:40:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 00:40:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 00/10] Add driver for MediaTek Wi-Fi 7 devices
Date: Tue, 1 Nov 2022 00:39:50 +0800
Message-ID: <20221031164000.17063-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_100053_692453_86A95153 
X-CRM114-Status: GOOD (  10.14  )
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

This series adds mt7996, a new mac80211 driver for MediaTek Wi-Fi 7
(802.11be) devices, which currently supports AP, station, mesh, and
monitor modes.

mt7996 first supports Filogic 680, which is a Wi-Fi 7 chipset supporting
concurrent tri-band operation at 6 GHz, 5 GHz, and 2.4 GHz with 4x4
antennas on each band. There are several variants that will be added in
upcoming patches. For more details, please refer to [1].

mt7996 supports only Wi-Fi 6E at the moment, whereas Wi-Fi 7 and its
specific features are work in progress. They will be introduced in
further patches.

The driver has had multiple developers listed in the series.

[1] https://corp.mediatek.com/news-events/press-releases/mediatek-announces-worlds-first-complete-wi-fi-7-platforms-for-access-points-and-clients

Shayne Chen (10):
  wifi: mt76: extend aggr_stats for tri-band support
  wifi: mt76: connac: rework macros for unified command
  wifi: mt76: connac: update struct sta_rec_phy
  wifi: mt76: connac: rework fields for larger bandwidth support in
    sta_rec_bf
  wifi: mt76: connac: add more unified command IDs
  wifi: mt76: connac: introduce unified event table
  wifi: mt76: connac: add more bss info command tags
  wifi: mt76: connac: add more starec command tags
  wifi: mt76: connac: introduce helper for mt7996 chipset
  wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 drivers/net/wireless/mediatek/mt76/mt76.h     |    2 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |    5 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |    3 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   66 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   10 +-
 .../net/wireless/mediatek/mt76/mt7996/Kconfig |   12 +
 .../wireless/mediatek/mt76/mt7996/Makefile    |    6 +
 .../wireless/mediatek/mt76/mt7996/debugfs.c   |  829 ++++
 .../net/wireless/mediatek/mt76/mt7996/dma.c   |  360 ++
 .../wireless/mediatek/mt76/mt7996/eeprom.c    |  229 ++
 .../wireless/mediatek/mt76/mt7996/eeprom.h    |   75 +
 .../net/wireless/mediatek/mt76/mt7996/init.c  |  816 ++++
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 2472 ++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mac.h   |  398 ++
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 1327 +++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 3478 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  636 +++
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  |  385 ++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  521 +++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  222 ++
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  533 +++
 23 files changed, 12374 insertions(+), 13 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/Makefile
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/dma.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mac.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/main.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/pci.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/regs.h

-- 
2.25.1


