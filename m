Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE1BEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 07:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Oq5xoynfS7rW1FF6Umo1czO+RibBSaj30BY5Sfz4zI=; b=grPrNx32ak+mYmNt6fcPmH9+MK
	OyGbYgrmvTMOqtKYJx3Au/zIQJIXtMICS+AC9IAZsujHoH45Izu7BYF1lyEB7/Axcg/bp7TErSKf/
	9OOw7GdyxlF98iJuj7xi69Q0xlAJ3WC1QRnIUqQ+kxsd00nkDEjTiThnSqimnts0fuk1hAEolGiDf
	KotCpUV+7jJcLh/DsrC7Xm72STy379XwHmOUUTOnd8PO9NFOeBwy+gCPQsL1AhdDT84Qrk9Rg8BO0
	ev0fgDr2TuGkWogYGuzUxjKMhDtHDNEfD+WK/xr4KQid8mnvXRLWHaTjWQimZEvxXFDV/q8sCXgKu
	AJhjsvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPH7-00F1JT-0H;
	Wed, 28 Jun 2023 07:07:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPH0-00F1EC-0D
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 07:07:31 +0000
X-UUID: 69ba8222158211ee83ed1395ce914268-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/Oq5xoynfS7rW1FF6Umo1czO+RibBSaj30BY5Sfz4zI=;
	b=OgvMbsywz7NIf1z6Lga5nFOcL6Id6VKv8giQmHhDfVg5Mxs2r+5Z1DfyXUXRXJhP1POhZJlfQ0jjof/+CZcUcUwAzfYCk2eVjs61XSsaB0nyLp5lqkDx0kEKVISPrn7NbNKIlkBY2kfLKc2UVuk8XqvLYIW3DnkI8vUfzKAAn+w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:05518fbb-2db4-4cbb-8606-a67bb21932e1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.27,REQID:05518fbb-2db4-4cbb-8606-a67bb21932e1,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:01c9525,CLOUDID:48ea7182-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:2306281507189TGK7S9D,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: 69ba8222158211ee83ed1395ce914268-20230628
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2048958152; Wed, 28 Jun 2023 00:07:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 15:07:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 15:07:13 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 00/16] mt76: introduce mt792x-lib support
Date: Wed, 28 Jun 2023 15:05:46 +0800
Message-ID: <cover.1687919628.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_000730_130344_0C67C210 
X-CRM114-Status: GOOD (  11.74  )
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

This patch set includes the new module mt792x-lib support.

Move some common header/functions from mt7921 to mt792x and also rename prefix
to mt792x. The new module would integrate the common functionalities of mt76
station driver mt7921 and upcoming WiFi7 solution.

(This patch set is too big to review. I will post another series with
remaining patches)

Lorenzo Bianconi (16):
  wifi: mt76: mt7921: move common register definition in mt792x_regs.h
  wifi: mt76: mt7921: convert acpisar and clc pointers to void
  wifi: mt76: mt7921: rename mt7921_vif in mt792x_vif
  wifi: mt76: mt7921: rename mt7921_sta in mt792x_sta
  wifi: mt76: mt7921: rename mt7921_phy in mt792x_phy
  wifi: mt76: mt7921: rename mt7921_dev in mt792x_dev
  wifi: mt76: mt7921: rename mt7921_hif_ops in mt792x_hif_ops
  wifi: mt76: mt792x: move shared structure definition in mt792x.h
  wifi: mt76: mt7921: move mt792x_mutex_{acquire/release} in mt792x.h
  wifi: mt76: mt7921: move mt792x_hw_dev in mt792x.h
  wifi: mt76: mt792x: introduce mt792x-lib module
  wifi: mt76: mt7921: move mac shared code in mt792x-lib module
  wifi: mt76: mt7921: move dma shared code in mt792x-lib module
  wifi: mt76: mt7921: move debugfs shared code in mt792x-lib module
  wifi: mt76: mt7921: move init shared code in mt792x-lib module
  wifi: mt76: mt792x: introduce mt792x_irq_map

 drivers/net/wireless/mediatek/mt76/Kconfig    |   4 +
 drivers/net/wireless/mediatek/mt76/Makefile   |   5 +
 .../net/wireless/mediatek/mt76/mt7921/Kconfig |   2 +-
 .../wireless/mediatek/mt76/mt7921/Makefile    |   4 +-
 .../wireless/mediatek/mt76/mt7921/acpi_sar.c  |  25 +-
 .../wireless/mediatek/mt76/mt7921/debugfs.c   | 228 +----
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 127 +--
 .../net/wireless/mediatek/mt76/mt7921/init.c  | 288 +------
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 380 +--------
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 787 ++++-------------
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 120 +--
 .../wireless/mediatek/mt76/mt7921/mt7921.h    | 297 ++-----
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  97 ++-
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |  14 +-
 .../wireless/mediatek/mt76/mt7921/pci_mcu.c   |  12 +-
 .../net/wireless/mediatek/mt76/mt7921/regs.h  | 464 +---------
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  26 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  |   6 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  |  14 +-
 .../wireless/mediatek/mt76/mt7921/testmode.c  |   8 +-
 .../net/wireless/mediatek/mt76/mt7921/trace.c |  12 -
 .../net/wireless/mediatek/mt76/mt7921/usb.c   |  34 +-
 .../wireless/mediatek/mt76/mt7921/usb_mac.c   |  16 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 275 ++++++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 792 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt792x_debugfs.c   | 168 ++++
 .../net/wireless/mediatek/mt76/mt792x_mac.c   | 313 +++++++
 .../net/wireless/mediatek/mt76/mt792x_regs.h  | 479 +++++++++++
 .../net/wireless/mediatek/mt76/mt792x_trace.c |  14 +
 .../{mt7921/mt7921_trace.h => mt792x_trace.h} |  16 +-
 30 files changed, 2611 insertions(+), 2416 deletions(-)
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/trace.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_core.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_regs.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_trace.c
 rename drivers/net/wireless/mediatek/mt76/{mt7921/mt7921_trace.h => mt792x_trace.h} (68%)

-- 
2.18.0


