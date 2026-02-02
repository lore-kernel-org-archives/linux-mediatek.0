Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEE9E7C70B
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBsRq9wTSokuZFFA8Dcd1l3YCrpJkoJ/AtXfSB5b7S4=; b=fK1bu9W9KnGHFPpc3uQCT+iZsx
	GCLNQ2cYJUlAh3fgDC/zgHH84guVDNo305vb/XXw+EdN2WIYkPyGCAD5iDhnKwlx/HUrubtRrkZor
	IFYh/+Tp9x3l/ejWJyu7yWUFLhU3Mpx1dsDKkgldYE+bN1S7s3XSc0POm/WiYt5i82V+5ciHji4bb
	+8xRrdoT1LaFPrDjaX/iOrl71A+tK8In/nwSQAvEW+MJBo5s5d0n6xnUhQPys2Fp4RE2H+elqwFmi
	LH+E8eDKXjPl0PT3RNHBVOSWduhByXwGiYZIM7aVM2YCbBGRcuQC1HYd5890XJRXz53UgZW8pOOLW
	QJxZYOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmolO-00000004cVe-3CHw;
	Mon, 02 Feb 2026 07:54:26 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmolM-00000004cUA-2WXK
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 07:54:25 +0000
X-UUID: 605f7da0000c11f1ad39f32c34db0b1c-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OBsRq9wTSokuZFFA8Dcd1l3YCrpJkoJ/AtXfSB5b7S4=;
	b=PVveEnMaU32EXrrhi89hHTuuvPVFqeT/S+OjVrCaIYdCBT2BmII/57GCmT1ElIm6c+MYTx+KOKDd9NeyU+FZhdit7I2AM9fu0DZ3IDsr6cOkcwmsh+TPBrWpH6Vk2D/5pUJI51ZcPZWKNWUoHx3fA+iggBGjQtbpklRyyEy3Zhc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d6780a76-0e79-4839-aa50-a54873c4f7a9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:937a35e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 605f7da0000c11f1ad39f32c34db0b1c-20260202
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1216779718; Mon, 02 Feb 2026 00:54:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 15:54:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 15:54:15 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 5/5] wifi: mt76: mt7996: fix queue pause after scan due to wrong channel switch reason
Date: Mon, 2 Feb 2026 15:53:10 +0800
Message-ID: <20260202075311.365673-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202075311.365673-1-shayne.chen@mediatek.com>
References: <20260202075311.365673-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_235424_709525_27B7FE6A 
X-CRM114-Status: GOOD (  12.97  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Previously, we use the IEEE80211_CONF_IDLE flag to avoid setting the
parking channel with the CH_SWITCH_NORMAL reason, which could trigger TX
emission before bootup CAC.

However, we found that this flag can be set after triggering scanning on a
connected station interface, and the reason CH_SWITCH_SCAN_BYPASS_DPD will
be used when switching back to the operating channel, which makes the
firmware failed to resume paused AC queues.

Seems that we should avoid relying on this flag after switching to single
multi-radio architecture. Instead, replace it with MT76_STATE_RUNNING.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 68d698033e43..1d5ea28e7b9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3925,7 +3925,7 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 	if (phy->mt76->hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
 	else if (phy->mt76->offchannel ||
-		 phy->mt76->hw->conf.flags & IEEE80211_CONF_IDLE)
+		 !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if (!cfg80211_reg_can_beacon(phy->mt76->hw->wiphy, chandef,
 					  NL80211_IFTYPE_AP))
-- 
2.51.0


