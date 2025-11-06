Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C822CCFA03
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NMx8D6zSS3pb0cJpJ/BcVu1SlX0wjR/kFyRpaLj1UU4=; b=PvP7KfcFUKkzuSKZjHdFU4kGMH
	F1zT3/01XdzUYWTy/UvjDr58jtE+YfWQyXoP/KZfQrDmX+mUs5IpHrwbVEaqkig7jWjmwFdPn3Frp
	dfIeZRZXqEQyvoeEoAjnf8+jLw/0xbtuJEHwjDZJXF8Qz4tm8FA+ue1j1SJTk4UnXh2IPCkyM/KdK
	8PaWxfA/50sIwLSdgg/yRJ4LYHNxUUK3XqCxGt6UX1WZtPgv0AICU/M+oTQ7gbWkYYHgtd17EE3hR
	ZyLlFfsyCNW+oqkgZ4Wq0e6GnUO6QL/1sz5fGzA3wzGi22hp6ntNyE7OvgaArvMRUPviMg6x++VHQ
	g/xe+uZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwBt-0000000F96u-1N2a;
	Thu, 06 Nov 2025 09:22:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwBq-0000000F96b-40Vi
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 09:22:00 +0000
X-UUID: 09c276aabaf211f0a52f393f94899d25-20251106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NMx8D6zSS3pb0cJpJ/BcVu1SlX0wjR/kFyRpaLj1UU4=;
	b=MGpMpJExAz9uNfZuK8UFgJqFSRhZz/a0wT9yHHvRLM7BuZMP2W7hCZ01yjBBjywUDHs7HSxBbkgmSZwcfWWSiG/Lv28eHUFcZh7bEfXyTPJVSSuT1thJmdevDfhxdybs8tbImEDvvKnlFmtsLy2lVnwj2w5a9sDGlDoQFpBwsx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:35a04750-082e-4c84-b396-63f9a776326a,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:a9d874c,CLOUDID:5abf1b6b-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 09c276aabaf211f0a52f393f94899d25-20251106
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 21158352; Thu, 06 Nov 2025 02:21:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 17:21:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 17:21:52 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Michael Lo <michael.lo@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: ensure the 6GHz A-MPDU density cap from the hardware.
Date: Thu, 6 Nov 2025 17:21:51 +0800
Message-ID: <20251106092151.1061648-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_012159_009342_B7C07916 
X-CRM114-Status: UNSURE (   8.57  )
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

From: Michael Lo <michael.lo@mediatek.com>

Set the 6GHz HE A-MPDU density from the hardware capability instead of a
hardcoded value, ensuring accurate capability reporting.

Signed-off-by: Michael Lo <michael.lo@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0e5a72638746..078c65859339 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -139,10 +139,14 @@ mt7925_init_he_caps(struct mt792x_phy *phy, enum nl80211_band band,
 	}
 
 	if (band == NL80211_BAND_6GHZ) {
+		struct ieee80211_supported_band *sband =
+			&phy->mt76->sband_5g.sband;
+		struct ieee80211_sta_ht_cap *ht_cap = &sband->ht_cap;
+
 		u16 cap = IEEE80211_HE_6GHZ_CAP_TX_ANTPAT_CONS |
 			  IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
 
-		cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_0_5,
+		cap |= u16_encode_bits(ht_cap->ampdu_density,
 				       IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START) |
 		       u16_encode_bits(IEEE80211_VHT_MAX_AMPDU_1024K,
 				       IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP) |
-- 
2.34.1


