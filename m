Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A751C678D5
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Mar 2023 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+nX4DmXaWAu5GaLRZX1v8/uR3NbT5kE2UzeDElONlw=; b=whO2FTkI4Gg3dB430lRUzn7PWq
	x8n/zkLS2rDaDF0AfVq5xllq7O7+vd75IyAD0xa95iUg1fJtHlnyq8u3FmUD6phaLbgVUzsyL0tKo
	/DwlSmrUc63EcdFmQ1z8vmMcq3/tvln6yl56FJHPszfQrbe5l2zTgGxxTQKYurCqspLE9vFaijGKn
	o0LSk+blQU7lBFcy6Ynwz30doo7qMKWxyg5LZdaPSQkOqLGuZulNVjbpDVmPA46OFosDfagt7kCcX
	4MZeZpy/3Q1w4UNqb4Kyp5yffM21JZzKz9QR28f6qLiA6sGI88vv4WcJxHnrQ1wBDXV80j8Hv0tNx
	vPYQ/eJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYMyY-008ZGB-Rn; Sat, 04 Mar 2023 08:10:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYMyV-008ZF9-Uw
	for linux-mediatek@lists.infradead.org; Sat, 04 Mar 2023 08:10:41 +0000
X-UUID: 0671747eba6411edbbe3f76fe852e059-20230304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=M+nX4DmXaWAu5GaLRZX1v8/uR3NbT5kE2UzeDElONlw=;
	b=DiQEHvv1AXnYPoOU6TwDw6kpx2aPAnxYp6f6zAV6YepAjUTsy1IkUBvUzc0Jv7PmODdUi0VGLulcFqlr9qrqljSSeXE6Anz7F+MFZhOJS8Tr8IiQJVDi3zGjoWx+lPfLkcgUzcjSSmjnIK3aBfyp9+uWawSmaVLxXsXyJxYRs6o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:163cb6bc-6a2c-4249-bc21-e637930796c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:44fe4d27-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 0671747eba6411edbbe3f76fe852e059-20230304
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1591237435; Sat, 04 Mar 2023 01:10:28 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Sat, 4 Mar 2023 16:09:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sat, 4 Mar 2023 16:09:54 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Neil Chen <yn.chen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: use driver flags rather than mac80211 flags to mcu
Date: Sat, 4 Mar 2023 16:09:51 +0800
Message-ID: <fce2160648ed8a83248e8998cf76bbe05de0e8a0.1677912476.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_001040_052533_835F4DD2 
X-CRM114-Status: GOOD (  10.38  )
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

From: Neil Chen <yn.chen@mediatek.com>

FIF_* flags from mac80211 is not ABI. mt7921 should not pass it into mcu
directly. Remap FIF_* to driver defined flags as mcu command input.

Fixes: c222f77fd421 ("wifi: mt76: mt7921: fix rx filter incorrect by drv/fw inconsistent")
Signed-off-by: Neil Chen <yn.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c    | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 75eaf86c6a78..f67b37d38dbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -703,10 +703,25 @@ static void mt7921_configure_filter(struct ieee80211_hw *hw,
 				    unsigned int *total_flags,
 				    u64 multicast)
 {
+#define MT7921_FILTER_FCSFAIL    BIT(2)
+#define MT7921_FILTER_CONTROL    BIT(5)
+#define MT7921_FILTER_OTHER_BSS  BIT(6)
+#define MT7921_FILTER_ENABLE     BIT(31)
+
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	u32 flags = MT7921_FILTER_ENABLE;
+
+#define MT7921_FILTER(_fif, _type) do {			\
+		if (*total_flags & (_fif))		\
+			flags |= MT7921_FILTER_##_type;	\
+	} while (0)
+
+	MT7921_FILTER(FIF_FCSFAIL, FCSFAIL);
+	MT7921_FILTER(FIF_CONTROL, CONTROL);
+	MT7921_FILTER(FIF_OTHER_BSS, OTHER_BSS);
 
 	mt7921_mutex_acquire(dev);
-	mt7921_mcu_set_rxfilter(dev, *total_flags, 0, 0);
+	mt7921_mcu_set_rxfilter(dev, flags, 0, 0);
 	mt7921_mutex_release(dev);
 
 	*total_flags &= (FIF_OTHER_BSS | FIF_FCSFAIL | FIF_CONTROL);
-- 
2.18.0


