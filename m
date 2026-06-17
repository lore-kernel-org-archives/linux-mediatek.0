Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7C2CD98EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 07:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFu+ZEr7GfSC3c2MuBlEdz/GNhYnMPO3lh+Ivt81P18=; b=pmPmio9EQoIGxU0Ju58RMRrHf+
	vP1pBahqlsQSSG54ZLwxjlgC1cisASUYarQ/BybQSvJc4ifOpD8XSG8FkAS6F5khMT+ogXQWDBPyB
	wqCzQfvPXKzh8kRsJPBijvEjNIikT/gqbQFh12Gd8oQeVZNKUCrgIVSfF91IF0SyWHM01DjSeqEYD
	miGoOVgq8/zusJM1XyGkJ9JwpZFo9qIQeWYqCrrC1T5PwlD/EiFhcaG/ryLwL+b8KxXGoiE6HJL6x
	GGRzjBS1W6tNulbFkAi4JfAMr5fQ42ZrtywwP9HiXvKszsh9lFHFXa066k23lUkySfK679TyDfVZ2
	vl+f6gXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkSo-0000000GnJm-1YUL;
	Wed, 17 Jun 2026 07:13:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkSm-0000000GnJ7-1pm3
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 07:13:29 +0000
X-UUID: 072105906a1c11f1afed4741b24580c9-20260617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IFu+ZEr7GfSC3c2MuBlEdz/GNhYnMPO3lh+Ivt81P18=;
	b=VcX94E6Wz94mOL4W2eTAqgCASaBQ3ZwMJUMkQ43BOc1qN4lfUAdhAYo5mQbBx4RV9n6sVj5P8znES3CXnmpQAGKgf/Kop0MAp8rYUnr/Fa1NEJZzbipzm+R85/KDHk65Hey2GBgajVvUHabCWCo2Mui+jF+IMcPFlfM2dlHtrA4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:57ee19fc-69ca-4668-8368-c3d8eadce63a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:d497b38,CLOUDID:6c11355f-e8d6-486f-848f-3ae1d0432240,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50,EDM:
	1,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 072105906a1c11f1afed4741b24580c9-20260617
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 784489226; Wed, 17 Jun 2026 00:13:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Jun 2026 15:13:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Jun 2026 15:13:21 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jared.huang@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix msg len mismatch between driver and firmware
Date: Wed, 17 Jun 2026 15:13:20 +0800
Message-ID: <20260617071320.1808499-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001328_480942_30B8D8E3 
X-CRM114-Status: GOOD (  10.70  )
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

From: "Jared.Huang" <jared.huang@mediatek.com>

The mt7925_tx_power_limit_tlv struct begins with a 4-byte rsv[] field
that acts as a UNI command header prefix. The firmware dispatcher did
not use the 4-byte rsv[] and will only check the payloads after the
4-byte rsv[] As a result, the total message length minus the 4-byte
prefix. Fix this by setting len to msg_len - 4.

Fixes: ccb1863 ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Jared.Huang <jared.huang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e94fa544ff20..7d9b8ebf2889 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3827,7 +3827,7 @@ mt7925_mcu_rate_txpower_band(struct mt76_phy *phy,
 		memcpy(tx_power_tlv->alpha2, dev->alpha2, sizeof(dev->alpha2));
 		tx_power_tlv->n_chan = num_ch;
 		tx_power_tlv->tag = cpu_to_le16(0x1);
-		tx_power_tlv->len = cpu_to_le16(msg_len);
+		tx_power_tlv->len = cpu_to_le16(msg_len - 4);
 
 		switch (band) {
 		case NL80211_BAND_2GHZ:
-- 
2.45.2


