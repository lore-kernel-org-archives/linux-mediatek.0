Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC738D5C0C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 02:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BhtuyS31s0lSv5xn4EwB/1db3Cviy3KjXj67mW+gHKc=; b=lzqNds1s9H52ieoWalUVyKise0
	ZVhgpr8aOBkXzKUIcYaljDhFYryW01QkqpVLb9PN7CZgEpxnkCPzMvEw6vGH9A7XzxtYNCqsgirR5
	6S5+s/ymlckh57iKDJecF1NTVdhToRa58wAnGKcKXXP8mck0XvFIZ3fg3ZgelJFHrlsowCZIHoPeU
	lgbs5zdNK/PVETWKmRfVuQ4BemPk+CzfV3Df1Iw0GFOCgaysZparAjOjE/LwKu1PcTwKi/R1DfhDg
	Ic+pRVKVId/6pwky6sSyUMoS9gqP45R/AZ09xoOPkulExr5NAt3DdRRmrAfpVbHeyuY/rdg2iVKCE
	natmufOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKfs-00000004ZWW-1YT4;
	Tue, 16 Dec 2025 02:20:28 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKfm-00000004ZW4-2Ex9
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 02:20:27 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c6cc366884so2298023a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Dec 2025 18:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765851621; x=1766456421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhtuyS31s0lSv5xn4EwB/1db3Cviy3KjXj67mW+gHKc=;
        b=Rwd3YjOyNrgKh89Zg3kdhzIcXoSnHGj1X/mYUUpI2CWfR5DBaCcQYxlhBr/fmjM0Ie
         RSuOGDpoh1E+RkPOnsTEZyP6fCZyBBoPEuGbD5u8X03S/eWsJ8dCROGpW0MW7an/zo29
         d2Gx4uDwVwSGDOrIpTcVSiYv69ED+OWjHmhhGULdrZUP4iQ9Pz4wytkbAOZ/RqjHo3UL
         NGm2QuDz1m+f+IDhG6q7HVl9IHzXtdbC2CnqZlNsXfoPnPcYvLLYiLbYPlKAcXFrmNgi
         tVDJKBfXlMTyFxDEi4L9M7JQZBdudSeMnnfJ7LfOLRiVGvMRsHWkc2kuKmIGHGZ61+Dj
         kOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS3EghUiH3U8X5Yle2NlPQ0two/kor+l0/wEBXK5B9gFGlURFp3vPJBHCg10E8o5MEi8t3nCLhq9HJcAPCIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3uN/fXDknVo6T0I8Vuo8T/rYr9qirSnAZNqCWBdF9rQ51QN1E
	s1kJXJtGz4X9206TJE4wsm9lzFmb8ymv9uy4oH691t75RdvlMR0tLiZ0P7lI5Q==
X-Gm-Gg: AY/fxX44wjYH9+Jp8mYcbyN3JE3UGwNtrBanvZ40+jqY16W/JrzLui23FzN7pVGWXrb
	cY1gT+VVIhbC3hnCawZ7Ihj1eHGRATzuxxi5v5AGcNvFHJ/IzQd/r9g+0soYByP7fvAb5QdBZAG
	rL0ssB1w8Cf2uhLNYzkT5rxPW+g70NCNcVjzpbO8AdkcEQr1wrtdpIlf8FHku6L6gzTIKFfdTN5
	6sBtpa1q6M4QFNotdjIspS5sKYmajFWRbg5a25iGCLemgkfgNVUSUDiKtkFpxgmzgFBQHkSeGfK
	wSIrn93pw0cwyveDeqTdYgZTrAGOAWN2VFxpS5Z4lYHTwPgAizcfSrteJVyNV+gFykSBkj0rtir
	B3WQOMTQfPAQNtyW1DS0DbyOIF+KlNpj/Ck5ckApDda4X0cAtxm4gLBfsrm1ebfYfgJhI8fogME
	y7eqOIkom5EZers1zl0xyInk0P+Iw9grNnQwM=
X-Google-Smtp-Source: AGHT+IEPInq7dKU5i3Nd5L9Ji23HRKytxpyOM8YuU0xOHiVpfXXjN5F/WsiOYHiZbg79z4RVoHcVtg==
X-Received: by 2002:a05:6830:3109:b0:7c7:5f6e:f260 with SMTP id 46e09a7af769-7cae82d5f94mr8309902a34.5.1765851619950;
        Mon, 15 Dec 2025 18:20:19 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cadb1d0e22sm10798074a34.1.2025.12.15.18.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 18:20:19 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo@kernel.org
Cc: allan.wang@mediatek.com,
	quan.zhou@mediatek.com,
	leon.yen@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: drop puncturing handling from BSS change path
Date: Mon, 15 Dec 2025 20:20:17 -0600
Message-ID: <20251216022017.23870-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_182023_795164_753C55FC 
X-CRM114-Status: UNSURE (   8.94  )
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

IEEE80211_CHANCTX_CHANGE_PUNCTURING is a channel context change
flag and should not be checked in the BSS change handler, where
the changed mask represents enum ieee80211_bss_change.

Remove the puncturing handling from the BSS path and rely on
mt7925_change_chanctx() to update puncturing configuration.

Fixes: cadebdad959b ("wifi: mt76: mt7925: add EHT preamble puncturing")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 05990455ee7d..faed4b236d00 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1898,10 +1898,8 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_bss_conf *mconf;
-	struct ieee80211_bss_conf *link_conf;
 
 	mconf = mt792x_vif_to_link(mvif, info->link_id);
-	link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
 
 	mt792x_mutex_acquire(dev);
 
@@ -1943,10 +1941,6 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 		mvif->mlo_pm_state = MT792x_MLO_CHANGED_PS;
 	}
 
-	if (changed & IEEE80211_CHANCTX_CHANGE_PUNCTURING)
-		mt7925_mcu_set_eht_pp(mvif->phy->mt76, &mconf->mt76,
-				      link_conf, NULL);
-
 	if (changed & BSS_CHANGED_CQM)
 		mt7925_mcu_set_rssimonitor(dev, vif);
 
-- 
2.43.0


