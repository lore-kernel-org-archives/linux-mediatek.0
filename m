Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE92C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UnlStqmYRAlfvxrZQ5+BdKf3D8frk3pBfaawlyt78ZI=; b=edrqeU52bWs1bCbkWp9kEF10Yn
	Znn8RRrFFcBUr8amL1FyIWQhJfu8ufvpu9Ote0uwuQnCT2pINT9GfqRja5OQbwvFh6sNF0LCFHkw4
	3r0cDgATqKnrcCYE6u5GjBKMN9jUnRpm2G6fUXbkmyKUt0hgSm2blxP/3sfDa7aLVemNlf44s6Q5z
	v9Q6i4TPNpnlJTfQJ+ekE2vO44h1rtlyCZZdNKpHMnp3RGkwRWUy02sV+m6ftzOnZUz/dqr0Q6/Ky
	hrWLPU8WY/nfPfktK6j82fhnJhCDhVqbzK40sCQXYbPBciTsY2TIBJO7gsugtQl+sxK4gyiNBhTdA
	rDipCBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFt5s-00Gl8u-2G;
	Wed, 20 Dec 2023 09:42:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFt5q-00Gl8S-0p
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 09:42:23 +0000
X-UUID: 107ffc869f1c11ee958cff29c719f35b-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UnlStqmYRAlfvxrZQ5+BdKf3D8frk3pBfaawlyt78ZI=;
	b=TCnhTfyh/ovGzNX6FORx+0e2rFpm8GBBHClavQBhxJ6W8rYGsO3lYi8J06LgObMCQR5StCsyu1vuM/aBG7KKmOmrVXQXY3bDTkJ9CeLCThuwDTP2CP9tzcixvzVMA+XGoZvxP8JVWXxHlSetLDZXcZ1tnn25Ykog5UID6RBkpyg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:e20d0319-894e-4a52-9753-0af2abcf42d9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:fc157a7e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 107ffc869f1c11ee958cff29c719f35b-20231220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 363505924; Wed, 20 Dec 2023 02:42:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 17:21:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 17:21:43 +0800
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
Subject: [PATCH 0/4] wifi: mt76: mt7921: fix potential issues for mt7921
Date: Wed, 20 Dec 2023 17:21:34 +0800
Message-ID: <20231220092138.12830-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.137900-8.000000
X-TMASE-MatchedRID: 4M8Lw78TDBDZK1rQqyNiGTQlj13qze9pFAr+wPWe7jEFi3R9x/2qQoy9
	bZLB2g0gX9TqmrRnueWcLyHbQAbhbRqXhvBXA7wb4bl1FkKDELdMkOX0UoduuQCGaccd4ae9XaT
	Eoipb2i/i8zVgXoAltmHJPdY2OmlS0C1sQRfQzEHEQdG7H66TyF82MXkEdQ77/pY551MkBh8ZGz
	M72QCXy6tXJZ/bai5SBJehHlD3Ahw4/uC4eWuzKA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.137900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F14A6D68CD1AA75A0B5CFB0D2B28BC6ECFA263416674C845491D98645F6630872000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_014222_299010_952FADE4 
X-CRM114-Status: UNSURE (   5.87  )
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

This patchset includes some bugfixes for CLC (Country Location Control),
suspend/resume and ACPI SAR.

Ming Yen Hsieh (4):
  wifi: mt76: mt7921: fix incorrect type conversion for CLC command
  wifi: mt76: mt7921: fix potential command timeout issues when suspend
  wifi: mt76: mt792x: fix a potential loading failure of the 6Ghz
    channel config from ACPI
  wifi: mt76: mt792x: update the country list of EU for ACPI SAR

 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  4 +--
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  2 ++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  | 28 ++++++++++---------
 3 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.18.0


