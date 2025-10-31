Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66744CCF9FF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Oct 2025 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVR2Scq/9GM22BDLY2SnnA5vPchtACGhKdIGuNj9/y0=; b=dyV4on65+NS5BB9HXFRF8BzwTn
	S5IGwdzRZt4wV+vj9QFc3XUUfenyxWUwdzv9N7HI90MvpS8957UgdYdYh3w/KzWCqp/EPqRUxhxyp
	uWCL77FhOHTgQueWdVSgAzDhKrHybvWtZjrzpvis2B1BasbxVLkIW2arw+3WCs5fI/33SvzYDq2HU
	yhR7r2+YPmeeOvH3GDmhb1op0BC3A7s3ftNS8MZH/b05+8Mri3Z9SXCCVfL1ARlTcmQgnwK+a+pHY
	tUDzOHvbHZ+OcPG/Ga3TupOw7mV5vCZsFmUWuo5SoGUFHHFBOBAFgPiMX/XcHNxQRg8L+QerpeWEF
	fR+1PtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3O-00000005k1D-3lf9;
	Fri, 31 Oct 2025 09:04:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3L-00000005jzB-3t1N
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Oct 2025 09:04:13 +0000
X-UUID: 8f1dd2eab63811f09f706fa2197c6ceb-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UVR2Scq/9GM22BDLY2SnnA5vPchtACGhKdIGuNj9/y0=;
	b=WTSqKpics2Usu1MGKmzJ4WoptYImQszYRlrTX68XCJQRWs7cr8UnYm7dniklYYEWd12Q4FjAKOnrsdWqhDaiAOit4BvjEeOKFvzpFzGu0DR/cLvRMAUfDBNIhKmo/guYhkNCA2boy65dKtevNdhCQKn6IcnlOrxsL+72DOA9D4I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:68024398-0f4c-4f4c-aa38-f683fd9fc301,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:d3acc518-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8f1dd2eab63811f09f706fa2197c6ceb-20251031
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 428698379; Fri, 31 Oct 2025 02:04:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 17:04:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 17:04:05 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 4/6] wifi: mt76: mt7925: improve EHT capability control in regulatory flow
Date: Fri, 31 Oct 2025 17:03:50 +0800
Message-ID: <20251031090352.1400079-5-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031090352.1400079-1-mingyen.hsieh@mediatek.com>
References: <20251031090352.1400079-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020412_008747_A6DCFC5F 
X-CRM114-Status: GOOD (  11.90  )
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

Move EHT flag handling into mt7925_regd_channel_update() to ensure
correct channel capability reporting.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c   |  2 --
 .../net/wireless/mediatek/mt76/mt7925/regd.c   | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f9993f191448..92d7a6eb4179 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1376,8 +1376,6 @@ void mt7925_scan_work(struct work_struct *work)
 				if (!is_valid_alpha2(evt->alpha2))
 					break;
 
-				mt7925_regd_be_ctrl(phy->dev, evt->alpha2);
-
 				if (mdev->alpha2[0] != '0' && mdev->alpha2[1] != '0')
 					break;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
index b36c6a6f5da6..12d8aac16e34 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
@@ -83,6 +83,17 @@ mt7925_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 			dev->phy.clc_chan_conf &= ~MT7925_UNII_6G_IS_VALID;
 	}
 
+	sband = wiphy->bands[NL80211_BAND_2GHZ];
+	if (!sband)
+		return;
+
+	for (i = 0; i < sband->n_channels; i++) {
+		ch = &sband->channels[i];
+
+		if (!dev->has_eht)
+			ch->flags |= IEEE80211_CHAN_NO_EHT;
+	}
+
 	sband = wiphy->bands[NL80211_BAND_5GHZ];
 	if (!sband)
 		return;
@@ -93,6 +104,9 @@ mt7925_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 		/* UNII-4 */
 		if (IS_UNII_INVALID(0, 5845, 5925, ch->center_freq))
 			ch->flags |= IEEE80211_CHAN_DISABLED;
+
+		if (!dev->has_eht)
+			ch->flags |= IEEE80211_CHAN_NO_EHT;
 	}
 
 	sband = wiphy->bands[NL80211_BAND_6GHZ];
@@ -108,6 +122,9 @@ mt7925_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 		    IS_UNII_INVALID(3, 6525, 6875, ch->center_freq) ||
 		    IS_UNII_INVALID(4, 6875, 7125, ch->center_freq))
 			ch->flags |= IEEE80211_CHAN_DISABLED;
+
+		if (!dev->has_eht)
+			ch->flags |= IEEE80211_CHAN_NO_EHT;
 	}
 }
 
@@ -128,6 +145,7 @@ int mt7925_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
 	if (ret < 0)
 		goto err;
 
+	mt7925_regd_be_ctrl(dev, alpha2);
 	mt7925_regd_channel_update(wiphy, dev);
 
 	ret = mt7925_mcu_set_channel_domain(hw->priv);
-- 
2.34.1


