Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236B1EEB575
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 00:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tGvQJO5+HZJPPO1KqQBIk25B8v7Ymb/OBKhMnfOmuo=; b=r9drboRdCHttGqZSm3Ug9qWAp2
	ol7YKRmpw/3X79JI+Q+Efvvz7G+9l2w4+KF+a2bTiV5+zuY1tmMXRfWbRs8riVeubr+fGbvKShyen
	FllRC7+/uXcMtGgRrOHEGFsO0w/Lc/tUceK8dY1GhJYSjqNnC7Sj4BFHj75Ysv4VHNdqBmksXhpYP
	9oqae83yH5T4YBNixhwInY1iZxXq7vpgcgXvRC6ZYCvSVC6NV4XoWaWeZPnsvdnxb47fAy+uC4kBM
	pXm2jbNLBfrAL9AOh0AqOHzIxlJ4CflKtnkm0MakfnhUAFPPqkn6rxGNTxcbQqTDeDvMx98d0MX2X
	93AcZqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6TR-00000006SRV-0pNX;
	Thu, 01 Jan 2026 00:23:29 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6TO-00000006SRB-3QGx
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 00:23:27 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso6261030a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 16:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767227006; x=1767831806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tGvQJO5+HZJPPO1KqQBIk25B8v7Ymb/OBKhMnfOmuo=;
        b=cSJvBQOTAmtIXDOZJT+Lk5KYuiiQi7Ei/KJPS10jWTKZ6LNXoR15mLRtiZtk4idNLx
         m8MN4JaZivawfkiG9LA6wp1b+DhqPYlGldCk9npzCzEzLqgL0qRZRKjdkK1P4JA8FmEz
         Ddv/O5jBKCAD87EAsiJPhs7riMi0KGIK9QZmuFSBQcg25cv5VqEs2FLIga3fnTadqUL6
         9vmnlu85eKZLHYAulNuipmjiwFwdGZV5xwV5/WhIzr7DEAVXRAHnhvVsiuKoAk/iPzt6
         STD0vHlFtGodkODYGgzCkZ6WhsiSxOJrx+w8dVBlZU7aGCae6aspMkAlTILL4WHmeEXb
         ipeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767227006; x=1767831806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tGvQJO5+HZJPPO1KqQBIk25B8v7Ymb/OBKhMnfOmuo=;
        b=vrkv98L5j4doYU5B2giFbTz9Sw06/t3vssulGJJ4p4LCNABg2z8SWVUjAE9ny5XCpO
         W7dTLh8pKfIQQDqTLuI2gDdgN17txwjqCvNkRvjiItGMgiS5gZDRFek6uYRIJAiaS0xF
         JuV3tChsmIP27lUPKNUotHAxwBy6lrjAyo30wb/aSWXpzvOzdW6J8knKcTdJYNZbJR12
         ZFilbn84ilZAtesHbFxspXFpBQzGLpViSWuxsm7pJ8k3emBK+fZ23iuPvthXiaTeUVff
         eLVnd2dzAxWCgvgW9YUXDmUHE/uDqYvevCciIBm+7Ng9xqvG/eLan8f6SbslSRdezAdi
         tnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1dv64P51PakF5Oz/+g3OQH6bAEgC34DiFSlTiaToxzcIohR7hj1QiT9xEpepyNrijCOJ5YKZX5a2tJISBEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoo1E/Lrhx01SaAlhWnAau6+C0PbBNP17ZBgjBG2ITvH4EIsne
	2JXFA5jx3VDBj/MSQ7Fi7KQiJSRYV4z0tszjsAxnBmnNcJl/dYf9gvYh
X-Gm-Gg: AY/fxX7VFQoI+aAXFPe9zdWIP9laeSTf7ikgaJEJ8P+37LqLfTr4DT9PUxcIJsquTed
	clrttfVjsoZ2b2z5KVQx3DdaP5jPZ+veILYYEswwkv4dxG+e6bZ9y+VuEyfUZmsDGdG7Hbuo4jw
	RtN8/NfRkWA3ryvXN8sEctrJqyI4X/46z7NIfJDv71GOPTD1I7/PXTrjwxFpOyryKqZUkbFnLCb
	fFOh5bdlLsq4ZrpHPBPPezxW3jiyzltUR3QuywPvB2UD6ksWCvEIQM2ToCNeDvzaBmu6txjPM6H
	XLuAfkU02dVpqoQaxB5kwmrMA9VzLBuQJrb5b9s9ZEp/4jwEi86vQ8ybTIZojtvbKJE7IuLK8cr
	C0SbGJSOHpyFKxOZ2rpHkccPRcoxWmQZp60aBY4ylv1pbNwN/kwc3ea4+ndAMtX3TyRxGtH40p2
	Nm4YKjbSi8dEirtV8J3tUYguhjAmWw/HorXCC5r5KkTtkwl0olLzhY7HMke6anIKM=
X-Google-Smtp-Source: AGHT+IEp/vktO+XgxIsz+HGD/FJGg3RlZ+uFDOzJ5P0vN0KkOMaBT32tzp8lCNQ2kbNN45KfK7ax3Q==
X-Received: by 2002:a05:693c:800e:b0:2a4:3593:dde0 with SMTP id 5a478bee46e88-2b05ebd065dmr25592455eec.13.1767227005665;
        Wed, 31 Dec 2025 16:23:25 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm81206627eec.5.2025.12.31.16.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 16:23:25 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com
Subject: [PATCH 3/3] wifi: mt76: mt7925: fix missing mutex protection in runtime PM and MLO PM
Date: Wed, 31 Dec 2025 16:23:21 -0800
Message-ID: <20260101002321.19332-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231223702.30957-1-zbowling@gmail.com>
References: <20251231223702.30957-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_162326_865133_31D1C34A 
X-CRM114-Status: GOOD (  11.30  )
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

From: Zac Bowling <zac@zacbowling.com>

Two additional code paths were identified that iterate over active
interfaces and call MCU functions without proper mutex protection:

1. mt7925_set_runtime_pm(): Called when runtime PM settings change.
   The callback mt7925_pm_interface_iter() calls mt7925_mcu_set_beacon_filter()
   which in turn calls mt7925_mcu_set_rxfilter(). These MCU functions require
   the device mutex to be held.

2. mt7925_mlo_pm_work(): A workqueue function for MLO power management.
   The callback mt7925_mlo_pm_iter() was acquiring mutex internally, which
   is inconsistent with the rest of the driver where the caller holds the
   mutex during interface iteration. Move the mutex to the caller for
   consistency and to prevent potential race conditions.

The impact of these bugs:
- mt7925_set_runtime_pm(): Can cause deadlocks when power management
  settings are changed while WiFi is active
- mt7925_mlo_pm_work(): Can cause race conditions during MLO power save
  state transitions

Note: Similar bugs exist in the mt7921 driver and should be fixed in a
separate patch series.

Reported-by: Zac Bowling <zac@zacbowling.com>
Tested-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 3001a62a8b67..9f17b21aef1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -751,9 +751,11 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
 	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 
 	pm->enable = pm->enable_user && !monitor;
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_pm_interface_iter, dev);
+	mt792x_mutex_release(dev);
 	pm->ds_enable = pm->ds_enable_user && !monitor;
 	mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
 }
@@ -1301,14 +1303,12 @@ mt7925_mlo_pm_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	if (mvif->mlo_pm_state != MT792x_MLO_CHANGED_PS)
 		return;
 
-	mt792x_mutex_acquire(dev);
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
 		if (!bss_conf)
 			continue;
 		mt7925_mcu_uni_bss_ps(dev, bss_conf);
 	}
-	mt792x_mutex_release(dev);
 }
 
 void mt7925_mlo_pm_work(struct work_struct *work)
@@ -1317,9 +1317,11 @@ void mt7925_mlo_pm_work(struct work_struct *work)
 					      mlo_pm_work.work);
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_mlo_pm_iter, dev);
+	mt792x_mutex_release(dev);
 }
 
 void mt7925_scan_work(struct work_struct *work)
-- 
2.51.0


