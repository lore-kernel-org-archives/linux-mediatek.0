Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D510FC55174
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2026 23:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GpnhTy9VhTfgus07R9luoxqIJ3Uscqq/lVYAIyMKBGE=; b=0fHXBmoqCPJ1YsLk9+XCugaB2t
	aVYpIJtiXaSzwdGCw284tYSyAF9LF8OfrjNJfiDTPV5o5HOF3zeN0r8Fp9XcKpy6goEtazoL+OOQa
	BqNJM/Zo1NjGcJJonlOjMgBxYJ/vv7eGciClAI1617BQBJtfvw7PMJ6FhLvOnwLMPxKeUJZybpCyI
	lfgrMt3sk+Xk2Fv6mcwcoLWNHajMQjycbz19O+sqp9Zxo/IdE1fC2sTu653ZGFRsUnJiZ9Ar2X2gY
	3JwNk6jKRBO4r4CX7S+oxvCcFpivIucov2DCL4Dk7hFSkFd+Tk1ANbNghyWn0jDKsTIgI91qUVL1L
	lLlE+JZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqfUP-0000000G7Ml-31hs;
	Sun, 02 Aug 2026 23:21:07 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqfUL-0000000G7MJ-0aqj
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Aug 2026 23:21:03 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c15dd4b9132so433509966b.1
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Aug 2026 16:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785712857; cv=none;
        d=google.com; s=arc-20260327;
        b=QZXvZnq+DtfPrVihFOFilk3CaZaUw7Iola/wIQSYt2jSZeMCNrx5UcF/YDbYJbhHC3
         tsvINyv1BFJu5VrPBHqvtleiMTprGvBwCDaNSF1QGqA3eNj71RVWKVCZ5TzJ0EruO4LD
         tMadVYfuQtL2Se18vC2rSqrkJVVBRacfos6F3rQzujKWUnE89mAymTIJbGVLJLMV3mnz
         2ycA++4QzgVma7Jedq9n9dMPyC+m6Wm3OlWbqN6QrbMCu50xkaay+Ag6G0urOeia9zm1
         oFxSCkkfAJcXQvG83bk2smzRy12FMBWkiIWE4LD3M8AUGJX3V34wrn2neBnjfJl/DxVc
         FnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=GpnhTy9VhTfgus07R9luoxqIJ3Uscqq/lVYAIyMKBGE=;
        fh=LvWu6EBn3NC5AeXtgORVUahHe2CkKRY6YZEQZTgtuNQ=;
        b=c1s+KwjWMC+HfXBbav8B2F6/HJWq34FpTwcGMzUqAWT3+cs/3v75z+8JVh65HV3OPv
         8hfUN3QfRg0Wcrr02l9km7AeZR0KL7slIYLGXGRlfI0k6kYzUkVd6Tg4SVnOOX8IYt04
         NuBa2/LuuQ71QDbMyMHpn9cSqxBLNRhM2R1iJ0y8ERTvnaIG8yQRCb/YXJyRakDvtFp6
         JfZg7fpTW3uRmjTkZwUQsOoqJm207Y47l+lC+tuFSHl11KMMIYPhoQLEykoVfFPCiNAi
         Mt4k2UGB2/oBDO34rpXOG0SHTq8kuILHTzQwNJ8s01E9/HsRoyW29LO8d90Cf2EL9F5j
         Ch0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785712857; x=1786317657; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpnhTy9VhTfgus07R9luoxqIJ3Uscqq/lVYAIyMKBGE=;
        b=jV4A6YG/DP4cc4FBreGXil8duTb8oi8lEbsy6BEioYP4bquQDzFFiYSHBLne/9O+iz
         U0pqWcve6YU11kenJSrUaeN6Vo7eCTNhyv1ozYWJpBjINrMVwWrxdc4AI3ZFiVUAIC73
         wt1wWgO9MDuxfWMBMuGvukjIvdFmc8w+lGRWFdVJ/CJqP89uNG3ozCB0liuqOQGgO/RZ
         R9fYZZnRd7QshawyfFPmZq9YsulcUaOHiAsovME+L7GIo6Ub2Kd+Ad8hYwptYXAii2rX
         d3OcyQbjYDLQqR5TDrUrp5QUs1O/ULo86xBA3DFLNs36Oqgcz0aVeLAfha1HCh756TaL
         8OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785712857; x=1786317657;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GpnhTy9VhTfgus07R9luoxqIJ3Uscqq/lVYAIyMKBGE=;
        b=dxltVha4Y3GLMRWFz48gjEyh7AbtrtUYcS+WlJJYK9ILseLVMeqg952HzsxFzoNbJu
         ztjXlNko52ULgPAH+AmuCpFke2CX9/Lm2gJBZy/DP81GDjOWQ+000VotLJec7atw+YGF
         G4bld1O7jnX9z+0a5C3/Q6AUZG5MOx1hhimKCdWIKankUfJHOgwkyv+o4+66d3sNN+NG
         m+ot0vyGvMvPY4MFuyxqJ5wCcyT6HU/jYVK5/+bkrLplxcwW0s+6Y0A1/rFSlEMgMEsk
         JmrGozyo7YbK8whrA6aUOZkZBTFTWDtaKLiocOBgBiqj9DDbGG+gXtByLmGleE5f4eFb
         wNuw==
X-Forwarded-Encrypted: i=1; AHgh+RqLByUCphzQOXTayItWnvK0l2L5AUP7ENllVFGeniaIjQjXWImWH0BTC9/ubUn6ZlHjlytMfqn2b5TeVc9TOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyAhH+M5tjWebphy4TSB+eYG+bzOFhdCElqSbC4IM/p3FB8Yh7
	RZwa15ZnRRzzUQCK9a3eHt7k2tegh4nygcGk63iWcMoE+Q17rhIK2N2W84rvQFYQxzB1MitzNmP
	Li0jttCD2N9cyrgmKNqLH3U410b3E+OM=
X-Gm-Gg: AR+sD11rFLX3TYIVETw1r+SNiIVNGgFGwcsdf4XJSkRFbQFz5Fkr6j2j3jqftFgv+l9
	K5rqLAf4LDB1PpjPSX6mSaELiBCJQN6VwLOEXv/NVeoRPC2HeyjTa666URxEUZoCOPTIt199Sl/
	TS8CHpzuSGKFYlmu95MpGjUQqrfEWdUCFzNhdO5Kw0uYs2MyHNSVk3irq4lszLimZIV0cdKO2NX
	FZcZG7a0P1lO1do5X+uTLQeN3EfR9Ui8U+vduwMebTDTK2cXJYGnDf7x3RXIsPlzDdk3j2Z7OKk
	rfVtMZ2poIuc7fTq2FreQkQ2n2rylAQfXTPH/o4jQQ3iW0F4c6Q2FnJOheygZolJQsFuGU0fCCd
	/fA0=
X-Received: by 2002:a17:907:3c93:b0:c1c:64d4:5ba3 with SMTP id
 a640c23a62f3a-c1fe7efb692mr580583966b.20.1785712857015; Sun, 02 Aug 2026
 16:20:57 -0700 (PDT)
Received: from 24047573820 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 2 Aug 2026 16:20:55 -0700
Received: from 24047573820 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 2 Aug 2026 16:11:40 -0700
From: Facundo Karanik <facundo.karanik@gmail.com>
MIME-Version: 1.0
Date: Sun, 2 Aug 2026 16:20:55 -0700
X-Gm-Features: AUfX_myBTVGBJrkfBlzC96giSapLxO2U7AxY6YzFQS9SLnjdrqlzc-JzU3yaUGA
Message-ID: <CAHNRTq83iAAFyYNB5D0eg3HJggJNq3xjO8Z1zi9=+yGe4uy_Lw@mail.gmail.com>
Subject: [PATCH] wifi: mt76: mt7615: skip MT_TXD5_TX_STATUS_HOST for MT7663
 group frames
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_162102_320417_FDEC7604 
X-CRM114-Status: GOOD (  17.00  )
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

Under the right circumstances, a broadcast or multicast packet can remain
stuck in the firmware/hardware queue. Following group packets then stop
completing and accumulate. On my system, this appeared as excessive airtime
queue limit (AQL) debt, which eventually stopped batman-adv traffic on that
interface.

For a packet to potentially get stuck it must have the
`MT_TXD5_TX_STATUS_HOST` bit set and remain pending while group traffic is
held for the next DTIM because a station is in power save. The queue stalls
when such a packet is present on the queue and the final station (still
treated by the firmware as power-saving) is removed, whether explicitly or
through normal teardown after the client disappears.

In summary, the packet must:

1. Be broadcast or multicast.
2. Be pending under group power-save/DTIM handling.
3. Have the `MT_TXD5_TX_STATUS_HOST` bit set.
4. Remain pending when the final power-saving station is removed.

The fix is to leave `MT_TXD5_TX_STATUS_HOST` clear for MT7663 group
frames. These frames normally use PID 0, the no-ACK packet identifier, and
(as far as I was able to find) the driver discards TX-status reports
carrying PID 0. The report therefore has no consumer or useful
per-recipient result. If a future path assigns another PID to a group
frame, `WARN_ON_ONCE()` records a stack trace while the status-request bit
remains clear.

My broader interpretation of this failure is that the firmware/hardware
does not expect a host TX report for packets that are not aimed at a single
station. The last power-saving client leaving might have been enough of an
edge case to surface this expectation as a bug. This is speculation, of
course.

After applying this patch, every single packet matching conditions 1, 2
and 4 cleared the queue without any issues. I also did A/B testing with all
conditions present. The stall occurred in 100% of tests without the patch
and 0% with the patch (which, of course, removes condition 3).

I let it run for about a week without either the stall coming up again or
any regressions showing up. The hardware used for testing is a TP-Link
Archer C6U v1 (MT7663E PCIe), running OpenWrt 24.10.3 and Linux 6.6.104. I
do not have any reason to believe this will break on newer kernel versions
or different hardware, although I was personally not able to test either.

This patch very likely solves the issue below, but it still needs to be
tested on that setup:

https://github.com/openwrt/mt76/issues/598#issuecomment-939419710

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Facundo Karanik <facundo.karanik@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index aad232c5a6fa..5c846f136961 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -823,8 +823,21 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev,
__le32 *txwi,

 	if (!ieee80211_is_beacon(fc)) {
 		struct ieee80211_hw *hw = mt76_hw(dev);
+		bool mt7663_group = is_mt7663(&dev->mt76) && multicast;

-		val = MT_TXD5_TX_STATUS_HOST | FIELD_PREP(MT_TXD5_PID, pid);
+		val = FIELD_PREP(MT_TXD5_PID, pid);
+		if (mt7663_group) {
+			/* Host TX status has no useful per-recipient result
+			 * for group frames. On MT7663, requesting it can
+			 * stall group traffic when the final power-saving
+			 * station disconnects. Force the request off, and
+			 * warn if the no-ACK PID invariant is violated.
+			 */
+			WARN_ON_ONCE(pid != MT_PACKET_ID_NO_ACK);
+		} else {
+			val |= MT_TXD5_TX_STATUS_HOST;
+		}
+
 		if (!ieee80211_hw_check(hw, SUPPORTS_PS))
 			val |= MT_TXD5_SW_POWER_MGMT;
 		txwi[5] = cpu_to_le32(val);
-- 
2.51.0

