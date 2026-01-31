Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BA6D73EB5
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jan 2026 03:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a+tuxKzfIwGph4KGmy/W4D3saam1yAaOrHAbmg45lyE=; b=3AzRa3b4ecEHaWHBfLXCZNMf0O
	qNuunD+44jpNgwQi81H/655JxwYzqBF1QFWLhu5x820HCdriCU4KV+p0kVHY3b5uMDfXw8uO8fACo
	tbDxAO9IH8DCetdVLYGH9QuVDJDaN02rgh8djF8/BqD6x9YGEjcRlhzJyuOls/INwSO6w0iTqXWCM
	RmGN1D+WtPFm9zfmJIgTW2j4RYQnhzKi+DhEbfYbDlKWFUl2E8hxPLhzqJdVAEKDt+se++oGclTdo
	s80n7V0EHNbEVlBlPvWL1oEDOedap9xQRwVFc0bM+rbMbSGHY6Rg5EvmNl4BUKYZn/BH4AG3NMtDu
	UhV3Pusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm21x-00000002HwP-1S1T;
	Sat, 31 Jan 2026 03:52:17 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm21u-00000002HvJ-36TG
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Jan 2026 03:52:16 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7d18dd2adf7so1647647a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Jan 2026 19:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769831533; x=1770436333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+tuxKzfIwGph4KGmy/W4D3saam1yAaOrHAbmg45lyE=;
        b=tB38abUrOAAB1zOZa893UpwOZMgw9/z9RYCumu3BFV4HRvaBH+TE0I2r+G4HgYmrPF
         GaTR7Yrjp7RLC4wiwdv71J/o/cvfyAanKNZXsA4hJ/OhKuBTvcPBZuYTmlC5qfM8US4R
         Ya0OLKCrUXyQZL2pRzUzKp+Ddime6FemcmC4jZ+fRw7ILiZm/3xc5MzPN/zF1kWkZvya
         8mbKnykz0E33Kz8pQlRMrVANv9RtyZaBm2gw17B2aeGul5c8CH9gnN/80P4G64DKf/EF
         kfkPgaALGGhcel63nR13x6RL/xPLcUT75YZMJnbo1izqYSAnLJmrOeq6Lg6skhRuZhSK
         0rJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769831533; x=1770436333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+tuxKzfIwGph4KGmy/W4D3saam1yAaOrHAbmg45lyE=;
        b=Wm50PcFwnc6s/wD6nPCvU01F8Xl5TUM4JisWzqyRvgI3YLvEXVMBDCh26/BvZ3zdMJ
         XodttPpIft78v48y0RhVpRGP3eXw1OFVC+OhMknnwdQQrGj4C0Y5NTAJx4qqFpg11lZT
         QtDvMONgYvmzIXNx+fvWTQZQbAYbI90HN2P93n1USMBJWCmveWgnIaWosssFgr0G/t5T
         QaqKQcSqFrKJIJqchm4T5RiIzHpfZRggYTWI/xBWQYoR1pbl+Ni6cE/q7/SSOl3g0AgU
         Y5+BA16iuh9pzFmNsKqgND2OwmAz8E74Pt9vE3NOF6gVdlAilk/L+09WH9P+JOLdkERM
         cFFg==
X-Forwarded-Encrypted: i=1; AJvYcCXov1D+9uL8++E16Yd5PGFxWkV7gCeB6cxcvrXyDLMG3Wbnhr/OebOQxp4odu1jengFyho1kVy4REixUoYJVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe/+7XppCn3naLZRpxj+WPdNU4+h7A4GDA8OcKoQXUI5f6vo+R
	lQrXKXDvjGa+qnSf7q3oBAU3GCAyM5UwYcsxRGEf2H5eaOh2T3H81EeeKv6b4XkuxmCgk6LgZwh
	n7mnT
X-Gm-Gg: AZuq6aKqFmvS9KmyE+wRIJ/NA0XptHyqA3pOhlrysJYDZ04JK5a8F9bDPmyTAjinwAI
	CSjJbwNycqECkJ4r82IGE2rxn4kpZ1NUakTQmItNic00xJHrsgZUoPzEKz4cbc92fASyn3EHtAY
	6mdUTXOvDENeBE+VUvdbEgbsU/2xXl0n6l+7eIuaEAUTDqX5t+1kuSyFAsDPjUc5vWjs0dnZm1f
	KUNJVycmG5S1OPQOuZaZ0cxreWvCDPRzXSBuTWa4BROWEHQsEn3MCfZoiymje69mcLrmN5XQ08O
	e2Nh+DLVYfad9T1z82Sc+hZPDW80ndQn9CfFcX8EALIIgUdX3Qd8x12gY9CEhYygtyCa3XulLPx
	GrBErAa9J3vRWO9D8jNmOIE2CZ2a4g1soQBj5JPS0pf2du5Y7bqKxNhb8iuTof5PVSAGBkGwnkE
	SZkdr1+EzS2A/qdYRJTdAGYSoWAsViphl6KHkRSP7VqY5Jn1aJHRLmIQh8lVkb+/OPN+IcXe4BD
	LrjGwwMjsUDMmNcpba8jPkwBWJfmBI=
X-Received: by 2002:a05:6830:6738:b0:7cf:d96d:7882 with SMTP id 46e09a7af769-7d1a5250f74mr3189657a34.3.1769831533374;
        Fri, 30 Jan 2026 19:52:13 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c69ac16sm6727975a34.7.2026.01.30.19.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 19:52:12 -0800 (PST)
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
Subject: [PATCH v2] wifi: mt76: add missing lock protection in mt76_sta_state for sta_event callback
Date: Sat, 31 Jan 2026 03:52:10 +0000
Message-Id: <20260131035210.2198259-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_195214_972288_E795EBBD 
X-CRM114-Status: UNSURE (   9.61  )
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

mt76_sta_state() calls the sta_event callback without holding dev->mutex.
However, mt7915_mac_sta_event() (MT7915 implementation of this callback)
calls mt7915_mac_twt_teardown_flow() which has
lockdep_assert_held(&dev->mt76.mutex) indicating that callers must
hold this lock.

The locking pattern in mt76_sta_state() is inconsistent:
- mt76_sta_add() acquires dev->mutex before calling dev->drv->sta_add
- mt76_sta_remove() acquires dev->mutex before calling __mt76_sta_remove
- But sta_event callback is called without acquiring the lock

Add mutex_lock()/mutex_unlock() around the mt7915_mac_twt_teardown_flow
invocation to fix the missing lock protection and maintain consistency
with the existing locking pattern.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
v2:
 - Move the locking to MT7915 driver to avoid deadlock in other drivers

 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 90d5e79fbf74..e212e964fda0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -851,8 +851,10 @@ int mt7915_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		return mt7915_mcu_add_sta(dev, vif, sta, CONN_STATE_PORT_SECURE, false);
 
 	case MT76_STA_EVENT_DISASSOC:
+		mutex_lock(&dev->mt76.mutex);
 		for (i = 0; i < ARRAY_SIZE(msta->twt.flow); i++)
 			mt7915_mac_twt_teardown_flow(dev, msta, i);
+		mutex_unlock(&dev->mt76.mutex);
 
 		mt7915_mcu_add_sta(dev, vif, sta, CONN_STATE_DISCONNECT, false);
 		msta->wcid.sta_disabled = 1;
-- 
2.34.1


