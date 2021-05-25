Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AD3C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 08:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9432361419
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 08:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9432361419
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9Xj8rnYYARq6eP0UOKCTHMK9rpCHWiKWhHrSFutxC8=; b=e03zZ4HU56oVzH
	zNfLg6mLMynxCM/Cdo5BAtl4oNUiW2hfSn+qa/A8ybcShrR9MNNBTB/PZTrZ/s6zyuUtZSnr5KOE5
	qGkJ5TorP46a8XiMR/lYZqHo4qgQjhrDmEvNSoqWu374LqeoWnOIsgcrBJLv9P4e0Skym1kDNk7+B
	X4QricGqOZqyzek76Cl/zS2G+YOogTfbsgLABxi5m+wKYI+1En+iNgTeUPS+TyAEpIiaQ197b3cHe
	NZTIwhhIZcHTxQcxkTs6xp6vWfXDXgEwEHjVc1gB0SWEbDZLQcdq19u3k/LttB9yV/BjMEtf5GYHB
	Hv53OCK+VYcmbhPqDs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llSgq-00493n-Rx; Tue, 25 May 2021 08:45:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llSgm-00491a-3P
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 08:45:27 +0000
X-UUID: c6a6af4dcadb4b50a5e40a6654989b0e-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fr5Ji9UWZFBgAwg+ZblntACD90fVLO9heV5eR2qiXME=; 
 b=QB/Iof1fVSIKvWtuc1T1uF8MUh5xHXhRohdVqN9S8pTToWwtto4vLCmIIPbVyuDC49++3xJuQiTIHz0lZ5YEbQ19HroaB10g88R/AKzQxn9HAkhyZEgWjzJOPvoF1AudZadjn5fCo8gidetCTW+41T4+GzmvB7WZbbsXDGJ664Q=;
X-UUID: c6a6af4dcadb4b50a5e40a6654989b0e-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2042062242; Tue, 25 May 2021 01:45:20 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 01:45:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 16:45:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 May 2021 16:45:17 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7615: add .offset_tsf callback
Date: Tue, 25 May 2021 16:45:15 +0800
Message-ID: <02303700150757de92fec3525fe51c04d1aca416.1621931743.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <324aa6af6a191a1f929fd3054148b001acd0bd13.1621931743.git.ryder.lee@mediatek.com>
References: <324aa6af6a191a1f929fd3054148b001acd0bd13.1621931743.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_014525_605489_11953282 
X-CRM114-Status: GOOD (  13.28  )
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

It's much more accurate than .get_tsf + .set_tsf, and switch to use
mt76_rmw to operate tsf registers.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 32 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  2 ++
 .../wireless/mediatek/mt76/mt7615/usb_sdio.c  |  2 +-
 4 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 71af122a0b38..2ac7d0b0eff4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1125,7 +1125,7 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 	idx = idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
 	addr = idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
 
-	mt76_set(dev, addr, MT_LPON_TCR_MODE); /* TSF read */
+	mt76_rmw(dev, addr, MT_LPON_TCR_MODE, MT_LPON_TCR_READ); /* TSF read */
 	sta->rate_set_tsf = mt76_rr(dev, MT_LPON_UTTR0) & ~BIT(0);
 	sta->rate_set_tsf |= rd.rateset;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index e36c52290985..3bd755634d5b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -891,7 +891,8 @@ mt7615_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 
 	mt7615_mutex_acquire(dev);
 
-	mt76_set(dev, reg, MT_LPON_TCR_MODE); /* TSF read */
+	/* TSF read */
+	mt76_rmw(dev, reg, MT_LPON_TCR_MODE, MT_LPON_TCR_READ);
 	tsf.t32[0] = mt76_rr(dev, MT_LPON_UTTR0);
 	tsf.t32[1] = mt76_rr(dev, MT_LPON_UTTR1);
 
@@ -921,11 +922,37 @@ mt7615_set_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mt76_wr(dev, MT_LPON_UTTR0, tsf.t32[0]);
 	mt76_wr(dev, MT_LPON_UTTR1, tsf.t32[1]);
 	/* TSF software overwrite */
-	mt76_set(dev, reg, MT_LPON_TCR_WRITE);
+	mt76_rmw(dev, reg, MT_LPON_TCR_MODE, MT_LPON_TCR_WRITE);
 
 	mt7615_mutex_release(dev);
 }
 
+static void
+mt7615_offset_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		  s64 timestamp)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	union {
+		u64 t64;
+		u32 t32[2];
+	} tsf = { .t64 = timestamp, };
+	u16 idx = mvif->mt76.omac_idx;
+	u32 reg;
+
+	idx = idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
+	reg = idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
+
+	mutex_lock(&dev->mt76.mutex);
+
+	mt76_wr(dev, MT_LPON_UTTR0, tsf.t32[0]);
+	mt76_wr(dev, MT_LPON_UTTR1, tsf.t32[1]);
+	/* TSF software adjust*/
+	mt76_rmw(dev, reg, MT_LPON_TCR_MODE, MT_LPON_TCR_ADJUST);
+
+	mutex_unlock(&dev->mt76.mutex);
+}
+
 static void
 mt7615_set_coverage_class(struct ieee80211_hw *hw, s16 coverage_class)
 {
@@ -1308,6 +1335,7 @@ const struct ieee80211_ops mt7615_ops = {
 	.get_stats = mt7615_get_stats,
 	.get_tsf = mt7615_get_tsf,
 	.set_tsf = mt7615_set_tsf,
+	.offset_tsf = mt7615_offset_tsf,
 	.get_survey = mt76_get_survey,
 	.get_antenna = mt76_get_antenna,
 	.set_antenna = mt7615_set_antenna,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index 63c081bb04d0..6712ad9faeaa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -463,7 +463,9 @@ enum mt7615_reg_base {
 #define MT_LPON_TCR0(_n)		MT_LPON(0x010 + ((_n) * 4))
 #define MT_LPON_TCR2(_n)		MT_LPON(0x0f8 + ((_n) - 2) * 4)
 #define MT_LPON_TCR_MODE		GENMASK(1, 0)
+#define MT_LPON_TCR_READ		GENMASK(1, 0)
 #define MT_LPON_TCR_WRITE		BIT(0)
+#define MT_LPON_TCR_ADJUST		BIT(1)
 
 #define MT_LPON_UTTR0			MT_LPON(0x018)
 #define MT_LPON_UTTR1			MT_LPON(0x01c)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
index 75a05f8dd7e7..996d48cca18a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
@@ -123,7 +123,7 @@ static int mt7663_usb_sdio_set_rates(struct mt7615_dev *dev,
 	idx = idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
 	addr = idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
 
-	mt76_set(dev, addr, MT_LPON_TCR_MODE); /* TSF read */
+	mt76_rmw(dev, addr, MT_LPON_TCR_MODE, MT_LPON_TCR_READ); /* TSF read */
 	val = mt76_rr(dev, MT_LPON_UTTR0);
 	sta->rate_set_tsf = (val & ~BIT(0)) | rate->rateset;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
