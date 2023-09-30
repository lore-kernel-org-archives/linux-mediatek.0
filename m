Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74876E7734D
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Sep 2023 02:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dLx30+l8wXNWnXJVQ+9TCbsEPqDxvrdIJ6mAOGtQKWg=; b=nCMGkc5mSPdQnVQ2tw4yXd1J3B
	Thl1LVnXz7fK8gPIFkvKlTmoIc3LZ12rV6u5oM+P4zn84Gz4V4U7DXxPxKyzW86OJI4SNM2MMuq8j
	c2CoQw/nyh1NHMg4AxK9nWuow2x1LpRrlYqer1yPCal2B3dH50TeAyqHeOs8iDIvKTe+qklq8fcLm
	0cBI+ZX77NNSVzl937sb39CXPMRjOp/iSyzrHfqEq1uhWfmAnstOT1S8ZzVPa5gxYZDuH5bozzXGP
	5mz91/zYGg7W/W1iCxtz8ZsiVBn51IwvydFz8w8CuCY4AQIDDnQjfbIDVTOTXIkxV+MR+Siv4bGk3
	waNn21Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmPpJ-008pLq-0h;
	Sat, 30 Sep 2023 02:35:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmPpG-008pLR-16
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Sep 2023 02:35:27 +0000
X-UUID: 00d6b5b25f3a11ee9b7791016c24628a-20230929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dLx30+l8wXNWnXJVQ+9TCbsEPqDxvrdIJ6mAOGtQKWg=;
	b=rS6P+9Vp5bKSKhXL8kO/wQdVN6t5Gfa0cSM7kHd3QgPTVLqD0qd2LZLm4vUj+XnV3fxusL0FTVJVWPP1tUaCD0Xv8YPDvWlq4YxA3H4azaKjMQPIN8WUNSXTk27gqH32Wavc1MyGvQlPdcDMGN4VWcDsHUJ1iQoS2SzzYrawKkk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:d190eef3-91e5-46f6-9fca-b7c8e0d0a0b6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:30bf8614-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 00d6b5b25f3a11ee9b7791016c24628a-20230929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 940408689; Fri, 29 Sep 2023 19:35:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 30 Sep 2023 10:25:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 30 Sep 2023 10:25:19 +0800
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
Subject: [PATCH v2 0/6] wifi: mt76: mt7921: support per-device regulatory settings
Date: Sat, 30 Sep 2023 10:25:04 +0800
Message-ID: <cover.1696039301.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_193526_414925_113C9926 
X-CRM114-Status: GOOD (  10.52  )
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

---
v2:
  * 6th patch in v1 is shown in wireless patchwork, resend this series to
    make the reivew easier
  * add preifx "wifi: mt76: mt7921:" in the title of cover letter

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


