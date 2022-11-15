Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AA4C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZuTPGR86r7bVaysdVG23npwmtpOuYDbcCm2ae20sKio=; b=wR3q2JbuLTqI5qIwpLyjFA662b
	qrIlFySbwwUXD7200md6Ye1oGN4p6ot3jJQGDWl2oraTIDEMiU0OqjmA1sYaoiPxlyh4P7bMoUxmj
	GBXtCLKIv6rR3HosCxtUbC2OY4Kc7V1uDm5SbhVx22HoNFHVm3cFHU/Iqi+jxm8JOWaKYqj18Dlsr
	CA+hPoVV8JxHsrFYmMYM9S5LLRrjRxlDJKdyQF1/TFtU8/YtQf22afBW9yjiTxtxTzP4nNKf3IgyJ
	FDcjueohTbiFlGk71BwNC3/iKtWNqijoVyRrlfjlqX78LVSi4ow1gDmVHbw/Pg0B8u485Sp89gVAS
	k+mC2iJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oujYN-005yLC-Im; Tue, 15 Nov 2022 00:11:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oujYL-005yJk-MI
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 00:11:51 +0000
X-UUID: 6e4ee8f1dbac4af8a52a9a834430ad2b-20221114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZuTPGR86r7bVaysdVG23npwmtpOuYDbcCm2ae20sKio=;
	b=SINjGUZtURHmBqZjWBpX7E0X8z+qY0jxgFDKA5q5kmpYDNU03Pix6zSJN/rThwP1BC/UI81ndT55t/kRdASNr8Sh83DRsL2ItWZNOXlIPMbaLKU+qWQ0kAGRaQoZXE40bkxJv3ZMsdl2lBVXRHOAfpAxvI76kKU693ZCy3OyYwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:46677ce4-d787-4c27-b703-9337072c8ad1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:2c19ee29-8055-4e28-ab7d-2959ba08645e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6e4ee8f1dbac4af8a52a9a834430ad2b-20221114
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1731887551; Mon, 14 Nov 2022 17:11:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 15 Nov 2022 08:11:25 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 15 Nov 2022 08:11:25 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Sean
 Wang" <objelf@gmail.com>
Subject: [PATCH v4 0/7] wifi: mt76: mt7921: introduce chanctx support
Date: Tue, 15 Nov 2022 08:11:22 +0800
Message-ID: <cover.1668467719.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_161149_754616_56E4C9AD 
X-CRM114-Status: GOOD (  11.81  )
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

From: Sean Wang <objelf@gmail.com>

Update the driver to adapt the new firmware can have the capability to
manage the channel context scheduling on multiple roles running on the
device including Station, AP and P2P GC/GO mode (will be extended based
on the future patchset) to help users sharing the network with others
on a single device.

=== v2 ===
(at 1/7)
1. remove unneeded newline
2. squash this one with "wifi: mt76: connac: rely on
   mt76_connac_mcu_uni_set_chctx"

(at 3/7)
1. remove unneeded newline and use 'u8 rsv' instead of origin one

(at 4/7)
1. drop mt7921_mcu_bss_event that is unused any more

(at 6/7)
1. move mt7921_check_offload_capability prior to ieee80211_alloc_hw
   and decie what ieee80211_ops instance we should use by the
   firmware capability bit.

(at 7/7)
1. decide the feature by the firmware capability bit
2. decide the channel by the hardware value in
   mt7921_get_status_freq_info()

=== v3 ===

(at 6/7)
1. fix mt7921/usb.c:231:7: error: no member named 'ops' in
   'struct mt7921_dev'
2. fix mt7921/main.c:425:13: warning: variable 'err' set but not used
   [-Wunused-but-set-variable]
3. fix mt7921/init.c:173:9: warning: variable 'features' is used
   uninitialized whenever 'while' loop exits because its condition is false
   [-Wsometimes-uninitialized]

(at 7/7)
1. enhance the git message

== v4 ===

(at 1/2 and 2/2)

1. reuse mt7921_ops to set up ieee80211 ops for chanctx
2. drop the patch 1/7 to 5/7 as they are being merged

Sean Wang (2):
  wifi: mt76: mt7921: introduce remain_on_channel support
  wifi: mt76: mt7921: introduce chanctx support

 .../net/wireless/mediatek/mt76/mt7921/init.c  |  90 ++++++-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   8 -
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 223 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  24 ++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  49 ++++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  40 +++-
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  30 ++-
 .../net/wireless/mediatek/mt76/mt7921/usb.c   |  20 +-
 8 files changed, 458 insertions(+), 26 deletions(-)

-- 
2.25.1


