Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEE8C43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A2B20675
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Via1L92i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNTwI+T9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A2B20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrCpIITfrVbMDlOr6FXpT6sSpcOuaKy54rhkcTrjpik=; b=Via1L92ihMw9MO
	yzAdqO0nZ+nPM2Gwa4jaJI6IRAWXOX54sNBEheUDXkTsABV/REuhMSF8LzEIJA0T+b8i2RbV8c3j7
	eQZvcrRlhnoMe9ZE6ylgx97zCrUvNHqqnYgPnDSk5f1Cge5oyQluN3hEuJrM2rASQUsksBw9AYeBI
	mg6x2VkFfSopGuA0cqmVJiVgYP6p+4ZjIrq1J0NZ0u5EhnTsF25A+K27w74KWQmG2beRusyMDl+Su
	BbniGHz7aH6RLwIMR7O6Jq0j5yKxUDcPSZJsdbOq2K8x6nzRGsUb9GfobwagnKcyN2IKJMjEVey2C
	3JyX1lkJvGzVbr/unWVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK4Qx-0000eS-5B; Thu, 02 Apr 2020 18:19:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK4Qu-0000cz-3t
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 18:19:17 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F8E720BED;
 Thu,  2 Apr 2020 18:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585851555;
 bh=KjgJPaETZxp1kZfdNo/7sMHsHLl7eVpB6vRIBWMpiz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jNTwI+T9mcZEDeXPDaDu3AE75BdUKZRwrQBHS4q+T+8y1GLT3OQi+1YogUIC0iB31
 aavFW72LnKKctg7QhgLAJrUj6rhrRfdwvs2hL6xZWtGHw4t5Dxx429YDFPziEyMUqn
 DTs5yD/yDX3eJumjzfAzyDnA2hy0VYeNBqd6xtvw=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 2/9] mt76: mt7615: introduce mt7663u support to
 mt7615_write_txwi
Date: Thu,  2 Apr 2020 20:18:49 +0200
Message-Id: <342c53e345ef63211943a00a46ba183f538b2ae4.1585851049.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585851049.git.lorenzo@kernel.org>
References: <cover.1585851049.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_111916_196388_88EFD7C0 
X-CRM114-Status: GOOD (  10.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Extend mt7615_write_txwi routine to support usb txwi configuration

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 12 ++++++++----
 drivers/net/wireless/mediatek/mt76/mt7615/mac.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index c988a104f911..285d3af621ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -526,11 +526,12 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	struct ieee80211_vif *vif = info->control.vif;
 	struct mt76_phy *mphy = &dev->mphy;
 	bool ext_phy = info->hw_queue & MT_TX_HW_QUEUE_EXT_PHY;
+	bool is_usb = mt76_is_usb(&dev->mt76);
 	int tx_count = 8;
 	u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
 	__le16 fc = hdr->frame_control;
+	u32 val, sz_txd = is_usb ? MT_USB_TXD_SIZE : MT_TXD_SIZE;
 	u16 seqno = 0;
-	u32 val;
 
 	if (vif) {
 		struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
@@ -554,7 +555,7 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	if (ieee80211_is_data(fc) || ieee80211_is_bufferable_mmpdu(fc)) {
 		q_idx = wmm_idx * MT7615_MAX_WMM_SETS +
 			skb_get_queue_mapping(skb);
-		p_fmt = MT_TX_TYPE_CT;
+		p_fmt = is_usb ? MT_TX_TYPE_SF : MT_TX_TYPE_CT;
 	} else if (beacon) {
 		if (ext_phy)
 			q_idx = MT_LMAC_BCN1;
@@ -566,10 +567,10 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 			q_idx = MT_LMAC_ALTX1;
 		else
 			q_idx = MT_LMAC_ALTX0;
-		p_fmt = MT_TX_TYPE_CT;
+		p_fmt = is_usb ? MT_TX_TYPE_SF : MT_TX_TYPE_CT;
 	}
 
-	val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + MT_TXD_SIZE) |
+	val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + sz_txd) |
 	      FIELD_PREP(MT_TXD0_P_IDX, MT_TX_PORT_IDX_LMAC) |
 	      FIELD_PREP(MT_TXD0_Q_IDX, q_idx);
 	txwi[0] = cpu_to_le32(val);
@@ -663,6 +664,9 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 
 	txwi[7] = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
 		  FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
+	if (is_usb)
+		txwi[8] = FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
+			  FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index e0b89257db90..422a140fd812 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -165,6 +165,7 @@ enum tx_phy_bandwidth {
 #define MT_CT_INFO_NONE_CIPHER_FRAME	BIT(3)
 #define MT_CT_INFO_HSR2_TX		BIT(4)
 
+#define MT_USB_TXD_SIZE			(MT_TXD_SIZE + 8 * 4)
 #define MT_TXD_SIZE			(8 * 4)
 
 #define MT_TXD0_P_IDX			BIT(31)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
