Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA28FD73EB5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jan 2026 03:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6W/Gjxb5BYcwIBkUjagY0/HM2eFwFo2YH1eXPS7fc80=; b=Nges1aZrqWlv7+sWElaysmiOUM
	lXvg2faCiTG56A80sPNelSQRqbtwX3jtlPFQWk1hYaVzu+mvULzQFq9oLTG+LECqLlpPvpPGEnP5Z
	nHPS56lUTRf+1SZOm7qYCJ3KLbqgKWna7PTdx/fKQOFMWROhkVBVuWcuaKREW7THDVBE4jPRI8acH
	4rZfCiAn/6Qypt8k9MX+AvXt9u4iHtuu8jkFYmm1FX2McKCewIj5KXX7tKeYrc+aPpRJbcDIVwQdh
	9Z97HFaz0oGOwjWtpa/psmODgFWQJ21HAuxfAdRTRLeJZx0sHyzQWR79+Vy3EoX7xLnChksldDAn7
	viLG1YAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlf8P-00000000xNg-3qNi;
	Fri, 30 Jan 2026 03:25:25 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlf8M-00000000xMV-1Kt6
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Jan 2026 03:25:24 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7d19bfe1190so1125394a34.1
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 19:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769743520; x=1770348320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6W/Gjxb5BYcwIBkUjagY0/HM2eFwFo2YH1eXPS7fc80=;
        b=oeo4L2kHt+G1a5qvjjIi0M6jL+oNIVl2sk0RToCS8WpJqChwqYy6GDqIblbt8Oqzr+
         cqnDkHP0tKWWoHcBucOmxYp+faO/IOWqQoLclmNCgAdQgbzopIIarb04ypol79DKemUO
         MuA94zo2efx7YrAlo9m0EuqLK4PYflueMcHvxVucV2eFR+ERdtLE8PFXL4R2+5Ljr8x+
         KRtaf0iv5H0jAoOinsDO9BfF4OiDVL7028VHDfOBsyZ1HfdRuiW9aOycYswbwx4x6CLS
         v+ZFmXoBH2eJQxc3zDJgirx8caJw92/A7fMi1e0gzVlY8glt4wgcLdU4bJnIbMpojwRr
         wbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769743520; x=1770348320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W/Gjxb5BYcwIBkUjagY0/HM2eFwFo2YH1eXPS7fc80=;
        b=EWVic/aajYpo9SPXPkODwUEHZEBZxDL8M6opL/GYe4Vf5clzg9aS5bWR5pYbntGPA+
         lzK714YQvQZPQNEOYg79anVKlOcbGkl19nodJg6QU9zmWkQOyTf0W7hm5yaE7TGaNXPc
         +b9uCx+l7sv1QLtQHGNAqRDbb0tZ4SzPrnvzmDvPrufiRc9XwH+32mPWjvCZQArf9/8b
         p4gOIzPUFObLFKowgKp0o8BSjP5RPHfJCB4okf8eZ6Lnqw3W6j5HXbCRQWl6KBbNAbKA
         vvARb7tQJLVwTaDKv6AkKlzs0M0c3v/DFnBnf1fhiwavfQv2Tv7IxQnbAuYZ1UAA7WsV
         Xcwg==
X-Forwarded-Encrypted: i=1; AJvYcCXViPxv2Rp6tvc740wiUJkMta99F9MdJu5F5UhorIby0MEwk/Rurm/gWD1IVIp55Eev/moxsu145aq9epeUlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOx9tpPFd9kYVR6/xGvc9Sxh16EtPo5qWQ29nWI5HFxZc/s862
	61bDCoSx8ZPLaqEyy4euXQB02ZC5hOnZuXUbSQP23AevsM1ZnTxCcwqg1JreFvwKO68=
X-Gm-Gg: AZuq6aJ9jPkgTqQ92TWvlUjRuj8CaEzsx6+PdP9YoPQVbNexTXsYQFacsDL5XVG7in4
	RkTrBdmNocmVvAyehY+OOlOilMgMUXeHUd9KlWBvQzhMF3DqYmn/3E9FB7KnKFvt2f9tTZHzynA
	wfnBoaT0Gp/ruFruFYH0OAryE8Bc82t1ms1e14+7MNMFS1E0MKwR6cJq27yDJIa3xxqHgEHMz9W
	KSDX8X7GXeui76/Rv+Gm75bBeLz8HefPlI6RrF7fsNr771fFdRBpQAwCnq9bB3APOxNfcPLRw1l
	RyLa97h3ElMqL3b/QEXoFmv0+2RrKTMssYlOs7UDV3pGRc6YO2tRhegWIJcuyntLKzhYtj6Pu3p
	XTf36GfXb5g5zHUr3St7VWBfi9bS9WpluRTHg5uBaRMsUO1E24UnaCOq2vZ+LiUXL+IobsWq5es
	HcSVnIqxOwJII+kSze6lEnm0Zrn7O9pca/203qoULdk9+uA4F+rMyOYeOgxV1AG7lUKwoLPa353
	GLMCVSAuv89d+ru+GpdyTNpCztzXt/PHFNxzSmucw==
X-Received: by 2002:a05:6830:43ab:b0:7cf:d1ed:f9ff with SMTP id 46e09a7af769-7d1a539155fmr1076078a34.34.1769743520479;
        Thu, 29 Jan 2026 19:25:20 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c824251sm4757013a34.26.2026.01.29.19.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 19:25:19 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] wifi: mt76: add missing lock protection in mt76_sta_state for sta_event callback
Date: Fri, 30 Jan 2026 03:25:17 +0000
Message-Id: <20260130032517.173590-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_192522_499347_A142DBB6 
X-CRM114-Status: GOOD (  10.02  )
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

mt76_sta_state() calls the sta_event callback without holding dev->mutex.
However, mt7915_mac_sta_event() (MT7915 implementation of this callback)
calls mt7915_mac_twt_teardown_flow() which has 
lockdep_assert_held(&dev->mt76.mutex) indicating that callers must 
hold this lock.

The locking pattern in mt76_sta_state() is inconsistent:
- mt76_sta_add() acquires dev->mutex before calling dev->drv->sta_add
- mt76_sta_remove() acquires dev->mutex before calling __mt76_sta_remove
- But sta_event callback is called without acquiring the lock

Add mutex_lock()/mutex_unlock() around the sta_event callback invocation
to fix the missing lock protection and maintain consistency with the
existing locking pattern.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 75772979f438..468bc176bacb 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1640,6 +1640,7 @@ int mt76_sta_state(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt76_phy *phy = hw->priv;
 	struct mt76_dev *dev = phy->dev;
 	enum mt76_sta_event ev;
+	int ret;
 
 	phy = mt76_vif_phy(hw, vif);
 	if (!phy)
@@ -1668,7 +1669,11 @@ int mt76_sta_state(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	else
 		return 0;
 
-	return dev->drv->sta_event(dev, vif, sta, ev);
+	mutex_lock(&dev->mutex);
+	ret = dev->drv->sta_event(dev, vif, sta, ev);
+	mutex_unlock(&dev->mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mt76_sta_state);
 
-- 
2.34.1


