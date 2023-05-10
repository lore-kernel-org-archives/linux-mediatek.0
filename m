Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53B6C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tx9CfWRYSGHMpHne4BeMeiM05WCsy/k7BT7zMI9zAyc=; b=4EU4OiIFyZAIMltP5+hlcDrK7t
	FcKHeFde5yRAXX4DpAAahpde2W4S2dSJLwn4yfZlsuGQTF67xFO5bnnvkPk1oo6ECzRI2DsP8oN7N
	yZyPnnNnSecLf8JN2ZxTH67kGP6QG1Z5U5e49NT3ah2PK45AuWp0zwmB+G0kS8qOj/LjR29ZcOo89
	CMbTWVFmy+N04E4n98Z8B4UBYfhCOaCUinGjkwXO0QSOHWAkZHwOYTbKouKaWn/Rv7pVz+IUHzSNQ
	2ZgLlGxSg48DBeXXodV7nOATBRCAJujhG8oCYkVKIPxY5jI5I3WSzw1z4fZroAaAa9lppyhPERyon
	WMiS2Y+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwe1H-005MPr-1D;
	Wed, 10 May 2023 07:13:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwe1F-005MPU-18
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 07:13:50 +0000
X-UUID: 32eef350ef0211ed83ed1395ce914268-20230510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tx9CfWRYSGHMpHne4BeMeiM05WCsy/k7BT7zMI9zAyc=;
	b=UgF+6FYJZevkbaFLaWeS/cL9frDY2tSXxlZtuvebQOJlFTRx/IHBxW37tHlPdZXfpj6S7WYM50m8x2X4nDzt4edqxc4azKDu8apwCVBj+209yoF4NIaervNzqwsDMBk1VmXZr/zj7azoepgUEzVQlKUGLF6rGaIvPwPLFtJln04=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:f55b1c69-a0f7-418b-9cb1-d09fe98753ce,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:178d4d4,CLOUDID:e113576b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 32eef350ef0211ed83ed1395ce914268-20230510
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1778979597; Wed, 10 May 2023 00:13:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 14:53:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 14:53:09 +0800
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
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH] wifi: mt76: mt7921: do not support one stream on secondary antenna only
Date: Wed, 10 May 2023 14:51:13 +0800
Message-ID: <cc94dbd5a53537e82d0beaa2d986f0b18e06eee4.1683700651.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_001349_403028_6DCFF8E8 
X-CRM114-Status: GOOD (  11.02  )
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

mt7921 support following antenna combiantions only.
* primary + secondary (2x2)
* primary only        (1x1)

Since we cannot work on secondary antenna only, return error if the
antenna bitmap is 0x2 in .set_antenna().

For example:
iw phy0 set antenna 3 3 /* valid */
iw phy0 set antenna 1 1 /* valid */
iw phy0 set antenna 2 2 /* invalid */

Cc: stable@vger.kernel.org
Fixes: e0f9fdda81bd ("mt76: mt7921: add ieee80211_ops")
Suggested-by: Knox Chiou <knoxchiou@google.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 0c9a472bc81a..6c971c30d6a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1364,7 +1364,7 @@ mt7921_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 		return -EINVAL;
 
 	if ((BIT(hweight8(tx_ant)) - 1) != tx_ant)
-		tx_ant = BIT(ffs(tx_ant) - 1) - 1;
+		return -EINVAL;
 
 	mt7921_mutex_acquire(dev);
 
-- 
2.18.0


