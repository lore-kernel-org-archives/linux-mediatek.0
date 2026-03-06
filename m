Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8D8FC9EC2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8U9+hSIbEs940Aoyd4sF/1aA7wYAwUcqyyOlSkJHcI=; b=Rks/gf45nFGuilNwKcPTIiaQbN
	zZLt7sftCXsI8OY2MZlH/eGBHgpoRhESFELCQQoEatdAw/+yiX6sfe3iUd5Xg3MOk0P/ITryd+cOs
	4P+ZdxTF0//u2Yy72uqmhuM8lGqssoWgZAo7TdyWonZiPUcpBRYB+dY4djV3xKCZky/tiwdD7ct92
	QY0lFZ1ltaJOERdMgGKABZ+4QUDdCJ7BqDycLhTp7trdaRDtpJbgBHAsrPq7P5xPyVrLtHkfgRcbm
	/vgfbtVmRrLQ6qfZc6+eiAZljYn17Uu3ZZBhwoZsyNw4y1jvI+z0RPnHmI2/1NW3r6xdvLavaZ1As
	wF2Pd98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWS-00000004dmv-01o1;
	Fri, 06 Mar 2026 23:23:56 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWP-00000004dlN-3JBg
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:54 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-40ee8b4f925so3401838fac.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839433; x=1773444233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f8U9+hSIbEs940Aoyd4sF/1aA7wYAwUcqyyOlSkJHcI=;
        b=gjpPCA9TrhhPsWkrGYYFr7YxSNPHoEgqGZdAA2pw7lKefeyNSMyzJoq7sysvnO4eTs
         KPCHC12SdcjMGFIB6/7CyCDOVMDcoRvE8FSnMlhP/ZTY9GzWGvUEmlOdvKVouBaikFTj
         iqXpH0qJ8Oq73GUTeN6wM1nKIBGCLxfY3yqSezHmXU7BqktJW8UEfgCrUT6exqWUkzTj
         i19EfNO1/79Z2jLsK9kN5cQGx1lco3l73RQmEmNJcGteGn94LaF8J1UBfM9AoX+cZRtd
         SiUkchlPTbkx2zam4I8R80HEvor10RaJhhvFtdWlSepXpByCQKyrnER8S2ufOVialAG/
         ceiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMy2DXKIGrsBdV2jqecbqhH2rvLkH0A9smch500s/1FVhk2ItuJBysx6gv3zzWxDmigAmVW/XmWxAMd+4lkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyepJDFgnDDFYy2eagZFUK4kJ4kXXkr9jINQtO2nXNgP8ODX/vu
	fOTlll2XEduaBt8R+G0znXu8cdT9YgAYt32AE7jdy1Ps1rNsKbQvJeewdVWjww==
X-Gm-Gg: ATEYQzy3ubWf9Sykq7OFb/TEgv+vctJfKpeFndazCAEHvggCwQlsfm1bxbXUkbLGz/k
	iVy1j0C0ymeCOUZX9tlisNlQAKlTtDLRzYQ4GBLE9pfTCT5mA2cDR4GUryJTMuFsuRE5lDbDDjC
	ZqCsqGOBP1t0Fs+T5iQaKf2jPgk97I4/jUskcfoeEHRrlEcdPGB+Cgrs+2b+oc6Qkq9cYofh72G
	FeTbWe2thpaC2cvqGe/+5nHForH9PCwF+3Nwwm64tur5VvvcQn00X2Ns62mZentO/VxM7YhKJX6
	pEzrhuynbuwYOgahkIQXfEJ8IQEuuBcRSn95JYd17Ylg1iDGDaKeulu0AqNKhuGkqAXqMR9B94N
	iqxTH2lFSCuLyi7HGP/j1dQ1wa2PzsGyT3LtRgLxhEj5YXXe00VsdDQwwMXJJtWAT8ZxyClhRga
	lljFZJUgER+qdugxm+Bi6NaloG0ecrVD4KzxINItogXsavlgs=
X-Received: by 2002:a05:687c:2191:b0:332:1b00:6d5 with SMTP id 586e51a60fabf-416e43ea37cmr2331768fac.39.1772839432955;
        Fri, 06 Mar 2026 15:23:52 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:52 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 16/19] wifi: mt76: mt7925: move WCID teardown into link_sta_remove()
Date: Fri,  6 Mar 2026 17:22:35 -0600
Message-ID: <20260306232238.2039675-17-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152353_978350_814DE606 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Move WCID teardown into mt7925_mac_link_sta_remove() to mirror the
dev->mt76.wcid[] publish done during link add.

This clears the published WCID before the rest of teardown, so WCID
lookups no longer expose a link that is being removed.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d99dbd707fcd..9e3f3874d0b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1151,12 +1151,14 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 				       struct mt792x_link_sta *mlink)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+	struct mt76_wcid *wcid = &mlink->wcid;
 	struct ieee80211_bss_conf *link_conf;
 	u8 link_id = link_sta->link_id;
+	u16 idx = wcid->idx;
 
 	mt7925_roc_abort_sync(dev);
 
-	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
+	mt76_connac_free_pending_tx_skbs(&dev->pm, wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
 	mt7925_mcu_sta_update(dev, link_sta, vif, mlink, false,
@@ -1183,6 +1185,10 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 		list_del_init(&mlink->wcid.poll_list);
 	spin_unlock_bh(&mdev->sta_poll_lock);
 
+	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
+	mt76_wcid_cleanup(mdev, wcid);
+	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 
@@ -1191,8 +1197,6 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, unsigned long old_links)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
-	struct mt76_dev *mdev = &dev->mt76;
-	struct mt76_wcid *wcid;
 	unsigned int link_id;
 
 	/* clean up bss before starec */
@@ -1235,16 +1239,12 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (!mlink)
 			continue;
 
-		mt7925_mac_link_sta_remove(&dev->mt76, vif, link_sta, mlink);
-
-		wcid = &mlink->wcid;
 		rcu_assign_pointer(msta->link[link_id], NULL);
 		msta->valid_links &= ~BIT(link_id);
 		mlink->sta = NULL;
 		mlink->pri_link = NULL;
 
-		mt76_wcid_cleanup(mdev, wcid);
-		mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
+		mt7925_mac_link_sta_remove(&dev->mt76, vif, link_sta, mlink);
 
 		if (msta->deflink_id == link_id)
 			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
-- 
2.43.0


