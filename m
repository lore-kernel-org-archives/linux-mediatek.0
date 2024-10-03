Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D1BCF34A9
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stIg9esjqTBVOCrbixO0axas16PaKZ9mDSWypU0VeBY=; b=wco2H1gFaZzte+b+Q9793MjdEk
	HIyZ3VBD/0w18r+j5JeAyjWjC7cCAb03666gzlNf8w5gm/unECijHP1Ia6Qj2I9/S1MpQ0RpHnePr
	wSfZUyBKifDvCOwfTMBx7UUZOfjqV1H7FfeaIYA5DnpOwB+tWhJkzyYrnXEKgnWNjcKsXwvl6rI+6
	zaM/8PfwtQAvstcus4O0TumPbYm3BpmRkWUCivdF+Oi4uxBe1eWYRz7e1+Mkbh4a4MOPqorKlbYeJ
	80nppZVvOrgR2RW4buHEcpOSpEYUbNb2x2BuOXhhAnGSOdc5Ggx8/zD8zSvCAbrsLyNtXWUUK2A/x
	zdX8tgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swNci-00000009YiR-0yub;
	Thu, 03 Oct 2024 15:20:12 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swNbN-00000009YDS-1vIO;
	Thu, 03 Oct 2024 15:18:50 +0000
Received: by mail-qk1-x744.google.com with SMTP id af79cd13be357-7a99de9beb2so61160985a.3;
        Thu, 03 Oct 2024 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727968728; x=1728573528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stIg9esjqTBVOCrbixO0axas16PaKZ9mDSWypU0VeBY=;
        b=Q4iN+O442jQDUpOGvsTZJrZfaWanaobuI4vV+fb3YA57uDWJ+da4QDHESITAJvWSRs
         VRVagFu72pQ5h5dNyEoSzIcI2oyPlRHJ4YcjzOmkALtkEK1OugOOJzPO8A/l1Esdy9Mh
         ytY6W0g7HjgDJDlQibreAF7PWABPbzH/fIbJyYi1BTErOC0gjeuULfM7Qu8fbrJTHg68
         sWRS8SpvkN9y53xqeMiXFE1nnyDuQhwxBAh861A+vjKvVa5OGN+Qz7RDbBou5+U0plYV
         LDPPioz9/z1hIIzBqdelRXXijyqR1gcf0dECzl74CPUQEVXUiMTqAXu4Ua50AqA62JI7
         t+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727968728; x=1728573528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stIg9esjqTBVOCrbixO0axas16PaKZ9mDSWypU0VeBY=;
        b=lTMJJ/dd+cLjhoSe2N2By1CnsjAlC2m779QZDyAOHPLlRdEWJOg9NXSpE+nx2+FYhr
         pASxizE2/b/yN+5ezUpNH86PAEVG8oJe4jenuJftRlSb4AnmOFgs4+F+nsdfYOZZBRWI
         JIkY52LEruKmvUIPSbtvOXQbhdrZO4L9OGi4U/rnDhUNyfHh8e48DnTjuieqLKKPfqSL
         BGxUQAYe1kvObkOjBrMngM87WcZhzAUDNccxCugiwbvKqRaGf3xib5l71rUDkxYu7t6c
         mxbjMDU5+MwvMESM7l6vfzzUv+xaXhyq0X5/s+9FfDA/e8aszHZXaifAzd3feSqJu2TE
         6SuA==
X-Forwarded-Encrypted: i=1; AJvYcCWhwi159aasCqkH9V5Rol5nhRXscEsHsmIfahHHHbrOJs32o9g36NGTXJ2XgxN6VONqqOSuKafksQivvWYOukI=@lists.infradead.org, AJvYcCX1+gNQ0LUKUr0ujrmfRwx723oMMEGO2Patay3UsPnNcbDyB9Eoxu/+jjsDKKgm6METt4A3ne2yQwbyg0uMpJJD@lists.infradead.org
X-Gm-Message-State: AOJu0YwBdHlwonc6UNtXwVC+a++7zQOQra4WC59Q91CCNqHAp6ZhL+G7
	P3fIELeBzX5WHctRspLQzGIUnl4tIlKgM1neKrDKhPXBsGp/a/Am
X-Google-Smtp-Source: AGHT+IEEFCsn4Q8lDCX9rG6BVsdQIU3ZEKq1t0MeNAyWegDJjg27MiEV03EeXDXAe5GTZPR/e/AgeQ==
X-Received: by 2002:a05:620a:440b:b0:7a9:c406:eebd with SMTP id af79cd13be357-7ae62727a81mr1091650785a.42.1727968727726;
        Thu, 03 Oct 2024 08:18:47 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae6b39a497sm58710985a.37.2024.10.03.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:18:47 -0700 (PDT)
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
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] wifi: mt76: Fix NULL Dereference caused by mt76_connac_get_he_phy_cap()
Date: Thu,  3 Oct 2024 10:18:20 -0500
Message-Id: <20241003151819.7977-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5d69448b-10ff-49b6-bfd0-6146ef04a0cc@kernel.org>
References: <5d69448b-10ff-49b6-bfd0-6146ef04a0cc@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_081849_510687_1E7780F6 
X-CRM114-Status: GOOD (  10.05  )
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


