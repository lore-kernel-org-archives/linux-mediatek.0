Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B94C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 07:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g1e1GiCglxw0G5nYW7W1hnHGQdgv+R0rMWtNcKzW+jo=; b=STZ7rEdEDBj6TkmVt2QZ6ugxhk
	AWFvO9u1wWrLNxM7GOl3MhBYJf0aXFlpZN4U5B4iOmTywYLc69X05B4nEJ8dpXw2yjGKnNXjsqOyS
	9NoatDmJme1cazAi2XUURPKeb0RdBj/w3jbWUvdKH85Bp45LQMlTKG06kydkcq+J0t+sFnIGPNRXt
	X8sGkGamUekcM2bro64vz11lB66Q4efP84KSRgGECe6HHNTCF1OKKHCdkcKltVjUKaPVcRfARBb8y
	NTj2Gt118f2PrafiRv4GcIyQww3sHhWabHntVTocDt7Fv2Nwus/Q102lKJ3Z/Crr+1nINpK+XUT9h
	tfVYbqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Enm-007JvR-13;
	Wed, 29 Nov 2023 07:16:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Dg9-007AQh-2C
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Nov 2023 06:04:25 +0000
X-UUID: 1b7f1a728e7d11ee86758d4a7c00f3a0-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=g1e1GiCglxw0G5nYW7W1hnHGQdgv+R0rMWtNcKzW+jo=;
	b=k2RBnBmhorIxcm6+AFtQdGRcVYI1Wy3AXCjM1qDpOdMAGFLkGLjNuvk8VRmPEDQWWlGhRHkRzHDm1O1OLRtyuOCNXbEioCZeP50MLQtXxkr3WLasJbmnpsw/PKfIS2kwF8XYMPAE2UetSo6XZ7UINhpbVOm1q4f9hGDightarQE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:aed9318f-fd68-4417-a56a-c0d64187697a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:abefa75,CLOUDID:655a3273-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 1b7f1a728e7d11ee86758d4a7c00f3a0-20231128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2040171538; Tue, 28 Nov 2023 23:04:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 Nov 2023 13:43:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 Nov 2023 13:43:32 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH v3,1/2] wifi: mac80211: add utility for converting op_class into chandef
Date: Wed, 29 Nov 2023 13:43:20 +0800
Message-ID: <20231129054321.10199-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.327500-8.000000
X-TMASE-MatchedRID: +2zAcmHD8Q7LmQtq4MlK+Y+emiGnyeDRUK80YYUAl4sXdhT0BAdFzjC0
	pJIQUiJOsRIB98XGTDmkeU7arquyzm94Ipa1otxo0Xw0ILvo/uUK3n1SHen81Wd6vNuG6Cqy56y
	iAZYPrXdKlBq8feLAYQ1Ica/LQEH+98hoZRVgb5WNzYJBKgDdEbyfV74eQpk+myiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1l3+bAt/YFVQDy43aFjnGUlGC9ibFzrTKGL9TwHJQaVYXM+5GWf5LWWgGZ
	NLBHGNe
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.327500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 19297579BCC92BAE0016C51A172C30A1E11B4BE1367D236699A885C686B08E212000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_220409_750911_77ADB5E2 
X-CRM114-Status: GOOD (  12.44  )
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

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Signed-off-by: Money Wang <money.wang@mediatek.com>
---
v3:
  There were two utilities for op_class conversion in version 2.
  This version combines them into one.
---
 include/net/cfg80211.h | 13 ++++++++
 net/wireless/util.c    | 76 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index b137a33a1b68..0ea1f1a53324 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -8669,6 +8669,19 @@ void cfg80211_ch_switch_started_notify(struct net_device *dev,
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


