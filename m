Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE26CE7A99
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3Bb1nrCF1oV2g5dOdB8Ph18kjGirLPr99ocUJVK3jc=; b=dn20EqNp53Y229DF8ZfqJnKwkW
	jHwXZYO5ffUj3zxG5JMUB/9NheOBNo5Bd2eRB2QTRMA/RwuJAELAdufTMv+7cyVsSp9hY+D+fdCFS
	NdRGMZI2YKumChhXfjczeWfaGhSlBu57dw4bYNoOaJlTWSg4dlsWY0zjAF+4rLQIYEXFos0yprbmt
	8dt3jjj/WkU7J8zhP6VpXAa54v8y1EhG5OsSvLUvRf7lZWsqNfNPozin85alZyij9ovvEEbEYzdF/
	5oWbdOgrK04p0PEeGdjnSz/s4+uoxKN3yhN7fyMU2r4uD/lxnDKa7hiNfy3R+mpEZkWzhOSBe8GlL
	8Ehsbt5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkggl-00Dhja-0o;
	Mon, 25 Sep 2023 08:11:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkggi-00Dhie-1z
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 08:11:29 +0000
X-UUID: 1f5930545b7b11ee9b7791016c24628a-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=R3Bb1nrCF1oV2g5dOdB8Ph18kjGirLPr99ocUJVK3jc=;
	b=AjlUCFoBaYe0qBHheMsleGdvlwOYHcpcfX1ig6AfbeWtR1txEOEACr7z+vTsa7s0QLeNLTt6vN/kLXk78wh2X0yeq3RZIPAeot3mmWCfg2zJJjs9HbLGBGRtoOlrrcvhsWdVH2S/Mm85psYPk/mWRtsrlO1Scc40EuFd4LLjLyQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:f0d84886-5d36-4e71-9488-d30258a03216,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:2cf66dc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1f5930545b7b11ee9b7791016c24628a-20230925
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1399901674; Mon, 25 Sep 2023 01:11:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 16:10:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 16:10:52 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 0/6] support per-device regulatory settings
Date: Mon, 25 Sep 2023 16:10:32 +0800
Message-ID: <cover.1695627867.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.009000-8.000000
X-TMASE-MatchedRID: fVi3P7wwuziT7j3lOi4TQ7bQFsbjObJeCt59Uh3p/NWyjjoaU0ns0J1I
	RllGCL0aKI5Q2HQKDwWgMg/vVFp1mGqJrgOBmG6qQpxiLlDD9FVMkOX0UoduuQCGaccd4ae9DYJ
	QbNnE3Z3jCeE5v4lH5IAy6p60ZV62fJ5/bZ6npdjKayT/BQTiGozzTLFRnsvHlhAaNCcqjMgsGG
	Ct/FhJQrc4q1dzctJNG5BUnwnZfeA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.009000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 41D8B72AC835A29244D3F47E4EC5040FEDDCF452D07E210D104A326BF9B670462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_011128_661566_D5089552 
X-CRM114-Status: UNSURE (   8.50  )
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

Some platform vendors need to apply their own regualtory settings and the
vendor-specific data would be written in dts or acpi. This patch set adds
the functionalities to handle this per-device 5.9/6GHz channel
configurations.

Deren Wu (1):
  wifi: mt76: mt7921: move connac nic capability handling to mt7921

Ming Yen Hsieh (4):
  wifi: mt76: mt7921: enable set txpower for UNII-4
  wifi: mt76: mt7921: add 6GHz power type support for clc
  wifi: mt76: mt7921: get regulatory information from the clc event
  wifi: mt76: mt7921: update the channel usage when the regd domain
    changed

rong.yan (1):
  wifi: mt76: mt7921: support 5.9/6GHz channel config in acpi

 drivers/net/wireless/mediatek/mt76/eeprom.c   |   7 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   5 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 122 +-------------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  51 ++++++
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  34 ++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 157 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   |  13 ++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |   1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  19 +++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  |  53 ++++++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.h  |   2 +
 12 files changed, 336 insertions(+), 130 deletions(-)

-- 
2.18.0


