Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B271C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 02:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0e5ybVv8A6inK3DjzUCu69ObX0ZeiNgIC/GN8KIuikY=; b=T6LUMWvN2sP1gE
	FJgZbXSQd+eQDVAgBY3wNMP8R+81GmjvXj8f9EDoUR5VhY6ppERmg5QYRGnmu612AFSDN4DaY78Fj
	NFGDIb8g9ZVdJwe/+6fRtvusCh/Z0tc2Y3rB3A0CEtsfGfLzuBL2PezoZxIM6sBo35M7lpDq4iYca
	KdLwWwaQNrDgl0sT2msDPYAtTj1wu1Pkk97FZ3Ak4Z0L4y5Gjx/Zktph5VC8vjk6t3YxsZ1+oJDLE
	Ep/dYjRK0QPVmK9k6+IAsTryQeqU2Jk+pTIMivUuAHWsgSy3EfdU95J0vTu+/pcvQFOwuK70lzTki
	q5LnNDIz3KLnkrRcXETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzV7z-005H6X-Oe; Tue, 21 Dec 2021 02:43:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzV7x-005H6G-CC
 for linux-mediatek@lists.infradead.org; Tue, 21 Dec 2021 02:43:46 +0000
X-UUID: bf416e998ed04c9287091715afa75f0c-20211220
X-UUID: bf416e998ed04c9287091715afa75f0c-20211220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1572296545; Mon, 20 Dec 2021 19:43:39 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Dec 2021 18:40:50 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 21 Dec 2021 10:40:46 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 21 Dec 2021 10:40:46 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix kernel build warning
Date: Tue, 21 Dec 2021 10:40:41 +0800
Message-ID: <ac714fe3ce1f74bec7adb971f6145a05aa0554eb.1640054337.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_184345_464365_759253D8 
X-CRM114-Status: UNSURE (   7.73  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

remove the unused variable 'legacy' and 'v1'.

Fixes: d2cf90e432b3 ("mt76: mt7915: update rx rate reporting for mt7916")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index e16df04..ee4535a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -468,14 +468,12 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
 			struct ieee80211_supported_band *sband,
 			__le32 *rxv)
 {
-	u32 v0, v1, v2;
-	u16 legacy;
+	u32 v0, v2;
 	u8 flags, stbc, gi, bw, dcm, mode, nss;
 	int i, idx;
 	bool cck = false;
 
 	v0 = le32_to_cpu(rxv[0]);
-	v1 = le32_to_cpu(rxv[1]);
 	v2 = le32_to_cpu(rxv[2]);
 
 	idx = i = FIELD_GET(MT_PRXV_TX_RATE, v0);
@@ -501,7 +499,6 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
 		fallthrough;
 	case MT_PHY_TYPE_OFDM:
 		i = mt76_get_rate(&dev->mt76, sband, i, cck);
-		legacy = sband->bitrates[i].bitrate;
 		break;
 	case MT_PHY_TYPE_HT_GF:
 	case MT_PHY_TYPE_HT:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
