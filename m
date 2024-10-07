Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B7CCED24D
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BZJs5LgH19bZqKLp3YYHgBwHdrmt2cmJoLoGioynQiw=; b=n0+DU3JhtxF2M8VpMw1d8cAUmh
	maUkvzXWNZKA3PRC8qMrdRnV+g2XsbSa99oqU0oqTEC6xTiprp0Fuqx6gtP8mp5D/QqLH2N5DwboI
	3+llIPpjTrToCL/ewGeE4Mt2xHGhhLrTCiNELfXMms5yyoZ4XESeOOyuK9hcgwqua5a0eXFf/XNAj
	/yAa9+K6JzDIPTnqXRACDqSGJm1RIILEz0XUYyniCv6NxWos0QdHS7Yh9MBpNbehOTsgFy++ThkAk
	x0Soer4ETrjktOQVXEk04tdU8ajHTlUT+RgJTjnrB5uPKbWm7O28rrzcsUUSdAt+FEQzTh4zcq9ka
	BzIp9cYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxxH9-000000042Lg-0ejq;
	Mon, 07 Oct 2024 23:36:27 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxxFq-000000042Gv-2jJQ;
	Mon, 07 Oct 2024 23:35:08 +0000
Received: by mail-qk1-x743.google.com with SMTP id af79cd13be357-7a9ad8a7c63so500309685a.3;
        Mon, 07 Oct 2024 16:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728344105; x=1728948905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZJs5LgH19bZqKLp3YYHgBwHdrmt2cmJoLoGioynQiw=;
        b=Pdmq2difkMQIIjAd2mtH/XSfT+R2kCZEaMgA9+X43RVbhqcPtUcrO6+BX8GG9Gaw9n
         zk0t/ACuODPM9XZT2cnWi+hQ6Vtwf4ITPkNgC3icv3wwwF1FyRQLoUZ8+SW4ctx5pcgp
         vOD98Cn37vkkTkEm/NGlkVA8EGrPfs90I0IRLmi7zPgrrkk9XRza4AfuaGPsF/sACa65
         wjmYnb+mGkEtv4gUslCN3z1N8QqXdauw/grHmTG/B4JM2o1M8EFpU/QXdaT/iQDHgh10
         cQdtrZpUG7/j6NTpS2pt+qPZTPJsTzCAWE6iDFQYdqrnKBwUJQOXDwKcqclHMK+Qyd8s
         pVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728344105; x=1728948905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZJs5LgH19bZqKLp3YYHgBwHdrmt2cmJoLoGioynQiw=;
        b=wUYGtkSBrplWRFAdF/U9v6703zvvGCraC/oet/iXtyzQTxNoKkrNnDv3oxQqEDw7UD
         /BH5K0l0z/ZcYoeOj6sNpv/g5zoqK+xJGj2jsetXspMJadgnJ22wpxKfQf/j74Idqz9u
         AQph8HO3jTOYMJuEIgnhll/9TuSw7nBoiDx0vwte4gAWamn78oU3OFXozByX5UV01elb
         DY53P8XExHASBLlu/FiPdtqIxJjVXjesMm0u/oQNiWND+w9H8NZygcwrh5hXWVemwfz0
         wFBPiyurxwKJOodQn0DHXWmbYQYowHGakq0QAlZ8D4dg7uGBxQ8rC79xYak2TCWlTlYt
         rjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpueVW6NijQ3XahOkScBo+PEldLiE8aHxeBpKSxpg35+W9tXtocxp50SUqWDWKkxUmbEMkBPKtgsurUS0h/kVp@lists.infradead.org, AJvYcCXMkmW1kfcc1JP/8/9yd/AIdEQaGImKpyYixebLqpSKKHuwJtjtMe6FoYKJI2JOY2njijaJ585jjdHOddGIlXw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9p9bygfoFkPndjslk8XUVNjK6JvPERCVDrrCGdxV2GVLyvScC
	9OyJ7lUJJoPPBGJP388AcMEvUjTnoMhi9lMCeKN3V3lCiV4qpyPe
X-Google-Smtp-Source: AGHT+IGmGfIMy8TYdgSBKpKyWik9Ym2iqoAVO/AxtLyOskaNQP7pFqpPhILQqK9APJ7pUJRBYoJ4TA==
X-Received: by 2002:a05:620a:1985:b0:7ac:b2d6:9ccb with SMTP id af79cd13be357-7ae6f43759emr2008332485a.17.1728344105232;
        Mon, 07 Oct 2024 16:35:05 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae7562e1dbsm303032185a.48.2024.10.07.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 16:35:04 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johannes.berg@intel.com,
	quic_adisi@quicinc.com,
	deren.wu@mediatek.com,
	chui-hao.chiu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	howard-yh.hsu@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	allen.ye@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	Bo.Jiao@mediatek.com,
	evelyn.tsai@mediatek.com,
	meichia.chiu@mediatek.com,
	krzk@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chenyuan0y@gmail.com,
	zzjas98@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v6] wifi: mt76: Fix NULL Dereference caused by mt76_connac_get_he_phy_cap()
Date: Mon,  7 Oct 2024 18:35:01 -0500
Message-Id: <20241007233501.11773-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_163506_722416_CC9A4C84 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

From: Zichen Xie <zichenxie0106@gmail.com>

mt76_connac_get_he_phy_cap() may return a NULL pointer,
leading to NULL Pointer Dereference.
Add a NULL check for the returned pointer.

Fixes: a5c372f77aa7 ("wifi: mt76: mt7925: extend mt7925_mcu_bss_he_tlv for per-link BSS")
Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy utilities")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
v5: Add version tag.
v6: Adjust NULL check position for readability.
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 87d0dd040001..4d53f819c5f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -551,6 +551,8 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct tlv *tlv;
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	if (!cap)
+		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*he));
 
@@ -1140,6 +1142,9 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	struct ieee80211_he_cap_elem *pe = &pc->he_cap_elem;
 	const struct ieee80211_sta_he_cap *vc =
 		mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	if (!vc)
+		return;
+
 	const struct ieee80211_he_cap_elem *ve = &vc->he_cap_elem;
 	u16 mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80);
 	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 748ea6adbc6b..55e4cda2f20f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2508,6 +2508,8 @@ mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
 	struct tlv *tlv;
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, link_conf->vif);
+	if (!cap)
+		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeof(*he));
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 6c445a9dbc03..55bb2d0e67e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -798,6 +798,8 @@ mt7996_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct tlv *tlv;
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	if (!cap)
+		return;
 
 	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeof(*he));
 
-- 
2.25.1


