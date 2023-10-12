Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47801CDB474
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 22:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ccyMZ2isxwLAUk2a1F8G2q9GYk1tSWppfRXB7kYv7s=; b=Ds2Eo/I8WjE+iQv+64Y/9LP3vf
	u9/SHRJSTcin0EUdit8VdBuK56O4S/jM7LwU+N/GuuZNX1+38OKMf+keriPl5CYUJ79uz3DXRNbhL
	1VyaJwCmNaNlVmubmdTn+YzMq8gyH5mW7/oWOYkJCwpBUhEiOE0PbKFaQChABZMPwOT/kluTyG6A7
	u45dUtrgxpNi5uQbFWSe00xRW3JG2LvWPEftZknfYjkZtVZsc60mTn4++/vSYVvAzgxerA1SLOOmK
	8/rAha1PBySsmvZiK+qibij4siavmAptqGyziP2iWzE6dm4PCe2oMl0wMG/aJSBYxLZCcFbXrspyt
	D2sFmWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr3tC-001xp5-09;
	Thu, 12 Oct 2023 22:10:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr3t9-001xms-0l
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 22:10:41 +0000
X-UUID: 292c79f4694c11ee86758d4a7c00f3a0-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6ccyMZ2isxwLAUk2a1F8G2q9GYk1tSWppfRXB7kYv7s=;
	b=NhDlzRF7CX2X4Hl7bioCYFE8QshZTNYGjKljhkR/tJmES2eog0EgKgmTxlGo5IFUwBUS08g1NMDi7MMtU7QpZnYuAqISpxqvEeZ1CGM5WkKqpLacoimP4uVHISyZfvW3LglcML/1M/9JEVFnwdN4hA1Nu977SpiX2iP5iFByyvo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:365bdacf-3714-4f70-89a4-a18f00346064,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:f66fbaf0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 292c79f4694c11ee86758d4a7c00f3a0-20231012
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 811355640; Thu, 12 Oct 2023 15:10:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Oct 2023 06:00:29 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Oct 2023 06:00:27 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: fix uninitialized variable in parsing txfree
Date: Thu, 12 Oct 2023 15:00:26 -0700
Message-ID: <e6c9a6fdeeaa57d73560c895046da4a58983297d.1697146767.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_151039_284529_2B015755 
X-CRM114-Status: UNSURE (   9.88  )
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
Message-ID: <20231012220026.E24D844tESOqPCyGUeYy0sNHL9yfqRz-OTP1PKnI_Xo@z>

Fix the uninitialized variable warning in mt7996_mac_tx_free.

Fixes: 2461599f835e: "wifi: mt76: mt7996: get tx_retries and tx_failed from txfree"
Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 04540833485f..59ab07b89087 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1074,7 +1074,7 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 	struct mt76_phy *phy3 = mdev->phys[MT_BAND2];
 	struct mt76_txwi_cache *txwi;
 	struct ieee80211_sta *sta = NULL;
-	struct mt76_wcid *wcid;
+	struct mt76_wcid *wcid = NULL;
 	LIST_HEAD(free_list);
 	struct sk_buff *skb, *tmp;
 	void *end = data + len;
-- 
2.39.0


