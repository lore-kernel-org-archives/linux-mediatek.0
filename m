Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC0FFC9EC2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYDpqZoQ+vNHkq329w7Lb717GNTwWDi5eHmjmn69HQs=; b=meibAb8EZBx3bSrVo61e+L+H9+
	IRGfNCxvypHum46AeRoz8V3I48H5EMDAZHoRfcysR7tr3dRcvmUO2vuUViNcbYYoYznGcxjwfHeiO
	Q3qBO+0IFrXzQq0QAVlwhwjN/uM+oeNKX4t8P68kU4H1xAlOvauzOwz0obbyfHT2W7TLTy+5qd9er
	nnKnSHifrIcjnXANiwx4+2jOCwumNOL8bLlxAI9dZH+cKmtfx/Vd9MK6wNa4p5aj6V3hOyZejnXin
	8gs8WCMyR4gIMZs03O6KiPmiwxcRGnR07u58Wyi7nq7P95if5MWSOLbtLzgMZOXvarKdm5gnfzCkM
	zWGuzfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWL-00000004diZ-12HD;
	Fri, 06 Mar 2026 23:23:49 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWI-00000004dfp-3YqL
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:48 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40ee486a76eso3277449fac.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839425; x=1773444225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYDpqZoQ+vNHkq329w7Lb717GNTwWDi5eHmjmn69HQs=;
        b=V0GnF2vYvnqhEDu/nV2cnnJeYwPPgEosoTJ64kH+rW/E30TmkiMaxz7BzUbrAQSMwl
         AHt5gw/U/yVaTlYLACGTTy7Y7vdfp0jRD+KzFYZyvN0KINZCoaNYh7OoCLp9eBObVuZV
         +J/xwW7Yv/w2ZI5O0CntIr4h0ThNgYbUpDsNf7bzXb3buZaeQzUvMoPryYbaujGRmDOm
         MlhidwLlnwmgTp3y+Hp+a72NehjjsaZou9lc2CEUnBgJZYNE/m9J2n8K/AAhdlMwH3NI
         RiA3+yHmsZzmS3sJD0Q/X0WEBFQRKWzkWMIOTFGy4N9gi7oQQCKf1Ns4ld6dX1Wv85HU
         dBKw==
X-Forwarded-Encrypted: i=1; AJvYcCWk3+ZdArYQLmJCEJ4r5RrJkSsJZ8ga+69GUs+yWBp9SH8i+HIuoAOdGVZVwXnkyoLPbaxV4L2h4l9M2c2f0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJALe66hs6gwSTmPBE0O59biYmbLZaBXfgxEDl4qAEJL4AauGm
	LdG7tm2ZjNsy1uFvSOptM2tgdSeAbLcwuqtrenlp9ACkAWvUZr4AVpeL
X-Gm-Gg: ATEYQzy7902J52Grtm6EH3BwU/vQp8suNJn2zrhrzIBAt9wZjqDvsBixNkR2eHtld03
	z+itLmfRkbnBGiNWI5cL7GZY4z+xUJgcT2jUqeQd4RkwkAGLZCTQ1RnatgsSQbl80KL5VnfPg4p
	LdOI0q4Orwbq1ZzVl5NA/2TVZ7NwpMXt9VqOsA0ZS8Md7ktW3SNuK07wyZWKCF2md4XNxw01der
	dvQ30Hvd2SoGs7sOgzAelLM2LLalgK/wW8EecMDPa1wHrP45wNrcon8fQWb0m4FeUEh4UMVno9W
	2crSAW6X2JpgFrHKVUwaGrASXq3klHYzE/LDG5O2yFMwCfwJxc50dbU4nhoAleolH3zsEiRWSJq
	Z/z00VGfuRTRIP8mrHVPgI/8ej8BfWxsQbISzZ5kTAJXE3PNV6IlFqL15tmF+v0T+uW8an532Ql
	qxfHsEWk+AsTliAwfpZOQNQy3rUxSIub8F/cFXwJ5mH6HlO+sCyyBrN3Pc8g==
X-Received: by 2002:a05:6871:e41b:b0:40a:5795:152f with SMTP id 586e51a60fabf-416e3f309b8mr2489946fac.4.1772839425579;
        Fri, 06 Mar 2026 15:23:45 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:45 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 14/19] wifi: mt76: mt7925: unwind WCID setup on link STA add failure
Date: Fri,  6 Mar 2026 17:22:33 -0600
Message-ID: <20260306232238.2039675-15-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152347_240978_9F194794 
X-CRM114-Status: GOOD (  10.96  )
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

Undo the published WCID state when mt7925_mac_link_sta_add() fails after
WCID setup.

The add path can fail after dev->mt76.wcid[] is published, so the error
path must clear the partial host-side WCID state to avoid leaving stale
entries behind.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 53 +++++++++++++------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 584d989fb4e8..dbde91727cd0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -862,8 +862,10 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	struct ieee80211_bss_conf *link_conf;
 	struct mt792x_bss_conf *mconf;
 	u8 link_id = link_sta->link_id;
+	bool wcid_published = false;
 	struct mt792x_sta *msta;
 	struct mt76_wcid *wcid;
+	bool pm_woken = false;
 	int ret, idx;
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
@@ -888,6 +890,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	wcid = &mlink->wcid;
 	ewma_signal_init(&wcid->rssi);
 	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
+	wcid_published = true;
 	mt76_wcid_init(wcid, 0);
 	ewma_avg_signal_init(&mlink->avg_ack_signal);
 	memset(mlink->airtime_ac, 0,
@@ -895,7 +898,8 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
-		return ret;
+		goto out_wcid;
+	pm_woken = true;
 
 	mt7925_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
@@ -909,15 +913,19 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 		mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
 
 		if (ieee80211_vif_is_mld(vif)) {
-			mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
-						    link_conf, link_sta,
-						    mlink_bc->wcid.idx, mlink->wcid.idx,
-						    link_sta != mlink->pri_link);
+			ret = mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
+							  link_conf, link_sta,
+							  mlink_bc->wcid.idx, mlink->wcid.idx,
+							  link_sta != mlink->pri_link);
+			if (ret)
+				goto out_pm;
 		} else {
-			mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
-						    link_conf, link_sta,
-						    mlink_bc->wcid.idx, mlink->wcid.idx,
-						    false);
+			ret = mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
+							  link_conf, link_sta,
+							  mlink_bc->wcid.idx, mlink->wcid.idx,
+							  false);
+			if (ret)
+				goto out_pm;
 		}
 	}
 
@@ -927,7 +935,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 					    mlink, true,
 					    MT76_STA_INFO_STATE_NONE);
 		if (ret)
-			return ret;
+			goto out_pm;
 	} else if (ieee80211_vif_is_mld(vif) &&
 		   link_sta != mlink->pri_link) {
 		struct mt792x_link_sta *pri_mlink;
@@ -940,31 +948,46 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			    container_of(pri_wcid, struct mt792x_link_sta, wcid) :
 			    NULL;
 
-		if (WARN_ON_ONCE(!pri_mlink))
-			return -EINVAL;
+		if (WARN_ON_ONCE(!pri_mlink)) {
+			ret = -EINVAL;
+			goto out_pm;
+		}
 
 		ret = mt7925_mcu_sta_update(dev, mlink->pri_link, vif,
 					    pri_mlink, true,
 					    MT76_STA_INFO_STATE_ASSOC);
 		if (ret)
-			return ret;
+			goto out_pm;
 
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
 					    mlink, true,
 					    MT76_STA_INFO_STATE_ASSOC);
 		if (ret)
-			return ret;
+			goto out_pm;
 	} else {
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
 					    mlink, true,
 					    MT76_STA_INFO_STATE_NONE);
 		if (ret)
-			return ret;
+			goto out_pm;
 	}
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
 	return 0;
+
+out_pm:
+	if (pm_woken)
+		mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
+out_wcid:
+	if (wcid_published) {
+		u16 idx = wcid->idx;
+
+		rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
+		mt76_wcid_cleanup(mdev, wcid);
+		mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
+	}
+	return ret;
 }
 
 static int
-- 
2.43.0


