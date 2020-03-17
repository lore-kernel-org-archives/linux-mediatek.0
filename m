Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE17EC3F2CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8517E20663
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X687oHNU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxoPTf18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8517E20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5Iced7GVVgU76GJlTTSrFvnhfR5EB3lxN/QHHgH3uw=; b=X687oHNUEj3eQF
	3i1JNHbqWwP8Q8h25nRebP6Itor+gOKnHkebt0acemDPrYK0bs3RVwU13WJfmNqIhP9N4Uwlgdy/r
	Qfg3WEfMWAHZrWaP+gCxxiSgbxTAVxHZ7RxUz6oAsQnghlPzIyx4pBid1yBg6UiFMyFP0dTnj5QiU
	4+Z1vJNkSSZ10S/WoDA8Ozgd/BKdRRIVnhXbr5UHvPfpLU8M6hGsGR9ZQmW3Stw6e8YsrnHIRl3Q6
	aJOG/oRu1mkwmVxaOS7XH13/NK4PffKVKNOrEg8/w1x3oa2dpwUFaMmRTrZ2NWGpWF77Qy3V+hOGk
	hcwZukVyjSQDqM14UBlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIi-0007T6-Aq; Tue, 17 Mar 2020 16:42:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIZ-0007Go-VT
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:37 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B66E20735;
 Tue, 17 Mar 2020 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463355;
 bh=L5q3VVBKVbFYJekTlRkKmcAza/3+JaJTZA6P0VDigdc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mxoPTf18EWbM6VOqMm9Ed9ueS52y53TtUSko1zjw4XFhsk60RyTsgnB9b+TbytawT
 c1Nm6xFe7Kgnfcs6ljogO1PadMnTwzAXUdioviytfAZrOyL5jQkiKW9Sb0riDU4u4H
 cOYgCgQnithK8ydNVnIJ/TL2hp+yBUoFzR/uguyw=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 23/25] mt76: mt7615: introduce set_ba uni command
Date: Tue, 17 Mar 2020 17:41:30 +0100
Message-Id: <0735a673686fc44c01c7154f86f01691f1cb01fe.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094236_081220_9995FC23 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

Introduce mt7615_mcu_uni_set_ba routine in order to add support
for mt7663e driver

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 7dd5826be305..9840933211a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1314,6 +1314,88 @@ mt7615_mcu_uni_add_beacon_offload(struct mt7615_dev *dev,
 				   &req, sizeof(req), true);
 }
 
+static int
+mt7615_mcu_uni_tx_ba(struct mt7615_dev *dev,
+		     struct ieee80211_ampdu_params *params,
+		     bool enable)
+{
+	struct mt7615_sta *msta = (struct mt7615_sta *)params->sta->drv_priv;
+	struct mt7615_vif *mvif = msta->vif;
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct tlv *sta_wtbl;
+	struct sk_buff *skb;
+	int err;
+
+	skb = mt7615_mcu_alloc_sta_req(mvif, msta);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL,
+				      sizeof(struct sta_rec_wtbl));
+
+	wtbl_hdr = mt7615_mcu_alloc_wtbl_req(msta, WTBL_SET, sta_wtbl, &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
+	mt7615_mcu_wtbl_ba_tlv(skb, params, enable, true, sta_wtbl,
+			       wtbl_hdr);
+
+	err =  __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_UNI_CMD_STA_REC_UPDATE, true);
+	if (err < 0)
+		return err;
+
+	skb = mt7615_mcu_alloc_sta_req(mvif, msta);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7615_mcu_sta_ba_tlv(skb, params, enable, true);
+
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_UNI_CMD_STA_REC_UPDATE, true);
+}
+
+static int
+mt7615_mcu_uni_rx_ba(struct mt7615_dev *dev,
+		     struct ieee80211_ampdu_params *params,
+		     bool enable)
+{
+	struct mt7615_sta *msta = (struct mt7615_sta *)params->sta->drv_priv;
+	struct mt7615_vif *mvif = msta->vif;
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct tlv *sta_wtbl;
+	struct sk_buff *skb;
+	int err;
+
+	skb = mt7615_mcu_alloc_sta_req(mvif, msta);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7615_mcu_sta_ba_tlv(skb, params, enable, false);
+
+	err = __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				      MCU_UNI_CMD_STA_REC_UPDATE, true);
+	if (err < 0 || !enable)
+		return err;
+
+	skb = mt7615_mcu_alloc_sta_req(mvif, msta);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL,
+				      sizeof(struct sta_rec_wtbl));
+
+	wtbl_hdr = mt7615_mcu_alloc_wtbl_req(msta, WTBL_SET, sta_wtbl, &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
+	mt7615_mcu_wtbl_ba_tlv(skb, params, enable, false, sta_wtbl,
+			       wtbl_hdr);
+
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_UNI_CMD_STA_REC_UPDATE, true);
+}
+
 static int
 mt7615_mcu_uni_add_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta, bool enable)
@@ -1327,6 +1409,8 @@ static const struct mt7615_mcu_ops uni_update_ops = {
 	.set_pm_state = mt7615_mcu_uni_ctrl_pm_state,
 	.add_dev_info = mt7615_mcu_uni_add_dev,
 	.add_bss_info = mt7615_mcu_uni_add_bss,
+	.add_tx_ba = mt7615_mcu_uni_tx_ba,
+	.add_rx_ba = mt7615_mcu_uni_rx_ba,
 	.sta_add = mt7615_mcu_uni_add_sta,
 };
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
