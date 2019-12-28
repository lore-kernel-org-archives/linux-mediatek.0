Return-Path: <SRS0=XgPn=2S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDDEC2D0C3
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 03:16:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70EBC208C4
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 03:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V8vmVjHx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n/WPZpT1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70EBC208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=41eGKvYS4dmBjBBiJLBi64AkZH2g4p3Rs10uNI8fOFE=; b=V8vmVjHxko+XTr
	dyslzGpBelWwvpN5vTyqbDkj5gbBsBfzQhcjPDd1XToPrAKXbChLE7AhTBQFj/xVwie+viR8dnDQE
	Qq66x4OmTavebYbqgp2wN9RQFIEKIbzZWIYCstd4RfthvBR42/sAYljUDG9opK1t7Xt0jUGrIAgti
	+lgi26pqdFzi3iJ90bJ7Ncjusq7d/hZHRI95tUwimgE4GCaZFUlI3dQ4eGJX5PWbqZO0sX6efYTmw
	KR0l7m8qT8cwqNyhparuwzdIliAj0knuvXScd5NWJ3hH+8fZX++0K8/nM3Lz71rUVrK5gE2/ncGPP
	RC2Am8Fqr4297vmJQp3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1il2al-0005pX-DD; Sat, 28 Dec 2019 03:16:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1il2ai-0005oR-SQ
 for linux-mediatek@lists.infradead.org; Sat, 28 Dec 2019 03:16:38 +0000
X-UUID: 18c558fc6efe433abfc73e16a01b441f-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uSTVEK+nsIniuJAECvz0aav3uObqmPZflDTTEqMVwi4=; 
 b=n/WPZpT1fQhu4MULr1KJzY4a5LZcfbnvjBBkB9GYqrovRvLNSF8Vbs1CUVkTWIzFVVgO+htzjo5iIcdGRzfLqIrbdq0T0zMK4k+LR7MEdgPWlnMiZ3WbGMz1jjG7ieCNp0LHM6pPaSiir4Ncn3v7MeGNohnDROMQV2cR3OOcNdM=;
X-UUID: 18c558fc6efe433abfc73e16a01b441f-20191227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 476230237; Fri, 27 Dec 2019 19:16:32 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 19:06:45 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 28 Dec 2019 11:07:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 28 Dec 2019 11:05:49 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 1/3] mt76: mt7615: report TSF information
Date: Sat, 28 Dec 2019 11:05:10 +0800
Message-ID: <769aba6e014b8e7650c3909d6adb8427c1d5c5ae.1577501739.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_191636_919650_B31172AF 
X-CRM114-Status: UNSURE (   5.80  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds a get_tsf() callback for ibss.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v1 - modify commit msg and variable name.
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 2a85859da754..fa67331918ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -628,6 +628,26 @@ mt7615_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  IEEE80211_STA_NOTEXIST);
 }
 
+static u64
+mt7615_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+{
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	union {
+		u64 t64;
+		u32 t32[2];
+	} tsf;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	mt76_set(dev, MT_LPON_T0CR, MT_LPON_T0CR_MODE); /* TSF read */
+	tsf.t32[0] = mt76_rr(dev, MT_LPON_UTTR0);
+	tsf.t32[1] = mt76_rr(dev, MT_LPON_UTTR1);
+
+	mutex_unlock(&dev->mt76.mutex);
+
+	return tsf.t64;
+}
+
 static void
 mt7615_set_coverage_class(struct ieee80211_hw *hw, s16 coverage_class)
 {
@@ -659,6 +679,7 @@ const struct ieee80211_ops mt7615_ops = {
 	.release_buffered_frames = mt76_release_buffered_frames,
 	.get_txpower = mt76_get_txpower,
 	.channel_switch_beacon = mt7615_channel_switch_beacon,
+	.get_tsf = mt7615_get_tsf,
 	.get_survey = mt76_get_survey,
 	.get_antenna = mt76_get_antenna,
 	.set_coverage_class = mt7615_set_coverage_class,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
