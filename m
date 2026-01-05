Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB15EC2A077
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otlGSXdgNZb8EYSsQOqh3OBybZYoKcQg4yihKraf1p0=; b=hjSsBnpolPENmuQVGspGhou25R
	Xrlyuf9iyI/unPo3CQTaqxOx0DPLhQmhcefj6XxqgvdHt6jg53Rz7NKAji+Vpx4fsGEOxp/7gSrHb
	c4uI7im09p2V2qYudKrX2ToCaQj3StHez325GNpLoFd6FIfJo5mnmbl1UPo8wUFMOybQgvAgNgrl3
	JpdcBOIDfVhWzc3uPkRHVAefoYeKAMCTzrPt45WwagMzKDYWCaGj+M7dIcBJfcBbBPy9/PErfraFg
	XL0d1exiKwxYOJUA+FDMjUzHpmsP+1J5uPKuCc+xJCCSAwEbPn3KMspsFH/fwk2o46m7agIG5tgv5
	z3Ea7Bwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR7-0000000Aa2m-3rJY;
	Mon, 05 Jan 2026 00:27:05 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR5-0000000AZyi-1jZb
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:04 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2a0bae9aca3so191923035ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572822; x=1768177622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otlGSXdgNZb8EYSsQOqh3OBybZYoKcQg4yihKraf1p0=;
        b=Y25P18foHqjn52zT3kxg1bLcIvmYm51hDO2um/J4Ea0V63lAMTvg/SRQPz3+eQtR1d
         biLmA7Eq9F5/A+UyPbkn7eATFpCHE0oiFLowTF0d7FPyqfzrOYliqP6iVFda2V85CVmU
         bq4RXJeN+fG2Yisv1Pj2hjZ/4RwsHtURU29X1wsLe9zUC9Wzpwh8ScqPpX9PcLEDK2u9
         HyMN+flWrL/egDo0RwG42NXjQFdS18IXnUDkDlmtOY9OHKVEO8+s2AoWO9elekSjOHV7
         pjGVaw1lnfbJtco0edVW2asnzS83FRF8yqwTVL8lCKxXY1v4Ow01ESjwe9ODQuc4oJw9
         iDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572822; x=1768177622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otlGSXdgNZb8EYSsQOqh3OBybZYoKcQg4yihKraf1p0=;
        b=RtR3Z10o6GabYMt5ipYQ45IA3DwrN0ABFWckUGJipEYuVqOPl8ix9CWKTP1FzjpGpd
         NMlNAgyn2y9ePCzmfs/KbN3r6mqp2lD0Juh4zcfOQFrBXnBtDT7AuKwJ/UMu9RBCY3S/
         XSwXRbZN8gk40vxdioFg3BfWz7EHp/bQsE5WAp1HmiQKCeAptrCWv80BEviXzLQtfwAX
         /i6xsQY3yhYwrPLkF9uKCIdmFJ+ZrhcST0r4KgiU8EEU2pcq3omgtyNu3t/htEx8IVMT
         mrhMBx5uIMF0MlN9SHOJ19HaKHh/2FuHp5yeLvKx88yd/0IQNoDw6PK+iEoVV+pXyDpm
         lSdw==
X-Forwarded-Encrypted: i=1; AJvYcCW58zHeyeKDZxa2R2fFl+Qwd9+68CBv1JxX96zLEyFhhFjHFo9ASWd8psOAmpEWDKm+hVEZy9/FflcIAMIYdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuBUmpRTBh0TxiiveJqS3j+S4tTOCDBksPylICqu0VMHU8NvXm
	NZgsxnExVnTjd5jt3uwNevJ8uez5b5fHiT7a2/FhpXrLzpU3tksk6GeDm9LIoMjfW2Q=
X-Gm-Gg: AY/fxX4AhUbV5awXUlVmU1fkz0UXUkEy8VU2nmk569yaCePdsI74QPBCN2tSnxaII37
	MhbapoQl4IDz+O4XPvtBu787LuNrOXadZoga+cCWs+x9OD3N3b00nS2F1twZYpA3CMLOSdCalxx
	HkUz53urOSc11u1d//epRUWI+/TcyTkqP2urn8HgMckpxySiwEzkpk3sL686GxWncRLeqZvDY2/
	i1fbViibM6x9e6f8Hn59pe9i+KZZeoI/WKqpX71iU3V8qwNCJNC/5Iw+1mDNd4XX93ahJlIPsQm
	wsIB+FSvt6KoYI2hgMJdL55fVTxeLIdabc7/3cTLSXVAyP5CTKf7k2TmNVvco2t6hNI4V2yaK/j
	mqQ36Ia+3mlfRbtyn2IfhO4N3bd2KRwOyk6NtV//yZ2VcG5bP+lg6q3tZU3c+RGBmtUMef+a8fo
	DwkUlmcVIrZL4bl4Ku4hOZ4+9s/MiaGvn8l9WG/e0gkoHQ4/XEm5077obccb3uM5Y=
X-Google-Smtp-Source: AGHT+IGoBnLyCx81MR6DWCg6Vhwj+2ECjH4n4qm3rwpzsNEJebHAQdFrXPLCsGc5oHn3E1w7jHt4DQ==
X-Received: by 2002:a05:7022:428b:b0:119:e569:fb96 with SMTP id a92af1059eb24-121722ab2c3mr48491836c88.5.1767572822470;
        Sun, 04 Jan 2026 16:27:02 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:27:01 -0800 (PST)
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
Subject: [PATCH 11/17] wifi: mt76: mt7925: add lockdep assertions for mutex verification
Date: Sun,  4 Jan 2026 16:26:32 -0800
Message-ID: <20260105002638.668723-12-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162703_487104_CF7042A8 
X-CRM114-Status: UNSURE (   9.25  )
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
index d61a7fbda745..958ff9da9f01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1527,6 +1527,8 @@ int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
 		},
 	};
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_conf->vif->type != NL80211_IFTYPE_STATION)
 		return -EOPNOTSUPP;
 
@@ -2037,6 +2039,8 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
@@ -2843,6 +2847,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	struct mt792x_link_sta *mlink_bc;
 	struct sk_buff *skb;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
-- 
2.51.0


