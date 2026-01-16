Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECAAD47CAD
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmitJgGTb482NSa9dbipMswu0tysB2njmnlh/lsqfgI=; b=24Ri4dsOQNE+gJ3tfNCE/vZJ54
	2oeDHbCua5kFiKfTW5bKTKirbAqOq637eAah5tkBMhzm2Q2U/wigbcXPIkoHWhcMER5kILL2qKrKj
	MXYsm6ju7MXwcPtZYDE/HHzIpuOopzG7Hkh2RkrKfMXP3bgfHULEprOA6EcQM6QWp7UPCYyc5FtSf
	ORjZfrTvMS+TkU0/wQL0rcukV1+6xeDw9jtw8csUOagwsL8Xu5U2/lXJtfMzisvRASQ+6tHun2ys/
	5COY8Q93WxAygbDDYv1SQ+kgaSw78wO40iwm9NZCrEwlS5VjgmXHKEqiXl4wIl1lsSTyN9rxoPQTO
	cN2uys4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHN-0000000DORL-2hdb;
	Fri, 16 Jan 2026 01:05:33 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHH-0000000DOOU-0xDm
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:28 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2b6bb644e8eso30909eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525526; x=1769130326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmitJgGTb482NSa9dbipMswu0tysB2njmnlh/lsqfgI=;
        b=R1vreJH3WKVj+4u2QICBbCOQpoxUizrxs+ftb+dh/TYuEIMpklfiY2ZjSik6rw7/dD
         G9CZQlRyVNbaiAHYa/Outzvx0b1ueKR/6dAE8XnaZyqgJ15eF046ny46LFMaTxJ2cfir
         t2fEcRARxRs4U9IJVzGzN4CmFhxsUx/tq3+Jp9u+8WPUIemlbPcpOIa67LDTLTpcxXIg
         2pM3cKR4//cAHwef78n7cOhSK2z52nc0Q8lRgbn+AMupI/ULzA5FiFuNv8IEBQgt14T3
         kBfRl4iFfa5xREKQbZjwhziTVvceW8792nBqSwlWiHanWExURiJ8oP0E+79uZJWWMA+U
         e2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525526; x=1769130326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmitJgGTb482NSa9dbipMswu0tysB2njmnlh/lsqfgI=;
        b=aJs53DZlYoPmTko4gaJu6665+WuZv0NY4Nl91borcYB0icc5AH4Of0bZWmrU3M/28c
         Po+ql4I2QcZqsxv8i4Eyfar3rdwmO3/zA9O1T39ifTnGkRd+Q+yG7ZGXoO+ttDpr/Jn3
         bT9jBBJ5+vjQTf+aF+T2M/gQgXoee40du43chdRyF9dexDC4y2AiGCSvvzObFf+HyJRF
         HsmnjYW2uvE8slm2CJZS8lymXJq3t/HVb4D4efTeBhdhLfGgzKkmv/UGPPVws7OpF9F5
         mD6s9Da1q98x+2z/Cdzr2IoeULhMnN+icq/d5TMF8/DVWEOgntzGdqYZ/13L7T9S3gKv
         VRZg==
X-Forwarded-Encrypted: i=1; AJvYcCVyXGo18AdAr1PnqgtMWwL+yYlXKLglnVmG8oq+X84E14bKEndk5RKQuv+Jqa+5aa2NaKVTdmJEOMj7BpPjCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaPJJBgPt75R2aadgIHcNGLWlc5hHpCuyPlbN13PS4dSZ+m2a/
	N+doALWpO+FLXB1xz1qEWG9YD0pP/JX2PXQ3b2IAx9ZF/2QSCOmVA8wL
X-Gm-Gg: AY/fxX41MhYvwmH1R+ZSUVK7KKop2BA35nX8WLEOOLPX6fAVe0RZH2JZOBXxdGkHVRl
	QGzyDUKrMvhBMdxLsMqOiMn0xYUtCSXrxWP4FchZp1rUENOWfilDSiv+d7XPZw75bZTn79vl1Rv
	yy5HVpOmpOLylPwMacFCF9heZ+0xDo5HlPtEKYfPIRdYi2BoAlYhtH0mS2eH1vM6zVwrkzFhdAn
	o8P5PI6Rsv70ENK3O6rpmibbLDJFsGlDeLzKtJiPJftQZd7RMxacKf+egCkeDpzZeUA91gRHiL2
	dmVxcn+NQDG+xNf2JSa7QpyvRg4VWCUzZUyuCDKOUm0gXN2K5Im4C5N4kP7D0G1QC0DVH2FfVPe
	4ET/1PxtVP6kh4rcrTqgIUTmQGcDTbUI+oa+f2Ypowv/OftsBaVa+b8jXi5jxd45mZx3lV87Bki
	cwiMwSVkjj65S9Xq9ZBZkXXGeTYbMJfOlSVmsUijvEl9WHtUY8B2LIM0zzUUgbUg==
X-Received: by 2002:a05:7301:1286:b0:2b0:59f9:aed6 with SMTP id 5a478bee46e88-2b6b3f182cemr1704175eec.9.1768525524645;
        Thu, 15 Jan 2026 17:05:24 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:24 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 01/21] wifi: mt76: mt7925: fix NULL pointer dereference in vif iteration
Date: Thu, 15 Jan 2026 17:04:59 -0800
Message-ID: <20260116010519.37001-2-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170527_270274_00F487C6 
X-CRM114-Status: GOOD (  13.67  )
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

From: Zac Bowling <zbowling@gmail.com>

mt792x_vif_to_bss_conf() can return NULL when iterating over valid_links
during HW reset or other state transitions, because the link configuration
in mac80211 may not be set up yet even though the driver's valid_links
bitmap has the link marked as valid.

This causes a NULL pointer dereference in mt76_connac_mcu_uni_add_dev()
when it tries to access bss_conf->vif->type, and similar crashes in other
functions that use bss_conf without checking.

This crash was observed on Framework Desktop (AMD Ryzen AI Max 300) with
MT7925 (RZ717) running kernel 6.17. The panic occurs during BSSID roaming
when the adapter attempts to switch to a better access point:

  BUG: kernel NULL pointer dereference, address: 0000000000000010
  CPU: 1 UID: 0 PID: 8362 Comm: kworker/u128:10 Tainted: G           OE
  Workqueue: mt76 mt7925_mac_reset_work [mt7925_common]
  RIP: 0010:mt76_connac_mcu_uni_add_dev+0x9c/0x780 [mt76_connac_lib]
  Call Trace:
   mt7925_vif_connect_iter+0xcb/0x240 [mt7925_common]
   __iterate_interfaces+0x92/0x130 [mac80211]
   ieee80211_iterate_interfaces+0x3d/0x60 [mac80211]
   mt7925_mac_reset_work+0x105/0x190 [mt7925_common]
   process_one_work+0x18b/0x370
   worker_thread+0x317/0x450

The issue manifests approximately every 5 minutes when the adapter tries
to hop to a better BSSID, causing system-wide hangs where network commands
(ip, ifconfig, etc.) hang indefinitely.

Add NULL checks for bss_conf before using it in:
- mt7925_vif_connect_iter()
- mt7925_change_vif_links()
- mt7925_mac_sta_assoc()
- mt7925_mac_sta_remove_links()

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Link: https://community.frame.work/t/kernel-panic-from-wifi-mediatek-mt7925-nullptr-dereference/79301
Reported-by: Zac Bowling <zac@zacbowling.com>
Tested-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 871b671019..184efe8afa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1271,6 +1271,12 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
 		mconf = mt792x_vif_to_link(mvif, i);
 
+		/* Skip links that don't have bss_conf set up yet in mac80211.
+		 * This can happen during HW reset when link state is inconsistent.
+		 */
+		if (!bss_conf)
+			continue;
+
 		mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf, &mconf->mt76,
 					    &mvif->sta.deflink.wcid, true);
 		mt7925_mcu_set_tx(dev, bss_conf);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 2d358a9664..3001a62a8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1304,6 +1304,8 @@ mt7925_mlo_pm_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	mt792x_mutex_acquire(dev);
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		if (!bss_conf)
+			continue;
 		mt7925_mcu_uni_bss_ps(dev, bss_conf);
 	}
 	mt792x_mutex_release(dev);
@@ -1630,6 +1632,8 @@ static void mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
 
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		if (!bss_conf)
+			continue;
 		__mt7925_ipv6_addr_change(hw, bss_conf, idev);
 	}
 }
@@ -1861,6 +1865,8 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_ARP_FILTER) {
 		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 			bss_conf = mt792x_vif_to_bss_conf(vif, i);
+			if (!bss_conf)
+				continue;
 			mt7925_mcu_update_arp_filter(&dev->mt76, bss_conf);
 		}
 	}
@@ -1876,6 +1882,8 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 			} else if (mvif->mlo_pm_state == MT792x_MLO_CHANGED_PS) {
 				for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 					bss_conf = mt792x_vif_to_bss_conf(vif, i);
+					if (!bss_conf)
+						continue;
 					mt7925_mcu_uni_bss_ps(dev, bss_conf);
 				}
 			}
-- 
2.52.0


