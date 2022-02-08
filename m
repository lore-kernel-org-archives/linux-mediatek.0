Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BD2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 19:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUcU8TrpONXoaFj+q8Ozloz08Eko6urtUSFaNYD4ALw=; b=m8CL2Mw27ZBJoB
	r9RoTo8WXj3vYugpaCNrW5/1JAKSbxz7/i9Nar9z5XDn2MVAooK8zYdqc+tmOWC4Apx0QEnWdoZyN
	UHwXMa1Ulf3OdvW8kqpMoB3Uoev614aZ5RLBO7i7+z4aQYO5+CeXXw4EVdt/NZBQRXASvA8fCG18c
	TJoPk1F7Dh41STUL1GMqsMWLmxfzUhL+2jrs0cxXRhy9SqCyAB/4MBC6rsr7VNJHAHyLztF/RbJg0
	dDkPCT7giyyu+FYNULeHWN09KUDCmGaC7His17RHkwwgB9fASvFaBwz83+BFV28FNatjkEFgMcx6o
	+a1BUEFUwUwxP1Mk+a1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHW13-00FOX3-Gv; Tue, 08 Feb 2022 19:19:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHW0z-00FOWk-HZ
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 19:19:04 +0000
X-UUID: 43b959952e7c4e7a9c65c1dfe3fda918-20220208
X-UUID: 43b959952e7c4e7a9c65c1dfe3fda918-20220208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2006760816; Tue, 08 Feb 2022 12:19:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 11:18:58 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Feb 2022 03:18:57 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Feb 2022 03:18:56 +0800
From: <sean.wang@mediatek.com>
To: <deren.wu@mediatek.com>
CC: <lorenzo.bianconi@redhat.com>, <nbd@nbd.name>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>,
 <evelyn.tsai@mediatek.com>, <Ryder.Lee@mediatek.com>,
 <Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921s: fix missing fc type/sub-type for 802.11
 pkts
Date: Wed, 9 Feb 2022 03:18:55 +0800
Message-ID: <1644347935-20006-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <33dd8e4b7f7f72d191e8eca88b33b32dbf2595d2.1644313224.git.deren.wu@mediatek.comk--annotate>
References: <33dd8e4b7f7f72d191e8eca88b33b32dbf2595d2.1644313224.git.deren.wu@mediatek.comk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_111901_635022_E303B354 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Sean Wang <sean.wang@mediatek.com>

>from: Deren Wu <deren.wu@mediatek.com>
>
>For non-mmio devices, should set fc values to proper txwi config
>
>Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
>Co-developed-by: Leon Yen <Leon.Yen@mediatek.com>
>Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
>Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Tested-by: Sean Wang <sean.wang@mediatek.com>

>---
> drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 13 ++++++++++---  drivers/net/wireless/mediatek/mt76/mt7921/mac.h |  3 +++
> 2 files changed, 13 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>index d17558349a17..e403f0225b77 100644
>--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>@@ -852,6 +852,7 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev, __le32 *txwi,
>	__le16 fc = hdr->frame_control;
>	u8 fc_type, fc_stype;
>	u32 val;
>+	bool is_mmio = mt76_is_mmio(&dev->mt76);
>
>	if (ieee80211_is_action(fc) &&
>	    mgmt->u.action.category == WLAN_CATEGORY_BACK && @@ -912,9 +913,15 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev, __le32 *txwi,
>		txwi[3] |= cpu_to_le32(val);
>	}
>
>-	val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
>-	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
>-	txwi[7] |= cpu_to_le32(val);
>+	if (is_mmio) {
>+		val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
>+		      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
>+		txwi[7] |= cpu_to_le32(val);
>+	} else {
>+		val = FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
>+		      FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
>+		txwi[8] |= cpu_to_le32(val);
>+	}
> }
>
> void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi, diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h b/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
>index 544a1c33126a..12e1cf8abe6e 100644
>--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
>+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
>@@ -284,6 +284,9 @@ enum tx_mcu_port_q_idx {
> #define MT_TXD7_HW_AMSDU		BIT(10)
> #define MT_TXD7_TX_TIME			GENMASK(9, 0)
>
>+#define MT_TXD8_L_TYPE			GENMASK(5, 4)
>+#define MT_TXD8_L_SUB_TYPE		GENMASK(3, 0)
>+
> #define MT_TX_RATE_STBC			BIT(13)
> #define MT_TX_RATE_NSS			GENMASK(12, 10)
> #define MT_TX_RATE_MODE			GENMASK(9, 6)
>--
>2.18.0
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
