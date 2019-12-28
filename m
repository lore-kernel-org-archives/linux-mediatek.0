Return-Path: <SRS0=XgPn=2S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6408C2D0C3
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 03:16:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D03208C4
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 03:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CNQpU8xH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GcqiQznp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86D03208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPhl6PG0FcFjlmuAr7oHHTi7idSo1dt5LZwLOtsLo7s=; b=CNQpU8xHuLix6O
	I558xtaPuNZiSKaIxI5BWN0NmjJDK+L63acmQotzLRxTQg6b8nuDySZHpDQ4mTBQ9MojT0zt5EURa
	sASfG0DYyF1L9VS66WhHySzNxw2y6rEns0Z0bL9oz9P/ZJsPMEN6udkfbV66kDWRO2RfWswYDW51D
	VCxcJhnLX+8IRs+tmSO6ePJaQnuKHX6qZtHS1hTIaaG3kolmSQ2/Pd2LPs+JZXBU0FWAThw/a5kVd
	AjywGjn4jWZ46xQa92AoZJDO2dwD3689WeA4JVdtjQr654NFGfw+avtd4sfOrOWkRHVPLHZvBOoA2
	MYNbVZEPrQk0kVf9JF2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1il2ak-0005os-Sl; Sat, 28 Dec 2019 03:16:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1il2ai-0005o9-8f
 for linux-mediatek@lists.infradead.org; Sat, 28 Dec 2019 03:16:37 +0000
X-UUID: 70ee6781ff7643af8d6077f949359410-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=59pqvoAaU68tyt/+uUeT/9cG7cvBamrg76YhqKNa9Pk=; 
 b=GcqiQznpnYTiQXvU0Az8ZblzNksY0t5dy6YaVu/C9pSJ05uogxjUIflvHXbsygLNMu8+Ra23dxuUFIi2vpy0qahrt+eTUgkBCPIsth0nsoEZvwcFs+AvrsAucd8HPF3SXBjG8nQw/YXBxMs00osOOnfkTYghdeuB9rfzXcgWqzw=;
X-UUID: 70ee6781ff7643af8d6077f949359410-20191227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 133346433; Fri, 27 Dec 2019 19:16:32 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 19:06:37 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 28 Dec 2019 11:06:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 28 Dec 2019 11:05:51 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 2/3] mt76: mt7615: add per-phy mib statistics
Date: Sat, 28 Dec 2019 11:05:11 +0800
Message-ID: <ddf49ee8dbb323be45967f804f348b8596847a3a.1577501739.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <769aba6e014b8e7650c3909d6adb8427c1d5c5ae.1577501739.git.ryder.lee@mediatek.com>
References: <769aba6e014b8e7650c3909d6adb8427c1d5c5ae.1577501739.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2DCC9F50CED6423EB6868D28408D639660D286A3AC266B14C66630E41025135D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_191636_316544_C0AADCFC 
X-CRM114-Status: GOOD (  10.84  )
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
changes since v1 - mark mt7615_mac_update_mib_stats() as a static function.
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 56 +++++++++++++------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  9 +++
 .../net/wireless/mediatek/mt76/mt7615/regs.h  | 16 ++++--
 3 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 1b52d8b79496..d6cb6532a883 100644
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
@@ -1588,6 +1577,36 @@ void mt7615_update_channel(struct mt76_dev *mdev)
 	mt76_set(dev, MT_WF_RMAC_MIB_TIME0, MT_WF_RMAC_MIB_RXTIME_CLR);
 }
 
+static void
+mt7615_mac_update_mib_stats(struct mt7615_phy *phy)
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
+		val = mt76_get_field(dev, MT_MIB_MB_SDR1(ext_phy, i),
+				     MT_MIB_ACK_FAIL_COUNT_MASK);
+		if (val > mib->ack_fail_cnt)
+			mib->ack_fail_cnt = val;
+
+		val2 = mt76_rr(dev, MT_MIB_MB_SDR0(ext_phy, i));
+		data = FIELD_GET(MT_MIB_RTS_RETRIES_COUNT_MASK, val2);
+		if (data > mib->rts_retries_cnt) {
+			mib->rts_cnt = FIELD_GET(MT_MIB_RTS_COUNT_MASK, val2);
+			mib->rts_retries_cnt = data;
+		}
+	}
+}
+
 void mt7615_mac_work(struct work_struct *work)
 {
 	struct mt7615_dev *dev;
@@ -1602,9 +1621,12 @@ void mt7615_mac_work(struct work_struct *work)
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
index eaafae9cc279..d215a84d6c49 100644
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
