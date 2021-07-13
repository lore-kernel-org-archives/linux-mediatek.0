Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D6BC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 20:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237B46135A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 20:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 237B46135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/3Vr7I30PSvMpy10evGaxcJXXDhBXSVdf/eszf7p3g=; b=HUOYO3aJcn8kxP
	9wn8mjDpVN7ptc/R+pcnLJpxfw4+/fM+HKIQqoSisegtcTto4O2ZYmNvjQYgo8BpbjVXY9PHgdwQh
	4cUsEeh7BS92PozHSO+PH8f6v1GyaWafQY+s0ORDXjxM3r8IVIbVGXsS+tt0gVmu6+xmW9J6ZubBQ
	qZc7/0zgiMaoTIpqmdw4WiJnrTsZ4NfByY+BSMcq7qOgMbC6Yps4cnGZ7GYPDNZybHqMEbZimPb7T
	2ZVeWM5CI4tqwG/sbkJOC8/ZS5GtzPviAOWsinZsXyhkWTwq5cDINPPk8akrqlkAkn9/qAt2ys80T
	9MbV8rdcFJqrFu//CThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3OpG-00BI7A-Jz; Tue, 13 Jul 2021 20:16:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3OpD-00BI5A-G8
 for linux-mediatek@lists.infradead.org; Tue, 13 Jul 2021 20:16:16 +0000
X-UUID: 58a82fcc52934846898511f93cbd23e6-20210713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pRTSLKA9pRUwLIWGLNxaL3mkS0Rn9ReUu8u4C4DfE8c=; 
 b=s7sV265TYdkN8uac20ppVH3JmUCSM9Ap+ztL0rH5Qbh3qPkWon6ValMs2lKYjajsqXzhlzghhdEh9oLu/i/ValAgAQ7/TQ3Oe0gc/iWHMX28+Sp/B5X44Py0zRGV7bq3pfcZPt4PYmFgCQqhsWXoaop0KuTHWKjpnNNcpSr0MsA=;
X-UUID: 58a82fcc52934846898511f93cbd23e6-20210713
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 282691490; Tue, 13 Jul 2021 13:16:12 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 13:16:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:16:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Jul 2021 04:16:04 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 2/4] mt76: add mt76_default_basic_rate more devices can
 rely on
Date: Wed, 14 Jul 2021 04:15:59 +0800
Message-ID: <8a86a3483ac686d40861489884c7737d38648905.1626207204.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <92a8ecfdf198b34f98d5c1489a83adf151657760.1626207204.git.objelf@gmail.com>
References: <92a8ecfdf198b34f98d5c1489a83adf151657760.1626207204.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_131615_566891_069C5FD4 
X-CRM114-Status: GOOD (  11.39  )
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

From: Sean Wang <sean.wang@mediatek.com>

add mt76_default_basic_rate to mt76 core more devices can rely on
to send frames which require the rate in the basic rates.

Suggested-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v3:  created in v3 that is splitted out from the patch
     ("mt76: mt7921: fix mgmt frame using unexpected bitrate") v2
     for more mt76 devices like mt7915 can reuse.
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 14 ++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 20b2423efc19..56e80e0fb2c2 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1336,3 +1336,17 @@ mt76_init_queue(struct mt76_dev *dev, int qid, int idx, int n_desc,
 	return hwq;
 }
 EXPORT_SYMBOL_GPL(mt76_init_queue);
+
+u16 mt76_default_basic_rate(struct mt76_phy *phy, struct ieee80211_vif *vif)
+{
+	int i = ffs(vif->bss_conf.basic_rates) - 1, offset = 0;
+	struct ieee80211_rate *rate;
+
+	if (phy->chandef.chan->band == NL80211_BAND_5GHZ)
+		offset = 4;
+
+	rate = &mt76_rates[offset + i];
+
+	return rate->hw_value;
+}
+EXPORT_SYMBOL_GPL(mt76_default_basic_rate);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e51ab917296d..d34d77967780 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -881,6 +881,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *data, int offset, int len);
 struct mt76_queue *
 mt76_init_queue(struct mt76_dev *dev, int qid, int idx, int n_desc,
 		int ring_base);
+u16 mt76_default_basic_rate(struct mt76_phy *phy, struct ieee80211_vif *vif);
 static inline int mt76_init_tx_queue(struct mt76_phy *phy, int qid, int idx,
 				     int n_desc, int ring_base)
 {
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
