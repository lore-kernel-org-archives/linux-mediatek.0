Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152AFC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jXEkGXbCtbIOJZL0eBlMntvmSAcsoRmhqUeWr+79ffA=; b=YCMKDkYgCy9tE0IGlRKMSvHMqz
	rs9hRHeLzuK0elyZPuPNZweENx6WzTRj10MzTteqI2Vk1v88/ZrhSbJXBCToDV7bgFj/n/Brvp30w
	cyLKF4p8ext0iSybe2H99ltDVUH3WH9/xlRNRLeRGaQIUbSS2j8HFSE7KDO280upAAK/ydC88H8dr
	gNmZvaAzEtxilPWqRs5ViWGBizl9Rcxd9MdI73ZTEh5GrgBsWn3EKGhYCiqkBxNc79eEN5F3//0X2
	N5VO4Gn+XsjXkUAXUVKZSqE/lzCJCBBsXK9PyarD1HYNmifN3ikq7DSH583UqKUxmI9psl64LkEn2
	zXqcbK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2R33-00DPt3-0I;
	Mon, 13 Nov 2023 07:07:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2R31-00DPsS-1t
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 07:07:52 +0000
X-UUID: 5aad644c81f311ee9b7791016c24628a-20231113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jXEkGXbCtbIOJZL0eBlMntvmSAcsoRmhqUeWr+79ffA=;
	b=XUkbZMQquQ+UcjQ0rsZtqx1BfbopKgFNSP+OKvRTJo439sxf5Wc5z61C2GE+urv1FPNHUnQEI908WP7J+bF0xZM9STNgXFvNuDRZhWMjHJ5HqexDrkQRi2HF5YoKMzoUhczmeScfKCQAM/gji62gks3FdHANU3r2TEQNq0oWsuA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:c2dcf177-3d97-407c-8f94-989da93bd98d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:b52776fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5aad644c81f311ee9b7791016c24628a-20231113
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1234501871; Mon, 13 Nov 2023 00:07:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 13 Nov 2023 15:07:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 13 Nov 2023 15:07:13 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 0/8] Add MT7992 support
Date: Mon, 13 Nov 2023 15:06:11 +0800
Message-ID: <20231113070619.19964-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.991100-8.000000
X-TMASE-MatchedRID: kSL0NBRKvPcReJdaDf25josKNaNh88CQsf4f4CxxueRcKZwALwMGs4AX
	rQfh62buh/90MLI5dilYk91062MLlxqXhvBXA7wbpN8sp+Lj7S2uiRuR9mCaureKIZi8OZjkZvo
	+mFW19mDuzcUA0q2gBaBVvEjzNBpCHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW3IYlFO6bAPz8mx
	h8UlOgf4GAyHU6rIh/EaXigxqt+eBmmpZSqWPzmMm15M0FklN1jR3SUzToIMOFoaBrz1hy1aF0b
	WWhkpVEwZBgUyJVEbl6Fw8/PpTMRaVvmiAyeA2kc5MSfkiJFI5p3LlElBHTlw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.991100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9A30C7B4BEA3F2AC459A9BEC0AAE65AAE7B50DBC6A8ADE8B0145ECE5779372942000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_230751_627698_C1EDE717 
X-CRM114-Status: UNSURE (   7.96  )
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

This series adds support for MT7992 (Filogic 660) PCI Wi-Fi device, which
is a Wi-Fi 7 chipset supporting concurrent dual-band operation on 2.4 GHz
and 5 GHz.

Benjamin Lin (2):
  wifi: mt76: mt7996: add DMA support for mt7992
  wifi: mt76: connac: add new definition of tx descriptor

Shayne Chen (1):
  wifi: mt76: mt7996: introduce mt7996_band_valid()

StanleyYP Wang (5):
  wifi: mt76: connac: add firmware support for mt7992
  wifi: mt76: mt7996: rework register offsets for mt7992
  wifi: mt76: mt7996: support mt7992 eeprom loading
  wifi: mt76: mt7996: adjust interface num and wtbl size for mt7992
  wifi: mt76: mt7996: add PCI IDs for mt7992

 .../net/wireless/mediatek/mt76/mt76_connac.h  |  5 ++
 .../wireless/mediatek/mt76/mt76_connac3_mac.h |  1 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  3 +-
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 72 +++++++++++----
 .../wireless/mediatek/mt76/mt7996/eeprom.c    | 18 +++-
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 42 +++++----
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  7 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 38 +++++---
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  | 59 ++++++++++++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    | 33 +++++--
 .../net/wireless/mediatek/mt76/mt7996/pci.c   | 12 ++-
 .../net/wireless/mediatek/mt76/mt7996/regs.h  | 90 +++++++++++++------
 12 files changed, 294 insertions(+), 86 deletions(-)

-- 
2.39.2


