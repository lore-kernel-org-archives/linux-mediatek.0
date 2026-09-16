Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF29FC982D0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GPA1DSANSZ2wx5ap9tiYRblcf1dOFfjW+WHihKGkeG4=; b=IICdE8Hxky8+1eEv4qj3rVH6CM
	q2DZIA/l5hGCIOrTmQrqHqpFL427scq1RxtWidVAaGEKjxPZCSk1Y2Ihw1btxXqkGP3kqLRIc3VDL
	R3MKsvU23E/nW/nlT081T+vYkdZhIeQ7xmZ/CKdd1SayRp3tMLuA7TRU1+lZqzswY3QzsSp9j4jCf
	54gQRHg8fY8p8dmyC9N9AN/ClA79dB5q/lvknXP554KhJiZPwwIrbGKhwYjq0jJumOkJWtQVM1IqO
	EQkiazYyNo7LwAiFkEQosj27FYIB9HDs8fatn6ZP49Ai5GNuVofdZ4Yr7xnQsiomZE/8uu4eGu4ge
	35SUx+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vd6-0000000A3Im-03tj;
	Wed, 16 Sep 2026 19:49:16 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vd3-0000000A3I2-18jP
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 19:49:14 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b91369d18so1014145e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789588151; x=1790192951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPA1DSANSZ2wx5ap9tiYRblcf1dOFfjW+WHihKGkeG4=;
        b=X/jPUI0wPs847WXS9+f0r+6Z/cax/7KlTc7QcIqVPLfKxAfD3LdEVyuu3OAf8ywk/8
         cDdA0+H6+UhRvyOvoNAgLCN3whjVVkhwxG//U0BFlX3iSPLAPXhoyEYORDs/YNWvS0eY
         EchFAY2bURxZs25UHpTn3qJ1mAgVZ/8Fq/HXeE1hgW4ozrbTUZXpjYEtoDd9O/EScJfU
         3aDFt+D7ajBiuVet/UEiRnJurRumwyS6denlljwWHORAu/MpjJU522oPhBU75Uw78LLR
         kfsW+0o07l26sjM+MNp219V8Yjo74Q+ZL99ueO0WJZ/4EgPOEx1hLzJfXH5mCqTgBPvK
         IbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588151; x=1790192951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPA1DSANSZ2wx5ap9tiYRblcf1dOFfjW+WHihKGkeG4=;
        b=WjGlEBV4ZPOdwGAA+UAhzvBcpiKg2TLNg4er27TfMfnCvx4VwVyFcT3eGN/JRCFor/
         aGMuPHMighMD8xJfD2t5VzPrbO4jG+I8UGFioFqX+pjqxOabhyrg/4Dq9DEIOMggi9R1
         MIjXPbo61Dyc0yUDjLrSbLiFehJGfNplDRvpbF2DurMQtqP2r2MAjOGFoBDLrcggFqEs
         polfvDlMSZE1aaDo6us6l/wOoQWz2KzGh9xO7eA6iqx6P+VnkH7loGFlk6STLHJcHt9A
         G6XlseA1KhAxROX7fAiaH8sHaiEtgjJl2ZvYYdTN8Yqn2FNN9E8wcP1vcAPovCwgi5bp
         +evw==
X-Forwarded-Encrypted: i=1; AKwUvBw/ZdJa6TL/gu/3ohub1Mu7q0df7flfTG6H35a996X+vV49SlMmy5+WiPtPsjuZmZ02wKSxoBDwIf5dVpUffQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kkxoeagU320qNZYi2BtFuWMtTnuCBpg9zQm/v6LCBdFM8DH1cs
	CBFXauHk+Ukua9CpqRFyNUOc8hch8EO4pB19GTAns2xBjiU/IxpAn5U=
X-Gm-Gg: AYBFou0vI1mSOdOKcM+/CMYWFfm2aoYIzXQSKF2ugpvhdDjmoJSTDtlw05QtQ85ughE
	UGhYLZMkwvp+kR+JMip0HZkl4OWPiQ2/XwJj6et1o2y820H9X4FLEFdFvBugPEx0g1NKaZr/CFR
	uo1VDkQ0cXlwtWU4GY7zkfNkh3V+JI/u3vFFDXJGgBvb6tLGrlGkZFuldnRtkz4QeuNcUN/o89u
	mTusOj57uFfIlNj92On0TEPUuLzUMWUz89RJamjl991H2uofdZ8b6xl/4lNtuYxnkQ9NxI/wTYf
	yFONH1h/6jSyMch7jqFzAh2cSOBlqGYzTCLpdr7+cq3zx7WGavjiRkk19IacUkrlN9znHCb/cR7
	diGAcADBNAtBMlMjyJTCCb3g/rcQrWnK6i+JrkawmPTJRE1L7sB+q+LrQlA1hRb1+EXBedC6u9G
	gkV9YIPRBwghcDIx171aLlCq83t8yYSLGF2/3h38Es8teOsR0zEfBe7htnoprheXvXN7ibkUVv/
	aREF5OBskfilzlsi/nE5qULySMHgCCedaSsKGERoNop7TUC8D5CbikmexrB8g==
X-Received: by 2002:a05:600c:621a:b0:49d:1d6a:4cfb with SMTP id 5b1f17b1804b1-49eac463a00mr43701435e9.1.1789588150982;
        Wed, 16 Sep 2026 12:49:10 -0700 (PDT)
Received: from localhost.localdomain ([193.160.247.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda7c461sm1682895e9.4.2026.09.16.12.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:49:10 -0700 (PDT)
From: Andrea Pesaresi <andreapesaresi82@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Andrea Pesaresi <andreapesaresi82@gmail.com>,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: initialize tx_info band for 802.3 offload
Date: Wed, 16 Sep 2026 21:44:12 +0200
Message-ID: <20260916194647.1421848-1-andreapesaresi82@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_124913_326296_57D25D2C 
X-CRM114-Status: GOOD (  11.90  )
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

The failure was first observed in normal use on a GL.iNet GL-MT6000
(MT7986). An iPhone using FT roamed between the 2.4 and 5 GHz BSSes
while generating traffic, then lost connectivity and the router
rebooted. The ramoops record from that reboot shows:

  Unable to handle kernel read from unreadable memory at virtual
  address 0000000000000010
  CPU: 1 PID: 1419 Comm: mt76-tx phy0
  Hardware name: GL.iNet GL-MT6000 (DT)
  pc : rcname_read+0x1ec/0x340 [mac80211]
  lr : ieee80211_get_tx_rates+0x140/0x4cc [mac80211]
  Call trace:
   rcname_read+0x1ec/0x340 [mac80211]
   ieee80211_get_tx_rates+0x140/0x4cc [mac80211]
   __mt76_tx_complete_skb+0x6bc/0x9a8 [mt76]
   mt76_tx_worker+0xb8/0x1f0 [mt76]
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

ieee80211_8023_xmit() clears tx_info before queueing a frame for
hardware encapsulation and does not initialize info->band. This is
normally harmless because mt7915 uses the firmware rate stored in
wcid->tx_info.

During AP-side FT roaming, the WCID rate information can be unset
while an 802.3 skb remains queued. mt76 then falls back to
ieee80211_get_tx_rates() with band 0. On the 5 GHz PHY,
wiphy->bands[NL80211_BAND_2GHZ] is NULL, leading to a NULL pointer
dereference in rate control and a kernel panic.

Set info->band from the resolved PHY while dequeuing hardware-
encapsulated frames. The dequeue caller has already selected the PHY
using wcid->phy_idx.

Temporary diagnostic instrumentation and a same-MAC dual-radio FT
stress test with continuous traffic reproduced the invalid state twice
in 300 cycles on MT7981. Both cases had info->band=0, PHY band 1,
tx_info=0 and HW 802.11 encapsulation enabled.

With this fix applied, three independent 300-cycle runs completed on
MT7981 and MT7986 (900 cycles in total) without a router disconnect,
kernel warning or crash. Continued testing with the original iPhone
also exercised repeated FT roaming without recurrence.

Fixes: 55f7c9b02790 ("mt76: mt7915: add 802.11 encap offload support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Pesaresi <andreapesaresi82@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 3707ee19e4..a168851959 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -406,6 +406,8 @@ mt76_txq_dequeue(struct mt76_phy *phy, struct mt76_txq *mtxq)
 
 	info = IEEE80211_SKB_CB(skb);
 	info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, phy->band_idx);
+	if (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)
+		info->band = phy->chandef.chan->band;
 
 	return skb;
 }

base-commit: 1eeca1d5e0920fbdad6449768fd2d4364e714180
-- 
2.43.0


