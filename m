Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BA5D2ECF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhF6S0lUNMQ6iu2San+RRE4uR0QE14549Ly/QDJAGJY=; b=iW39A9BHHVmKZoASOOlcPtmC6L
	6wtFSBqa8BPDThihZNA+XFXqDJsbj7px7oXmTxu7BXca5fGm6VAZsSABAc3J4o9CqAlFhUKDzpf62
	upnz6fN4yEifufH1DZ0Ou+PrtkOqKml6rZZ9oAkxY5Y2knt4Ur9MfS2g3dE9W9IEVNTyuCo3TTcsB
	iU2FvU4v/uZ0V9CMs7w5lFlkUKU4nJnvZkZ2qAGVLX1WgrbhobUlLe+RDweY6tyIaYBr6lueYWvlA
	ywRDT5wmpns0DZwRXLRTemYkuBry6CYpFLJGt1go+uwKJdI19y8ICzbILhc2qsifD8bbBhml/hM+a
	9T4YgBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5FI-00000003GqB-1gva;
	Tue, 20 Jan 2026 06:29:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ep-00000003GfV-1Q1o
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jhF6S0lUNMQ6iu2San+RRE4uR0QE14549Ly/QDJAGJY=; b=MKexXX6fSax71M8Mmi0G6/sANh
	v72QcJsSNPYJlc50hONe77NbPq68D6UEkxlYXsIsuxz34xRo5yuO9vGE1iuq4ZfoXVOyXTnIm9b0j
	mGdHrFj1joT8uv78zomnmEf5761+CPap6BDF3UUzmWs1RD/8iw6zbJAgEity8piBZuxZcHH8FH4OL
	joqJFiw5Up0oxdf/OGHIX8TqXA9llLRzKlHNcC1zMTzoYJr6P3DsB6dN0QCGKNJdp8zb6aeqBBmYs
	rBN8rXQEgbHHSmvmnv7HdHkd8+BHae6DvpykC8gadGgZgiBHIeDVMPl5bxy8Ku4pvYnzU+o9p6frO
	BHi+98fw==;
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Em-0000000DP7m-20zj
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:14 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso1031391eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890550; x=1769495350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhF6S0lUNMQ6iu2San+RRE4uR0QE14549Ly/QDJAGJY=;
        b=ifOWVV6spgLd/XAfra4Nqc2FE+6ou/MsAqiJvEl8F/W7fCju47ArEwTEfExw8nyVzn
         goxoUq/uDzdGA0H1O+t6bUJTLMkjH+rtMcbdNLITM6xh/g/9d0GF8nr659d973ZPUvTt
         KvXn99fB08oc3Qt0S/YzmOYt9MpEflATvA1NrkQoF3rBVrfFf2TzFsZCDY0baDAYEjAt
         guVGIBXyqseOAoChqTMy2W58HCm3insAuy9Qt4VqWHPIsn1hWgkaAfBLSRmgd4VjMZ2Y
         bxa+bod8N86hsqVRfAm0BMVDBIMVQhWqvgMXysa6/8U80vGi3UVsoxNUBd1w9h2OE29P
         uBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890550; x=1769495350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhF6S0lUNMQ6iu2San+RRE4uR0QE14549Ly/QDJAGJY=;
        b=QKy91bLgQ9UgqHfWblDhf1g6KeAZRlps3vt8CMXmTXRESSj6tgWKeSFIvgW4yZxWZw
         93vEWoD3L+//t5hr1mWpYT7rj/I1R+9Z7Yx6zz7m2+E+Ifg1p7oIrW7CU70w5GdTe/cp
         pXkFpWWDtyyPFhfrHR+ZXFMIRnzdkaMMqLG5228yGPWw/N1RuZj3KqHhSDc2OzWAyjBl
         llutfgAZydX8OCNNlbvzLM0YMkSzfwaivm0P2SPQliq0Q3wk7iH0VNCtQBdaaI4QQ6W6
         YEV0uscsOnLztPDo8zxSj6wEimu55+i+hR/A1SVOTi2S1qloUUI6xjeYkothj0GQpKWW
         x5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwbYa0Ag6tnJ8reS3/h93+YoEJh6yd9TzVWHSkKEE2vCn0FnljFueEXJ6ANWWr4LMMzh+2Y6QTm4kFrxKfgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxncsmNiL7ZjMe/LuYpspMQ5poH4T2CLSOCJiVWFgsix0XB5c0h
	S1E5BxMwaySXTlK4FVvAushqZAL7cQ3pZu4a8E4wuDyLN0OhzpARYvMS
X-Gm-Gg: AZuq6aJm5yYJZXCZlelAgPfzN8vDxkhlOcDxeUMGK8IIXarf83DEn2/z8QTdqm1sy9r
	BwNL+GDWyjpRGQBHesDr4t8sZozoR67z1x6xC+8uLI3tUhwkCMb2IzM4mmRjTn8hBeE+9xOsIMV
	WVroeYolVe/5U516mZo9vl6vJFsOAH0AiEAC51YqFcdcaydYyoGNKRpSKCXzJII/fxekf0EvyGW
	9QuWboX38z4nYLBOj2V1VzdW9Lx+r0Mo0zb+9vq1vfE4xigHX6ylOc1tq7Jm02kC+Vu2kpu3ANb
	Eol0zEc6WYFEcXXFLIQJeQTXURk1gHZaKNZbCUNL7qk6R8S7t3mOh9vphWL/Mpg1+uRSsbbHvAZ
	w1LgkF+4PSKtPLUziyUqMXl2tMExbq/QDvTsrGd9w4YPBwbHl5Ougk6iyIcG6rhGJkz4MdkRe7U
	q52vqJsEshY5jvTybZRpwU8YdKDXBG6BztNmoBsgAZXkGSEXyGwVI1nrho02cXnoZgZ4p78RA=
X-Received: by 2002:a05:7300:3206:b0:2b4:7c92:3f7c with SMTP id 5a478bee46e88-2b6fd623ccdmr573615eec.6.1768890550416;
        Mon, 19 Jan 2026 22:29:10 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:10 -0800 (PST)
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
Subject: [PATCH 10/11] wifi: mt76: mt7925: fix BA session teardown during beacon loss
Date: Mon, 19 Jan 2026 22:28:53 -0800
Message-ID: <20260120062854.126501-11-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062912_662732_FEB0B75C 
X-CRM114-Status: GOOD (  11.43  )
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
index 81373e479abd..cc7ef2c17032 100644
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


