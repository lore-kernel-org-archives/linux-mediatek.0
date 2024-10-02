Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DFCF8543
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 21:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbnx/1jmCJVxpVNY76oZY6UsGEKPb8zsIs5QjFgvYPw=; b=i2UO6yc+8p0Kj6ovJssi39hb/0
	ZoQeH3opZO9joK3VjOIQ9jv5wptSVJEB7MhPsNCYpL4hbKIwlx2nglIR4MmtuxWAWdF0K3tTsc5fT
	r9IJpcAh1m1XYWWWcOsOKHCa+U0kqIWs+p2dMVyP72AbFeR8dopcxYikgA1uSZbf8XM0HkFpZzNYI
	GEJ4BD50mIEY+3h8jbmVEtctsdpPfIttOb63JYN3ambfvl0PxQ1yxI7zzVX+KfiA78WqB3LtRfdbo
	7JgXs/PbIBH92mnIX8sg+Mw8u2ZvKPOBi0cKYy0B3LfUARi+KB3z/QiTehQwnpvRG4Un4uuCwVQHP
	OdeWo0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw76Q-00000007Yp7-35RI;
	Wed, 02 Oct 2024 21:41:46 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw75B-00000007YcM-0bWd;
	Wed, 02 Oct 2024 21:40:30 +0000
Received: by mail-qk1-x744.google.com with SMTP id af79cd13be357-7a99fde9f1dso25131285a.2;
        Wed, 02 Oct 2024 14:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727905228; x=1728510028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbnx/1jmCJVxpVNY76oZY6UsGEKPb8zsIs5QjFgvYPw=;
        b=hcX0HWl8kfvRAflV7d9G5EQ5NDG6oFy9C5FD10ejwSHACDPx38XcHqrios3RVbbNcw
         +oA9Xz87S+VgRtxRWFiO3GCCf+ySBMmS1pVY/a9mW3UB9Uk5fzdmX/mGKIHrUimCt87L
         fE008usCh1qsYTQCt75D3eF6PgYruwwXdP2BXZyQeHQ+Q33GfX6Z6t2sIGf3bIRQzrlu
         vYCo9R5YqVNeNudFsebe0uqlvl03JhIdZul+77j5VDNOu/dwGnVDvyzY5NVZwAeboRf5
         sJvwpR6eVIXoLI+GLJlbZrCQHOBU6fWrwxtAbNKZUJlOR++ODyIEJ0e6dk9yU9JO5q8b
         AYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727905228; x=1728510028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbnx/1jmCJVxpVNY76oZY6UsGEKPb8zsIs5QjFgvYPw=;
        b=o9fWq8Gpt4zovTmkL0D0EAgc/hJ82Uxvo9PwC/ij4dMpPZqa7LLKPIA0IAGSRjtyDF
         khgry0+BDKaNEu8IVtROOdlYa17yeDSb4/tGJ2YLq6YQj2rRtFvxJ6ZvQE72yQefW7K9
         0rNAlfcOuo7iO4ZYMoW6/mS+vX4cb7+ZFj2ddFDLRQNJB8QNV7zkaSeWcE1EL7QvFgrd
         zkR1R86SdWKhpxcMqivBnPhGrhqhglT4MQ3R/tHI2II5UGbBPBtY5eMJl8rBeTWo40y1
         mLLhLdIJliTsEZ8hH8D/mPqJ985sLQkt3SfUsS/3ayeV8pw3fO+yJ+t82y0q1e/BONNg
         Xqbw==
X-Forwarded-Encrypted: i=1; AJvYcCWNP32gEoV1u+WyOiXDoook/3qyi9P4u/LLMvcemOuFB97SzrZ7Wg+QdkCX7sO4nsXso1HjYfn2aeGllgtrcGo=@lists.infradead.org, AJvYcCWkm0ixrIpTmSDTGkMwI/2gyGsNJl1BKvMZHgJw+x2Ccs4KZReURRmHXNMmangaTGYED0N2zqW7lWot1dbBk7is@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7K1yl7gR45ks+7gGarZhKgUjxPY1WXCyqZhtoqV2IgSCF52BE
	mAABtpurczM1r54CE3lA0k+8rZpnmRhGDHW82mZVyCgDHkUczq+e
X-Google-Smtp-Source: AGHT+IGvVKxkVzIqO1aVzK1KfhXdUeEPO/IVUAq1zzjzGQn7t7CVJeZqGV2TUekB8BorfcWRHEj7ug==
X-Received: by 2002:a05:620a:198b:b0:7a2:e53:3f5d with SMTP id af79cd13be357-7ae627698ffmr538163385a.66.1727905227654;
        Wed, 02 Oct 2024 14:40:27 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377f0e71sm656507185a.71.2024.10.02.14.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 14:40:27 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: krzk@kernel.org,
	nbd@nbd.name,
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
	meichia.chiu@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Gax-c <zichenxie0106@gmail.com>
Subject: [PATCH] wifi: mt76: Fix NULL Dereference caused by mt76_connac_get_he_phy_cap()
Date: Wed,  2 Oct 2024 16:39:20 -0500
Message-Id: <20241002213919.30360-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c7978538-04b4-406a-b8e3-70d3472ace7f@kernel.org>
References: <c7978538-04b4-406a-b8e3-70d3472ace7f@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_144029_210644_2A59B11D 
X-CRM114-Status: GOOD (  10.62  )
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

mt76_connac_get_he_phy_cap() may return a NULL pointer,
leading to NULL Pointer Dereference.
Add a NULL check for the returned pointer.

Fixes: a5c372f77aa7 ("wifi: mt76: mt7925: extend mt7925_mcu_bss_he_tlv for per-link BSS")
Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy utilities")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 87d0dd040001..762be3a37228 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -551,6 +551,8 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct tlv *tlv;
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	if (!cap)
+		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*he));
 
@@ -1145,6 +1147,9 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
 	u8 snd_dim, sts;
 
+	if (!vc)
+		return;
+
 	bf->tx_mode = MT_PHY_TYPE_HE_SU;
 
 	mt7915_mcu_sta_sounding_rate(bf);
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


