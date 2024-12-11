Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5CBE7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FV6wsq5yojUFiUHKK/2cJBWsk228RylpQzgVFP9hkUI=; b=EesblV71kzzAOVuDtAfDd3/GTr
	0OVvjbEZk2G5Pl6A6Rs2wo3oHrRhSBHh7UgpNFKDGA8XaCyVdVUx7itKpP2mnlPQnMRPhERF+9Ai1
	J/7XN4rMcAaNbgEDJo5uyEiAl6OCYfXbulrf7vZQkzjlpLGx9pf1g3vQI3a/bxzz0TSFmmI3+jkTc
	RpudteG4Kts1u3Yd4X23vIbGDLaK4k1tV+Dh+qEzX+vPrcm/75tl0ZdjkFYVkUjlixMUQV5pKLS4o
	IaEpMz/RQpf/xjNBY2/WgxwxpexF6aQD3ZyPziWMdcbPB4b32+ezoTnxsVpQQREktu2u4iJZhT/Hs
	M/SnOeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOg-0000000DOqf-3Sb0;
	Wed, 11 Dec 2024 01:20:14 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOf-0000000DOpX-0Yl0
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:14 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-29fbba47ca4so1233965fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880012; x=1734484812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV6wsq5yojUFiUHKK/2cJBWsk228RylpQzgVFP9hkUI=;
        b=jhaZAFHVWQa4roive1nk+7jsNLGvzDGWKy2Q4QQl+wpAIa7XWDgdG9ZJ79FIe5ZQ/m
         aZhCQhJETZRB8LbUXqRcHJUvpt9lK61zjldIrQlpzT9Ht7QqT6ZO1LFkJVKzepQEMVcf
         vJy15czgmFNyiyGwIsQ46BK1zzLeAr5wSmboOZQSGe9Bhp0V+2e2PRY6ApMNEEhNqiXG
         EWloxn/Vh1xfmMseQzmTPj+7BhhDvpCXYmfYE0gO5n92kz2Kbbtn2FDycx6cyWHOe1sT
         dlof4XZyX56KopQB4KGiqQlkRoIZh53hU/cHJSE6Q3l5LnjRHvDp35ypQFCSSbDoyQs+
         Ckzg==
X-Forwarded-Encrypted: i=1; AJvYcCUr8G2a0gYnuxNNNgfZJMKmphdPNsR+VGHbWKfx3jcQFuj9JLZr/EduWOS4AtA+QSSCZROCC//Ty+a50GI9CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKcjn8lQGXfNN7uSCyYIRYEIaJ/HqSA4e8/L9kYxRx9DejtcbE
	gMWLC7YoBVGuiuOjiFsmvh0ZlYXqBioWid6Sl54VRwUgfB/uv01M
X-Gm-Gg: ASbGncsiyt6pQMmtLRGP6htaj94J6BUL43galC5QeWrWgPGDVTIo8eWNMMisy5mCpzn
	L3BXL7LmRNgfqm3YRas46qTbN5D3NjIHjxv6R+yybDt32RELu7w6+ggC/O4FLvtumvZVuS6HYwe
	r2fakrtJtz7TfrIYW7Pm0PgnjAPWoeEtAokAz5ERBrap2k7oxu9wa547pD9UbNbUv5STeRVHpJe
	AZzIr6C2dLxthVUuOa0NCkhC5XUUfIuNfRD3BRQQufM0XAcgHrOF8nNhGfhMvsHFeI3Hks=
X-Google-Smtp-Source: AGHT+IGqlBfpoRHgY6cQ59RfOO97L29fROSkxpXSP4o/y0JiWpNvhu6DePzNcIePlys5f39S81NDGg==
X-Received: by 2002:a05:6871:e48d:b0:29f:de75:d178 with SMTP id 586e51a60fabf-2a012c541d7mr747405fac.19.1733880012250;
        Tue, 10 Dec 2024 17:20:12 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:10 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 10/17] wifi: mt76: mt7925: Update mt7925_mcu_sta_update for BC in ASSOC state
Date: Tue, 10 Dec 2024 17:19:19 -0800
Message-Id: <20241211011926.5002-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172013_172424_C427A5A7 
X-CRM114-Status: UNSURE (   8.88  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Update mt7925_mcu_sta_update for broadcast (BC) in the ASSOC state.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d0bfc7711a80..a0df9a4c4b23 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1905,7 +1905,11 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
 	}
 	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
-	info.newly = link_sta ? state != MT76_STA_INFO_STATE_ASSOC : true;
+
+	if (link_sta)
+		info.newly = state != MT76_STA_INFO_STATE_ASSOC;
+	else
+		info.newly = state == MT76_STA_INFO_STATE_ASSOC ? false : true;
 
 	if (ieee80211_vif_is_mld(vif))
 		err = mt7925_mcu_mlo_sta_cmd(&dev->mphy, &info);
-- 
2.25.1


