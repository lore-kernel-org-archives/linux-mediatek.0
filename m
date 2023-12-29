Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B055C4706F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 02:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4tTGW1qHUJdYYTmybPDLa2NdHjA+/39cIhS/Yh7ugKI=; b=OCPi9Ep26uDl03F4CyJClE/nQf
	rXSjPS2imxqAC/u5ru5KFQDU1GIEbN8C47cEHkXmcteQsdbVpL9gcALybtjEGF8Y0RSnjhUTMoGES
	cGyIvzE5Fst2tItV8bCTB+40ZYZ7rphYiBT1G8HpB2WNppYsDqIhD5Wyokohi3cAuFszaFYuFEjyd
	10W1IDKxxq1KhkSFycScET89QcCBHuSuHZOCh3RoZUuIbeIWBeFY5njCwpnCICptXFx7l7AyxSJLt
	i1Daj24D+QKlua+Og2OUa2TsREq8yHgrOUMBjotmP39bXkcVJMPNO5u+1scJlqDOfaKfKBVWOodvh
	j5XLZUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ2BR-0004Z0-1d;
	Fri, 29 Dec 2023 02:01:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ2BO-0004Wm-0w
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Dec 2023 02:01:07 +0000
X-UUID: 180dec78a5ee11eeafd70d0b34820190-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4tTGW1qHUJdYYTmybPDLa2NdHjA+/39cIhS/Yh7ugKI=;
	b=cqqfcNzQf3NP46LH68S1NUc68e/3kazWg7sFVyUfgKPLMoQ0wiEXbqc+BqKmxP0wJ19FQk5fU7RsXy5+YWefOCdnI3HK1O4h2Tyf5YR+Qzy1Re233nZOEdz2WlxxzuUXBeZecA7hd9jtyuj/ag47eXEbHZvOfArf0R5/AnOc5UM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:0dc0bf9b-82d4-4a9d-a857-e5386cd1465c,IP:0,U
	RL:0,TC:0,Content:-32768,EDM:-32768,RT:0,SF:-32768,FILE:0,BULK:-32768,RULE
	:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:1c3a4882-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:nil,EDM:nil,IP:ni
	l,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 180dec78a5ee11eeafd70d0b34820190-20231228
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1920696310; Thu, 28 Dec 2023 19:00:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Dec 2023 10:00:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Dec 2023 10:00:15 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<MingYen.Hsieh@mediatek.com>
Subject: [PATCH v1 00/10] wifi: mt76: mt7925: fix connection and throughput issues
Date: Fri, 29 Dec 2023 09:59:59 +0800
Message-ID: <20231229020009.12385-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_180106_330535_3D21D915 
X-CRM114-Status: UNSURE (   7.66  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>

Hi,

Recently, we have some tests on the mt7925 driver and find a number of
potential connection bugs and throughput issues. This patchset contains
bugfixes and cleanups for these issues.

Thanks,
Yen.

v1:
 1. [PATCH 04/10] wifi: mt76: mt7925: fix wmm queue mapping 
    a. change mq_to_aci[] definition from "static" to "static const".

Deren Wu (1):
  wifi: mt76: mt7925: update PCIe DMA settings

Hao Zhang (1):
  wifi: mt76: mt7925: fix mcu query command fail

Ming Yen Hsieh (6):
  wifi: mt76: mt7925: fix connect to 80211b mode fail in 2Ghz band
  wifi: mt76: mt7925: fix wmm queue mapping
  wifi: mt76: mt7925: fix fw download fail
  wifi: mt76: mt7925: fix WoW failed in encrypted mode
  wifi: mt76: mt7925: fix the wrong header translation config
  wifi: mt76: mt7925: add support to set ifs time by mcu command

Quan Zhou (1):
  wifi: mt76: mt7925: add flow to avoid chip bt function fail

rong.yan (1):
  wifi: mt76: mt7925: fix SAP no beacon issue in 5Ghz and 6Ghz band

 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |   2 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   4 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  26 ++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 176 +++++++++++-------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  92 +++++++--
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +
 .../net/wireless/mediatek/mt76/mt792x_dma.c   |  13 +-
 .../net/wireless/mediatek/mt76/mt792x_regs.h  |   8 +
 8 files changed, 227 insertions(+), 96 deletions(-)

-- 
2.18.0


