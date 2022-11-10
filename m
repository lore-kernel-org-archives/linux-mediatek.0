Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135ADC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ap/uZUa19gYgZAqa91nfpfnFpXg72cD/89ZSdgoCoZ4=; b=4pxjKEtznKIxg46lpXMcvMt/Qp
	1u7cuNFCx0ycuBgO0ZHf8FhWoKeCk0GZWTybl1kExbqUmSX/NYWBBOLIxzshm1FT5/koS2NEIqiE9
	EQNThEyXqoxcseoA69LOEb1mxJj+aJmBoHVp0xxId3DHEBHj1ljMrMBTQdOYKtkSpWgMUSBuk0MRk
	g8Cv53BrzE28++5mp/fiQG+s3ybfHFvugFcmgz9FeVfgZUNl4mHhmAbZ8PUssTcNjN1Wxy2gBD3Xh
	lP1gjipPVBwrZbm8TMOOy4H3UMSXNpMRonfI7U/DPHF0JihKUEaapjxRkt/vi5PyDva4+sOn89+wr
	9vn5Bs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot409-004h2E-5i; Thu, 10 Nov 2022 09:37:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot401-004gtq-3D
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 09:37:31 +0000
X-UUID: 06327aedc5d442f598027ad0b84ec1bf-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ap/uZUa19gYgZAqa91nfpfnFpXg72cD/89ZSdgoCoZ4=;
	b=gVMSy4eJS0TwL3qe2UhrI3h7tbNcqTKOuAbbFy3kjfMPlh/UyW5xy2/klme3WGpOcYdDgYnRCbtYJiPUnLUySkKLOHocMENCe+i7DzKxk/+SY+OAddeQdubKqDSIJ5Aa/Ca7t5pguPVZQNlhlEmvVShXpQMBMl6JpJYv2ULxf4Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:adb7f286-51cf-4e35-b2f5-c1b654919084,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:d355e950-b7af-492d-8b40-b1032f90ce11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 06327aedc5d442f598027ad0b84ec1bf-20221110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 435253320; Thu, 10 Nov 2022 02:37:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 17:36:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 17:36:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 0/9] Add driver for MediaTek Wi-Fi 7 devices
Date: Thu, 10 Nov 2022 17:35:16 +0800
Message-ID: <20221110093525.29649-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_013729_158981_F22195C1 
X-CRM114-Status: GOOD (  12.69  )
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

This series is based on the following series and patches:
- wifi: mt76: fix bandwidth 80MHz link fail in 6GHz band
  https://patchwork.kernel.org/project/linux-wireless/patch/85b5e8374fc9b86fb955060c1840f3b2a1d187e4.1666614616.git.deren.wu@mediatek.com/
- mt76: move aggr_stats array in mt76_phy
  https://patchwork.kernel.org/project/linux-wireless/cover/cover.1667427944.git.lorenzo@kernel.org/

v2:
- rebase on top of aggr_stats series to prevent from breaking other drivers
- clean up unused mcu commands
- fix some commands that haven't been changed to unified command format
- update fw path

Shayne Chen (9):
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
 .../net/wireless/mediatek/mt76/mt76_connac.h  |    5 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |    3 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   69 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   10 +-
 .../net/wireless/mediatek/mt76/mt7996/Kconfig |   12 +
 .../wireless/mediatek/mt76/mt7996/Makefile    |    6 +
 .../wireless/mediatek/mt76/mt7996/debugfs.c   |  851 ++++
 .../net/wireless/mediatek/mt76/mt7996/dma.c   |  360 ++
 .../wireless/mediatek/mt76/mt7996/eeprom.c    |  229 ++
 .../wireless/mediatek/mt76/mt7996/eeprom.h    |   75 +
 .../net/wireless/mediatek/mt76/mt7996/init.c  |  816 ++++
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 2468 ++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mac.h   |  398 ++
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 1325 +++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 3428 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  662 ++++
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  |  385 ++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  516 +++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  222 ++
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  533 +++
 22 files changed, 12363 insertions(+), 12 deletions(-)
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


