Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C58C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 08:57:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CCDE64D5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 08:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CCDE64D5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tzSinWO1YwB710z0SxAMuVhV9Jwwr4eO/i5L72rbwGc=; b=JDq4AcWBkKfsJm0PdxBCV4ja2n
	QJM8o1iGA+7VcAIBp5f6TDOzZvfgwPLcT7cJtYO+3Js07nNr0fdbfLj2gGgApqhOHFhXesw9LIwnv
	uR7ndYUE9kvhH0b53N5yYbQD3Zg6cpVgAIUte1nV7LHUzTmuATUlp23CnI6/UBIJystRzVhF6r0Xe
	EnubrZIKtNhNoXouLGSu+5sapPPVNrLSXiLV9rTllrLHMzqWz+EJPVlWbdaW3VBe05vr38uYU1bL2
	tyIRTbcOz06UZRRYYGaI3fcofbVwZI6iHHd8zWbzD3ftKIzE7fqFLZ4TmaLtTYcOZRH2zyk6ZZB3B
	plBiy/0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lETP5-0000f6-26; Tue, 23 Feb 2021 08:50:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lETP2-0000e1-A1
 for linux-mediatek@lists.infradead.org; Tue, 23 Feb 2021 08:50:45 +0000
X-UUID: 8de5ae6f9c374f4983c4c9a1f3c5ffdc-20210223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0WkpOVALgtZLvDwpzIRCBYP72YDIAl4Q/zZkEPZ9Cck=; 
 b=HrP+RQEnm3XeaA7e7vTsCEP6HpMxtJeqJHPnSG/iWvHu6WNsR2ss8mptqMoo/CayxM96QzzlbRGvcPDkXFa0Sw39kPdFe9qfqCHp6DYcsIlk8wblLd1pUb5r2OgmKCpwvoAGzx8dQcr6bEcyykBaM/r4UDutPcpbPpq3TXZcfu0=;
X-UUID: 8de5ae6f9c374f4983c4c9a1f3c5ffdc-20210223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 109288139; Tue, 23 Feb 2021 00:50:38 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Feb 2021 00:43:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Feb 2021 16:43:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Feb 2021 16:43:15 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7615: fix TSF configuration
Date: Tue, 23 Feb 2021 16:43:11 +0800
Message-ID: <61d40a20375f888c122ee0e186168fc2db863fc3.1614058187.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_035044_588039_EABA34DF 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The index of TSF counters should follow HWBSSID.

Fixes: cd795267612d ("mt76: mt7615: support 16 interfaces")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  |  6 +++++-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 16 ++++++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7615/regs.h |  7 ++++---
 .../net/wireless/mediatek/mt76/mt7615/usb_sdio.c |  6 +++++-
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index f2dd56674acb..df2dc77a323a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1005,6 +1005,7 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 	struct mt7615_dev *dev = phy->dev;
 	struct mt7615_rate_desc rd;
 	u32 w5, w27, addr;
+	u16 idx = sta->vif->mt76.omac_idx;
 
 	if (!mt76_is_mmio(&dev->mt76)) {
 		mt7615_mac_queue_rate_update(phy, sta, probe_rate, rates);
@@ -1056,7 +1057,10 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 
 	mt76_wr(dev, addr + 27 * 4, w27);
 
-	mt76_set(dev, MT_LPON_T0CR, MT_LPON_T0CR_MODE); /* TSF read */
+	idx = idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
+	addr = idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
+
+	mt76_set(dev, addr, MT_LPON_TCR_MODE); /* TSF read */
 	sta->rate_set_tsf = mt76_rr(dev, MT_LPON_UTTR0) & ~BIT(0);
 	sta->rate_set_tsf |= rd.rateset;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 1cf40f85eb55..68accb37ea28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -818,15 +818,21 @@ mt7615_get_stats(struct ieee80211_hw *hw,
 static u64
 mt7615_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 {
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	union {
 		u64 t64;
 		u32 t32[2];
 	} tsf;
+	u16 idx = mvif->mt76.omac_idx;
+	u32 reg;
+
+	idx = idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
+	reg = idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
 
 	mt7615_mutex_acquire(dev);
 
-	mt76_set(dev, MT_LPON_T0CR, MT_LPON_T0CR_MODE); /* TSF read */
+	mt76_set(dev, reg, MT_LPON_TCR_MODE); /* TSF read */
 	tsf.t32[0] = mt76_rr(dev, MT_LPON_UTTR0);
 	tsf.t32[1] = mt76_rr(dev, MT_LPON_UTTR1);
 
@@ -839,18 +845,24 @@ static void
 mt7615_set_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       u64 timestamp)
 {
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	union {
 		u64 t64;
 		u32 t32[2];
 	} tsf = { .t64 = timestamp, };
+	u16 idx = mvif->mt76.omac_idx;
+	u32 reg;
+
+	idx = idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
+	reg = idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
 
 	mt7615_mutex_acquire(dev);
 
 	mt76_wr(dev, MT_LPON_UTTR0, tsf.t32[0]);
 	mt76_wr(dev, MT_LPON_UTTR1, tsf.t32[1]);
 	/* TSF software overwrite */
-	mt76_set(dev, MT_LPON_T0CR, MT_LPON_T0CR_WRITE);
+	mt76_set(dev, reg, MT_LPON_TCR_WRITE);
 
 	mt7615_mutex_release(dev);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index 1fd7f183629e..190a02670795 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -449,9 +449,10 @@ enum mt7615_reg_base {
 
 #define MT_LPON(_n)			((dev)->reg_map[MT_LPON_BASE] + (_n))
 
-#define MT_LPON_T0CR			MT_LPON(0x010)
-#define MT_LPON_T0CR_MODE		GENMASK(1, 0)
-#define MT_LPON_T0CR_WRITE		BIT(0)
+#define MT_LPON_TCR0(_n)		MT_LPON(0x010 + ((_n) * 4))
+#define MT_LPON_TCR2(_n)		MT_LPON(0x0f8 + ((_n) - 2) * 4)
+#define MT_LPON_TCR_MODE		GENMASK(1, 0)
+#define MT_LPON_TCR_WRITE		BIT(0)
 
 #define MT_LPON_UTTR0			MT_LPON(0x018)
 #define MT_LPON_UTTR1			MT_LPON(0x01c)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
index 203256862dfd..4a370b9f7a17 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
@@ -67,6 +67,7 @@ static int mt7663_usb_sdio_set_rates(struct mt7615_dev *dev,
 	struct mt7615_rate_desc *rate = &wrd->rate;
 	struct mt7615_sta *sta = wrd->sta;
 	u32 w5, w27, addr, val;
+	u16 idx = sta->vif->mt76.omac_idx;
 
 	lockdep_assert_held(&dev->mt76.mutex);
 
@@ -118,7 +119,10 @@ static int mt7663_usb_sdio_set_rates(struct mt7615_dev *dev,
 
 	sta->rate_probe = sta->rateset[rate->rateset].probe_rate.idx != -1;
 
-	mt76_set(dev, MT_LPON_T0CR, MT_LPON_T0CR_MODE); /* TSF read */
+	idx = idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
+	addr = idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
+
+	mt76_set(dev, addr, MT_LPON_TCR_MODE); /* TSF read */
 	val = mt76_rr(dev, MT_LPON_UTTR0);
 	sta->rate_set_tsf = (val & ~BIT(0)) | rate->rateset;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
