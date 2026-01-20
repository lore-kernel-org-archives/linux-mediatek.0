Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8B4D26296
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yt1mPPXw8aFoKYpC5Tia09ZY3lzzrV+SydYHdLpjRKk=; b=pnHvOl0udJZ314Ab/tzAjCiBAN
	cTXRP3OLyix90uYhhUWlMSAPEAwFzXPizloMM4KqAT3RFdu/So1cyTzgZ84WSQvtcDrGxLg7MmO4Z
	RC0NAask0e5tX38Bky4984IbxifNlg/seKzkB6my8aBNk3zHlrCaxFWHHWTh467MMrGC12uACp8L3
	wzh9zyb+265Sjd/19mjC9+J8f1k7tOmiyFbPnDKXMfecnVNsbtyPzF22qe+ZKNDQmvbBy0Yxrj/gE
	kV9zVIUS+gPyvnAGywc2mdGm7SS9IPbxGrGNlJzxMPFFiMVt851StG38Bt7lB9fcq4uYEtizJSP1d
	sFk1ytQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4L-00000004QFW-0sB9;
	Tue, 20 Jan 2026 20:11:17 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4D-00000004QBS-2fO1
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:11:10 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-12336f33098so4746737c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939868; x=1769544668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt1mPPXw8aFoKYpC5Tia09ZY3lzzrV+SydYHdLpjRKk=;
        b=JIyMx1UlT/NfJ0bl3QcMSGzk63QWhZqt9p6lwu/NT1q7tTTxIuRLtRRhZLWVwOJjJ1
         vFrk/IgzMk8apoNnIYJ02IIzV5msQC61YQ2xwhWyeh5W3ROVIQxRmBvnsjZDY0ZyZe6f
         H4c4kB3Meox30Trz9HUt6DOVzeUdALoG2L/OPxvdmq6pFWd/NMR/P0aYANy6IzVSFzIa
         JuEBaiDlAenR4FxIgyw1xJI6gC7TBaT44PaXvJKGYIPo0c9LYG1MitzbQOHxa4fMhpzf
         +EKjUdqFwJgcM754Gor8jd/Leqq4qkoBvBQ5SPIu5IDqgxDBZQmR6MXmqHCkbnfm5UDt
         XdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939868; x=1769544668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt1mPPXw8aFoKYpC5Tia09ZY3lzzrV+SydYHdLpjRKk=;
        b=DrBMdGUATXhBsySUt5rvmSeSWMrl5ug/F5kRlexPj8qQsQ3cdYjKLZR0KaLGu5MVyc
         CbbErpWO3RPIexdJLcqNjJMT9K/YvX+6cqndSAvM3FkMJlaAiyUtTIJcN0H2E29mtCrd
         GazrTFLGBciHfmWAHxV5nPCVkfa/mA7/yUKRAer8AG8o3rt+65VaJGM/vH4M7dDtqKcW
         hdQ2zb85hFTR+3s1oK6Fl1t/wcoFm0rHLS7VJgr1i8sJkNQpqiPIzHsT2GFuQ4TBeXSO
         LtlKsd6TJAqxy+GFiQkNesnYvGgoWMK5fvqr0wCGfa8afW7hZ7VCYAnPt/yFJbcnIidp
         EP1w==
X-Forwarded-Encrypted: i=1; AJvYcCW9mWCQwB/paO7S8WKnft8l5UTVSK0m7IPY+Qm4KXWCPX2AgbrM45bR8pydoNdN5j13xfVm2sjDp8TwPY0rhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVYFBsJuwnmie+Q0vOr6gsUuDiGscKvOBcy4xyW8rT6yJYPo0h
	8IT3r7e4pT0Ud+gUzNylPAJqMi3EzHWTdEAg3qOvdpSY7S29/luuzeuO
X-Gm-Gg: AY/fxX5tKcZMEJYCadgOf9vfUrHqxBwrIWGRYqGDqcE50u53tjdGbuwZQmn8NIpPAjC
	C14bld8hg8wa/68qS+YW8d7RuRFJ7yQvAyMy4mu8QNyPYpyfMZ+dgkhTooVJFPTAi90Puu6YQAB
	S0HnD+jn5GaXGUQRAv7+tM+DoPqcrYdbj7Ovqt7hv6KBzTaXhN1K02A0WgPMBuruHxLo+WbSb4z
	2YKnCZdfFpqJupIS+RCvSoJnJvhovXwizfP4ozU2WQNy11vCXleyZZs0MCoC3QFtKoIjOTCoyS5
	ZNrqorMNXXuxJ2LCb5la73msT9Du+my5E5CR7tEju4iHiiF+NVVZ4j9UpJ4b+GHS8J0QVROC6S6
	4jb5tKZ1q3L3pJDe4Lt8w5gE+RLU/FHe6sS0PH/WX7uqlOUHvFvzQuVFmSCfKpLmqcGUEjLsrh+
	DWG0ymWo0oqaovRYmV5ZRpMfFeehwxutfZkXXsTmwzj8tYgJNvbHdtdU3hGKUr4A==
X-Received: by 2002:a05:7022:608a:b0:11e:3e9:3ea1 with SMTP id a92af1059eb24-1244b37fc20mr10744650c88.50.1768939868222;
        Tue, 20 Jan 2026 12:11:08 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:11:06 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH 09/13] wifi: mt76: mt7925: add lockdep assertions for mutex verification
Date: Tue, 20 Jan 2026 12:10:39 -0800
Message-ID: <20260120201043.38225-10-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121109_682182_6A4A8465 
X-CRM114-Status: UNSURE (   9.94  )
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


