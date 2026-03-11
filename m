Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811E7103E2E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 20:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFQ/QAVUt2bC4UBVG90/SucbtwxVRuUMolNaHVPHXSY=; b=zZaeUnWEsgwfaxQE7I06my+glo
	zB7A3Ea5c0pdHq3rzhcaVJ0awN5OMDGiQsQik5J0SinQrOZS2GgwAi7wO+ZixG6YeTl1hKheqvkw1
	y6OHARjlBWYHG0CJlAHJ/LJP6rSw7vYMK1CebJclrGXQNAn+PsqqY9ZOe7az0kDyhpHA1mxs7mx8B
	ad7PI0OKgQNSjnf5S/B6D19Ck1unAJFNwQD5v1xcgiRUDgTubQVjxYAc0MIb/cjLyEaKi5D2M/7jy
	zkiXmhMVZfijdIQO3vy0Jf/imBDoFxQLKe2EA85UzrU9ab1M/bjVcZJDMUptM0XSCzTF4DgbAdc6x
	Li89Gm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0QcW-0000000CWmR-2hhv;
	Wed, 11 Mar 2026 20:57:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0QcT-0000000CWm6-3UMa
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 20:57:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b94358796a1so33161566b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 13:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773262647; cv=none;
        d=google.com; s=arc-20240605;
        b=ljFe6t4VZQH70ePYI+ROmaiH8qE98IePz/WCLklCnyr7qVS/12ha6wCuBUUm69eUzh
         tShRzKIjuYqKkYNiaLldhf9qzWw4jHIOwRO4ASPFMgVMVz7bjWdAAZvMSinfORvbm99N
         pGf4JoogxN55Wm9V4KPyTKFGuUJi4+manmwA4HOoiVKCMjG5oZRL5ZrSB7SC+vkDj81A
         Qha7tB+5/rqBpb69w0jXsH8HriVmLO1lu9H8V+d18Ao7kVRUAuvhF9yHxr3bsa5m1iq4
         D27zd44KvJyAcjoLvQdX3y35WwddKyHMahuLTM6BTtAonVgu3ftwq0Uz3A/8VoV3anjw
         vMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XFQ/QAVUt2bC4UBVG90/SucbtwxVRuUMolNaHVPHXSY=;
        fh=u4Q1xZGtIosGtuH6Q5tvV6L/K3OHW4sG23whQoIstlQ=;
        b=RphsuUUpK4ZkUv2QI2lsBbBxFXV5qPNA+EhSRL0MmoCSpVs5NcXyYdwGzEFHKdHXTc
         28DIOMAkxNVdCZDUNKSD59qqYuEbhke1f9kTCgq2XNgwDwK45Hcq1fXvuzBXrLcmDe/G
         kWLzt2pay5BfqOyoEjsmQ27ZpnAnkqQ1KqIf0RBAiWFgcFXeJ2ypTSRhMIvilCvV+jAA
         hd/9jG5LyHYop2c1vNXurDnS1t+qj9v5Azpgr0CavV10ylqkhFx4QvSWsBaJ7k/ClEzl
         JDZRIu20XQTubXddfLPPkNXfAcpw9DbTJbBEWg9xU5B03phUniXim/GSPGz0kExDJsCj
         4tQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773262647; x=1773867447; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XFQ/QAVUt2bC4UBVG90/SucbtwxVRuUMolNaHVPHXSY=;
        b=RTvr2cuV/xWJ6bubUs2auf3ONt+YyYueFa54Hj7rbOENXWo3feApkbVTP2np+tsajc
         Bxn6MTPb8QKMUCgD4X1H3T8d/LGpYIIzbqirwOJeTpfhaN7xt+HBELnNKv5tn1MnlDLT
         vb3H+i+d81OaduIzv+nszB/JMpTVfWWB9HnTnHe39d9ODDj+7htmay6rpYymK/pG8ozQ
         bPKrKLt6REKgnjCMKdvG9VKPDkW35XIe/Lq5R+JBsSttLMtTFbjiDHck6WXX2X9IXBtq
         3wAO/hQC6VVO+bJQXwqGBWgHOuthy/JlNXPRk4OZ9R4L77jkBAfJrp0KpeSivK6ydtVm
         2cGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773262647; x=1773867447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFQ/QAVUt2bC4UBVG90/SucbtwxVRuUMolNaHVPHXSY=;
        b=HfPd60jpCZILuje4sxBRH9MdnTA1Jb+6x5KF+QANE8O0TxB1xGX+ymItbRJu6pLoMl
         27e2bSb72o+YbqtL4wzU8n4AcXpohwTofOULzcdoOjR+GlBsTM4QpQCZe7agdh3XnEeT
         WTVioxQSLREFWngcTLRoBtjn6RxcBWh0UiIa4tYZdqP/difX29GK4qnbtCoM4NZ6rGK3
         UOC7hvmH/nTvrpiNWCksICtU0oVYsWZqE07Iv94ruNrDNPU7B159o9+7ulmln/iY5IbR
         b6KLT0DerUNwvl3XYbF53U296BCMb/HdtoWvZIz96lfpN4Z8kUeyfisvSfuyYvKbGTSS
         fG3w==
X-Forwarded-Encrypted: i=1; AJvYcCVNn/R7iBK+b7y7t8xgw6DpLXhh1/PWxhlrlvQgb3+TZtE/ZhUmvnlktleBxtT4OxD/MPh7xPTKEc5jmegtSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4V13TtGMarnqia6D7soTtBzxLcVRWQ5d0NOih/HJd1CFh1qyA
	UQkbMbnUXTlEeTvUDkKfxrq5hNNVfzSw26wnQOqYDkXCCbRVhz/pSVXuT2rWt7nWRy6ukavpKUv
	+rJwlrvu3pFkttNWk0WX78xU4TiALr3s=
X-Gm-Gg: ATEYQzzB5uy9uauBRnUsivKSGcoSKVnOGoSU+LsLZRduSeaemv2VdrFq+eiHHJd56eG
	0LPw8ao8fYXik4ejtlVh/IQKHH5x3Kmg07yYFS6Hkb7YT9GiGJnZzfOb3ymVQZd1NMNAnyKbLXS
	Lmgnz9m+ewgx9dCU7I+2LRMQriVE+ddhsIw7gea64y+puZeVmjFRqsKin6LhFQYrRcRsswTxIoH
	UHtODy4kb5UzUBTt26D/odhDHVyfJZ5wJOE3lr13N/U8k7EzV/nLsrBsOg7uEZwyfjj2eTT2qMR
	tAwOTg==
X-Received: by 2002:a17:906:7955:b0:b90:71a2:3e76 with SMTP id
 a640c23a62f3a-b972e70af16mr238634666b.61.1773262647344; Wed, 11 Mar 2026
 13:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
 <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com> <CANAPQzgiE1rMP3F=5NJg3hp2uBXtq44+vTRBdkHwdfHyXJ8MQQ@mail.gmail.com>
In-Reply-To: <CANAPQzgiE1rMP3F=5NJg3hp2uBXtq44+vTRBdkHwdfHyXJ8MQQ@mail.gmail.com>
From: bryam vargas <bryamestebanvargas@gmail.com>
Date: Wed, 11 Mar 2026 15:57:15 -0500
X-Gm-Features: AaiRm501XYuf6_xNncggL8WilcZ-LyyUOcc71F3ioiC44yhoD1Fm0RW2lRnL-J0
Message-ID: <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_135729_926861_85ED5F00 
X-CRM114-Status: GOOD (  12.99  )
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

From 6c75ad481f0c3667d6ae2a2c8f7c2df08b1d52b5 Mon Sep 17 00:00:00 2001
From: bryam <bryamestebanvargas@gmail.com>
Date: Mon, 9 Mar 2026 11:52:53 -0500
Subject: [PATCH v2 1/2] mt76: mt7921: add mt7921-specific get_txpower callback

Instead of updating txpower_cur in the write path
(mt76_connac_mcu_set_rate_txpower), implement a mt7921-specific
.get_txpower callback that derives the reported TX power directly
from the SKU limits at query time.

This avoids mixing write-side configuration with reporting logic.
The callback uses mt76_get_power_bound() for SAR constraints and
chain delta, then mt76_get_rate_power_limits() for per-rate EEPROM
limits, yielding the actual TX power value.

Fixes: 3b4a3bdba808 ("mt76: mt7921: add support for reporting tx power")
Signed-off-by: Bryam Vargas <bryamestebanvargas@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 67383c4..35454e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1517,6 +1517,31 @@ static void mt7921_rfkill_poll(struct ieee80211_hw *hw)
     wiphy_rfkill_set_hw_state(hw->wiphy, ret ? false : true);
 }

+
+static int mt7921_get_txpower(struct ieee80211_hw *hw,
+                  struct ieee80211_vif *vif,
+                  unsigned int link_id, int *dbm)
+{
+    struct mt76_phy *phy = mt76_vif_phy(hw, vif);
+    struct mt76_power_limits limits;
+    int n_chains, delta;
+    s8 tx_power;
+
+    if (!phy)
+        return -EINVAL;
+
+    if (!phy->chandef.chan)
+        return mt76_get_txpower(hw, vif, link_id, dbm);
+
+    n_chains = hweight16(phy->chainmask);
+    delta = mt76_tx_power_path_delta(n_chains);
+    tx_power = mt76_get_power_bound(phy, phy->chandef.chan->max_power);
+    tx_power = mt76_get_rate_power_limits(phy, phy->chandef.chan,
+                          &limits, tx_power);
+    *dbm = DIV_ROUND_UP(tx_power + delta, 2);
+    return 0;
+}
+
 const struct ieee80211_ops mt7921_ops = {
     .tx = mt792x_tx,
     .start = mt7921_start,
@@ -1541,7 +1566,7 @@ const struct ieee80211_ops mt7921_ops = {
     .wake_tx_queue = mt76_wake_tx_queue,
     .release_buffered_frames = mt76_release_buffered_frames,
     .channel_switch_beacon = mt7921_channel_switch_beacon,
-    .get_txpower = mt76_get_txpower,
+    .get_txpower = mt7921_get_txpower,
     .get_stats = mt792x_get_stats,
     .get_et_sset_count = mt792x_get_et_sset_count,
     .get_et_strings = mt792x_get_et_strings,
--
2.43.0

