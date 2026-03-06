Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB392FC9EC1
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqkwc4qahyVC1i4Brqm30Kr/xENgHWOOasft1YJy04E=; b=LHWyRCCWHqWtRl56k2ObadQFfm
	Kmk4ScRAMDS4OUBmHJ2+w5IlD48gK4+i+g0bjYoTZ2ygxM4Z0SfT7UFYG7Bftc6rLMeJCrvcEl1Nf
	9dV/lETlM6+FcPlhEXkV0Zo4TACrGmI6eUefIePaIcYSqT8y9adyRxF3iCivsXOcK7Q20KgdSSd1P
	cOrAbVdUrQ4gBXOhXaPi8dw6oovAGMyhLuJWNqKUvztYZnYWcWYzfn147azpkD6tRBU9t2g6sut2y
	uNy3ORHEj3f3Q0GrHFDYbLsyIH1r2+qL11LOZs0QrDnP/3gQtG6D36///9pQaSWSFCfuRz2i6wiYY
	nCJPU+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWX-00000004dqb-3FZZ;
	Fri, 06 Mar 2026 23:24:01 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWT-00000004dnc-2tAw
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:58 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6786b13984fso6910157eaf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839436; x=1773444236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqkwc4qahyVC1i4Brqm30Kr/xENgHWOOasft1YJy04E=;
        b=CxTYi4BfwdMRF9eLp+DjO/H1YhL8ZChcdE2CyrtTVQ/Eqkz5hZsVLXO/X72SelLGuL
         JduVCw8R11xDWDDHql7jloWcQjlSg5rvVvBl9lFvgjBAMrw8gtbie2SZVw7urHtbZXG9
         I780H3Kxixh26jSGSmegBME5zTRmb6g2BiVyFKa2uZnVa+tfui79MhBMHeZjDXhgJmme
         uLgq6Vi34NV2E30Iqjxii1rEkDrycgLnQ5/NpFuVcW/+7S8mQcFs6351kw/abxOVTo/u
         NOJAWf0D/3NBWNE8V6Wp3/0kLcE1I3lUevMFrs5HkAMbQ4Lb0yto2aGNc0T16fBbMnpn
         s4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkl9GOXhnJvhS36mQ5CVft3o3xDPT3cZVqES98nMHUV4t7+XUotFTER54wlkql559IpSXC4RSI4e6dAKdzug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVTTG5Pb7AnxR0P7pUGx6VKtoMvEt7/vQm3JIctoJQrIsAmPpt
	MME62+YiyI3aP+1q7qjxcbBljsdWSkCz6JqecBplu0QTamwdCAVOVkGa
X-Gm-Gg: ATEYQzwIfdBfKEEXuFJ7ppaDQp31BiMCoP1+9BLd7up66gQNGhhADODYSeXFRBKpcTt
	uhrzVZU429jcqeWuTkna8s2aeMlUpxEF6R+6zyHHpL2b8aXklsyMBGgiHpyYWNcfcIb70GKzirb
	RVsOnPnwSPRibMZKMY8GpbFSWb6q7O3nsXtPn8negO58+Keo/Yo4o3p9AjgRWHpKqXBLZ4SrFx0
	pcV39dvgNYkPGqU9VssShv0Fdha+DMDP1sJ9hI7bqyfVrO8Ya5I4hsMoBb3j1vSdyqRu232YEHv
	Ii+zMfsqzhKWlolZxRu6R4SbQt89CtIEZKKJ3wJG605cSe35Q/+J+Gh1mnfeXa2r7Pk+7pDa1C7
	3LlqJH059XuASFPT+8dPS6iGnO5HBLbOjBWm/QNXRJ0oPJ3/uWBmAlP4ALdaChXk8eVpG7k5eWP
	LXuKuBnmiySvnWqVxRASHzfDhleNZM4FmLrchpPRhrvBdnu0/if0bcz6WDNQ==
X-Received: by 2002:a05:6820:488e:b0:679:f16a:6228 with SMTP id 006d021491bc7-67b9bca200bmr2063257eaf.27.1772839436606;
        Fri, 06 Mar 2026 15:23:56 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:56 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 18/19] wifi: mt76: mt7925: publish msta->link after successful link add
Date: Fri,  6 Mar 2026 17:22:37 -0600
Message-ID: <20260306232238.2039675-19-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152357_728119_B6AF13C4 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Sean Wang <sean.wang@mediatek.com>

Move the msta->link[link_id] publication until after
mt7925_mac_link_sta_add() succeeds.

msta->link[] is RCU-visible, so publishing it before setup completes can
expose a link whose add path later fails. Publish it only after success
to avoid partially initialized link state becoming visible.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index eb16c4683100..95c631b57894 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1000,10 +1000,11 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_link_sta *link_sta;
 		struct mt792x_link_sta *mlink;
+		bool is_deflink = false;
 
 		if (msta->deflink_id == IEEE80211_LINK_UNSPECIFIED) {
 			mlink = &msta->deflink;
-			msta->deflink_id = link_id;
+			is_deflink = true;
 		} else {
 			mlink = kzalloc(sizeof(*mlink), GFP_KERNEL);
 			if (!mlink) {
@@ -1012,14 +1013,23 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			}
 		}
 
-		msta->valid_links |= BIT(link_id);
-		rcu_assign_pointer(msta->link[link_id], mlink);
 		mlink->sta = msta;
 		mlink->pri_link = &sta->deflink;
 		mlink->wcid.def_wcid = &msta->deflink.wcid;
 
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
-		mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta, mlink);
+		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta, mlink);
+		if (err) {
+			if (!is_deflink)
+				kfree_rcu(mlink, rcu_head);
+			break;
+		}
+
+		if (is_deflink)
+			msta->deflink_id = link_id;
+
+		rcu_assign_pointer(msta->link[link_id], mlink);
+		msta->valid_links |= BIT(link_id);
 	}
 
 	return err;
-- 
2.43.0


