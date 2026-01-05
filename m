Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C75DC2A073
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZnhjhyPQPCObFdQCf0DoFdJ2rk+AgcVn/BEbBcwfpQ=; b=NK4TgPB8gujRxcoBITUpBamrd5
	C+9JBIpzN9UFw3n1wCKNpu2vjLxSKfHLkYRddCV6bAD7B+Qb9ZtzMMKY5RPLphG8n2eivE7CgAGLy
	I9v5SjneeavzOfin1Q5dcB9SH48ihX7OISLXWOKP96os30GSUB+OLqWo+v1Oiqcj/PEyt4yXCl2zc
	WRNQlAcXDDyyFJUjuiGc69NPO6JDLsLg0pRF/2QIsiT3Fy/pD87WrVcG+tbM/U+WgKPvzBhn/Kt2a
	oCugHNeN2UBRDmteS2JdWPZTnPKSMMsJotD4mKysjw/tptemxlxZ/03XudSTv9PCkSzW/jqcMbglj
	llP883Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR2-0000000AZvK-1GYb;
	Mon, 05 Jan 2026 00:27:00 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQz-0000000AZsI-3sHs
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:26:59 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso625478a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572817; x=1768177617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZnhjhyPQPCObFdQCf0DoFdJ2rk+AgcVn/BEbBcwfpQ=;
        b=CAJw9nVaqgpP/3i6rcFdyueGUoN9JWvYUeb4sR+U3kRixfiNiDhZhDehr5tBiUROBg
         fuq6enyAD3ARqTUEFt6X6HbZfXziOgbMx3Xg9sNmdZFprhs4+r3on5UB2fqnlMljnslr
         6mhYUjhfMs38oGQHefEVjmiRi0E+oLvjqsuNaQzxyxjaz7J9DMD+e6t1+BjtzgiMYqL+
         0TCjeqlnA6+9EXAY4lIMEP501N8/6QSC8PpLdedzEPXNuk8hI1lo4y1a+u9jEPyL4q4w
         dnArwQmtzi9+SCXpwdxge5h/X9TTNAl5xEU9yYfvgqaeQYbLsDlP/dFA5l3BT7oSX8pe
         L9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572817; x=1768177617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ZnhjhyPQPCObFdQCf0DoFdJ2rk+AgcVn/BEbBcwfpQ=;
        b=kBQWekL2J2rCbv8deGohLga+PUuoN+rw6bYP+3GBahcAmp1VOmnuwAQsJZukx/NIb+
         s0Kd/q/QfPOez6SAfXcyLYTLh0xBXp0F0YcjowwGMqTmPWln8lLjnAHrzkx9xFun4w9a
         Z/DuOtJ6ZySsOOxq21PJjHpAE8U/XT9Hf45kwMDmYruKRf8BaI98J9zrngo2ccfDGxEq
         TlGs9B/Gu9zbk0XpmcHtdPQECK02K7PknWCXh/9sWM3fo6krIjMC4TAx96v1Nw29XAXS
         +RNBJgYOBC7FW+c3ZtNV262E2GjYO9ONtFJC0Zx6u7BIpi7hFedH7YZWHhL8HHItkjuN
         u90g==
X-Forwarded-Encrypted: i=1; AJvYcCWl9odC7Hx2SuTkPUQ0+pqipJp7M98bQfNZUkF3JiCNIn4zj+ilian1nkleND9yQlnkCSVjA5XplKbjkrcqYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWjyaSqSIlF8nCefMG6ShhGyvk7rUetHAhkHnkSremjs6PDzp4
	BzKChgMf6koVUB9I/vNAoo63IvMlo9v5k9qVXAvkYRSdJ5nNodxHPWPt
X-Gm-Gg: AY/fxX5gg3JckyOdYGEMIQNCG0jiDSejJ6Ip888j5bWiVxm+C+B3mueGDuIpVEOhUIh
	mFdIFyv0tEsFu6ovAV09N6Bq8PiKwWTp6IBMm4hUR7LUjscvCsJqy2IFPiVoHEf4RUNdCmUlndp
	/Mjgn322Xd0VB/5FNsWVsQfdWvUzdi6ebhSPLcOgYEv/Xo70XJdZIAc8toqzzI2VUMtMDUf/JmE
	wvaDGWtfJ4IBvYF59AQNLdkRguc6I2p7KvgF4vLg6AxlutZL8SJtbrNqbaCB/uphHAuq9b4w5ZY
	dCtrZJgyEJNTl4Ax3Ioafh0Gg+t2RNHSMYl6V4+Yl5aqTKxE4cD3eRnn19eFVZBSWJ+PxXWOJBu
	SeZCvQWHbOiPiZuQxsHkkNbxdHl8sgDp7rjgUuGGz/ofNXDPl0neJjIn7VbKQ/yk8+7ebKaN3ax
	Ks8Hf5AMTNaq7bca0tAjS1wC2rVHiBcKam2ux6vjQmniPabkhlNFGR0+J1rgqImus=
X-Google-Smtp-Source: AGHT+IGN/67FaErtupyToYrJxzBUIYkl4OUOnnfqPdZ+eJIg4lHjFzD7t9gZZl1LJK6SGTTybmCpRQ==
X-Received: by 2002:a05:7022:3708:b0:11b:9386:a37d with SMTP id a92af1059eb24-1217230eaa7mr24870293c88.44.1767572816910;
        Sun, 04 Jan 2026 16:26:56 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:56 -0800 (PST)
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
Subject: [PATCH 06/17] wifi: mt76: mt7925: add error handling for AMPDU MCU commands
Date: Sun,  4 Jan 2026 16:26:27 -0800
Message-ID: <20260105002638.668723-7-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162658_252626_2265AE8B 
X-CRM114-Status: GOOD (  10.31  )
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


