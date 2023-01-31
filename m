Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152D6C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgBgoPIks5ILoAiAo1k2ULVWyeQf7aPW4gZTo3R8QaQ=; b=Uo8xqjItWGKQni/au3ducsFgzu
	3KjNlrgHAf8u8lBydMGqn3Lt72/nBko4fc67bkt4FsBdnhhmeCuAPP7ErFPxzbdoeMyshIlQL0vHt
	+XRUZpHqB8586OOszaHY2OEIP1Qt2qFOzl6O9ejLE9eeyW4M+ixNZvxi6dBEP0wt8/qNW2hKh495c
	+ogS2EGyfwm8W+qKjQGOSJsatB0qyCIqOr8Y8N0zzi2xs73sWNfYluBVj3wCQlOINzXrIiC2uYaq/
	OmLhZtrasqC/13ast14GJF2kEzgbFO3EGrdJQIsI1zQRZLILYZUfIMfu8eVtCphHHczFnEikYZVYR
	u8IV7aNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn4E-00732x-My; Tue, 31 Jan 2023 09:36:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn4A-0072y5-39
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:36:39 +0000
X-UUID: be33faf6a14a11eda08d4d6090ec5a5c-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rgBgoPIks5ILoAiAo1k2ULVWyeQf7aPW4gZTo3R8QaQ=;
	b=LboazErbLBZ6zK73z9R4fHtXfxlZUAC7mv5GuG+P+pDimiUc+bC6p25CDKt69R3Q13flvSpA/tJtV2p/ZkaVY0slFHIJWcYLBZmA/z5ZvcM1YrnGwLQe3mo2osF+uxVI7kAGQKo74P9ud+5UveQR73aQj3E5ErC1HT9YNoPZ3cE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:4e71b9fd-56b9-40e4-9dbf-df1a96b43616,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:7032758d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: be33faf6a14a11eda08d4d6090ec5a5c-20230131
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1329776175; Tue, 31 Jan 2023 02:36:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 17:36:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 17:36:28 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 00/13] Add EHT support for mt7996
Date: Tue, 31 Jan 2023 17:35:58 +0800
Message-ID: <20230131093611.30914-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_013638_172531_4A505381 
X-CRM114-Status: GOOD (  10.69  )
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

This series adds initial EHT support for mt7996 driver, which currently
covers features of EHT SU mode. More EHT features are work in progress
and will be introduced in further patches.

This series is based on the following series:
- wifi: mt76: mt7996: fix chainmask calculation in mt7996_set_antenna()
  https://patchwork.kernel.org/project/linux-wireless/patch/20221223101348.11504-1-shayne.chen@mediatek.com/

v2:
  - add eth param to mt76_ethtool_worker() to prevent from breaking HE stats

MeiChia Chiu (1):
  wifi: mt76: mt7996: add EHT beamforming support

Shayne Chen (12):
  wifi: mt76: add EHT phy type
  wifi: mt76: connac: add CMD_CBW_320MHZ
  wifi: mt76: connac: add helpers for EHT capability
  wifi: mt76: connac: add cmd id related to EHT support
  wifi: mt76: increase wcid size to 1088
  wifi: mt76: add EHT rate stats for ethtool
  wifi: mt76: mt7996: add variants support
  wifi: mt76: mt7996: add helpers for wtbl and interface limit
  wifi: mt76: mt7996: rework capability init
  wifi: mt76: mt7996: add EHT capability init
  wifi: mt76: mt7996: add support for EHT rate report
  wifi: mt76: mt7996: enable EHT support in firmware

 drivers/net/wireless/mediatek/mt76/mac80211.c |  11 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  13 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |   2 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  46 ++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  12 +-
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   2 +-
 .../wireless/mediatek/mt76/mt7996/debugfs.c   |   8 +-
 .../wireless/mediatek/mt76/mt7996/eeprom.c    |  27 ++
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 400 +++++++++++-------
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  36 +-
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  12 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 186 +++++++-
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  16 +
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  25 +-
 15 files changed, 603 insertions(+), 195 deletions(-)

-- 
2.25.1


