Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF9EC2A077
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nx+S5z3h6030ObTHHh0B/SCcYrL7BGZ5wBUiVpgW8C8=; b=Epa722uE+txGGfD6aZqiAuNWgX
	SU8OFpm+kHBVt4u4ah74x2eQh8vJHw/cwNi0sQPP1WbrcvCAyKC/RTuTfDmNx4/zmvGttUEj1VY76
	hs+y96nodfmu6AJZTwhCj+5YamesShxJllmCfV97sBnzw27F5ouUiZEdHtqXMBQLzAwmGWOSd1EKt
	KM73MT8pWABOkRTA7M9TpxPX+Dlga9tZnEAM91PRJLjMy5ArmKdhyvsZvdUlYCxqlCxY3igO8B6ud
	sBYH0rTPeYhIUkFya04cvv1nnm6x9BEzGoerDB4pKI1sjJ4k9nAlcDC3ggJ/Z8avV7VRC3eT0V9KH
	QoWH+Y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQx-0000000AZps-19Xe;
	Mon, 05 Jan 2026 00:26:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQu-0000000AZoY-15K0
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:26:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0d67f1877so179062555ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572811; x=1768177611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx+S5z3h6030ObTHHh0B/SCcYrL7BGZ5wBUiVpgW8C8=;
        b=K65FoAVeFWo3NF5oRZZgJJbS4P20cHcvViB6QEsR5uD7D54fO/9LMHsCDF1KVPPMlf
         cttuiNc0dMfqx1K3Xx31/qjKSlpD1UCPCDBTLB3b0ZtuYEzDO0PbXAkCOIZvF/FUSUDd
         yFphUbYGmkZ9PYqLcdrHORIJF4J8UG/6GJed/FL7PgbYcQHaYwmKu67MZI7IYWzN4D/P
         NdEoAP3UT7mzNM6PilHR92nsBVbKsuIpPtkjj3fdlM5vu9XnSKtEF4PP/WQ9TgjxWLjN
         yytvWe2n33cUpHd7oA4qcfiZ1+X5VuZGGRf23WFUCwndrdX967NrIHbw/Q4AvpyunMsX
         bkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572811; x=1768177611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nx+S5z3h6030ObTHHh0B/SCcYrL7BGZ5wBUiVpgW8C8=;
        b=kjQLTGXR/M2TMNrRCEEqQVoJvNSC69Z5n+jdqZOZiCjNbeq7w3+OeRFAGjjIQapCUf
         ypu5JROtxyHbDwyHt/FSX4D296JkDoqaR2PkIgN539MhXmK7r0MW0BMjaIFgP/LWq9lQ
         XXN4x5MtjUYioCAzQnLjUfvsYucvhx08cBVgyWcFiK+gUadAknhl+VwgNF1TVRftQAv+
         aX5U2/SzrSWOkh7iiQq5Hd6T0jfCV5KzTXD8AFiCnk7fFO/q4LHxxzLlIX23rjGfrrPV
         snACzi/ughMU3shc3KN9MwPD3n3IcrQuZsxhMwNsSXwZYTCltjV1VSpL7HHY82xp9V5d
         zS3g==
X-Forwarded-Encrypted: i=1; AJvYcCUzxGrCB9//5snPEM3VK9W6Lx3QOIO0jveV6Odfi+bSQqt48kLS3raxXhGDeeDUVb9fT4obxvIoC8js85GJxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/sj4WGJyR81bKbt4kIEzz/EV+9TxTyVylQQpMiZvHNm34NXcq
	UX68gwUXDbrge31Rpu1UDYibs5RItIaEzgcj+I5lxXYmQ/m/ZczL1WH1
X-Gm-Gg: AY/fxX6KH+uSSWubQ0es2e8jgDm45jqgToMs8xZI/c858gF4rjDDpzi+PAFAZN0b0Q+
	6sVGr5Z+JsXY5HulIdopTtUc78VF9v8T0TeM2MlY5nxfbkxUfZulUkzbXziFCDPn/+1m/dhdmuT
	vGbQy8+lMQ9D0yMfupAtP3DoHAKErIrVi1FaPMTDn+olCSH3eK/lrG+nbrGgDkBInhhQ7e+yu61
	eY6unVkYtC9nND+Ccid8ioJJiXfjAlHitRxDEL+T71FaIh575w+9TPSwLcwX0aEj8Nyn8BpvN4U
	wNKhktDoXvnIGX666JO5rVwPuHf5UJgOT95NL2txZYECmGILHQc9q2/nQ25VOOkICikDBJkra2w
	urReOscRnKu9SRuDHyaShP2fvlMQiDev2TImh4aXlb7wEMC+qXHviynL3JWVs0D+buIsRKF/0Er
	sItUNMGiXoKqK3zwCFzxaLRtfyE8R6yhqOBx08lTuiWIJwzRumUJMi4eLLb3/RZ2M=
X-Google-Smtp-Source: AGHT+IG07f4+BWjJlbqJDdFUMO7Ft/315N9xOwOmVA0qQn17sAgscoR34CTnkVLXsA8WiWEJB7CjHQ==
X-Received: by 2002:a05:7023:883:b0:11d:f890:6751 with SMTP id a92af1059eb24-121721acc21mr46191919c88.10.1767572811084;
        Sun, 04 Jan 2026 16:26:51 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:50 -0800 (PST)
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
	sean.wang@mediatek.com
Subject: [PATCH 01/17] wifi: mt76: mt7925: fix NULL pointer dereference in vif iteration
Date: Sun,  4 Jan 2026 16:26:22 -0800
Message-ID: <20260105002638.668723-2-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162652_300902_4BE82E79 
X-CRM114-Status: GOOD (  13.57  )
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
index 871b67101976..184efe8afa10 100644
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
index 2d358a96640c..3001a62a8b67 100644
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
2.51.0


