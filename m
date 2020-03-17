Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE07C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9327920735
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z4CCHPiX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJbEJreY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9327920735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Z5Dbv6Ywmg09tNQ0mA+hbMetnT0qeOVDWXJCuWswlU=; b=Z4CCHPiXiZw+NY
	nruLn4w4BYHosv9nBa9n6nFnxr3jb8vunYn12i3Uz9ErdFbcIrwyWNgW64BtvF1xP7GvgXNzL2voK
	OVil19FgXSuWALFeh/Xi7wn9oqwq9CRnb27MZ0mLgZ8eY4BrfIMyH5nEX8zJaqz3kTDjD3fc4p5G7
	PlQRu5FhHjsLjK9jIw8GCH/jLqJ54fWnM+gkTZuOOQT13Xzq94j15TUd5XB16PfaFBeT6L+RohLqp
	sr8fu3qA/HPM5PXnkUrfT67//ZnY2V2QSZbRoJmYiStr0dhire473udGLPR9t5bW2tCm1sdBWX+99
	drYv5ymiaka8HeUxhbQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIf-0007P2-PB; Tue, 17 Mar 2020 16:42:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIW-0007Ax-1Z
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:33 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58C5F20663;
 Tue, 17 Mar 2020 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463351;
 bh=ynUZ5Y6q9lgAZbJYesFYCJto2omiLpDktVmChdZM5jU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pJbEJreYdeKzPzlKm7ZgF2nAvl7NE75kARF5RWhvcGn4tbLMvvy8s6vQ7aI2ufVPP
 luvKwViklkqCtXsllq6T2pne4/cAWnLTTXwoGkTL84ikFc5GEIm595Bv2bnaaYScRq
 2/YENc5hX591brNOrqmm85iRHjlSRQrgYbpbgTUQ=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 21/25] mt76: mt7615: introduce set_bmc and st_sta for uni
 commands
Date: Tue, 17 Mar 2020 17:41:28 +0100
Message-Id: <887044814c14356c4b56a827e929c474e5b6da3b.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094232_146872_49130C7C 
X-CRM114-Status: GOOD (  10.65  )
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

Introduce mt7615_mcu_uni_set_bmc and mt7615_mcu_uni_set_sta routines for
mt7663e commands.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 27 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   | 15 ++++++++++-
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 372ffc6322c9..a72b65ebdffc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1062,8 +1062,8 @@ mt7615_mcu_sta_rx_ba(struct mt7615_dev *dev,
 }
 
 static int
-mt7615_mcu_add_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-		   struct ieee80211_sta *sta, bool enable)
+mt7615_mcu_add_sta_cmd(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta, bool enable, int cmd)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct wtbl_req_hdr *wtbl_hdr;
@@ -1092,8 +1092,15 @@ mt7615_mcu_add_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			mt7615_mcu_wtbl_ht_tlv(skb, sta, sta_wtbl, wtbl_hdr);
 	}
 
-	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				       MCU_EXT_CMD_STA_REC_UPDATE, true);
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb, cmd, true);
+}
+
+static int
+mt7615_mcu_add_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+		   struct ieee80211_sta *sta, bool enable)
+{
+	return mt7615_mcu_add_sta_cmd(dev, vif, sta, enable,
+				      MCU_EXT_CMD_STA_REC_UPDATE);
 }
 
 static const struct mt7615_mcu_ops sta_update_ops = {
@@ -1106,6 +1113,18 @@ static const struct mt7615_mcu_ops sta_update_ops = {
 	.sta_add = mt7615_mcu_add_sta,
 };
 
+static int
+mt7615_mcu_uni_add_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta, bool enable)
+{
+	return mt7615_mcu_add_sta_cmd(dev, vif, sta, enable,
+				      MCU_UNI_CMD_STA_REC_UPDATE);
+}
+
+static const struct mt7615_mcu_ops uni_update_ops = {
+	.sta_add = mt7615_mcu_uni_add_sta,
+};
+
 static int mt7615_mcu_send_firmware(struct mt7615_dev *dev, const void *data,
 				    int len)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 3aad460e0809..bc87cf0419d8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -269,6 +269,10 @@ enum {
 	MCU_EXT_CMD_SET_RDD_PATTERN = 0x7d,
 };
 
+enum {
+	MCU_UNI_CMD_STA_REC_UPDATE = MCU_UNI_PREFIX | 0x03,
+};
+
 #define MCU_CMD_ACK		BIT(0)
 #define MCU_CMD_UNI		BIT(1)
 #define MCU_CMD_QUERY		BIT(2)
@@ -607,6 +611,15 @@ struct sta_req_hdr {
 	u8 rsv[2];
 } __packed;
 
+struct sta_rec_state {
+	__le16 tag;
+	__le16 len;
+	u8 state;
+	__le32 flags;
+	u8 vhtop;
+	u8 pad[2];
+} __packed;
+
 struct sta_rec_basic {
 	__le16 tag;
 	__le16 len;
@@ -659,7 +672,7 @@ enum {
 	STA_REC_BF,
 	STA_REC_AMSDU, /* for CR4 */
 	STA_REC_BA,
-	STA_REC_RED, /* not used */
+	STA_REC_STATE,
 	STA_REC_TX_PROC, /* for hdr trans and CSO in CR4 */
 	STA_REC_HT,
 	STA_REC_VHT,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
