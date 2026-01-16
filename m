Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F9BD47CB4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhC8L1hQ8dg4kLrkzny6o4mFLtnYcnvkf4rrn/bndiU=; b=Z28Fft/DRftCLI3qMXIdGWwpjl
	uuDsInFeVlBmM2X2pVZHVcXyyhJLKqdr6vSr+Tbo/WVpWCD7usuxkxlqTcdF/efvVxAsHxVb3vImF
	cmK0VXI0n5Bcczm2H9Y93p4+3sJ9Kdk5ft131I582sqvS19g51H6GKPOeiP6YVcf+UdbrIPgNv+Oi
	5oyEAR27Gntzmi7PVPur+tWbPS2eCmrEXBzk/rZ45UqHBY7qX3bPne8ElvbU7wvZcgTpLCG0NEkTf
	vWYzGlJAF0cWrhoxm9tdA9SgFoxtvBqO8sh0lf2rBLMJLOi6e49TFeACU4EECpzfqvxNbNB4oYBJP
	HMAOZDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHr-0000000DOpJ-3KDl;
	Fri, 16 Jan 2026 01:06:03 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHj-0000000DOks-20Zj
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:56 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1233b953bebso3824271c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525554; x=1769130354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhC8L1hQ8dg4kLrkzny6o4mFLtnYcnvkf4rrn/bndiU=;
        b=BigqvZnMb2oscXLSm7G+ajI04umsSBy2tK40KDSE6R6bc9cZPcucsnuezCvO/clgH8
         gCzxKq/AC0K5jcmd6SH2foud7bdB1NR2XyPnANs6cdRiuJjw/6P7hevvYQr/yOOU0zJD
         E9nmH4q8PooK/x7T514+LKSydH/1H8TRYYRhBDIeJphhJ+3lKsMKIrXt1jIOWPcBkjJh
         OEdADnrdeNjCG8ONrI3qceXDQ+PdNGPaC/1eE6vwGolG21MCgwDZf59hceHYbOBYdiv3
         icm/LWFaO1jGyXvy5Bwn6KgbfxVGt0JXtOAD4z5mKeCiEsyzycKHbEbONDNnA2q6+nmZ
         1Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525554; x=1769130354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhC8L1hQ8dg4kLrkzny6o4mFLtnYcnvkf4rrn/bndiU=;
        b=v5RbYs6coR4kFcsY3LTySW4GE9GDhs+0xnIJ9PE/R6SuWoY8mKD4L3KZ59tNKINHg6
         71RzUy8vD06k/7FxiWi2GfdadLm+a7MLxROLpjgI7jFxddiuknhGjQ50JNTLsLoTM4ai
         lk+ajz9MYb9J4cmgcJw0ZUxf2Qnr2iw/w9ADX+od2m/SoDnON3iGteMJwUVXRuEfJLsZ
         4ahqMElYeaSOQSanATv9fB5NeCOXkSo/RCQ31gpj1zAX9Sd3g8jtmtJ3BEpJ6h4RZpc0
         rJX4x3NdWo/EKFUMc404nJyGKu29D25Pju4YlujWJNO9Ta15e804Sh7qMr9z5Cru4aNP
         OilQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF5DbUFyqXJNQzvcEjP9hK56EUruSlAj/sIqQXw3CliZWWfJWggg0FfNbrtF/fvRjJSqQBDhOXbTjD8PvF9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIvyMv/BiS1dS0r8KdyygqgNTxzvCaAUzEfplAmgx15r5DOk7U
	XcztvAS+D5jWRgilVua8bYVp4zcUgOjQRAhOmLBPdx5CdXkRKDlqgme2
X-Gm-Gg: AY/fxX7+Lttv99mfvQLQV06rvxlsZdjiBPMI/qCrAzAuvTtJY/MH8ZTr8fDnCvmftbj
	3aYTD7i48wviHauD0AqTP/WwiP/JRyytE/8esetQpR07YwdyDdRdt9hDGIPCvQ3cOq5i1hcGZeA
	aq5TjiFf2aj09ftthJYRmqiEJxoWkMW+jWdvPBT3ZFrgH9pR+d5dd0IIe2zb3SdsUK7gAnsdD0d
	4NR63rqzskq8eYirVjUvucDudGuodyIgvD0Ja5nVBUC5COs2opaPHQahZUCfjxBgIR2WNUFVdAD
	tFvsdx0HaaJso/jUY5Oi/v4rXtDKbPW0pEJAHIug34rV/2+bj+yuB/2FtWNCrP6Iq1Q98Q8ysAz
	hi2glXPTjf/QgrElMyG1j5oSQgkybvJc9BQndZwMvENV22VvLbY6mSjSGjjIv15wn4uoNQp5+od
	opRHZySXSZxt7ZKpFTQflNA/xi68jmtBuTsFN57qlGMemao4RDU4SAh3fIMzQnKA==
X-Received: by 2002:a05:7022:48e:b0:123:3461:99be with SMTP id a92af1059eb24-1244a6fe904mr2196015c88.21.1768525554364;
        Thu, 15 Jan 2026 17:05:54 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:53 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac <zac@zacbowling.com>,
	Zac Bowling <zbowling@gmail.com>
Subject: [PATCH v4 21/21] wifi: mt76: mt7925: fix BA session teardown during beacon loss
Date: Thu, 15 Jan 2026 17:05:19 -0800
Message-ID: <20260116010519.37001-22-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170555_541116_D13FA867 
X-CRM114-Status: GOOD (  10.95  )
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
Signed-off-by: Zac Bowling <zbowling@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 81373e479a..cc7ef2c170 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1323,9 +1323,13 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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


