Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EE3C19F29
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 01:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2FoJzUe9lSoKYKsC9yyy/FQQPS//QbUJ/y1FD2QkfM=; b=Q5zjsri+bEfDpZbAXfUyUPzrVw
	ycYCxkHIC77S5/4UBn5BL4q3gAlHmEz+et0TNZQg2hqlZdWSadG15p5SRQInPHKwF12zE+VLpyeQt
	IX+5QII83cpkr/xCN8C3bYx+xkKdJv3veLuPG3BB4lnxL4R8b5Iu/0yidjLI2c0XNLiMlDMC8zrbh
	x6DJY9Z+W7hf1NNRgc+UFB+7ouHNxU7jEprNmtmt6rIM4XNRSEBcxzil0STKGv09q4xl562i9rsBk
	SgyZQf7RDh8m1ZMh0ilmbWleklwkPInfVZrvwNOGiSHau2hJhifl97nfWfoxe35h9KKFAiBzDC7B3
	sWfuM3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQ8I-00DZVO-Cj; Thu, 04 Aug 2022 01:58:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQ8F-00DZH5-8G
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 01:58:41 +0000
X-UUID: c62c8a0754b7479291d0c59b6c88f5f9-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e27982e2-f593-4f35-a91d-36db8497e6ca,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:0a8b2bd1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c62c8a0754b7479291d0c59b6c88f5f9-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1864342519; Wed, 03 Aug 2022 18:58:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 09:07:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 4 Aug 2022 09:07:46 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Deren Wu" <deren.wu@mediatek.com>
Subject: [PATCH v2] mt76: mt7921: fix antenna signal are way off in monitor mode
Date: Thu, 4 Aug 2022 09:07:45 +0800
Message-ID: <0f95fcdb8511ec765040c8fe85c1fa09437e8ef5.1659574985.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_185839_444261_BAD09789 
X-CRM114-Status: GOOD (  13.40  )
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

From: Sean Wang <sean.wang@mediatek.com>

Group 3 in RxD is disabled in monitor mode. We should use the group 5 in
RxD instead to fix antenna signal way off issue, e.g we would see the
incorrect antenna signal value in wireshark. On the other hand, Group 5
wouldn't be used in STA or AP mode, so the patch shouldn't cause any
harm to those modes.

Fixes: cbaa0a404f8d ("mt76: mt7921: fix up the monitor mode")
Reported-by: Adrian Granados <agranados@gmail.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: drop an unnecessary blank line and fix typo
---
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 32 ++++++++++++-------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 47f0aa81ab02..1c242f2ae997 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -394,6 +394,27 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 		if (v0 & MT_PRXV_HT_AD_CODE)
 			status->enc_flags |= RX_ENC_FLAG_LDPC;
 
+		ret = mt76_connac2_mac_fill_rx_rate(&dev->mt76, status, sband,
+						    rxv, &mode);
+		if (ret < 0)
+			return ret;
+
+		if (rxd1 & MT_RXD1_NORMAL_GROUP_5) {
+			rxd += 6;
+			if ((u8 *)rxd - skb->data >= skb->len)
+				return -EINVAL;
+
+			rxv = rxd;
+			/* Monitor mode would use RCPI described in GROUP 5
+			 * instead.
+			 */
+			v1 = le32_to_cpu(rxv[0]);
+
+			rxd += 12;
+			if ((u8 *)rxd - skb->data >= skb->len)
+				return -EINVAL;
+		}
+
 		status->chains = mphy->antenna_mask;
 		status->chain_signal[0] = to_rssi(MT_PRXV_RCPI0, v1);
 		status->chain_signal[1] = to_rssi(MT_PRXV_RCPI1, v1);
@@ -408,17 +429,6 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 			status->signal = max(status->signal,
 					     status->chain_signal[i]);
 		}
-
-		ret = mt76_connac2_mac_fill_rx_rate(&dev->mt76, status, sband,
-						    rxv, &mode);
-		if (ret < 0)
-			return ret;
-
-		if (rxd1 & MT_RXD1_NORMAL_GROUP_5) {
-			rxd += 18;
-			if ((u8 *)rxd - skb->data >= skb->len)
-				return -EINVAL;
-		}
 	}
 
 	amsdu_info = FIELD_GET(MT_RXD4_NORMAL_PAYLOAD_FORMAT, rxd4);
-- 
2.25.1


