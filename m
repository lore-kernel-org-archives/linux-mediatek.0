Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B9FFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSvcfLBOpoUTWN4tbv5S8Vjt79qJpmtw6Uk94nia/cU=; b=gf/4B/fJNRj2rEXMPXfRNkt60P
	H4aoZRhM5IV80PqaeZLBZV5Db+qm96LiFJu+ePwnbWKTHuszCO0zlblApQavEn9vtIU40tKN68aPW
	GcnY75teDO2bkhwifNsSzjebI/yL2x9PDXeTskNXD4W4thJsLtpwqi2o5R7/zqbgXBUsDUSB1nQN+
	zF06iQTtA64pFsECqcCIja+L8h5mNa9UNeZfDGYvIRCludJscDbZGkyl01w6rtz6wlqBNhSwk+MeU
	q8RWdg1veOPl4o5jEkSQFEVBlFZG2MOKxHBlxYa7eH24EGlemW6SFnSwuIRMZ4yL0YfxJLFkx3hZc
	N3HQbV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2I-0000000EmOx-3341;
	Sat, 25 Apr 2026 19:51:30 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2G-0000000EmO7-1DEh
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:29 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d4be94eeacso9234913a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146687; x=1777751487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gSvcfLBOpoUTWN4tbv5S8Vjt79qJpmtw6Uk94nia/cU=;
        b=BxDk3Uz0A6enwMEOpNlF4PINKEAWRPlrqhdJu1pJ0IsJCt0eHP0DSUkijR6CGw1cHe
         j5jkcJpi+BcNSMqgXMXZ02NM2918CozYFkfUwgDdodHN5B3v3DurmiuCVClxykXa6x2g
         6xcHAaYdb7/XJIPIeaduiOCXMM48cIhZZnoQyB9GubSQXR1SzaNRmQlKmjJyhFauMoeV
         Mx4tm0L0OEpziwJV+FcHDTPbM5jAx4ZFPrxYmd0gIr6IzOh9c775Dib81H3JPt9D2DPb
         2xMeMg0JIyXX17TlooYb1m9IhMocSVkB7843K4CbHURwEbO2a4/vBC2FlUgYrt/MLxaM
         PYFA==
X-Forwarded-Encrypted: i=1; AFNElJ9gFtTtEb1l2sALlyfYZBIWLCekEIOfbUKNl7NmpWWFRqs6a5CkJPxo+Utkc5ZG8mxliOVJ70ucgUU7x45TZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlanPoI9NuZ14LgcbtP7Bi3wocJ9Ca6dqM4DiySOm+wHZrT1wM
	xxxjVy3AKWzWUdQDRxFzXppy/2hwBiaYK0cP5wtVwIQJ4fCTJBeF+c4e
X-Gm-Gg: AeBDieuc51DUslkkT69+Ga/EfDwYjhXj79bQlazwTkZVBVD2xXVc1iKWEGFe7BiKlF/
	rVZA8RFu3xwgT3r7YCaXjFaasuF1u4tvygXyxVm8EylBhkLuPEMzZJ75TBRPbAe4NhhrPBIbLFF
	JUXclbM3UbSfWQvDingq0iLfJBafYtsnNLnThwOfSf4oRlpWzneVrO5iWm7sOrywKAhabvsq4OR
	uQOZ3MQdnYsD+se6K+cy8I+PC5/qj+6ISTVBBUbFeBuUPzSU+7V4ky/fwWwUcJMAVfb+J3LOCcM
	D4fF/lx7zRZPK3xcydrFNi2nWnVyS0RFUw4d9jZ7ZHicpt6rajoPJDdixUNX/k9BLpcMxp1Tz+D
	pOjwK8xQoeXv16OPptzk1PBXqHCgxw0/FHuqdYDRj7g7KKmv+J9zJFq8auCb+d4L3pcL1aB2YfJ
	cAOqbbJJlQMdDTCmVdIc2cQaB051sXszrYYG6pAqE0KhUutulqP6mMZdnOhKqLCJxevEHk4nqqT
	PTpMjz6OCgW
X-Received: by 2002:a05:6830:7315:b0:7db:a832:b329 with SMTP id 46e09a7af769-7dc9521f8f4mr22143740a34.21.1777146687361;
        Sat, 25 Apr 2026 12:51:27 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:26 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 11/21] wifi: mt76: mt7925: use link-specific removal for non-MLD STA
Date: Sat, 25 Apr 2026 14:50:01 -0500
Message-ID: <20260425195011.790265-12-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125128_354615_CF2833B4 
X-CRM114-Status: GOOD (  10.94  )
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

Use the default link removal path for non-MLD STA instead of the
multi-link flow.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index bf38d6502970..044043a8768d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1338,14 +1338,14 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	unsigned long rem;
 
-	rem = ieee80211_vif_is_mld(vif) ? msta->valid_links : BIT(0);
-
-	mt7925_mac_sta_remove_links(dev, vif, sta, rem);
-
-	if (ieee80211_vif_is_mld(vif))
+	if (ieee80211_vif_is_mld(vif)) {
+		mt7925_mac_sta_remove_links(dev, vif, sta, msta->valid_links);
 		mt7925_mcu_del_dev(mdev, vif);
+	} else {
+		mt7925_mac_link_sta_remove(mdev, vif, &sta->deflink,
+					   &msta->deflink);
+	}
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		mvif->wep_sta = NULL;
-- 
2.43.0


