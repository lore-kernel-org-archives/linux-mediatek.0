Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F89D2ECF7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yt1mPPXw8aFoKYpC5Tia09ZY3lzzrV+SydYHdLpjRKk=; b=b3n4CBhM30AEuFVK3cLKMU+i0S
	LPUnbbLkrO/QszLCi+6vaqXqUUbzbju1Q5l9SZN1NVJFEiZDMbnyRc978nv9onA77GGpoDLqGsO+V
	0HVIVbIS7+vTiR9f6P+DCGLDaKcWNBxoRfNHyVzwZ61JOnDY5q+xRT7/Pr9XNcy6SSyraatQFBidj
	/3kWToXPzE5dkxRn6bU//Z5bdnHFmlShqxtwYrjHz4NWRkjNs08VYZRUhIo+54ixaN7+EjOMVkWSF
	JTTmea4k7v8OhQfIP0VcOJpmZmZGm6xNTCIH0+QSagU36Ita1g0sYo+DGiKa5uqmfFXmwkeJl9XDN
	BZvp0Q1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Eq-00000003GhV-22DT;
	Tue, 20 Jan 2026 06:29:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Em-00000003Gdb-1e55
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Yt1mPPXw8aFoKYpC5Tia09ZY3lzzrV+SydYHdLpjRKk=; b=oNXmyAjUEVMLOiE7IEtoJY6pMN
	gsE8JPhdiGpJjGXb5DlIx3pcU+ZOFokm58l187V/j3Ua2SNqjhY6fzbkL1PLdXtUPpCvLbxbWY+t0
	138oYpHtxmLfNAb4NQfVoUtW8fsxvM1oyxwgW1eWb2wHlXfUTO5OpjuD8eXiCO9Y7K+YEos0SCRjJ
	n0/ode/CDBYNv5n805YOu7hnD+zzzF9H+ocr+hIF50OL36cQqhQzF/UK23KrReNuUKp3hCCTqtf8S
	oxZ4hcLW6/YzXWS6G3tLLFovj6cskMuwW3yumu+F14pcnRbUwznEljgeozUupXqoljtOnLluE49HI
	7QYD951A==;
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ej-0000000DP7C-2zyb
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:11 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso5272146eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890548; x=1769495348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt1mPPXw8aFoKYpC5Tia09ZY3lzzrV+SydYHdLpjRKk=;
        b=bO4jhngvFDYvk+FAQR2a+ixQ4/CJU6kLrSa/NakaVi9hpmSevRc6D6MwTKrAkZU0Jr
         uhYXw3MFxtcWo5AulY3gOvGGUAqpRHwvn3ZMVFCkGvMqnVxHQDNHMSRzHsXhCtTVzL5m
         RXIPBvAP6NjecNsCL2cO2iwLaXQoDWiI2hKy+9+d3Szbre9y4TMNhqvicCSd1n79O2kl
         FHIS23IT4KrXdGAotfJ/jsPmy0Uqhb1jaY8ZKi74/hU33q6Bpl27vFrzyt0+p07/Vnzj
         S9DLzEbrSG3NgHAKjmS5DR23iypPSq1rqQWR6gaAmkB6hjORuhTfWJPjXpfW12UVLIbi
         35Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890548; x=1769495348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt1mPPXw8aFoKYpC5Tia09ZY3lzzrV+SydYHdLpjRKk=;
        b=QbrZtE+AyP2KinYCvrPwXZh1ZCx5E3emJ8rQIpD+u7sHJjhdMw1jVaXihl8LIjr3UJ
         YBb8sckjK+7rcZfRowbJbOOUrBIiffs9y5Vpck89Ak+qqPOgLuKu7Kfy9lGHqIVg1pMu
         C8IIwxcfp1HwfycycPcgQEY95b3ajdrD6P2Nc4JKhdJLwlS3oYr+12nKkMwubtUIINUJ
         vpXzobEjdNVEatc93B82xjS5PnW8GjcPocTbSb4pK1XKU8HgnBZ7zlIkHeJw8V8oWhgs
         ERAacv45xZDBF0hFmaQ8AsFUe0V3xAnYfs8RHF11b3qf890VF7UcYLpTdNe2t9sKLsE5
         jQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIzlmxDX6pUzDQ0hEK+LPJH6QMzlF2wrIVXFabY5QWVgvt+SHmWBd1sEXTudSyTybM+WGD3vQT2ZpLRJPPIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrpOqQ6aifPsXjyuo43oDPqWoPGs2IDZRRfBOvRZakqmXSjsZa
	uiaZysanM5G3FsQoZsYBwV1LPbhXpK/M68GwZHQn5ZUC65Xbv5otWWaC
X-Gm-Gg: AZuq6aKYizDwaOeAtH9lUObrknYJcRLKSIdBCWWbBAAktyQA68CUEMgJ0mtKAspjRX1
	sutx8x8/pJumw/+AvzFrMn7Oj0Wg50jGEPTNSa90xHaQ4SIddfz2n1D5xzEtrPMotU1C44JX+e7
	siO2Sy3mtbehf+kuF6RV7Rmgjd4/dT1O9DsRbdU02QNss/rtkI9pVY79ifSuFzX8ClucKfLUD90
	NwsOezIdvoWiVt1RQDHMUZcrO7bnMjVLl8qTJ4GKvRLw/DXJIUT/SSaae2lfp2sGP+cM35bu27e
	icSmN4NGbJBNcPkP5Nz4HVaItebYO+V6bUXsR14kmSNza6b78dcxct0ktWrdfi0gJr0WIlL4t0z
	HFQNB1WKjmODLPcZUEVhuacJaM+TxCcwweGEeqNuqhHajYRAKwO5OffpOv35ed81hkDArFaePoO
	wSr9AE5Qho3/oXv1nK/97U60wRjQ48H1q4xGEfRZ/K4uSyI8ONpBQbs4b476p+
X-Received: by 2002:a05:7300:54d:b0:2a4:3593:ddd9 with SMTP id 5a478bee46e88-2b6b46c69ebmr9563555eec.6.1768890547673;
        Mon, 19 Jan 2026 22:29:07 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:07 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	stable@vger.kernel.org,
	linux@frame.work,
	zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH 08/11] wifi: mt76: mt7925: add lockdep assertions for mutex verification
Date: Mon, 19 Jan 2026 22:28:51 -0800
Message-ID: <20260120062854.126501-9-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062909_862639_A645BF79 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Zac Bowling <zac@zacbowling.com>

Add lockdep_assert_held() calls to critical MCU functions to help catch
mutex violations during development and debugging. This follows the
pattern used in other mt76 drivers (mt7996, mt7915, mt7615).

Functions with new assertions:
- mt7925_mcu_add_bss_info(): Core BSS configuration MCU command
- mt7925_mcu_sta_update(): Station record update MCU command
- mt7925_mcu_uni_bss_ps(): Power save state MCU command

These functions modify firmware state and must be called with the
device mutex held to prevent race conditions. The lockdep assertions
will trigger warnings at runtime if code paths exist that call these
functions without proper mutex protection.

This aids in detecting the class of bugs fixed by patches in this series.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 94ec62a4538a..1c58b0be2be4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1532,6 +1532,8 @@ int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
 		},
 	};
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_conf->vif->type != NL80211_IFTYPE_STATION)
 		return -EOPNOTSUPP;
 
@@ -2047,6 +2049,8 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink = NULL;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
@@ -2853,6 +2857,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	struct mt792x_link_sta *mlink_bc;
 	struct sk_buff *skb;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
-- 
2.52.0


