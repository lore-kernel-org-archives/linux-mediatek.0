Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CD1C98304
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 03:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S4rkArTvjlD8DucpkVvcyw33LP877dBjJ3f1kqgDbC8=; b=4iVCyuiFaXFY6UO26jt+kveCgu
	YJlVf+5iEU3zDpEjyQwsWSlx0Ql84HqJAiyEm4J/ocfK7sKfrdTNqINUeDE2WwXLzaXKsyVwzgbvy
	1PCLhROAkvaXaDujfCFYtuQOtybpqoZ/c//rvGamBUPoyD68nC26wMCHo+ZAT/skJ0gExAdyUv/IL
	QW6iuLSxeMP+95OKssVwIheBZjM3L+yMlDI/rCUWMFcqncWUZW5zi7eagoSDVssst1GjLsEeTKcVU
	PSSb7M+EWGqKW1/pHNvkw0oLYzIBhbxG6Izv/LJhBM8Tm6DUqkrx4LmGt8495Twa1O4/gPs+IaH2z
	w4b2gpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aDk-00000009wrc-26gZ;
	Thu, 24 Sep 2026 03:34:04 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aDh-00000009wr2-2Aij
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 03:34:02 +0000
Received: by mail-vs2-x10.google.com with SMTP id 71dfb90a1353d-5c67e33b917so1281565e0c.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 20:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790220840; x=1790825640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4rkArTvjlD8DucpkVvcyw33LP877dBjJ3f1kqgDbC8=;
        b=rbyzaDs/gRHtP6u1wkP+DrMi15gAQ1C7etIR+FSmeFekE7+ltxG6mCkFYHUeQVL028
         SLBlR6O5ea2h8KS5cZmPEEniXkpQtre1mwRWqTZyYYRHJ8yABneqvtK02de6gyslxzkM
         LjbjbNlal0ep+cCN7roLyE/jLmBapZu5GtNolQqwl3iA6KzE4i8ICECfneSEFgwmCBOi
         4l8Tawo/cmEiFa3XY25NW7SYgwM6c0nFSME3iKDq5ZmwN2fKVl5emFU7MofqP3bHK1AC
         6j4E2GNqSbpZGcZ/vtZ2uLn9VR4PUqwkjwWNA9ID4TkNjOfCoMLXq+vI01TtlGvXkIFR
         kWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790220840; x=1790825640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4rkArTvjlD8DucpkVvcyw33LP877dBjJ3f1kqgDbC8=;
        b=bMCGzP/3kEsx0oDZStaHrurkzVdXIM7mj3VlkubkpKQtdv5zjd9jafGsJqa8zY0wXW
         h5xt90YzW9fjW8urm8xjMlSTX37vYR1wb/j7Hu3JZ4jUItkmwxzljUOhLoEGAJFbOmHG
         +4FsLWJ5WBwdz2y07VIhS1A0i8Rl1EcIuos8sRZpeRGS1Kc5BWw2K5YAf1il2Z1KgXSf
         kgCkd3PqtTMQVAurYYbwv37IIR4Tm4blUf8IzW9WFttT1DEP1yjwEYzkAQmidAbhs2dI
         Ul7C2gerlqKZd0TOmrpUkdNkmPSnbKVA86M33FT/15Csh8PcOPUubhLx0Kw74k7JiZ/4
         Fzdg==
X-Forwarded-Encrypted: i=1; AKwUvBzzAhGUx06ffre58swbybdO/VXL7SslbQ6hUzS7P5TgRlj1LFOdqBCxDgiZHmZMrZKKgBuXrO4mmE/C/5vbag==@lists.infradead.org
X-Gm-Message-State: AFuF++llbGL+aB8BlGy9SgVfViE2OE60UnJBq0zFn8igR3i57t8GC56z
	bZPA6pHrJ9pG1aiF/V1UduXhRyz+ZEIQe81qybzxMUlQMLEDMO+CYlvT86PYT2F4
X-Gm-Gg: AYBFou3NFDzBZuYKC2DGHy66ZfO1D2U9Ne7EtjxLxfsfB4lEqc3NLlVCWLUxS7ddsle
	M0ceIYD5djw+82sT8ifNWMxUCBlzxdAGwMdMHuoPQTfizqyv1Aijh92gYHRx3LlMWigofbuT9cg
	0dPGwsTd6CNtzmjUJ5Q5chGYbx0+V7X9B9OGvWmCaBFvYamMwjsz5cdUQv+lz12LqHqpLINCVWF
	WWJPXEAVIwxQx40+2Gs5PT+ZGu9x4Hu/9X3xolaVYcnVIcKCq6BjLoLHqzpAV54/hMpzzroFZ9A
	K+l5l+0TdeMuUTgd8NVEB3ETa5uJZa2w83rDoKOVMONe7tkf/TMKRZikAR5Jx0LwpZTuHtM00Uk
	Se6+1v/3RwvwuZi7YK4kUoJIyoY0sWZ/DsMS0TxLe24FqyKSuoRwY07GBTQM1BHTOJfGUlSrAFb
	v3CmM5mRPK0H9ioEjzNVJdYGsyjP3m3vU/78TCj2xdnu1xlkAMXlw1wSdWz8WM7LlhKZwj0o0F+
	unJ6sY3G2e2fuVchvG75EkWURxgvwe2QzeSWXSw80E9UaI=
X-Received: by 2002:a05:6102:4191:b0:7a8:1817:276f with SMTP id ada2fe7eead31-7af1f61e9f8mr693993137.37.1790220461112;
        Wed, 23 Sep 2026 20:27:41 -0700 (PDT)
Received: from localhost.localdomain ([190.177.169.131])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf35bcb07sm6107028137.2.2026.09.23.20.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:27:40 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: feed the station RSSI average from the chain signals
Date: Thu, 24 Sep 2026 00:26:39 -0300
Message-ID: <20260924032639.28158-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_203401_567828_57B01140 
X-CRM114-Status: GOOD (  14.52  )
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

mt76_check_sta() adds status->signal of every received frame to the
station's RSSI average, wcid->rssi, which mt76_get_min_avg_rssi() reads
for the dynamic sensitivity of mt7603 and mt7615 and for the gain
control of mt76x0 and mt76x2.

Since commit 4550fb9e9810 ("mt76: improve signal strength reporting"),
drivers no longer set status->signal: mt76_rx_convert() computes it from
the chain values when the frame is handed to mac80211, after
mt76_check_sta() has run. Except on mt7921, which still sets it, the
average is fed zeros. mt76_get_min_avg_rssi() then returns 0, so mt7603
and mt7615 leave the sensitivity at its default, and mt76x0 and mt76x2
fall back to -75 dBm for their gain settings.

Compute the signal from the chain values in mt76_check_sta() as well,
as mt76_rx_convert() does. On mt7921, the average now follows the same
combined value that mac80211 gets instead of the strongest chain.

Tested on a TP-Link Archer XR500v with one client, switching between
the old and the new input every 30 seconds. On the MT7662E (mt76x2),
the average the AGC works with was -75 dBm, its fallback, with the old
input and -54 dBm with the new one, while iw reported -54 and -52 dBm
for the station, and the AGC mostly used its low_gain 2 setting instead
of 1. On the MT7603E, the station average was 0 with the old input and
-41 dBm with the new one, while iw reported -42 and -41 dBm. The mt7603
sensitivity still stayed at its default: a separate bug keeps it from
leaving 0.

Fixes: 4550fb9e9810 ("mt76: improve signal strength reporting")
Assisted-by: LLM
Signed-off-by: Cristian Papa <pcristian292@gmail.com>
---
Testing: OpenWrt, kernel 6.18.41 with the mac80211 backport of 6.18.39,
openwrt/mt76 at be5ce79105 plus this change and the board's local
patches, with a temporary module parameter selecting the old or the new
input (not part of this patch). One client; the old-input samples of
each run come from the same minutes as the new ones.

Tools: an AI coding assistant (Claude Opus 5.5 in Claude Code) found the
cause, wrote the instrumentation and drafted this change and changelog;
the tests ran on my device.

 drivers/net/wireless/mediatek/mt76/mac80211.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index cda5c5d51..4231adb77 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1471,6 +1471,7 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
 	struct ieee80211_hw *hw;
 	struct mt76_wcid *wcid = status->wcid;
 	u8 tidno = status->qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
+	int signal;
 	bool ps;
 
 	hw = mt76_phy_hw(dev, status->phy_idx);
@@ -1488,8 +1489,10 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
 
 	sta = container_of((void *)wcid, struct ieee80211_sta, drv_priv);
 
-	if (status->signal <= 0)
-		ewma_signal_add(&wcid->rssi, -status->signal);
+	/* status->signal is only set later, by mt76_rx_convert() */
+	signal = mt76_rx_signal(status->chains, status->chain_signal);
+	if (signal <= 0 && signal > -128)
+		ewma_signal_add(&wcid->rssi, -signal);
 
 	wcid->inactive_count = 0;
 
-- 
2.47.3


