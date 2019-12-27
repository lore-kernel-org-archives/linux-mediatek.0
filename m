Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69853C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 09:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7A2208C4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 09:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YvrtO/dw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="smVl0JZt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C7A2208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuukM/ubjGhTuCKxTqKRet7U1FuYS9VCn1SFhrkMiMg=; b=YvrtO/dwiE4OYS
	JVAr/2fc7F7ORGIOpxidxXmO4u/YS2zBGUelz4f4RBUIEFgvI3a2TThmkuzN764K8OF6dSpzICgZk
	DS+QqrDs2F6ugZDtaGx1YoEt/fqDKmAGgjNEA6FFe9Xs1GRq6Fx/YwtEyHR6bu2mGMpJtQXtbZHa1
	sBZYt3Dgb7gh8/GbP9rJ8R+9EKv9lBoLI9DsELg7xQ9m2nWmek26Cac/+AzEGeed88zZQ8KxJqJx4
	YnnaBCwY9mv1vqXKjYWbKf0ywUcQvZJiHTU51QilQybN9SNPx5qjj+lPMtBdT4WkhRyExZ7J+y5mc
	hO7jFl+waV2p9KdIpeQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iklTr-0003UB-Fh; Fri, 27 Dec 2019 09:00:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iklTo-0003TK-PN
 for linux-mediatek@lists.infradead.org; Fri, 27 Dec 2019 09:00:22 +0000
X-UUID: d1dc1201a2a54a79a7fcf6d88bd50311-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Jy+3vAjq4MY1dZs27rmpRS3cueXyCydKk5O55UCE3ao=; 
 b=smVl0JZtz7vgu0H326OJTmOdVAcsw61UPAWUkC0u1aWAbeFTY0fFHZFhdiy9qFq8bV1OD1OUdVMiHMZKlz26MfVoHA3TyrP/966YoLEY52s4lQCWRi58JqzTNqJHlq7K6YDjN/UYIFBNCiF0VL5DhKu7S8hNnrNDkWPX415ruPI=;
X-UUID: d1dc1201a2a54a79a7fcf6d88bd50311-20191227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1139049567; Fri, 27 Dec 2019 01:00:14 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 01:00:23 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 17:00:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 27 Dec 2019 16:59:59 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/3] mt76: mt7615: add per-phy mib statistics
Date: Fri, 27 Dec 2019 17:00:08 +0800
Message-ID: <e0ae0723788cde748ac1322c594c105ff923bb07.1577411732.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <7d450f0c4fec3c7242804e47f9bce13255e7f28d.1577411732.git.ryder.lee@mediatek.com>
References: <7d450f0c4fec3c7242804e47f9bce13255e7f28d.1577411732.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_010020_831615_95B113BD 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update per-phy mib counters every 500ms.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 55 +++++++++++++------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    | 10 ++++
 .../net/wireless/mediatek/mt76/mt7615/regs.h  | 16 ++++--
 3 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 1b52d8b79496..72a2007afd1f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1480,25 +1480,14 @@ static void
 mt7615_mac_scs_check(struct mt7615_phy *phy)
 {
 	struct mt7615_dev *dev = phy->dev;
-	u32 val, rts_cnt = 0, rts_retries_cnt = 0, rts_err_rate = 0;
+	struct mib_stats *mib = &phy->mib;
+	u32 val, rts_err_rate = 0;
 	u32 mdrdy_cck, mdrdy_ofdm, pd_cck, pd_ofdm;
 	bool ext_phy = phy != &dev->phy;
-	int i;
 
 	if (!dev->scs_en)
 		return;
 
-	for (i = 0; i < 4; i++) {
-		u32 data;
-
-		val = mt76_rr(dev, MT_MIB_MB_SDR(ext_phy, i));
-		data = FIELD_GET(MT_MIB_RTS_RETRIES_COUNT_MASK, val);
-		if (data > rts_retries_cnt) {
-			rts_cnt = FIELD_GET(MT_MIB_RTS_COUNT_MASK, val);
-			rts_retries_cnt = data;
-		}
-	}
-
 	val = mt76_rr(dev, MT_WF_PHY_R0_PHYCTRL_STS0(ext_phy));
 	pd_cck = FIELD_GET(MT_WF_PHYCTRL_STAT_PD_CCK, val);
 	pd_ofdm = FIELD_GET(MT_WF_PHYCTRL_STAT_PD_OFDM, val);
@@ -1511,9 +1500,9 @@ mt7615_mac_scs_check(struct mt7615_phy *phy)
 	phy->false_cca_cck = pd_cck - mdrdy_cck;
 	mt7615_mac_cca_stats_reset(phy);
 
-	if (rts_cnt + rts_retries_cnt)
-		rts_err_rate = MT_FRAC(rts_retries_cnt,
-				       rts_cnt + rts_retries_cnt);
+	if (mib->rts_cnt + mib->rts_retries_cnt)
+		rts_err_rate = MT_FRAC(mib->rts_retries_cnt,
+				       mib->rts_cnt + mib->rts_retries_cnt);
 
 	/* cck */
 	mt7615_mac_adjust_sensitivity(phy, rts_err_rate, false);
@@ -1588,6 +1577,35 @@ void mt7615_update_channel(struct mt76_dev *mdev)
 	mt76_set(dev, MT_WF_RMAC_MIB_TIME0, MT_WF_RMAC_MIB_RXTIME_CLR);
 }
 
+void mt7615_mac_update_mib_stats(struct mt7615_phy *phy)
+{
+	struct mt7615_dev *dev = phy->dev;
+	struct mib_stats *mib = &phy->mib;
+	bool ext_phy = phy != &dev->phy;
+	int i;
+
+	memset(mib, 0, sizeof(*mib));
+
+	mib->fcs_err_cnt = mt76_get_field(dev, MT_MIB_SDR3(ext_phy),
+					  MT_MIB_SDR3_FCS_ERR_MASK);
+
+	for (i = 0; i < 4; i++) {
+		u32 data, val, val2;
+
+		val2 = mt76_get_field(dev, MT_MIB_MB_SDR1(ext_phy, i),
+				      MT_MIB_ACK_FAIL_COUNT_MASK);
+		if (val2 > mib->ack_fail_cnt)
+			mib->ack_fail_cnt = val2;
+
+		val = mt76_rr(dev, MT_MIB_MB_SDR0(ext_phy, i));
+		data = FIELD_GET(MT_MIB_RTS_RETRIES_COUNT_MASK, val);
+		if (data > mib->rts_retries_cnt) {
+			mib->rts_cnt = FIELD_GET(MT_MIB_RTS_COUNT_MASK, val);
+			mib->rts_retries_cnt = data;
+		}
+	}
+}
+
 void mt7615_mac_work(struct work_struct *work)
 {
 	struct mt7615_dev *dev;
@@ -1602,9 +1620,12 @@ void mt7615_mac_work(struct work_struct *work)
 	if (++dev->mac_work_count == 5) {
 		ext_phy = mt7615_ext_phy(dev);
 
+		mt7615_mac_update_mib_stats(&dev->phy);
 		mt7615_mac_scs_check(&dev->phy);
-		if (ext_phy)
+		if (ext_phy) {
+			mt7615_mac_update_mib_stats(ext_phy);
 			mt7615_mac_scs_check(ext_phy);
+		}
 
 		dev->mac_work_count = 0;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index eaafae9cc279..054b4e40e3fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -87,6 +87,13 @@ struct mt7615_vif {
 	struct mt7615_sta sta;
 };
 
+struct mib_stats {
+	u32 ack_fail_cnt;
+	u32 fcs_err_cnt;
+	u32 rts_cnt;
+	u32 rts_retries_cnt;
+};
+
 struct mt7615_phy {
 	struct mt76_phy *mt76;
 	struct mt7615_dev *dev;
@@ -112,6 +119,8 @@ struct mt7615_phy {
 
 	__le32 rx_ampdu_ts;
 	u32 ampdu_ref;
+
+	struct mib_stats mib;
 };
 
 struct mt7615_dev {
@@ -300,6 +309,7 @@ void mt7615_mac_set_timing(struct mt7615_phy *phy);
 int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb);
 void mt7615_mac_add_txs(struct mt7615_dev *dev, void *data);
 void mt7615_mac_tx_free(struct mt7615_dev *dev, struct sk_buff *skb);
+void mt7615_mac_update_mib_stats(struct mt7615_phy *phy);
 int mt7615_mac_wtbl_set_key(struct mt7615_dev *dev, struct mt76_wcid *wcid,
 			    struct ieee80211_key_conf *key,
 			    enum set_key_cmd cmd);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index b0c14067a832..40e58b332e75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -333,10 +333,9 @@
 #define MT_WF_MIB(ofs)			(MT_WF_MIB_BASE + (ofs))
 
 #define MT_MIB_M0_MISC_CR		MT_WF_MIB(0x00c)
-#define MT_MIB_MB_SDR(_band, n)		MT_WF_MIB(0x100 + ((_band) << 9) + \
-						  ((n) << 4))
-#define MT_MIB_RTS_RETRIES_COUNT_MASK	GENMASK(31, 16)
-#define MT_MIB_RTS_COUNT_MASK		GENMASK(15, 0)
+
+#define MT_MIB_SDR3(n)			MT_WF_MIB(0x014 + ((n) << 9))
+#define MT_MIB_SDR3_FCS_ERR_MASK	GENMASK(15, 0)
 
 #define MT_MIB_SDR9(n)			MT_WF_MIB(0x02c + ((n) << 9))
 #define MT_MIB_SDR9_BUSY_MASK		GENMASK(23, 0)
@@ -349,6 +348,15 @@
 #define MT_MIB_SDR37(n)			MT_WF_MIB(0x09c + ((n) << 9))
 #define MT_MIB_SDR37_RXTIME_MASK	GENMASK(23, 0)
 
+#define MT_MIB_MB_SDR0(_band, n)	MT_WF_MIB(0x100 + ((_band) << 9) + \
+						  ((n) << 4))
+#define MT_MIB_RTS_RETRIES_COUNT_MASK	GENMASK(31, 16)
+#define MT_MIB_RTS_COUNT_MASK		GENMASK(15, 0)
+
+#define MT_MIB_MB_SDR1(_band, n)	MT_WF_MIB(0x104 + ((_band) << 9) + \
+						  ((n) << 4))
+#define MT_MIB_ACK_FAIL_COUNT_MASK	GENMASK(31, 16)
+
 #define MT_TX_AGG_CNT(n)		MT_WF_MIB(0xa8 + ((n) << 2))
 
 #define MT_LED_BASE_PHYS		0x80024000
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
