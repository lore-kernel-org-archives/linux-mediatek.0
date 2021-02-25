Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD38C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 14:59:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D157D64EC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 14:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D157D64EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0KAiFH5rlypKcc2XYZD2KlA65s1ZsUL6EIKJVZ7K4Oc=; b=a4Y7ydGRJWDYbUTQFR36xNzNQ
	0Ql8ftqOKSF7SMbNjT+UoSFOXSpGogjJGbDtqxujk3xiUawPFg/a/DbqL+O36LQ5/LJPciW2x77MR
	ctms/jcUTB3BvBZQDlDdh3wdFDIdJSs+YSFCX8CMXKqEAK0KRJWQa8x5+ehn7O+f9jmlr00A98Hck
	nT2z8E2oCq96Xs0OM5XbN3SoC6Txx5qDHO0W1WDKTi+5J69xn+dCEViKPrv+UEAJWaj9cj4bMMjig
	u1a2rhZn44w6zUg8mRqOCwg7VFyS/vKl5pzICC0GFeU2faVthe5oaW6pLKg9fnD/cZ8FZEXvdqrHi
	SbIgo3kTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFI6N-0003Wt-RR; Thu, 25 Feb 2021 14:58:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFI6I-0003VD-Oy
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 14:58:48 +0000
X-UUID: 3054a0dcc1e740d288d88895e86833bd-20210225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Y27a2mx/sioEwtQ9jqiiBUAupSs2pvIadmiyucoqiUs=; 
 b=tYTiPwoZmCIu3vIUriYImcquAg9VGW/TZU/pV0dMwZ3LvZrXznBQ5buJv3faItU5iLUdc7yMQC0Pcl67F1BTn9lAGqKt/F8JqINSHB4kpAq+jeut5Dpv49WVhusdDKIhYNed8V26/RlkKPyE3r0SnEuzOuHYhSYwUVHlmVyeF8Q=;
X-UUID: 3054a0dcc1e740d288d88895e86833bd-20210225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 753643307; Thu, 25 Feb 2021 06:58:40 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Feb 2021 06:58:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Feb 2021 22:58:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Feb 2021 22:58:37 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 2/2] mt76: mt7615: add missing capabilities for DBDC
Date: Thu, 25 Feb 2021 22:58:36 +0800
Message-ID: <7d82c4070c96c32a3fcca07366d1c5183b0c0258.1614239710.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <dd852df70c61ad730f39566ed6fa22c736ce5942.1614239710.git.ryder.lee@mediatek.com>
References: <dd852df70c61ad730f39566ed6fa22c736ce5942.1614239710.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_095847_616002_953AF383 
X-CRM114-Status: GOOD (  10.88  )
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

Same as mt7915, this should improve performance.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - adjust setup sequence.
---
 .../net/wireless/mediatek/mt76/mt7615/init.c    | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 88a2ee7e7143..bc908514a510 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -368,6 +368,17 @@ mt7615_init_wiphy(struct ieee80211_hw *hw)
 		hw->max_tx_fragments = MT_TXP_MAX_BUF_NUM;
 	else
 		hw->max_tx_fragments = MT_HW_TXP_MAX_BUF_NUM;
+
+	if (phy->mt76->cap.has_2ghz)
+		phy->mt76->sband_2g.sband.ht_cap.cap |=
+			IEEE80211_HT_CAP_LDPC_CODING;
+
+	if (phy->mt76->cap.has_5ghz) {
+		phy->mt76->sband_5g.sband.ht_cap.cap |=
+			IEEE80211_HT_CAP_LDPC_CODING;
+		phy->mt76->sband_5g.sband.vht_cap.cap |=
+			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
+	}
 }
 
 static void
@@ -424,7 +435,6 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	phy->mt76 = mphy;
 	mphy->chainmask = dev->chainmask & ~dev->mphy.chainmask;
 	mphy->antenna_mask = BIT(hweight8(mphy->chainmask)) - 1;
-	mt7615_init_wiphy(mphy->hw);
 
 	INIT_DELAYED_WORK(&mphy->mac_work, mt7615_mac_work);
 	INIT_DELAYED_WORK(&phy->scan_work, mt7615_scan_work);
@@ -448,6 +458,7 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	/* second phy can only handle 5 GHz */
 	mphy->cap.has_5ghz = true;
+	mt7615_init_wiphy(mphy->hw);
 
 	/* mt7615 second phy shares the same hw queues with the primary one */
 	for (i = 0; i <= MT_TXQ_PSD ; i++)
@@ -505,10 +516,6 @@ void mt7615_init_device(struct mt7615_dev *dev)
 
 	mt7615_init_wiphy(hw);
 	dev->pm.idle_timeout = MT7615_PM_TIMEOUT;
-	dev->mphy.sband_2g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	dev->mphy.sband_5g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	dev->mphy.sband_5g.sband.vht_cap.cap |=
-			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
 	mt7615_cap_dbdc_disable(dev);
 	dev->phy.dfs_state = -1;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
