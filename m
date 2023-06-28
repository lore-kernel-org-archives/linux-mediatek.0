Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2B0EB64DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XcTpzYWutNflNwjCLThIvSL7Y9MEaSFxW50yimtDcuw=; b=Lq0eUjPaOmUYuFvLZiBmhbvvPH
	MLsP7faMeYkFHpiN3B/YcXjWfBRQU+0X79X7P7ZQGuu02eNontvn2FXPhrt3hq0zwYAFWrGqghC2g
	tWQoy5cblIhvQYoXvcKWDrCT2OqDUgF1m2ZDNjTdjUcxdfVB9rkhDngMpIvMofca5uyiXQuiQRvvN
	5QjLghrPw3ECCesQV0nT7+SdboQ3/9yzLR1fuucfMM3+2pFhduu5lcWdBE8SI0fDgyUz6QTwND1cz
	Fi3QWp+MuetHQXP7MlGUqEhPGFl8MEKqDz5SW1NNg9SuQ09++i6Vzn8lz1DPnWTWoRehz8WFeWYF4
	jlLl+m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPKn-00F2SJ-0u;
	Wed, 28 Jun 2023 07:11:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPKi-00F2Pf-1c
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 07:11:21 +0000
X-UUID: a8622a66158211ee912e1518a6540028-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XcTpzYWutNflNwjCLThIvSL7Y9MEaSFxW50yimtDcuw=;
	b=iAghYf1b/aJACKPMVi9pw8/eYRDZk44imQ2mfjvrcjviUsQRq/WUy+DzGfFaIJaO256U5kiQXtaP1dp9+tP8cni+oORrpB1V7mpvnkQU/zTWVQNY1dMVAIIc9dL6rZe2m5stlRRidXMdnk9MOgiOeg2d2GuCSPoe7UkAoit37QU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:8612049e-4930-40d6-b00a-4d95c260abc5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.27,REQID:8612049e-4930-40d6-b00a-4d95c260abc5,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:01c9525,CLOUDID:23774f0d-26a8-467f-b838-f99719a9c083,B
	ulkID:2306281508597AFSFUDL,BulkQuantity:1,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_SNR
X-UUID: a8622a66158211ee912e1518a6540028-20230628
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1334869592; Wed, 28 Jun 2023 00:09:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 15:08:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 15:08:57 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 00/11] mt76: introduce mt792x-usb support
Date: Wed, 28 Jun 2023 15:07:13 +0800
Message-ID: <cover.1687920269.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_001120_551922_C11C0AD9 
X-CRM114-Status: GOOD (  10.87  )
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

This patch set includes the new module mt792x-usb support.

Move some common header/functions from mt7921 to mt792x and also rename prefix
to mt792x. The new module would integrate the common functionalities of mt76
station driver mt7921 and upcoming WiFi7 solution.

(This patch set is based on preceding series "mt76: introduce mt792x-lib support")

Lorenzo Bianconi (11):
  wifi: mt76: mt792x: move more dma shared code in mt792x_dma
  wifi: mt76: mt7921: move hif_ops macro in mt792x.h
  wifi: mt76: mt7921: move shared runtime-pm code on mt792x-lib
  wifi: mt76: mt7921: move runtime-pm pci code in mt792x-lib
  wifi: mt76: mt7921: move acpi_sar code in mt792x-lib module
  wifi: mt76: mt792x: introduce mt792x-usb module
  wifi: mt76: mt792x: move mt7921_load_firmware in mt792x-lib module
  wifi: mt76: mt76_connac3: move lmac queue enumeration in
    mt76_connac3_mac.h
  wifi: mt76: mt792x: move MT7921_PM_TIMEOUT and MT7921_HW_SCAN_TIMEOUT
    in common code
  wifi: mt76: mt7921: move mt7921_dma_init in pci.c
  wifi: mt76: mt7921: move mt7921u_disconnect mt792x-lib

 drivers/net/wireless/mediatek/mt76/Kconfig    |   4 +
 drivers/net/wireless/mediatek/mt76/Makefile   |   5 +-
 .../wireless/mediatek/mt76/mt76_connac3_mac.h |  14 +
 .../net/wireless/mediatek/mt76/mt7921/Kconfig |   2 +-
 .../wireless/mediatek/mt76/mt7921/Makefile    |   5 +-
 .../wireless/mediatek/mt76/mt7921/acpi_sar.h  | 105 ------
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 223 ------------
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  16 +-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  72 +---
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  11 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 111 +-----
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  61 ----
 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 170 +++++----
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |   4 +-
 .../wireless/mediatek/mt76/mt7921/pci_mcu.c   |  65 ----
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |   6 +-
 .../wireless/mediatek/mt76/mt7921/testmode.c  |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/usb.c   | 179 ++++-----
 .../wireless/mediatek/mt76/mt7921/usb_mac.c   | 255 -------------
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  94 ++++-
 .../{mt7921/acpi_sar.c => mt792x_acpi_sar.c}  | 125 ++++---
 .../wireless/mediatek/mt76/mt792x_acpi_sar.h  | 105 ++++++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 244 ++++++++-----
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 344 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt792x_mac.c   |  72 ++++
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 309 ++++++++++++++++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  14 -
 27 files changed, 1334 insertions(+), 1283 deletions(-)
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/dma.c
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/usb_mac.c
 rename drivers/net/wireless/mediatek/mt76/{mt7921/acpi_sar.c => mt792x_acpi_sar.c} (64%)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_dma.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_usb.c

-- 
2.18.0


