Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B51FC6162
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 20:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwXGmthbpTQEUqtRqROv4y4T1PCVhu/O0zEJC5A6YzE=; b=lBBSHy+Lxi5WvF0Vq9ix2DGZOT
	176CdxqTC7hcqSBDxkYqeOgk6iYzaSgMBUwlHnyI19pKFmjQ2/mWCQOdVjOS1YtLxuCiMipjtvu2N
	woKZXVa6rSXPyHgFAHwGZLxozujViMmzrWPUgXe3m0I2ZFu83FqDTneleIuPd36GeoQXSj/1jU7zD
	+hGNFWSTMfM+u1YxFMIV5n48vIST24+mUsRntDQeSSL4JeP2V9L3nTQ22id2cuDxG+WoUboMihrrN
	/DFB/AAjiXKaRtPBi47WKD34IrKiKyc/mkEloGoiffZ5n4isaRXGNF/YkW+YEDpYAXYDxa4qDEPLW
	l/FzwB4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMv-00000008glS-0u3S;
	Fri, 02 Jan 2026 20:03:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMr-00000008gho-2v41
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 20:03:27 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso11405791a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767384205; x=1767989005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwXGmthbpTQEUqtRqROv4y4T1PCVhu/O0zEJC5A6YzE=;
        b=Xa16llJZNUfc8ESHq29x+aKMWdEdwTxIvSC1OV9cgsTCkITSWTGPlZR2uxo6FWX4Nd
         EQPDlQJt5T+1ALjy7g1B5ZEVu9oPZZ3C3Wid8ub2nBqlyfaIhLZ9EQA72JC6/0hbL8O4
         ZW0rIPuw0xpaFrH0Qf0vV5heKOSOyeA/uxcIQv8Xz/pa9oEGtmOtSXUOEROg293O5zdN
         y7JNsjLcyxaaHt7oZpJXlVnTLS/+0bLencv+VSUreDT4iXr0bgYXXB9r05zyldtvSnju
         TtbapEuY/U5utic9YTOnK1eY7cHhnYFAA0G19E/8uHHGuwXrG1JnGTgCimYxAPnSVr3m
         R7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767384205; x=1767989005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CwXGmthbpTQEUqtRqROv4y4T1PCVhu/O0zEJC5A6YzE=;
        b=LXnBgrB9SPK35xyhH3ZThyki/VuPjI8j3owBdHvwqpvS48uxbgM0iRWQj4SMqhCVQg
         oGrZhMNQ7VnbpKyIaM7qLvbZOq0GkS/5bwKnjFbaWbg2fFwIRIBTU30c8xyyavGze05N
         ChbXE3E6Z0Dudy/wypJDo9ztVTdDDCogZXSjc+6hyig26slVhoB63iSRJnzsyIu7ZYz/
         H5tUgx9z+/Fs9EEeFvdcZC/TsPZ0kJmmEpFcJXRXZ7JjYVRscZphKAU0zzasK2Ka0Ta5
         Z/UGZUlabTd+fia15nscpwbbliuQu8VUpt9/bNEQ+Pz8mrBZQahG1nunj7Aftzgozuji
         xNZA==
X-Forwarded-Encrypted: i=1; AJvYcCVkiI78ZlMyHsOVuo/PopokT5jLW+Vo+VPvQkMcIYnOpnt3Y+q7FNNon+uzEjW6Q5/SuHL872yXmydNnENeig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdJVrln5K8rgFM4nb+0JyXpOdgvsYvOXGNBi8qeEGUSsVq2+S7
	fSzssDlfdCOQ0dhYXTCb6xMigBQqGhU1tqUVNtUwf+1rSAqQoZ4/5kjg
X-Gm-Gg: AY/fxX4ZFAufKF8krljnvqkcDxaJWcGW2CuJ2eTl3OOC8H3Ju5vKVpPsF9DpB34AwXz
	YbkkcfEcX3Ffg4f1XzB5Tp0sF1fS9qlBJNN+HrXgu2wFLhw4HQXZjxBojvtI3JW9+iFYOGUiYHT
	b7AZKTxC+EpWNRT8yOMckvNsxQ3ynYWdETftpfSBvtFfmExKHm/oNhYiQsIgVW9g+TIjayBoc6d
	4Y7u1Qpx0c+icFfPaxnLtJh5tEGP6uG4ZJddmKxOmcGrc38vL57gOZpgqqba42RhKlvMZjwnasY
	sUOXgORUuZOUpGtOYwdEmXezIyMxMGZv7MwXKdMzYC9XluSa/I5/QP99g1RI8nbJuIuVDz5Vt/t
	awKh3j/tWwlDodSsjUB1qRLNrRmk5FmomKtwyNw9uF/VF+p3fBgo67sjeRPEgLiMGjxtz1BGbxa
	CBLMV0bMOi7fd+i+Svb8HUYNuCeOl9bc9VQVzKFfod6itFT7LAQMvnNYmlKwR7IUg=
X-Google-Smtp-Source: AGHT+IH1/N1u2PuoX7Eh0VerFmshHlsErFvyeb9e1ESgN0ZCiAZGVIbekPGk8cfz8LdFjRq6JiFCzg==
X-Received: by 2002:a05:7022:987:b0:11b:ca88:c4f7 with SMTP id a92af1059eb24-12172309d60mr39471937c88.40.1767384204564;
        Fri, 02 Jan 2026 12:03:24 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm120203795c88.10.2026.01.02.12.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:03:23 -0800 (PST)
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
Subject: [PATCH] wifi: mt76: mt7925: add NULL checks and error handling for MCU calls
Date: Fri,  2 Jan 2026 12:03:15 -0800
Message-ID: <20260102200315.290015-7-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102200315.290015-1-zbowling@gmail.com>
References: <20260101062543.186499-1-zbowling@gmail.com>
 <20260102200315.290015-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_120325_844778_D4071A50 
X-CRM114-Status: GOOD (  13.28  )
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

Add NULL pointer checks for mt792x_sta_to_link() and mt792x_vif_to_link()
results in critical paths to prevent kernel crashes during MLO operations.

Add error logging for MCU return values in mt7925_regd_update() to help
diagnose regulatory domain update failures.

Found by static analysis review.
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 13 ++++++++++---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  8 ++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index d7d5afe365ed..f800112ccaf7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -162,10 +162,17 @@ void mt7925_regd_update(struct mt792x_dev *dev)
 	if (!dev->regd_change)
 		return;
 
-	mt7925_mcu_set_clc(dev, mdev->alpha2, dev->country_ie_env);
+	if (mt7925_mcu_set_clc(dev, mdev->alpha2, dev->country_ie_env) < 0)
+		dev_warn(dev->mt76.dev, "Failed to set CLC\n");
+
 	mt7925_regd_channel_update(wiphy, dev);
-	mt7925_mcu_set_channel_domain(hw->priv);
-	mt7925_set_tx_sar_pwr(hw, NULL);
+
+	if (mt7925_mcu_set_channel_domain(hw->priv) < 0)
+		dev_warn(dev->mt76.dev, "Failed to set channel domain\n");
+
+	if (mt7925_set_tx_sar_pwr(hw, NULL) < 0)
+		dev_warn(dev->mt76.dev, "Failed to set TX SAR power\n");
+
 	dev->regd_change = false;
 }
 EXPORT_SYMBOL_GPL(mt7925_regd_update);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 11c0197c7426..b6e3002faf41 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -863,12 +863,17 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_id);
+	if (!mlink)
+		return -EINVAL;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
 		return -ENOSPC;
 
 	mconf = mt792x_vif_to_link(mvif, link_id);
+	if (!mconf)
+		return -EINVAL;
+
 	mt76_wcid_init(&mlink->wcid, 0);
 	mlink->wcid.sta = 1;
 	mlink->wcid.idx = idx;
@@ -1750,6 +1755,9 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		    [IEEE80211_AC_BK] = 1,
 	};
 
+	if (!mconf)
+		return -EINVAL;
+
 	/* firmware uses access class index */
 	mconf->queue_params[mq_to_aci[queue]] = *params;
 
-- 
2.51.0


