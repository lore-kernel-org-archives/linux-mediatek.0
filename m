Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2116C433E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 12:46:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A518620578
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 12:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFVyYUhg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGDqvh/q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A518620578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h8gphlZP6SR/XgIEJ6DkVNCw576ka5HI77BYRrwP7xs=; b=hFVyYUhgbIklOeSsQEN2xdFVm
	rNQVfmUUpyTQtULaNTFCO+K5ohMb3jG49OY2G01pk94qBBEDj9OxQ3omizSM5yIVFvSHb+FBr+sQ4
	mwgyaoEVPbR53rVotixP5tewAegBLbKHfEDYOC83LjLtCpw8dyGmTMe5k8nWcRFY5C8dbEdsmiZaI
	4YaHabhXSr9QQ78mDNbTfBRuPFdHMh+SAQl8Do03VsFrRvq4weIznQNFaXex/6mcl2tmu9dRN1zqZ
	Eadr4P8W5mCgw/NhYXcKP1338WJGf22CVaWO9F4aSnhwozwEdw1L92ONk46mqinOY2wk71DOKiGZ4
	3/7TMp7CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvgoD-0003U6-8h; Wed, 15 Jul 2020 12:46:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvgoB-0003Tc-DC
 for linux-mediatek@lists.infradead.org; Wed, 15 Jul 2020 12:46:48 +0000
Received: from localhost.localdomain.com (unknown [151.48.133.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AD3E20578;
 Wed, 15 Jul 2020 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594817206;
 bh=AAyMsSxS3Zbrr3T5QeyFKdSYFNMg+D2IWFw9DdVM2Bs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZGDqvh/q90lB4tNHe6uCkCDco3Rh8nxOwkIk0CB733FDsQ+kcuJhzkagHreWL+tFI
 sMDU8jmRpoJCy5SbwBDIg7lgEuFvZtJoJEh9OlidrFtiXjaL/y2+m6U8gqyGWSyxYr
 UPyYugoYw2NXmXbgbUwmwLWWkl7wdUNYryGG7UUQ=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 1/6] mt76: mt7615: take into account sdio bus configuring
 txwi
Date: Wed, 15 Jul 2020 14:46:26 +0200
Message-Id: <980bfaaca2e8a19e2e0196e8a90163f0a2efdb18.1594815602.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1594815602.git.lorenzo@kernel.org>
References: <cover.1594815602.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_084647_533894_5158B15A 
X-CRM114-Status: GOOD (  11.75  )
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

usb and sdio relies on SF architecture. This is a preliminary patch to
add SDIO support to mt76 driver

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 126c54afefd4..afac8d81d317 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -529,18 +529,18 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 			  struct ieee80211_sta *sta, int pid,
 			  struct ieee80211_key_conf *key, bool beacon)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	bool ext_phy = info->hw_queue & MT_TX_HW_QUEUE_EXT_PHY;
 	bool multicast = is_multicast_ether_addr(hdr->addr1);
 	struct ieee80211_vif *vif = info->control.vif;
+	bool is_mmio = mt76_is_mmio(&dev->mt76);
+	u32 val, sz_txd = is_mmio ? MT_TXD_SIZE : MT_USB_TXD_SIZE;
 	struct mt76_phy *mphy = &dev->mphy;
-	bool ext_phy = info->hw_queue & MT_TX_HW_QUEUE_EXT_PHY;
-	bool is_usb = mt76_is_usb(&dev->mt76);
-	int tx_count = 8;
-	u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
 	__le16 fc = hdr->frame_control;
-	u32 val, sz_txd = is_usb ? MT_USB_TXD_SIZE : MT_TXD_SIZE;
+	int tx_count = 8;
 	u16 seqno = 0;
 
 	if (vif) {
@@ -566,10 +566,10 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 		p_fmt = MT_TX_TYPE_FW;
 		q_idx = ext_phy ? MT_LMAC_BCN1 : MT_LMAC_BCN0;
 	} else if (skb_get_queue_mapping(skb) >= MT_TXQ_PSD) {
-		p_fmt = is_usb ? MT_TX_TYPE_SF : MT_TX_TYPE_CT;
+		p_fmt = is_mmio ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
 		q_idx = ext_phy ? MT_LMAC_ALTX1 : MT_LMAC_ALTX0;
 	} else {
-		p_fmt = is_usb ? MT_TX_TYPE_SF : MT_TX_TYPE_CT;
+		p_fmt = is_mmio ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
 		q_idx = wmm_idx * MT7615_MAX_WMM_SETS +
 			mt7615_lmac_mapping(dev, skb_get_queue_mapping(skb));
 	}
@@ -675,7 +675,7 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	txwi[7] = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
 		  FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype) |
 		  FIELD_PREP(MT_TXD7_SPE_IDX, 0x18);
-	if (is_usb)
+	if (!is_mmio)
 		txwi[8] = FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
 			  FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
