Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFACBCA9EC0
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 19:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=75/9wntxrYg7KAVI+BsS7cL60VeD2bNUigkOoVopl5Q=; b=jwtg1RJWKs85QG7Pz/6U4EO1pb
	ybkVa0s1vTDuIi27ieo2qKA7urC4Emga6lIN4AnMUbM7qF0lkTeOmQGIoD2M6O++I+qvonx9dIlFA
	JqM0TpZbvf0L32CcZOumezOoQ6iIjGoESdN2+CA6nNLkG6J8x5pU4ZA8uRik2w4NwslReYArtK2Pd
	FTsmpqMTeCVdPSgyb2MT89Q/29XXTEyKKNGmbNY3MpEk6oMsEt6hKht2Ic8iZSh4yDfiVAkmVgH2L
	v/x1ku7ce9U3UzdAcfmhlkMP0TcoyVXyZaTTwF7/Ixh6bo4B8zBcHKa1EDYMglKUKrnDalMDzfzBN
	QZ1+OzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFcik-00000008Ozk-0I05;
	Sat, 10 Oct 2026 19:27:02 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFcig-00000008OzI-3GXW
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 19:26:59 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-5e7834687easo126911e0c.3
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791660417; x=1792265217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/9wntxrYg7KAVI+BsS7cL60VeD2bNUigkOoVopl5Q=;
        b=OnjsBTC+z5EEDJp2Pk2EFn5cWjgnHRlUg7ANInaZvUsdzc5hlerLc/jhU2/qcpeKd6
         /Wc/zxSpqDJ3+XIaUOFQY6EeZZHr0zt2ecm/55AeFfaSSJH0JOAF7k5V7/y43/VWycYy
         1OKtIY/3BwqZZ9aZIqel0n1YdZO5c24VF+PolFr7S2rwl0AeLx1cmd2gd6J50hp8YTz9
         /TM/Rnj+bnG2yCPQpIpTx7hstOLQxKTwjzPEOm6A7JA0LTFJgqIjW8WoHPxca6/GrKwU
         VNEYP8VY2MNgpuXc0mC9TsVggEzs6+HattPsEfIxD9IewQpYhl7CQxpSzY6GKdQ4T31N
         xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791660417; x=1792265217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/9wntxrYg7KAVI+BsS7cL60VeD2bNUigkOoVopl5Q=;
        b=WOnlmP/VhzuCmN37aKfxCEt+GADcTUThT9NDccAPgCer0q7ZWsho82YhAcz59zcccF
         k5b5eL+m6x8I82iWzOmeBBNGFYF9Q8BdH+7ShCQLZUBeVSs+BCyQ8z8IC4VZjylGyYZ4
         MRejkfShK/6qoW94Inq4Z7UTdHgPTazK3hWccWHzzT23q3YUQwRXiQBr3eOLRTto7rLI
         G70RjvEoeFEoYjmVPdmQt6eixtyYgRaTDJ+9xh+x7qfwZgHLww3X18OmXIrFUE5gNWsK
         UtY8L3VajhiZUo7TJApobsC4WJqPrMXg0/J0bq7ogmRZgfCwPkiM8wERYGhDqrK4BqHB
         KwyA==
X-Forwarded-Encrypted: i=1; AKwUvByAgKbzP57W6K4mmDBiQCAFljhGpeRElFY+hsBtW/owaID5DsfmQEhY4jfEajqefTfr9BZb8GrEEcWr4Vbhzg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL4LoqqMA+0AghZasVtM/eyeXwz3t3tVNX/avD6AS1P/7kYWMTB
	9BbRUx36ma5yTeFnKQLe6WCIDdqSvHBQi6jd2Cn0GMwsDRAkNHrD6xIW
X-Gm-Gg: AYBFou0kG5AWXxpIgFz8eiaJSdUdASb7WNZr0HTVaPaV4TQxJ9AtbpcJt7LOEkXBxfE
	14YKgvFNhzktxtWU6hs+S7UaYeSJnqTlRlEiHhN6JTfbRO95o5JCEzvbzPep/uyMCdZbF02Ei4u
	V0YYTzGtHlSZaNqao5FCS3+PWTL0F3ymrV3/jaGY9g9hyeg+Fy72E0R5wAJwPO3YcqfYe4KjhVx
	AI36GAXrMBlOJRQ3RtOOYVjLGVtWcd0mWUkLNwmd0TjCOFNYc8ruLBwu3hPCYeueWtWk+Xa4e+m
	QhusTnlmfwcNKKl2b4fJ/T3e0WMjGbeyQGv8x8FMaqSXf01Q2Ud5H1e0hoMMJDL08n+7VH6/0pG
	8MnVcL/1nGi1Ftu4B+aeGpi7ri6rlBJdmvWUhRk2RqWhI/VwOzHZ0096LkoN6V+bWdxdh4TL1Qy
	pe0Z7nt6IVyprs4/wLqgzx0zpT67gaIxLpBd0qWLM3/uthPjPjk9t2pWfvn8p4OdgOG1Xs9rONR
	biUy4mPm4OfpTbgrH0jJBelrBozR3F/vBvA4DkDQNec0GE=
X-Received: by 2002:a05:6122:1d4e:b0:5c6:81c2:5496 with SMTP id 71dfb90a1353d-5e91f43e0fdmr1833621e0c.4.1791660416965;
        Sat, 10 Oct 2026 12:26:56 -0700 (PDT)
Received: from localhost.localdomain ([190.177.186.207])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cb292a5sm4457640e0c.7.2026.10.10.12.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:26:56 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt76x02: keep A-MSDU subframe buffers at even addresses
Date: Sat, 10 Oct 2026 16:26:49 -0300
Message-ID: <20261010192649.15608-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_122658_847231_63A1450C 
X-CRM114-Status: GOOD (  30.98  )
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

On mt76x2e and mt76x0e, mac80211 builds A-MSDUs in software: it chains
each new subframe to the frag_list of the first frame, and
mt76_dma_tx_queue_skb() maps every skb of that list as a DMA buffer of
its own, two per TX descriptor. Since commit 166ac9d55b0a ("mac80211:
avoid kernel panic when building AMSDU from non-linear SKB"), mac80211
pads each subframe to a multiple of 4 bytes by pushing the padding in
front of the next subframe, so the buffer that follows a subframe of
odd length starts at an odd address.

On an MT7612E in a TP-Link Archer XR500v (EcoNet EN751221 SoC), the BE
TX queue occasionally stalls under load: its DMA index no longer
advances while descriptors are queued, the MAC is not transmitting,
and after a second the watchdog restarts the hardware:

  Hardware restart was requested

A debug patch that dumps the TX ring captured three of these hangs.
Each time, the DMA index was stuck on the last descriptor of an A-MSDU,
and the buffer in its second slot (LAST_SEC1) started at an odd
address. Such buffers are rare: in 20 runs of 95 seconds with four TCP
streams and without the check below, the driver queued 227 of them
among about 10 million multi-buffer frames, while frames with more
buffers and descriptors, all at even addresses, went out by the
hundreds of thousands without a hang. An odd buffer does not always
hang the DMA, though: the layout of the stuck descriptors was queued
63 times in those runs and hung once.

Only append a subframe if the frame built so far has an even length
and both frames start at even addresses. The 802.11 header, the IV and
the subframe headers have even lengths, so head->len has the parity of
the last subframe, and thus of the padding that would follow it; every
buffer but the last then has an even length as well. A frame that is
refused starts a new A-MSDU, so nothing is copied or dropped.

The cost depends on the packet sizes: full-size TCP segments and pure
ACKs have even lengths, while with uniformly random sizes a host model
of the aggregation refuses about half of the attempts. In 10 runs with
the same check as a run-time switch, interleaved with 10 runs without
it in the same boot, it refused 143 of 7.5 million aggregation attempts
(0.002%), no odd buffer reached the ring, and A-MSDUs of six or more
buffers were as frequent as before. TCP throughput was
307.9/401.8 Mbit/s (up/down) with the check and 308.6/399.1 Mbit/s
without it.

With that traffic the hang is too rare to compare the two cases, so a
UDP flow to the client with packets of 1500, 275 and 217 bytes was
added next to the TCP streams: mac80211 then builds the layout of the
stuck descriptors whenever that flow backs up. In eight interleaved
rounds of three 25-second phases in one boot, the driver queued 64,000
to 91,000 descriptors with an odd buffer in the second slot per round
without the check, and 5 of those 12 phases ended in a restart (11
restarts in all). With the check, it refused every aggregation attempt
that would have produced an odd buffer (139,000 to 160,000 per round),
none reached the ring, and none of the 12 phases restarted (one-sided
Fisher exact test, p = 0.019). A shorter calibration run before it gave
2 of 3 phases with a restart against 0 of 3.

Turning software A-MSDU off, as commit c2fcc83b41a6 ("wifi: mt76:
mt7603: disable A-MSDU tx support on MT7628") did for mt7603, avoids
these buffers as well, but on this device it lowered the download
throughput from about 440 to 360 Mbit/s.

mt76x0e uses the same DMA code and descriptor format, and it has no TX
watchdog that would recover from such a hang, so it gets the same
check; it was not tested on MT7610E. The USB drivers do not use this
DMA path and are left alone.

Fixes: 166ac9d55b0a ("mac80211: avoid kernel panic when building AMSDU from non-linear SKB")
Assisted-by: LLM
Signed-off-by: Cristian Papa <pcristian292@gmail.com>
---
Testing: OpenWrt on the XR500v, kernel 6.18.44 with the mac80211
backport 7.2 and openwrt/mt76 at be5ce79105 plus the board's local
patches. There the check ran as a run-time switch of a debug build
that also counted the buffer layouts handed to the DMA (neither is part
of this patch), so both cases could be interleaved in one boot. This
patch itself was build-tested with W=1 on top of openwrt/mt76 master
for that kernel (MIPS) and on top of the mt76 branch of nbd168/wireless
(x86_64). I only have this one board, so I cannot rule out that its
PCIe host plays a part.

The throughput of the runs with the UDP flow is not comparable between
the two cases: after some of the restarts without the check, the client
stayed associated but passed no traffic until it reconnected, and the
upload rate of the later rounds dropped in both cases. That looks like
a separate problem in the restart path and is not addressed here.

mt76x2e and mt76x0e already set MT_DRV_TX_ALIGNED4_SKBS, so
mt76_dma_tx_queue_skb() pads the 802.11 header of the first buffer to a
multiple of 4 bytes, but nothing keeps the buffers of the subframes
that mac80211 chains to it aligned. Is there a known alignment
requirement for the TX buffer pointers of the MT76x2 DMA (buf0/buf1 in
struct mt76_desc)? If odd addresses are not supported, that would
settle it.

The hook documentation asks for a symmetric and transitive relation,
while this check depends on the length of the frame built so far.
mac80211 only calls it to append to the last frame of a flow, so I
think that is fine, but I can rework it if it is a problem.

Tools: AI coding assistants. OpenAI Codex wrote the first ring dump;
Claude Opus 5.5 (in Claude Code) decoded the dumps, wrote the later
debug, test and host model code, and drafted this change and
changelog. The tests ran on my device.

 drivers/net/wireless/mediatek/mt76/mt76x0/pci.c |  1 +
 drivers/net/wireless/mediatek/mt76/mt76x02.h    |  2 ++
 .../net/wireless/mediatek/mt76/mt76x02_txrx.c   | 17 +++++++++++++++++
 .../wireless/mediatek/mt76/mt76x2/pci_main.c    |  1 +
 4 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index f8d206a07..3c4948522 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -90,6 +90,7 @@ static const struct ieee80211_ops mt76x0e_ops = {
 	.get_antenna = mt76_get_antenna,
 	.reconfig_complete = mt76x02_reconfig_complete,
 	.set_sar_specs = mt76x0_set_sar_specs,
+	.can_aggregate_in_amsdu = mt76x02_can_aggregate_in_amsdu,
 };
 
 static int mt76x0e_init_hardware(struct mt76x02_dev *dev, bool resume)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02.h b/drivers/net/wireless/mediatek/mt76/mt76x02.h
index 3c98808cc..f5a25608f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02.h
@@ -193,6 +193,8 @@ void mt76x02_rx_poll_complete(struct mt76_dev *mdev, enum mt76_rxq_id q);
 irqreturn_t mt76x02_irq_handler(int irq, void *dev_instance);
 void mt76x02_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		struct sk_buff *skb);
+bool mt76x02_can_aggregate_in_amsdu(struct ieee80211_hw *hw,
+				    struct sk_buff *head, struct sk_buff *skb);
 int mt76x02_tx_prepare_skb(struct mt76_dev *mdev, void *txwi,
 			   enum mt76_txq_id qid, struct mt76_wcid *wcid,
 			   struct ieee80211_sta *sta,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_txrx.c b/drivers/net/wireless/mediatek/mt76/mt76x02_txrx.c
index 301b43180..3ca530f1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_txrx.c
@@ -32,6 +32,23 @@ void mt76x02_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 }
 EXPORT_SYMBOL_GPL(mt76x02_tx);
 
+/*
+ * mac80211 pads each A-MSDU subframe to a multiple of 4 bytes by pushing the
+ * padding in front of the next subframe, and every skb of the frag_list gets
+ * a DMA buffer of its own. After a subframe of odd length, the next buffer
+ * would start at an odd address, and the TX DMA has been seen to hang on such
+ * frames. The 802.11 header, the IV and the subframe headers have even
+ * lengths, so head->len has the parity of the last subframe. Only append to
+ * a frame of even length, and only if both frames start at even addresses.
+ */
+bool mt76x02_can_aggregate_in_amsdu(struct ieee80211_hw *hw,
+				    struct sk_buff *head, struct sk_buff *skb)
+{
+	return !((head->len | (unsigned long)head->data |
+		  (unsigned long)skb->data) & 1);
+}
+EXPORT_SYMBOL_GPL(mt76x02_can_aggregate_in_amsdu);
+
 void mt76x02_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			  struct sk_buff *skb, u32 *info)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
index 550644676..cd8130790 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
@@ -153,5 +153,6 @@ const struct ieee80211_ops mt76x2_ops = {
 	.set_rts_threshold = mt76x02_set_rts_threshold,
 	.reconfig_complete = mt76x02_reconfig_complete,
 	.set_sar_specs = mt76x2_set_sar_specs,
+	.can_aggregate_in_amsdu = mt76x02_can_aggregate_in_amsdu,
 };
 

base-commit: 2e6968e9286f3573016b9f804d4945373a21c489
-- 
2.47.3


