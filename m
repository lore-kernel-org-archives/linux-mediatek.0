Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D50AD47CB5
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmo1wCmkMZsP9rEEVr9OwRQ+MJCKwHnawZH5r7i9q+E=; b=mfnqrsUyZEThVIXcr8hhbIRkAq
	kA4tb2UzGHKRg1YfIk+Ts53jVZYHz9RbqkUN2Om+1KsOYrjLXzXIQ1/Sq3irKqxnQ/9Yx5qMhT+sU
	MiJkBCNCEc39KthyvMYvUMcgjiAONvk3VAe5ggv6VDA2+yjvImSsimECgMso7Qqkd7GdTn7d90DdI
	okHCEic/sF2FgCoo2aD8rbFBFZhmizAyUq8zyqYH5tggxFxY3MQIRMQkorqJGfu+8E+072qQRjHwd
	IiHW+g4G72GcmgISV8WLXBLzI81HjdIM8LbjvyBKFoi0YM9Q2Y1TIiezzc1wPZ9gzawaX1Jqtf82O
	HWqoU5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHV-0000000DOWn-3yzR;
	Fri, 16 Jan 2026 01:05:41 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHP-0000000DOST-0vIJ
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:39 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2b6b0500e06so914136eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525534; x=1769130334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmo1wCmkMZsP9rEEVr9OwRQ+MJCKwHnawZH5r7i9q+E=;
        b=Hl/OOuL1DfdIyJJZyAu296cmI1diKThhUTH9IQ/6yLS3yLhIdMCajGlg1rCuR1gq1R
         71i6v16bXa9i6DSngBHzR+nytzArXeLoh7jhH1irS6z73uIHaYCMIv4ItIAN3DXE9Lbw
         0vZSHUdU5Gh2RwwJFEBU3gyWXccsyqi/lkrXnZt9VQ6AN5pfjUXNjRrN2mSBlpTPf6Ic
         171ha37qwgfzWXcsAw3aWQZc8pSLvcJ6LKN3a7AVayXO+eAMMJnFbpaZ1wJ7zbTDmY60
         lWXg62zzrGpb3F8iOcL5nb9yd4ATCKuudzZBYdEpCHJHGqAXOzkY3NmHdvFd6tavzul0
         EYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525534; x=1769130334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmo1wCmkMZsP9rEEVr9OwRQ+MJCKwHnawZH5r7i9q+E=;
        b=ru7e4euzLEt1RusbdeSzmNaeGtmprOV9IuSFqsXqKD/45i4W3aily9i3vrqdYwWCF4
         H18/ryjbqQhrP28K+cMT55+wmAZROBT1Lkt5Jq1mp99PK2tpxss4FiSKik6pWS3WZv0N
         0jAIili7ld1KjCNhv1TUqwJrMdPJcKiUVbeX3WJmSBiV3EgO8nIh67mj3WaZVC4aNU2E
         lBDb6uZpumCBUNfETouTDSsrzICmXrYumEUWh9caKsLKJPgjFMaYEfve9idd8OH0ihGs
         xdvifWiCharE2cmUD6wNuzwAEY5PdGSteSAJ1Wz/AqDZaiVhnPHthRpPbUfa7d26reph
         ahSA==
X-Forwarded-Encrypted: i=1; AJvYcCUK5jPt6C/pXmEa8Oixg/z5Ioap7Tjg984MdzSNbnPuVHkjrfNjaaZnKHoHOZD89d8ZO8Cg4UUUYa4vzUjFGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFAr9WHFS5OaYyC+23796sCRBIkusflGCYUioi5lu7ODCFPh9P
	7WNvrFEltxbu33Esv/LGRwpTpPCDKUHZUFFVCicRViY8i/FhK4jm5wMlWTPHR6Yf
X-Gm-Gg: AY/fxX4iJHNbEcND6lRohw0iJEUf9lxLeFWz7qvyfqqzlwknzmmBK2iSqcac/gjBCQg
	jPZQDEeSLHXJWxdTNgAG+G5riCjnyXNeINwjuyNjKiCZVWLnwzLAAex9Y85HyFz0Ok3vOypGcaV
	JUPWVPsYui9YM6trDGCLPhT08+ulPh8mSH6GJGD+57XOyzhEKbSLl5UKbKJbXrLzumqLhtlVCMP
	4TPolhF0/CKUSuz1WOT1uwW+BLkD59kmZbBOGIh1AMfo7YtbFhhDFYNDLVNfSLzFzl1UjgHJPBb
	f+9Ql6lqnHLtFw77R/V+wr/5R3+dqNl5wv/PIBL3ZRDFKYXMeqST9F9yHSwwhdIPgI0Xnzdr/sJ
	8ciLz3gOFwq29/FTVzNDO8JFAGpYG/NDBnUqUH1ue9qBXC+C8vMMiVstORQdN8WYXOiZSAVLS56
	bz0bztqMZkTTeVTH/e2/xNcT1RYOGP9zluaOrbK6xstGbTdQwKL+jnMPoHF79/uQ==
X-Received: by 2002:a05:7300:2d06:b0:2a4:61d1:f433 with SMTP id 5a478bee46e88-2b6b3f2a8ccmr1281770eec.16.1768525533543;
        Thu, 15 Jan 2026 17:05:33 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:33 -0800 (PST)
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
Subject: [PATCH v4 07/21] wifi: mt76: mt7925: add error handling for BSS info MCU command in sta_add
Date: Thu, 15 Jan 2026 17:05:05 -0800
Message-ID: <20260116010519.37001-8-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170535_258833_0D20AC58 
X-CRM114-Status: GOOD (  10.91  )
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

Check return value of mt7925_mcu_add_bss_info() in mt7925_mac_link_sta_add()
and propagate errors to the caller.

BSS info must be set up before adding a station record. If this MCU
command fails, continuing with station add would leave the firmware in
an inconsistent state with a station but no BSS configuration.

This can cause undefined behavior in the firmware, particularly during
MLO link setup where multiple BSS configurations are being programmed.

Reported-by: Zac Bowling <zac@zacbowling.com>
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d966e5ab50..a7e1e673c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -899,11 +899,14 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		if (ieee80211_vif_is_mld(vif))
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, link_sta != mlink->pri_link);
+			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						      link_conf, link_sta,
+						      link_sta != mlink->pri_link);
 		else
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, false);
+			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						      link_conf, link_sta, false);
+		if (ret)
+			return ret;
 	}
 
 	if (ieee80211_vif_is_mld(vif) &&
-- 
2.52.0


