Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27272CD3423
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2026 01:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5/hy9Op5MH/n5HzPINkQe6Hw6Gmq5KhiDMLcdOYjsuM=; b=U1Bxycqaa3O+Fh
	E7XbTDLUCAaWBiU/kVgFTgDLq86wgQ/jL+8Xq00dcCgHETKERb3Qo8OeImyAokflhRXJnIwUQavQX
	djcou4ZrhEYH7czVG3i2HL/a/BCBP0GMQzUyvyPVxiFZH/vaHRd1f8L93vEIUWDhJsO4TSKxjTiTg
	Bgv0xamYBcyGUV72ZHSG4gLTQ0/bmj3cgkwFRwHoderVwAiYhte9VEA2NgY1GcyIj32ZejH2cEOt6
	YQHfW+IVM0P2KhsZ0EU4Xx4HhGMyHJVQ7+VMnz0K18Hv7ddeanckzKPePzfkom0diX+rI0OMbSIQy
	Xdakxh6fYYdswvIdxQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJLnw-0000000A55N-2BTO;
	Sun, 03 May 2026 01:39:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJLnt-0000000A52x-1ESb
	for linux-mediatek@lists.infradead.org;
	Sun, 03 May 2026 01:39:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso402743166b.0
        for <linux-mediatek@lists.infradead.org>; Sat, 02 May 2026 18:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777772367; x=1778377167; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/hy9Op5MH/n5HzPINkQe6Hw6Gmq5KhiDMLcdOYjsuM=;
        b=c2nG1Mp6Vp4cR3nE1ioECs/Ul16hQQboM1mGhBTf7O1benIudorbrGA2SmaFOU3MF1
         +gY3TuJ6HlvS5YGNH8ujP7Jn0W5EhADUhiw6WBYrWRUAYaopIfEw4WTEiaEATVOh2TGw
         O5CqKqewaA0/9ATa3rPHOR9czj1SRxkq7lV+YHJu/Yjw4+AguNcsCLyzYYFGGaw6g7Ow
         QayM+PgSo2ieBYzRCN5vzcegGgZVcNUK1CL0JqwQn8mJDXMhxDYaEph0aWA9JbESx2Jm
         VCaXEZkNlyc1EPSgTU3FZV+bT/uc0CF+tcb9mv8w9A44Mf8KuYKXiyqfEOfDQze3CmHc
         8zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777772367; x=1778377167;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/hy9Op5MH/n5HzPINkQe6Hw6Gmq5KhiDMLcdOYjsuM=;
        b=RB7NMaVF/J/Gr4XBVPUqWAnc4VCJayyK9GCOb70cQpLIzvkS4xrGMKmhCyj41Pyrq5
         xv5YNTmo4zyI/ohz2Jgj/l4P57BTyEnNdlQ/vQ4JGLa0wB0ZCaCGC3gqmyXWI83flGod
         xkXyuTKNKSkVjMEI7/ynny2pRWkn0svmg/k0n7fnQYSlx89PwgvChTEaOQNHaIBSPJ/C
         Lsfno7qcA3ZOCClFLcoIG9pwdwBqKXLkXb4f/V/GIOK+J8ln4b25761aSDtoTHoUFWl/
         pSBqomddSE3UgDS55tboVhhYKp2E6XEkmoAhRzbRPTKY0juKa6jWxoBy0V64c8JPh2cz
         ngjg==
X-Forwarded-Encrypted: i=1; AFNElJ/v1IlnR1nVkdcdEOJ2858uD/4ELCsYbITGVC3v4JyTIGU197bqYzlnTwFD9zGT/AyHifwIhIu+YXynd1gBFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YymGNlgHsTSp48fGt7njjmC0w2UyWsZjLHxgxybSym7dJquGN9j
	tksWAxGu23DJUTlBn/jGAbsVkAScei/T5YxrMlw08yWTXwFxmqWsWgE1
X-Gm-Gg: AeBDieu4B5x3Wr6QrqBLcJKqbtDfsO+/q/sb40bbI0MJPGYVxp+KbesJWTHSJoayDCe
	FNnvcpVyaML2ebmWWzF/bR4dtsb6ZfLs2PDJxjzKuUsFQBoMoq5uQh6IS6Y/epSgwTL0jzz4zCm
	kraqhTE+JluBJamhR5XF5njiDGiSz9s0ZHSEQ969R5Y5qp8/UkjDfgq6klQKxUj7JdTjy4Bfnp0
	e/JnDywrOZRAw55C+LkCRIZQYQNIQUfETzNtDQq28uw13dkxsR137EOkvxcd7UCOKU33/GqqpsI
	ioClxMtNwOK2l04WCHYjoIa7LbPSVgkhoRSsiYjKpRH9aXPoGZmTkl7Tws2mZ4jMOCT1tAjHS5k
	3IP/R9e6coGby6VNo9N3qGiHKGsOiQ48OEd54GYPHyCyqCQg4mbCvL0W7L1vi2SQSk0SIut35td
	gN9sRleKjVD9wOf7SqGH1p6WS2f+1yPbNqJ8lwPTMWmcDp+d/tZWLJKYe7B5GkR/b/XEGW8syAV
	IfvEcq/GRnJehv/T/Dl/ixeoD7ylYVRJYUm46A=
X-Received: by 2002:a17:906:9f87:b0:ba1:1181:b773 with SMTP id a640c23a62f3a-bbffa336011mr224803366b.10.1777772366373;
        Sat, 02 May 2026 18:39:26 -0700 (PDT)
Received: from KURWA.angora-ide.ts.net (mm-39-71-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.71.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1671c1d3esm24796466b.42.2026.05.02.18.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 18:39:25 -0700 (PDT)
From: ElXreno <elxreno@gmail.com>
Subject: [PATCH 0/2] wifi: mt76: fix TDLS direct-link on MediaTek MT7925
Date: Sun, 03 May 2026 04:38:29 +0300
Message-Id: <20260503-mt7925-tdls-fixes-v1-0-dde847e21081@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWn9mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNj3dwSc0sjU92SlJxi3bTMitRiXcMUQ2NLcxMjA0sDAyWgvoKiVLA
 EUFt0LIRfXJqUlZpcAjJIqbYWAK4p9jx1AAAA
X-Change-ID: 20260503-mt7925-tdls-fixes-1d1397420900
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Soul Huang <Soul.Huang@mediatek.com>, 
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, ElXreno <elxreno@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364; i=elxreno@gmail.com;
 h=from:subject:message-id; bh=YPGmyUudNSjw4eCk1z0v7TQxyamgkewkjdMSqZfW3uA=;
 b=owJ4nJvAy8zAJXa0WDmKX5v/EeNptSSGzG/LfatSrcLPN15++MYthFUoRjl0P9uFBxs3mHG9s
 t3u1fv3xrmOUhYGMS4GWTFFFp5ze2tzltUtmVzPlQEzh5UJZAgDF6cATGRnEyPDqa45L/1ZclJ/
 /9llq7hf+zqzQ2gHy6bMwgdSfMtWLRHdwfBXqCrhlfWsxyXsGw3No7YdPOWXz7twtWi41hQxt1u
 f7yUxAgBO/EcD
X-Developer-Key: i=elxreno@gmail.com; a=openpgp;
 fpr=0CCEBD7D6CA67EA4937F0A68C573235A0F2B0FE2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_183929_399929_16C07B91 
X-CRM114-Status: GOOD (  12.59  )
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

This series fixes two TDLS-related issues on the MediaTek MT7925
(Connac3) Wi-Fi 6E chip, observed reproducibly with Samsung phones
and other peers that auto-initiate TDLS direct links.

Patch 1 works around a TDLS direct-link issue on MT7925: QoS Data
frames whose destination WCID is a TDLS peer are silently dropped
after submission to firmware via the HW_80211_ENCAP TX path. mt76
advertises WIPHY_FLAG_SUPPORTS_TDLS via the shared
mt76_register_phy_helper(), but does not provide TDLS-aware
firmware-facing peer setup -- no CONNECTION_TDLS constant in
mt76_connac_mcu.h, no STA_REC_TDLS TLV, no TDLS bit in
mt76_wcid_flags, no TDLS-specific handling in
mt7925_mac_write_txwi_8023(); the proprietary out-of-tree MediaTek
driver carries an explicit cfg80211_tdls.c with no in-tree
equivalent. Whether the underlying gap is in the firmware HW_ENCAP
path or in mt76's missing TDLS-aware setup is unclear from the
kernel side; the software-encap path sidesteps it either way. This
patch stops advertising SUPPORTS_TX_ENCAP_OFFLOAD and
SUPPORTS_RX_DECAP_OFFLOAD in mt792x_init_wiphy(); mac80211 then
takes the software 802.11 encap path, which submits already-formed
802.11 frames via a different firmware path that handles all WCIDs
correctly. Verified on mt7925e at 5 GHz HE 80 MHz and 2.4 GHz
802.11n; TDLS direct link sustains ~750 Mbit/s and ~130 Mbit/s
respectively. The disable is applied to the shared
mt792x_init_wiphy() and so also covers the Connac2 family
(mt7921/22/20/02), which uses the same firmware HW_ENCAP path; if
Connac2 is later confirmed unaffected, the disable can be narrowed
with is_mt7925().

Patch 2 fixes a regression introduced by the MLO refactor in
commit 3878b4333602 ("wifi: mt76: mt7925: update
mt7925_mac_link_sta_[add, assoc, remove] for MLO"): the cleanup
loop in mt7925_mac_sta_remove_links() unconditionally calls
mt7925_mcu_add_bss_info(..., enable=false) for every link of the
station being removed, including TDLS peers on a STATION vif which
share the AP's bss_conf -- wiping the AP-side rate-control context
on every TDLS teardown and collapsing rx bitrate to 6 Mbit/s for
tens of seconds.

---
To: Felix Fietkau <nbd@nbd.name>
To: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
To: Shayne Chen <shayne.chen@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Soul Huang <Soul.Huang@mediatek.com>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
To: Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
base-commit: 7baf5857e15d722776898510a10546d6b2f18645

---
ElXreno (2):
      wifi: mt76: mt792x: disable HW TX/RX encap offload to fix TDLS direct-link
      wifi: mt76: mt7925: don't disable AP BSS when removing TDLS peer

 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 10 ++++++++++
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 10 ++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
---
base-commit: 7baf5857e15d722776898510a10546d6b2f18645
change-id: 20260503-mt7925-tdls-fixes-1d1397420900

Best regards,
--  
ElXreno <elxreno@gmail.com>


