Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BDEC4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 03:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZywQbXcavj5/ok+uU0CpXxI7ASScmFhLjYN382ZWMIE=; b=sYQsPQYlrgEiLuJQrb/5gEqQ/Q
	hWlMzlPSGEqqmGoBk/3wMBgO/WeRgUXMkJxwkcdgVjM0vSx/pSZQpOYxXL5N31Iyec7E7z1w6dVXv
	tRxHxWEi5A+ln6SCijcuba4+f3Fs8xaIcJYnKq2G8VcyAcec6UfiDO9ZH1xkouzzmaOfhmJk97ZwI
	lCSY96sewqbkLXdUDXAv01HrRtlP2RwzIQ7as6h9KXI1lO1K6ZYlfUF5PAhbK3cmkL98TSosX/REC
	xzFuuhNhSL6X+rt/rH2XKN2CaJlIaXfC+Y+ZKGVXeFM4qYQaOQeKnUqzsmKtJdKxhbnVvCVniAw6A
	aLEUypBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXYez-00000009ZLw-1iiJ;
	Wed, 07 Feb 2024 03:31:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXYew-00000009ZLa-23Et
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 03:31:39 +0000
X-UUID: 62dd4e52c56911eea0bf134e88e6c2dc-20240206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZywQbXcavj5/ok+uU0CpXxI7ASScmFhLjYN382ZWMIE=;
	b=jqumqd/S10wS4Fy7JjBA1outoqMtHGj6X82b2olWniS591eNwch6qnu2RenJuEAUWZp5QQx+y2XtxB+98/hxozKl621ZMhCjp6kVb0PA3bi880uG4RvJzZNUnoYf3VolqfnVB9y1h5B/cuAtfLqtw4Z3jz7oleFA+eOsy4rP0kI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:0127dc07-79bb-4e3e-9884-d8ef626e1146,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:b1a03480-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 62dd4e52c56911eea0bf134e88e6c2dc-20240206
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2123470919; Tue, 06 Feb 2024 20:31:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Feb 2024 11:31:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Feb 2024 11:31:29 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: fix the issue of missing txpwr settings from ch153 to ch177
Date: Wed, 7 Feb 2024 11:31:23 +0800
Message-ID: <20240207033123.26551-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_193138_559600_D5AB78C4 
X-CRM114-Status: GOOD (  10.13  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Because the number of channels to be configured is calculated using the %,
and it results in 0 when there's an exact division, this leads to some
channels not having their tx power configured.

Fixes: 7801da338856 ("wifi: mt76: mt7921: enable set txpower for UNII-4")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 7602f979297d..34693fc3a1cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2104,7 +2104,7 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 		int j, msg_len, num_ch;
 		struct sk_buff *skb;
 
-		num_ch = i == batch_size - 1 ? n_chan % batch_len : batch_len;
+		num_ch = i == batch_size - 1 ? n_chan - i * batch_len : batch_len;
 		msg_len = sizeof(tx_power_tlv) + num_ch * sizeof(sku_tlbv);
 		skb = mt76_mcu_msg_alloc(dev, NULL, msg_len);
 		if (!skb) {
-- 
2.18.0


