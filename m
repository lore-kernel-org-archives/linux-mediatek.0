Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AD0C47073
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 03:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ahSVIanf9Tu10foFMgThr+AABLaLVrB58rhIX7RkWts=; b=TkPLq3kfNK3P3pimRj/U47Eide
	YRnqFpUNu/HQiBdfPsuCRc+H51rDSlwld8k7hwnITziARRNA9bfVOyWPjXWkZ3kiYwZhhG7WNjoZP
	QfJ4VpSbW9HYPw4cznoKw4omy+lmXSfJZ2VGKWu8IIpxfrVlSTKZE4SFbkMMU72r1woeDnCF0eGDN
	MuUXptz6FkXzsyMxWYIslN+FS8dyYuCxC7nP/eQcPQx4txA6vemv5/lE8TK0FrnqVPCNRuGVaw2P5
	2a0sfUGqotm6soV4WZiMTn12iBaESDWSZUoQb3geIYBC84yposez71PbK/vYnD0tXMp85ALN0vjGt
	UByiw7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ3GR-0008J9-0j;
	Fri, 29 Dec 2023 03:10:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ3GN-0008He-09
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Dec 2023 03:10:20 +0000
X-UUID: c9533f0ca5f711ee9a662f17bb45267e-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ahSVIanf9Tu10foFMgThr+AABLaLVrB58rhIX7RkWts=;
	b=VmmVowGbogtzdjRxibp6i+CBMMXWUrp53sUj7Db2CMBWI/gW6uCEKRAG+IrMCifpQMFD5+OlwJcu6C7OUw0ghhvs85kqZETXupMI9FGKOk+e9anRsfJQUbWC5v0QlFWREhCTpjrka4cFkahz1MygazxsMGXI/RbzTvYwkMBA2Pg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:7b01ddbd-3bcd-4347-ab97-b3f2e86ef9c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:c3ecaf8d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c9533f0ca5f711ee9a662f17bb45267e-20231228
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1720713687; Thu, 28 Dec 2023 20:10:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Dec 2023 11:09:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Dec 2023 11:09:40 +0800
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
Subject: [PATCH v2 00/10] wifi: mt76: mt7925: fix connection and throughput issues
Date: Fri, 29 Dec 2023 11:09:27 +0800
Message-ID: <20231229030937.22605-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_191019_088128_B020F353 
X-CRM114-Status: UNSURE (   8.66  )
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

v2:
 1. [PATCH 04/10] wifi: mt76: mt7925: fix wmm queue mapping 
    a. change mq_to_aci[] definition from "static" to "static const".
 2. Resend v2 patchset for wrong patch version submit.

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


