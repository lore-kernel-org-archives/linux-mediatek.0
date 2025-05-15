Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D68C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 03:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7E0yGV9fq1bLHyrmBJkJI+P3GpWKwf3pIXly3srXsq4=; b=mqIUiaAcg/hVVLJzIyRdxabZgQ
	bUt/YTYCwBbefxnmhEov0QGBCSFrblrjuTobAXeQ6l6Ic/kzNsBQpNruHP3zOooUEeO35S4cIa+3i
	Mh/RWKylmdblccyGzeAEPZi3VwNtpQYrD739qU1Y8ngzWxDwIQ+fNDU4ZPtJTAOFbTNfi5LzhmTlP
	q+rT1Ku2lln5sSWpXTvsKg8GSXXzFT1ma649hgyxkpvJB/exw0pxEkyfhfXXb0P8lr8unemsWD1in
	3c7IQElmNPLFTkoUA/lujWw5uQzMSEK9g6g/Lm5DPNh5o/+3wVo1rFxnr2CAVPIYDIJoFGuZJDE+8
	2jchDWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPKw-0000000GwNL-32uo;
	Thu, 15 May 2025 03:32:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPKu-0000000GwMW-2veY
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 03:32:45 +0000
X-UUID: 4255fd82313d11f08d385d50fb11b32d-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7E0yGV9fq1bLHyrmBJkJI+P3GpWKwf3pIXly3srXsq4=;
	b=oQ6Uh/+Jk1QqxjmWM62Cnh38ztMijfFQyBtRc9f/bH/3pBTvCvVAQjcloc8KvOL5JMWOm2kTMinoRxuHgmqFIp7tjtKZVpUsZECX5VchoF3w/gDzSaczDxIjDELbA1yVlv+KP8fEZep1fVH6/fLIaEtiiB0DDBzd60HR11haq14=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:66f9816a-845c-4041-bb80-dbec7c0019f4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:17acbe97-7410-4084-8094-24619d975b02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4255fd82313d11f08d385d50fb11b32d-20250514
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1012499018; Wed, 14 May 2025 20:32:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 11:32:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 11:32:39 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next 5/9] wifi: mt76: mt7996: fix invalid NSS setting when TX path differs from NSS
Date: Thu, 15 May 2025 11:29:48 +0800
Message-ID: <20250515032952.1653494-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515032952.1653494-1-shayne.chen@mediatek.com>
References: <20250515032952.1653494-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_203244_742850_ED260928 
X-CRM114-Status: GOOD (  11.47  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

The maximum TX path and NSS may differ on a band. For example, one variant
of the MT7992 has 5 TX paths and 4 NSS on the 5 GHz band. To address this,
add orig_antenna_mask to record the maximum NSS and prevent setting an
invalid NSS in mt7996_set_antenna().

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 7bfd19ed9594..87c6192b6384 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -310,6 +310,7 @@ int mt7996_eeprom_parse_hw_cap(struct mt7996_dev *dev, struct mt7996_phy *phy)
 		phy->has_aux_rx = true;
 
 	mphy->antenna_mask = BIT(nss) - 1;
+	phy->orig_antenna_mask = mphy->antenna_mask;
 	mphy->chainmask = (BIT(path) - 1) << dev->chainshift[band_idx];
 	phy->orig_chainmask = mphy->chainmask;
 	dev->chainmask |= mphy->chainmask;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 91c64e3a0860..85c5d76c0c2c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1518,7 +1518,8 @@ mt7996_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 		u8 shift = dev->chainshift[band_idx];
 
 		phy->mt76->chainmask = tx_ant & phy->orig_chainmask;
-		phy->mt76->antenna_mask = phy->mt76->chainmask >> shift;
+		phy->mt76->antenna_mask = (phy->mt76->chainmask >> shift) &
+					  phy->orig_antenna_mask;
 
 		mt76_set_stream_caps(phy->mt76, true);
 		mt7996_set_stream_vht_txbf_caps(phy);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 7c334e319547..c75189a02316 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -312,6 +312,7 @@ struct mt7996_phy {
 	struct mt76_channel_state state_ts;
 
 	u16 orig_chainmask;
+	u16 orig_antenna_mask;
 
 	bool has_aux_rx;
 	bool counter_reset;
-- 
2.39.2


