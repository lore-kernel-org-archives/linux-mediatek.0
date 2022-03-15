Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WCoNEXEg5f82iSlWWtIQHEEPpS1XY9ZKJoFEOoyVo48=; b=3m6N1CXOHC6ZPS
	u+kYb3KqUhB5P8mHfOVG8P7ZEskxzroWs6fXsVFU/AzbQdWoDWDokqi2Qm6Y2fwXbp1TyhHnF6adf
	wqSdUvQpnTMOqv8mgpLMc/YyNz0tXh1KuNgU9EceU6yCnUcf1rjiXTNPNAN7fSpdppwMU+Zkq4fgx
	ZaKHv5+6qrWVtXe0unKXH5J07rjARejDFnEiSsWvGyPPyYZz1FK7IxShWcaIQp24gs7tezipAy8zh
	PG77ynzi/yN98DME7SiNoFcR5xEfu4VFlVaciHhUgyWmx2YYiK21Yg6Phh7lz/D2Jfdm2ZSLgeqAX
	gcFxe8hIXELAWMQo8tpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU9yl-009sMM-Ny; Tue, 15 Mar 2022 16:24:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU9yi-009sL9-5p
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 16:24:58 +0000
X-UUID: 82ba5ddbc1e4462d8d2e9979c61dfe54-20220315
X-UUID: 82ba5ddbc1e4462d8d2e9979c61dfe54-20220315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 922478829; Tue, 15 Mar 2022 09:24:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 09:24:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Mar 2022 00:24:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 00:24:45 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: fix wrong HE data rate in sniffer tool
Date: Wed, 16 Mar 2022 00:24:34 +0800
Message-ID: <0c9519fe98d40970017a01e40c6d35885937fde2.1647360139.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_092456_256286_4D30B621 
X-CRM114-Status: UNSURE (   9.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Deren Wu <deren.wu@mediatek.com>

Due to the missing IEEE80211_RADIOTAP_HE_DATA1_BW_RU_ALLOC_KNOWN in
status report, the HE rate in wirehsark/tcpdump always shows wrong value.
Applications will refer to IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC
when the flag is set and shows the correct data rate.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 6 ++++--
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 47d5a993c9c7..e9e7efbf350d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -349,14 +349,16 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb, __le32 *rxv, u32 mode)
 	case MT_PHY_TYPE_HE_SU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_SU) |
 			     HE_BITS(DATA1_UL_DL_KNOWN) |
-			     HE_BITS(DATA1_BEAM_CHANGE_KNOWN);
+			     HE_BITS(DATA1_BEAM_CHANGE_KNOWN) |
+			     HE_BITS(DATA1_BW_RU_ALLOC_KNOWN);
 
 		he->data3 |= HE_PREP(DATA3_BEAM_CHANGE, BEAM_CHNG, rxv[14]) |
 			     HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
 		break;
 	case MT_PHY_TYPE_HE_EXT_SU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_EXT_SU) |
-			     HE_BITS(DATA1_UL_DL_KNOWN);
+			     HE_BITS(DATA1_UL_DL_KNOWN) |
+			     HE_BITS(DATA1_BW_RU_ALLOC_KNOWN);
 
 		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 8bd8b4fe1047..3ff2a4c428ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -304,14 +304,16 @@ mt7921_mac_decode_he_radiotap(struct sk_buff *skb, __le32 *rxv, u32 mode)
 	case MT_PHY_TYPE_HE_SU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_SU) |
 			     HE_BITS(DATA1_UL_DL_KNOWN) |
-			     HE_BITS(DATA1_BEAM_CHANGE_KNOWN);
+			     HE_BITS(DATA1_BEAM_CHANGE_KNOWN) |
+			     HE_BITS(DATA1_BW_RU_ALLOC_KNOWN);
 
 		he->data3 |= HE_PREP(DATA3_BEAM_CHANGE, BEAM_CHNG, rxv[14]) |
 			     HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
 		break;
 	case MT_PHY_TYPE_HE_EXT_SU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_EXT_SU) |
-			     HE_BITS(DATA1_UL_DL_KNOWN);
+			     HE_BITS(DATA1_UL_DL_KNOWN) |
+			     HE_BITS(DATA1_BW_RU_ALLOC_KNOWN);
 
 		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
 		break;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
