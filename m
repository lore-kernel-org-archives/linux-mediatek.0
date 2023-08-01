Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BDEC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s+JFvACbYRNYAv86ehnQqAIBqTFzkTa1nL15aGbtCvI=; b=EyLlj+uqXE6rbPYkCzhlx21bgE
	w7QRD8yVK2gyPDjPrPqRpXi0WdxtXMGM+t+W98r9Yky97QARNfmwEoph8W6LPcbObwP0iUuf/h8Ra
	gnHUJncdjg46huj8O3lec6/U5dFN4jNsQDgXWVaudMnuJDAH9ATdycqlDfIJ4rnyr/6oadyPAaTjY
	ZSx5nlmHXkXocnbY5G/lBrm8zlh4SNk2fdcHTDMZev/GUS6ejFVdZrRtNRKnZrwXAcS8948SAtXHN
	VUA7VgAIElrJd7SgSBgR65Xxx9rn0QpdFeU4bWUV7UBfc9ssc1cFYFs8CMBG4kQ/x/CIqg3xRnDjW
	qH6BzVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqTX-002c35-1n;
	Tue, 01 Aug 2023 14:35:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqTU-002c0y-2P
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:35:50 +0000
X-UUID: b26bfc6a307811ee83ed1395ce914268-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=s+JFvACbYRNYAv86ehnQqAIBqTFzkTa1nL15aGbtCvI=;
	b=UIoZk5p9Ucn58JXxObZZWuV04fUbcxZDqMoFoWxprtMFuEXUfvPmg9h2rM5RMzRvs+1eIMQfYVdQatQr01kDEMZm7hyQM3C4CpSmWOyvDzSxTS74lFK7WnBPRik8MhHe6Qj1lQf7KDlnXdrM0T3bMVU6DwN2kRM30odMW98n+Ro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:59398776-c6ad-4f83-8169-3fe675696f3a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:59398776-c6ad-4f83-8169-3fe675696f3a,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:4e72b242-d291-4e62-b539-43d7d78362ba,B
	ulkID:23080122354680BTR734,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM
X-UUID: b26bfc6a307811ee83ed1395ce914268-20230801
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 271143803; Tue, 01 Aug 2023 07:35:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:35:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:35:41 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, Hao
 Zhang <hao.zhang@mediatek.com>, Leon Yen <leon.yen@mediatek.com>, Mingyen
 Hsieh <mingyen.hsieh@mediatek.com>, Nelson Yu <nelson.yu@mediatek.com>, Quan
 Zhou <quan.zhou@mediatek.com>, Rong Yan <rong.yan@mediatek.com>
Subject: [PATCH 00/17] Add support for Mediatek Wi-Fi7 driver mt7925
Date: Tue, 1 Aug 2023 22:34:16 +0800
Message-ID: <cover.1690864199.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073548_787474_33CCB942 
X-CRM114-Status: GOOD (  10.39  )
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

This series adds mt7925, a new mac80211 driver for MediaTek Wi-Fi 7
(802.11be) device Filogic 360, which can support Station, AP, P2P, and
monitor modes. Filogic 360 supports max 4096-QAM/160MHz radio operation at 6 GHz,
5 GHz, or 2.4 GHz with 2x2 antennas. This chip supports PCIe and USB bus type.

mt7925 supports Wi-Fi 6E and EHT rate with single link only at this moment,
whereas Wi-Fi 7 and its specific features are working in progress. They will be
introduced in further patches.

The driver is build tested by Intel's kernel test robot with both GCC and Clang
with several architecture. Sparse reports no warnings.

There are multiple authors, they are listed in alphabetical order below.

Co-developed-by: Hao Zhang <hao.zhang@mediatek.com>
Signed-off-by: Hao Zhang <hao.zhang@mediatek.com>
Co-developed-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Nelson Yu <nelson.yu@mediatek.com>
Signed-off-by: Nelson Yu <nelson.yu@mediatek.com>
Co-developed-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Co-developed-by: Rong Yan <rong.yan@mediatek.com>
Signed-off-by: Rong Yan <rong.yan@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>

(This patch set is based on preceding series "wifi: mt76: mt792x: add mt7925 support")

Deren Wu (17):
  wifi: mt76: mt7925: add Kconfig
  wifi: mt76: mt7925: add Makefile
  wifi: mt76: mt7925: add mt7925.h
  wifi: mt76: mt7925: add regs.h
  wifi: mt76: mt7925: add mcu.c
  wifi: mt76: mt7925: add mcu.h
  wifi: mt76: mt7925: add mac.c
  wifi: mt76: mt7925: add mac.h
  wifi: mt76: mt7925: add main.c
  wifi: mt76: mt7925: add init.c
  wifi: mt76: mt7925: add pci_mcu.c
  wifi: mt76: mt7925: add pci_mac.c
  wifi: mt76: mt7925: add pci.c
  wifi: mt76: mt7925: add usb.c
  wifi: mt76: mt7925: add debugfs.c
  wifi: mt76: add mt7925 to Makefile
  wifi: mt76: add mt7925 to Kconfig

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 .../net/wireless/mediatek/mt76/mt7925/Kconfig |   30 +
 .../wireless/mediatek/mt76/mt7925/Makefile    |    9 +
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  319 ++
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  235 ++
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 1452 ++++++++
 .../net/wireless/mediatek/mt76/mt7925/mac.h   |   23 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 1472 ++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 3174 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  537 +++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  325 ++
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  586 +++
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  151 +
 .../wireless/mediatek/mt76/mt7925/pci_mcu.c   |   53 +
 .../net/wireless/mediatek/mt76/mt7925/regs.h  |   92 +
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |  340 ++
 17 files changed, 8800 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/Makefile
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mac.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/main.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/pci.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/regs.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/usb.c

-- 
2.18.0


