Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9AFD2ED0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PemvynWJoEEr+vQfljTmIKiSnjimqG0bkRw68R0p5Rk=; b=TmzyjOe/3p7945UYD8Jc1wOcs8
	tbfpsrohHDAFTcofIBrljGcicyNBhLCT+5r0p7vjEEaJ28jq8wQNjjXSPbwQXW04Iys+s7nEyPm6v
	bXaAB+O5dfpTHHHa6A6sr6GQWTpu5rxdFikRDV05K1Aqm77vLdvsn8ozv2JWTLPIS54v+N4t2j/Qy
	QuUfqZHS+V3YHfYHOZNXU5dOhiYifdLP9544vzONJmNIxivHr5RsoCHnOBKWJ5Wnz9qZJrB6BMPo3
	gEwR3sXKK7QYv1vuJn544Oq8PAXp8bwc0ZU4uyvd+kFV3UZVidGJ6ZDmP0/ljhqJuQ08oiUJzBtYM
	FNn2BP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Eq-00000003Ght-3GGx;
	Tue, 20 Jan 2026 06:29:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5En-00000003Gei-47Um
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PemvynWJoEEr+vQfljTmIKiSnjimqG0bkRw68R0p5Rk=; b=ZOUewj7pyoLkyq+Qg4zDQcJYe5
	hOLPmRhppO6EVcTB4ARX40WkHWUnEvRp0KuhNBvWtzKL72hyBMYNZ54wJVdJaSeJ9QAdB20DACwmD
	ThPwKH5XQT3Kp/sI/vI1ZMYRk1PEU2JEq8K6H2woKl4HPLswKq+Q7SHnO6Yb23fXUWLazcPaxxE9H
	E7PfLugD5I7EpE5aD1GOhz+4erzRTNo61FquAzQiT8OTePmk+KWylxCVk+lPxC80x5WlJV5y/W1XH
	zynwMDMIIb099k9NjPIer5niQoojYrJGgAh4YMTFiI2In1NZ3Gq/oGbS/SxzSgHLSPfZC4q9R1Rm3
	+URGatXQ==;
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5El-0000000DP7h-0cdW
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:12 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-121bf277922so6917088c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890549; x=1769495349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PemvynWJoEEr+vQfljTmIKiSnjimqG0bkRw68R0p5Rk=;
        b=NXcWCuytZgzVaQQNX4quT6vDqPMFwkdODFKXQ+eEw8RpuI+QZHlSsbi6gXeE3uO9gc
         StNTs7m/mJ9iZKvMSBHoNlWfTzy1XfJh7CWOn2Ek6FFiZ1iDnXNSKkA1eDDVftebOz5b
         uTL2hszDBoe4RZuTsSeW01Pi0YWb8FzTt2CeaNAg6pPRBSWQgksSD2jGYJ+Kf2twSXar
         +e4oWs2GJBp0+SsuMSP/W6LEDfZXh1mQhpInEaT4W7jn0ivp1Ub4FfokhVR0Uviuylmy
         RZhBW/6lstBOa0goFbnE1N46FhrwaJ4ltRJcgXHqKzayHAjwmG79nkT8SvYoHZEDLUrp
         4MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890549; x=1769495349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PemvynWJoEEr+vQfljTmIKiSnjimqG0bkRw68R0p5Rk=;
        b=UOrrSDe1Hg/IjfhSBsxug4WQqqYs+46x2E22odCqKavuNoPwl4AB58VYUufJvv88nk
         mSub2EfeSCzq4cSN0ImhoFM7eHrw2x0K1fQ9nVhY4sByCwHTnMLeNtXdreHCT9wMK2PK
         ij14QgfqJ4wVVhT0L7KHkg8l+96/8yvtU2Nsk2UnxTq+GiIDyO+m3gZBZRbWA3SukeDD
         9qmYM03ijBQ36TDYT8g7z8/pjOiEufw2dGf1jLuzWJlqmcLQKSYJhX85lN8Cfp2lR/R3
         vDyguMJg+U6naZZ04Pb1cDx3Lm7DOTRgs1QE2OUE/zQPUDLQpiP855YH4Ls+Gt8tzMkM
         bBDA==
X-Forwarded-Encrypted: i=1; AJvYcCXc/8VkRlP6X8Iserr6GYmxjVWSnKXpipcrURTyeq0BIQKXCQlH9JKRGMcgXhYp5FHcvnCCx/Yvc68KSSnYBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB80BfUqQ0KDvl5QF+1YziZbkfJRQQ3zLPp7Gvo3pnjisQidkN
	ilvgsrw01SO0cgy7kWPIndjJ4LYhtkqRkRHg6w8WAhUnjeCiMQOYjkW1
X-Gm-Gg: AZuq6aIX5QcYh1xPtuU1PFOEKbL6cRp3W5v8t4dxdTVo4mTPuXjqxoyPb/aM6k9KYFh
	z+ptU37calpHq2Noumg2VGEA3BGa6Z1WnDXBosBSAvlqOoTnOug625Aw35zQKdAA5JN/S/nWnRr
	8wyrCJ2qkovIXTObaNi2nSh1BXZyXjnlTsV6lpIfhkUS/QGWAdQ+nBbDBc/qNlgo2O4Xwbu8nK0
	keOaec8AW2lP7HIfa7/osiqWtgkQ0NDb7I6xChTS7SHOdDBFUXo18Xt5jtz/yWaZ7RuiVVSPZFU
	Pj8t5tqGVvhRmX3nO6XBWUtf+/5ojBKHzV7z2SQDMMUaeVe6MXYCDT2ft/lbG8GScEJ4otdv6BP
	APjPxZCixVs08VjH8DHR/suds1nghuIoUwNgeh4eu0ZiQZbgIfJ2TFg3B+WHxD5zBuXTEMZqF1S
	EzencPz4fZ/5+XMUTIczadvUMezO4wI12BcXZo0V507ciLc/HrFPo2p4padkI+
X-Received: by 2002:a05:693c:4096:b0:2b7:108:40a4 with SMTP id 5a478bee46e88-2b701084a6bmr223705eec.14.1768890549004;
        Mon, 19 Jan 2026 22:29:09 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:08 -0800 (PST)
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
Subject: [PATCH 09/11] wifi: mt76: mt7925: fix MLO roaming and ROC setup issues
Date: Mon, 19 Jan 2026 22:28:52 -0800
Message-ID: <20260120062854.126501-10-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062911_334145_9222089E 
X-CRM114-Status: GOOD (  18.00  )
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

Fix two issues related to MLO roaming and remain-on-channel operations:

1. Key removal failure during MLO roaming:

During MLO roaming, key removal can fail because the WCID (wireless client
ID) is already cleaned up before the key removal operation completes.

When roaming between APs in an MLO setup:
- mac80211 triggers sta_state changes
- mt7925_mac_link_sta_remove() is called for the old link
- WCID is cleared via mt76_wcid_cleanup()
- Later, key removal MCU command uses the now-invalid WCID

Fix by checking if the WCID is still valid before sending key removal
commands to firmware. If the WCID has already been cleaned up, skip
the MCU command since the firmware has already removed the keys.

2. Kernel warning in MLO ROC setup:

When starting a remain-on-channel operation in MLO mode, the driver
passes incorrect parameters to mt7925_mcu_set_roc(), causing a kernel
warning about invalid chanctx usage.

Fix by checking for valid chanctx and link configuration before
setting up ROC, and use the correct link_id from the vif when
available.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  9 ++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 20 +++++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 5f8a28d5ff72..81373e479abd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -605,8 +605,15 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	mconf = mt792x_vif_to_link(mvif, link_id);
 	mlink = mt792x_sta_to_link(msta, link_id);
 
-	if (!link_conf || !mconf || !mlink)
+	if (!link_conf || !mconf || !mlink) {
+		/* During MLO roaming, link state may be torn down before
+		 * mac80211 requests key removal. If removing a key and
+		 * the link is already gone, consider it successfully removed.
+		 */
+		if (cmd != SET_KEY)
+			return 0;
 		return -EINVAL;
+	}
 
 	wcid = &mlink->wcid;
 	wcid_keyidx = &wcid->hw_key_idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 1c58b0be2be4..6f7fc1b9a440 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1342,15 +1342,23 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 	for (i = 0; i < ARRAY_SIZE(links); i++) {
 		links[i].id = i ? __ffs(~BIT(mconf->link_id) & sel_links) :
 				 mconf->link_id;
+
 		link_conf = mt792x_vif_to_bss_conf(vif, links[i].id);
-		if (WARN_ON_ONCE(!link_conf))
-			return -EPERM;
+		if (!link_conf)
+			return -ENOLINK;
 
 		links[i].chan = link_conf->chanreq.oper.chan;
-		if (WARN_ON_ONCE(!links[i].chan))
-			return -EPERM;
+		if (!links[i].chan)
+			/* Channel not configured yet - this can happen during
+			 * MLO AP setup when links are being added sequentially.
+			 * Return -ENOLINK to indicate link not ready.
+			 */
+			return -ENOLINK;
 
 		links[i].mconf = mt792x_vif_to_link(mvif, links[i].id);
+		if (!links[i].mconf)
+			return -ENOLINK;
+
 		links[i].tag = links[i].id == mconf->link_id ?
 			       UNI_ROC_ACQUIRE : UNI_ROC_SUB_LINK;
 
@@ -1364,8 +1372,8 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 		type = MT7925_ROC_REQ_JOIN;
 
 	for (i = 0; i < ARRAY_SIZE(links) && i < hweight16(vif->active_links); i++) {
-		if (WARN_ON_ONCE(!links[i].mconf || !links[i].chan))
-			continue;
+		if (!links[i].mconf || !links[i].chan)
+			return -ENOLINK;
 
 		chan = links[i].chan;
 		center_ch = ieee80211_frequency_to_channel(chan->center_freq);
-- 
2.52.0


