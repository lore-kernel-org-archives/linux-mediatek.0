Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA38D262A0
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMeBYNgptE+VTvskSTsKlJV1FmbWFGB7NRFg6t+m7Ik=; b=GS6lcHKkAVAalsIf8pLUPLuIM0
	ayqLTlFa4EwrDmOXO64ifcixeXj//SuNM2KfQFu2Bm6cNzIv1ZgUp6BfXqiUgUzB77/tSFgrvIkWs
	i6fCQVfXolwuyzwmUwnxSkNXJ4fCfW5+jM/t4Xqwbxn006eLXtsnuVzKR4wI+IsRDK3emo+cg8g/d
	QRrpvucJLmulLeSgDHEOTBHeq8b/RPKWisVe5gcx1vsq087vmANY/6sJg8qeofmO0DKH2Ng+yzrVL
	n+nevNUsnMTAZvGCLoFxLab2eIfQGHcG//53b0AYdfcRrQZOby/MBkrZN99zIuG6vvslkYbh4+eHW
	l7LnY3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4L-00000004QGN-3dGL;
	Tue, 20 Jan 2026 20:11:17 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4I-00000004QDq-1gsm
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:11:16 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1233bb90317so194469c88.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939873; x=1769544673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMeBYNgptE+VTvskSTsKlJV1FmbWFGB7NRFg6t+m7Ik=;
        b=D2kOThvyyKmfSrdLh1TqnHOuTH/bPwSZvndTTGF3lTGtZwz06UwyzRZBm/OSZhokBg
         UtX17RZmcUFpi4FwWGl4+hs6so9CfBj0ObIm+yfEINgkUDBui9jKSMBXpzmzlLUfQJJt
         FYEsrD3PHF5szgqG4cRxdXoV4iAwiDvbFxdz7O8/qYB/FxxL8ggbvFDPWu0Vudl4z3Wr
         ERW9ETzAsXT2uRtL/jw+iVAY4ASFfDLFhqEwguGhAy2NlTiIXrkyE/DF/JeXaJjXYX0q
         JnfwFaUJMNsivqAzY8bEBNVbq9BRwpjhnNez/jfdD1oHzCjsJ7d7HSIEhsfaw+AASYWE
         Knvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939873; x=1769544673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMeBYNgptE+VTvskSTsKlJV1FmbWFGB7NRFg6t+m7Ik=;
        b=iVyBRc0KQSc9zMRktdjNZ9ARBo69aT1OOHZIMyLcWpBVZWLG36tMPMF5hWSlHZRTaZ
         I1KZ5cCehSS/RlAd4aWGTctuwnPqwu4P3sQxPpx9uDhikv8YkpuQR2TwBv3KPgbmmPj1
         xHeguNLv1H7WqDYOapVFupOhQEVzRpeJCIyEtK2cqR2Xgf+5q/mr9A2S0HAJQIEnLiyI
         T6DBX8FWFc8KGQnNwYHPaHT0Bza/fdhGxGQJyAEU5Spq2GhksDq8w0yxTTbwOvzRaLRO
         9SRhEGioTdBRV45mx4hig1IUFESzgSCHK1TIdRFY/EwJzwMB/xG+hpiq1Cf1okH5cF/2
         Er2g==
X-Forwarded-Encrypted: i=1; AJvYcCVOxqS7WZnFXqwNtXh/SK0gnTwr3XspUe9BCxPe1PA2JswPnEE4mTDyg6+hMSF3nI1PfSTe4pmVGnmw+PcNFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeuIAsUJl6L/obTpNAk2eS96d51+SajGg4YN+wjv1+faXiBPCi
	BKSzi/F1UPJ4yBxuUq53PvFemCX01BGGV7ZrRMA2mIzhYAPNGItPGqYr
X-Gm-Gg: AY/fxX7K8ot/sUv+CTnpov4UQhwV+KxrLeTgURw3HV6NPb0C6cmDY+sXaUkBHutWdhQ
	fjahzTQ3IbERVcxec+hEHa3pS9sLZP+IU3zuNp/NCPhBDbtdWtU3PrhEb263SV33b2bWBAlydxD
	s6/qkv0mrzQ38xFI5BQHYpEg/GtvzSPisOQOQUgCjaqa1gqk6/qXUXj6SVCMzTyeNUEXy70Nh+k
	acVeM9lKkis1fSEGSteYfKvZ0dT6qrkHNOuZ+m7Bc/hbFh0VwwS6A2fFtjHCjZu5qXIahb7iiMD
	heFeL/D0INZftU+7W4SbIRCD4KXfEp+0TNJy4T+A8M7ggLOSjkgC7BRbvQtWxbbET0vSpK6lYx2
	iclXbsdpT8y0GixyeQCjOCtspZo/N7Ai+Ls1b+2gKqaC6gd9u9nNWNRwPq1EXLWppE2gqaVTEg2
	HLjwYba0E+6nt7JQQ5kj4OWi/+zF1wROrTK2FKiuWL9Ufqyt9xjQ5Z70SkeGWYKpPEKMN+nZ2o
X-Received: by 2002:a05:701b:2310:b0:123:3673:8459 with SMTP id a92af1059eb24-1233d0a82bbmr10840641c88.12.1768939873295;
        Tue, 20 Jan 2026 12:11:13 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:11:11 -0800 (PST)
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
Subject: [PATCH 11/13] wifi: mt76: mt7925: fix BA session teardown during beacon loss
Date: Tue, 20 Jan 2026 12:10:41 -0800
Message-ID: <20260120201043.38225-12-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121114_443367_8D681264 
X-CRM114-Status: GOOD (  11.48  )
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

The ieee80211_stop_tx_ba_cb_irqsafe() callback was conditionally called
only when the MCU command succeeded. However, during beacon connection
loss, the MCU command may fail because the AP is no longer reachable.

If the callback is not called, mac80211's BA session state machine gets
stuck in an intermediate state. When mac80211 later tries to tear down
all BA sessions during disconnection, it hits a WARN in
__ieee80211_stop_tx_ba_session() due to the inconsistent state.

Fix by making the callback unconditional, matching the behavior of
mt7921 and mt7996 drivers. The MCU command failure is acceptable during
disconnection - what matters is that mac80211 is notified to complete
the session teardown.

Reported-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 7d68b08f445a..82c81c22e39c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1327,9 +1327,13 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		ret = mt7925_mcu_uni_tx_ba(dev, params, false);
-		if (!ret)
-			ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
+		/* MCU command may fail during beacon loss, but callback must
+		 * always be called to complete the BA session teardown in
+		 * mac80211. Otherwise the state machine gets stuck and triggers
+		 * WARN in __ieee80211_stop_tx_ba_session().
+		 */
+		mt7925_mcu_uni_tx_ba(dev, params, false);
+		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
 	mt792x_mutex_release(dev);
-- 
2.52.0


