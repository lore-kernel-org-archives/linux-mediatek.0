Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8CCC46CCD
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 01:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE2EG5ost8SzA/gX5PT8nHP18dhMS5yCBIwP0l0ls7I=; b=mGOkSf5iyiyglUDxFaVqp0z/o6
	aWlhmLfiff1FUtlpv+1IjXmP+yKDclGkUYf5Qv/n9F6MlIFwa96QX9kx2sLlgMxXE6/wap58ZEZB3
	uJfjzgRyphANqSVjSZgS9ZzOk9hTG9haQrN4MX2CNfZRDAJWF9FXEF0il3izL9FWfmnz/cv4jF72W
	KQ8HpHHV6MQNzac2HXQSToWRsQLneeX7xXKCJxb6M5AHCQy6GgcI/2CapMBgsgFRrgYyMVHNSqLgL
	ANzTmlluxtZfWAyLlHaSUL9/SXOQ1lj1EVYMUSbamDt46Elww+Ks1OIQ0ucfeOKyjB7uVgxlbQXe9
	OmHRoUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGU2o-004Zv9-0b;
	Fri, 22 Dec 2023 01:09:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGU2l-004Zuf-0C
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Dec 2023 01:09:40 +0000
X-UUID: c49d64c4a06611ee9b09ad09c76753c8-20231221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bE2EG5ost8SzA/gX5PT8nHP18dhMS5yCBIwP0l0ls7I=;
	b=VE2zAe+POzHp7ECI9BszUAUloIxtP4Pi5d3wGaKPgq6QGcC2ddsRAvV36bMZG8R0j6QYzhwSXfuZYnal5+c48zIl8stGOV+gqxy32lZwB8aw+HhVHJ4zC8Q354rFrUvaiDtI1sJ9nhGYaEqVMGfWxDjLBIlpT//mXkMVfVqoD08=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:85477fc5-6143-42d8-b263-79e7e8d19421,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:67a55b2e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c49d64c4a06611ee9b09ad09c76753c8-20231221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1720254019; Thu, 21 Dec 2023 18:09:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Dec 2023 09:09:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Dec 2023 09:09:31 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [v4,1/2] wifi: mac80211: Add utility for converting op_class into chandef
Date: Fri, 22 Dec 2023 09:09:13 +0800
Message-ID: <20231222010914.6521-2-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
References: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.202000-8.000000
X-TMASE-MatchedRID: +2zAcmHD8Q7LmQtq4MlK+Y+emiGnyeDRUK80YYUAl4sXdhT0BAdFzvMT
	uIrC6WWhsRIB98XGTDmkeU7arquyzm94Ipa1otxo0Xw0ILvo/uUK3n1SHen81Wd6vNuG6Cqy56y
	iAZYPrXdKlBq8feLAYQ1Ica/LQEH+98hoZRVgb5WNzYJBKgDdEbyfV74eQpk+myiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1l3+bAt/YFVROQSbiTNQmeZerkDDruMdsGrj/8opIaOcGqSULbIPBSGA7b
	UFBqh2V
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.202000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6B95A0EE5A464375FFD95EB39FE80FB83A0475E68EA8F450FC127FBA2D7232A82000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_170939_105240_F587BA1D 
X-CRM114-Status: GOOD (  10.74  )
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

This utility is used in STA CSA handling. The op_class in the ECSA
Element can be converted into chandef.

Co-developed-by: Money Wang <money.wang@mediatek.com>
Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
v4: no change
---
 include/net/cfg80211.h | 13 ++++++++
 net/wireless/util.c    | 76 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index d59669d86718..3093c88ab9ec 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -8672,6 +8672,19 @@ void cfg80211_ch_switch_started_notify(struct net_device *dev,
 bool ieee80211_operating_class_to_band(u8 operating_class,
 				       enum nl80211_band *band);
 
+/**
+ * ieee80211_operating_class_to_chandef - convert operating class to chandef
+ *
+ * @operating_class: the operating class to convert
+ * @chan: the ieee80211_channel to convert
+ * @chandef: a pointer to the resulting chandef
+ *
+ * Returns %true if the conversion was successful, %false otherwise.
+ */
+bool ieee80211_operating_class_to_chandef(u8 operating_class,
+					  struct ieee80211_channel *chan,
+					  struct cfg80211_chan_def *chandef);
+
 /**
  * ieee80211_chandef_to_operating_class - convert chandef to operation class
  *
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 626b858b4b35..edcc6f202c19 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2017,6 +2017,82 @@ bool ieee80211_operating_class_to_band(u8 operating_class,
 }
 EXPORT_SYMBOL(ieee80211_operating_class_to_band);
 
+bool ieee80211_operating_class_to_chandef(u8 operating_class,
+					  struct ieee80211_channel *chan,
+					  struct cfg80211_chan_def *chandef)
+{
+	u32 control_freq, offset = 0;
+	enum nl80211_band band;
+
+	if (!ieee80211_operating_class_to_band(operating_class, &band) ||
+	    !chan || band != chan->band)
+		return false;
+
+	control_freq = chan->center_freq;
+	chandef->chan = chan;
+
+	if (control_freq >= 5955)
+		offset = control_freq - 5955;
+	else if (control_freq >= 5745)
+		offset = control_freq - 5745;
+	else if (control_freq >= 5180)
+		offset = control_freq - 5180;
+	offset /= 20;
+
+	switch (operating_class) {
+	case 81:  /* 2 GHz band; 20 MHz; channels 1..13 */
+	case 82:  /* 2 GHz band; 20 MHz; channel 14 */
+	case 115: /* 5 GHz band; 20 MHz; channels 36,40,44,48 */
+	case 118: /* 5 GHz band; 20 MHz; channels 52,56,60,64 */
+	case 121: /* 5 GHz band; 20 MHz; channels 100..144 */
+	case 124: /* 5 GHz band; 20 MHz; channels 149,153,157,161 */
+	case 125: /* 5 GHz band; 20 MHz; channels 149..177 */
+	case 131: /* 6 GHz band; 20 MHz; channels 1..233*/
+	case 136: /* 6 GHz band; 20 MHz; channel 2 */
+		chandef->center_freq1 = control_freq;
+		chandef->width = NL80211_CHAN_WIDTH_20;
+		return true;
+	case 83:  /* 2 GHz band; 40 MHz; channels 1..9 */
+	case 116: /* 5 GHz band; 40 MHz; channels 36,44 */
+	case 119: /* 5 GHz band; 40 MHz; channels 52,60 */
+	case 122: /* 5 GHz band; 40 MHz; channels 100,108,116,124,132,140 */
+	case 126: /* 5 GHz band; 40 MHz; channels 149,157,165,173 */
+		chandef->center_freq1 = control_freq + 10;
+		chandef->width = NL80211_CHAN_WIDTH_40;
+		return true;
+	case 84:  /* 2 GHz band; 40 MHz; channels 5..13 */
+	case 117: /* 5 GHz band; 40 MHz; channels 40,48 */
+	case 120: /* 5 GHz band; 40 MHz; channels 56,64 */
+	case 123: /* 5 GHz band; 40 MHz; channels 104,112,120,128,136,144 */
+	case 127: /* 5 GHz band; 40 MHz; channels 153,161,169,177 */
+		chandef->center_freq1 = control_freq - 10;
+		chandef->width = NL80211_CHAN_WIDTH_40;
+		return true;
+	case 132: /* 6 GHz band; 40 MHz; channels 1,5,..,229*/
+		chandef->center_freq1 = control_freq + 10 - (offset & 1) * 20;
+		chandef->width = NL80211_CHAN_WIDTH_40;
+		return true;
+	case 128: /* 5 GHz band; 80 MHz; channels 36..64,100..144,149..177 */
+	case 133: /* 6 GHz band; 80 MHz; channels 1,5,..,229 */
+		chandef->center_freq1 = control_freq + 30 - (offset & 3) * 20;
+		chandef->width = NL80211_CHAN_WIDTH_80;
+		return true;
+	case 129: /* 5 GHz band; 160 MHz; channels 36..64,100..144,149..177 */
+	case 134: /* 6 GHz band; 160 MHz; channels 1,5,..,229 */
+		chandef->center_freq1 = control_freq + 70 - (offset & 7) * 20;
+		chandef->width = NL80211_CHAN_WIDTH_160;
+		return true;
+	case 130: /* 5 GHz band; 80+80 MHz; channels 36..64,100..144,149..177 */
+	case 135: /* 6 GHz band; 80+80 MHz; channels 1,5,..,229 */
+		  /* The center_freq2 of 80+80 MHz is unknown */
+	case 137: /* 6 GHz band; 320 MHz; channels 1,5,..,229 */
+		  /* 320-1 or 320-2 channelization is unknown */
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL(ieee80211_operating_class_to_chandef);
+
 bool ieee80211_chandef_to_operating_class(struct cfg80211_chan_def *chandef,
 					  u8 *op_class)
 {
-- 
2.25.1


