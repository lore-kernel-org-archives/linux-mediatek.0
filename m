Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04973EE57CE
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fQX3XjClGYHMJYLD0S4wnHpCEAj+Lkoo18KPH1N6VQ=; b=wLW/nGeZesQjBbYO6ofe3VScNs
	JmzwiGxl9C3DRL0aMl9sRn476cKFQoW6WwG9Qg6e39diM1vX50+OQug7Ds+O0CzXj2Jc4CgELXW4b
	kb45qOLnFEdAxU+9Mxr5dqkm3vGP1mV8t7Zg/iA/JMqrP3i2xBqD/I/YXMs1Biy42O4gV7G2bN708
	UyzMxvEx+QlS/4ofVaqRIBQbyd06PcF9ztT02AU0rsIibePbIk/N+7iypQPdFKthSmBDfShyWdGqw
	7BB6ht0Kh+ONDwav95Kx8YxGzHyejdDBteu9AR1hAfLtaNUibd89lH8+BQmjgT/IkFh4r1Rsd0JIh
	gy7wPniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7n-00000006dvt-3MXS;
	Thu, 01 Jan 2026 06:25:31 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7j-00000006du3-3aY6
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:25:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so7595499b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248727; x=1767853527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fQX3XjClGYHMJYLD0S4wnHpCEAj+Lkoo18KPH1N6VQ=;
        b=gk3+sdU+kGUcqDCUbrwQCGdBwG4EbP0N6cBYUcJmol/XQosHKSmtXge3fC5nwOJnrG
         SAvWB1czvpvYUiwVhe1QXMRTVUhVtVTeDx/sJXNDCyURTHhEkHI6XvVqLsDXng4w+t+j
         UwoA+D8A3E5yijOqcuCw7Gi991aG7ry25Ep4xYbDb9qDcDMBjm1KKe3UD2s3p3Hwo6E3
         VjXJldt9tOwdgSha3owpgf8C+aRVLTDy7h671MEZpw6TrgTGbZin/d7N6EzfdMZ/4HYi
         5AH7c4G73o1zQdxopfcde5R6ndugWna3OqLvAPeFj+e9GKaFtb599MlZfUY2L6vmFe5f
         DujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248727; x=1767853527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3fQX3XjClGYHMJYLD0S4wnHpCEAj+Lkoo18KPH1N6VQ=;
        b=k0u+eWpByoyhqZrheFDsTLl5nhD3w2ng0UHoSqluLcq5d0HonqanTPA7rAKoaND+Mg
         NGJW2m/mlhc0+416QocKbp2TggDTM1iBonwtwlSa+lGbwgy0lWqNNyWCZaJxTlGOgdXq
         KV51iPThfeXhXQEfopUFXq6UrExhkMN3BQsHFcdl5aO+Z5dRqv+1eanLjHw9feO8X29E
         pVIP0FpcXSZSx27yt5AjS8dQgZUYdOU46HxtuQ3ZmjKLm8a18+ixSfc8iIGnypuiOPw/
         ftDd+h576lVBQw5WLBey0rmctpFaYGbaf4yJ62cxoZMDklbR9RY7ZWWoU9T/MWm53eJe
         b+Ig==
X-Gm-Message-State: AOJu0YyLGwkjl4xfmdxvKE1RZr7sRhR57zggl2tgAhFuM+Zkr3wNiIM8
	qo7mT5t4xBe8jWnSA09EQ/OhWsGxGopJ3fQ45+/kmhJ/VXGaqrh07A+1
X-Gm-Gg: AY/fxX5prLlHMNsayermW8BM7HG2jSjOChylHQ4f9z/1iJTBpndMYU8454yzTUqHLFt
	shJqwC8evLMOxGk7NNdWQUz3KHLPbLp4UifJdmogrHx/whOqSOLq3rqTcf8YhzbBKk7H3JAcr49
	fpgp2Hej1EVyuVY4bhSCue0QDpKsplxXsf/tXiL08gLyfQVb2WvMRa0NQTFIKzxQOEpGvCsq/UT
	QPlTM5fH/eJtfeuMRXqagsafuelUl+4E0WNmpR1Arx0e3GDN1YLsUbEK760lAo8IPLoptoqKQ/L
	JbuSZB7+G687exzOm+nPhpwxng9xLmWb4MG6i1Xp1g5mQvLvsvkLwv8ao2Qxk1H81/VLNtKzGv2
	Lf7KL68k+aJYwCv5Uj6qj4TjbnXaz2Xw88CeOBk9lagCB/9n9P+pn7m2kStVIPL1AJTlEUrEVTd
	iLf9bz+FcxE4n25ZXtRqe/6aTDX1R0nE6p7RuGriDaLwZTlK+ChEIqf9bDK6uRNg==
X-Google-Smtp-Source: AGHT+IHNHRrjwP/J1xNE9ra/NusfYhUBwbj+0R4XP+dQskrbGT/ub95rsw9PxwoTEkG2747s582cyQ==
X-Received: by 2002:a05:7022:62a0:b0:11a:342e:8a98 with SMTP id a92af1059eb24-12172136c4emr41995730c88.0.1767248726773;
        Wed, 31 Dec 2025 22:25:26 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm144361662c88.4.2025.12.31.22.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:25:26 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	ryder.lee@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: add error handling for AMPDU MCU commands
Date: Wed, 31 Dec 2025 22:25:23 -0800
Message-ID: <20260101062525.186192-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
References: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222530_328045_74AF256B 
X-CRM114-Status: GOOD (  10.25  )
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

Check return values of mt7925_mcu_uni_rx_ba() and mt7925_mcu_uni_tx_ba()
in mt7925_ampdu_action() and propagate errors to the caller.

Previously, failures in these MCU commands were silently ignored, which
could leave block aggregation in an inconsistent state between the driver
and firmware.

For IEEE80211_AMPDU_TX_STOP_CONT, only call the completion callback
ieee80211_stop_tx_ba_cb_irqsafe() if the MCU command succeeded, to avoid
signaling completion when the firmware operation failed.

Reported-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 7d3322461bcf..d966e5ab50ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1271,22 +1271,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta->deflink.wcid, tid, ssn,
 				   params->buf_size);
-		mt7925_mcu_uni_rx_ba(dev, params, true);
+		ret = mt7925_mcu_uni_rx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
 		mt76_rx_aggr_stop(&dev->mt76, &msta->deflink.wcid, tid);
-		mt7925_mcu_uni_rx_ba(dev, params, false);
+		ret = mt7925_mcu_uni_rx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
 		mtxq->aggr = true;
 		mtxq->send_bar = false;
-		mt7925_mcu_uni_tx_ba(dev, params, true);
+		ret = mt7925_mcu_uni_tx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, params, false);
+		ret = mt7925_mcu_uni_tx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 		set_bit(tid, &msta->deflink.wcid.ampdu_state);
@@ -1295,8 +1295,9 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, params, false);
-		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
+		ret = mt7925_mcu_uni_tx_ba(dev, params, false);
+		if (!ret)
+			ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
 	mt792x_mutex_release(dev);
-- 
2.51.0


