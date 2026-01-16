Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2688D47CB4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayqgJZ8LSe73VJtWRWF0cloWppdfmdK1Vbp7fAPizSU=; b=c0+8MzUV8LsA6S+8Mm0AmFtgSO
	QjwcV7uxNLwIu2Zoho8Og/aCSa5r4mq59WB29a/1UuiL46wG1ftiMLBIXEuKamxcf4tl+JRDX5d0Q
	xSuhOqPHu2g6lcfVEKV11aRjPnfumCvjeFV07AdTUNhVKGs2eAfXAicWOz/mDMoVioP/bP4KLnzVI
	8ZmR2qZsZCm1/ClrdbneqRdN42KkzG50SAu/Ngh7Nm7gcdnotHvoLRnruod2mPW0Je8hPSkM7foZU
	jRaxRfGnCW/zZjVkXWM/zEf6s8172ncse4ci+0fBFQo9Fe+CQ5PT6CZ/mb9IuBSkQy5oM0Rh4Ckn+
	icMnYwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHV-0000000DOWD-2fcW;
	Fri, 16 Jan 2026 01:05:41 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHN-0000000DOR4-275N
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:34 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b1981ca515so1731856eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525533; x=1769130333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayqgJZ8LSe73VJtWRWF0cloWppdfmdK1Vbp7fAPizSU=;
        b=PTfxkX8moYnzsOMM76FZSvs1/PxAAcXE3fK5nEVR7EYBpqg6VOz8W0moQVTrHunUep
         KPJ2lZYqwXun72lF+ZCPYcpAEs+LmIXSsPPEvMbtA5o25H0l8V7pRkb5gf5dViVRMNqx
         oeAKzd5SS6TYqVy4kHUGXV9O0rZt+Sy9V7iujeht11PUWGDwIZ3IEQuwgm/S44wwZ3SG
         XHi7yKMsHLqS17KnrxjhqGGiFum8o/dkzqDWEvvt6+S6PrGPLw+BlX+kOTYpSWvzzasp
         yXujkAQkMN39XB8puFmIPokYp+YppKFhvaEcEs0EFkZxTVauS4MA5ktx94m9V50kYyGc
         1D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525533; x=1769130333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayqgJZ8LSe73VJtWRWF0cloWppdfmdK1Vbp7fAPizSU=;
        b=TOuWT3g1Y1ikdzuv3AO2IUHYlaX6G2ENLaQiJIRmnL//TVIM8elS2irRkQtaHZQoDE
         Xnzzh9Kok1h3UyBlc7BckaTZZYyvoniv11SMfK2khRLiTTknOLQqw6VSQh/8blyxPYSV
         m1Hh98Mctv5+rrhKD2XaqGpLBHsEq7dFU58fcOu7qWnyTElpYJ3ry3KehXSbqblupHPJ
         ackb6wfVf+cvvkfp15UyM42lWXwD9cD9mHYVMrzAO1Uh6Tw50SzIF4rwGHc/mlifa1Rd
         rbAECtFQGLx6iXW4PIxj2fH0wBnqkz8oFLZpnQJ64nm/heBgQyMOCoweDoIz6m56L1nw
         HiNA==
X-Forwarded-Encrypted: i=1; AJvYcCWHmnA4KFQ6kBX/uOkSlL1bLjhQvd8uZ8d4q0Eca/iU93OQM40Y09Ll2P4wO+SJmZbIGihvsepSRKyRdPSu5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyroJpboZCGiVL92MUXGWSFj8cp0pgEINSjfutvCIA1JfDHSgsi
	R7IkUBUg0u3fvCsUjZt4it0f1C+C1N0nEHsbM3S/1U/fUoMQaAnXGhNh
X-Gm-Gg: AY/fxX6AKCdGEGrqYgitYplvceKJL2vvhXbPqOh9g89KPpkF15R+GHVU3USKjfwmHql
	ldOlf3SW3Mbp4Wy/arV9mxVWc/pl6bpAvZcTJgdbZWKewp3w0GCoAYwb7tD1f+C1ggw2ApCiW1c
	EtYyV9VrwQceKSfLHbQxxZ+E6TFooJRHp2j3BJJTEKdiaItEFpQC7/L3cQM5W8BFvef9HmSzZu3
	b4Tzg+9D66U/cOOk/a17O7YgxQmpixiE9H+ilpTwTiqPRBE4pGAf6XuY8qFU3nAm6TzJEWJWKUw
	G4KzYUnv8LX8v4aCdUwWH4IKZockqf2K4Wlyimra3aE+0ydL4MAy3SnDHxK/qMhZPk7uQ6dirav
	Te2CB/+uOEKjz3bxReDJi/CFHme1jzKZO1/ku/cXMODQ9gl9ms7AK2k8FBDrH1TwJMi89g+tbjp
	0Jc8OqhV3ZASrDQwSv0spYniLWmLIrUSI6rIwTpYJCkMhgH2rPMTUE/2BrGmxA9Q==
X-Received: by 2002:a05:7300:73cb:b0:2ae:614a:3307 with SMTP id 5a478bee46e88-2b6b410c29bmr1459357eec.42.1768525532104;
        Thu, 15 Jan 2026 17:05:32 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:31 -0800 (PST)
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
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 06/21] wifi: mt76: mt7925: add error handling for AMPDU MCU commands
Date: Thu, 15 Jan 2026 17:05:04 -0800
Message-ID: <20260116010519.37001-7-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170533_565205_22FAB0AA 
X-CRM114-Status: GOOD (  10.27  )
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

From: Zac Bowling <zbowling@gmail.com>

Check return values of mt7925_mcu_uni_rx_ba() and mt7925_mcu_uni_tx_ba()
in mt7925_ampdu_action() and propagate errors to the caller.

Previously, failures in these MCU commands were silently ignored, which
could leave block aggregation in an inconsistent state between the driver
and firmware.

For IEEE80211_AMPDU_TX_STOP_CONT, only call the completion callback
ieee80211_stop_tx_ba_cb_irqsafe() if the MCU command succeeded, to avoid
signaling completion when the firmware operation failed.

Found through code review - pattern of ignored return values throughout
AMPDU handling.

Reported-by: Zac Bowling <zac@zacbowling.com>
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 7d3322461b..d966e5ab50 100644
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
2.52.0


