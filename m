Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E309C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H8OCvE7enPzYeS+ZD/b1+wgUiD3d8fgb6HgQLR5dMYs=; b=JAU9iReMFnhti91PCRH6BqSvkW
	7OK8Zgb2Bw5DnddY6OrEctDGBQcnwRVsNbWhdiU7qBAVDMFFIhHUFSsdXqOwIZAaHNGHZi9GwrcJm
	9hFngV8TpbzeUTZYwFO2febSHHGtZpy8I46a2PPio/uqg1gtwZYbrjo4cdsnp/D2atf6J3FM+pTs2
	MwsSCxzcCGCdP1i8D/DvJWDAo15JGDSut24ZQlMaV6JXGDeV3uzEX5QGC0VBryC/HBvnPmohI2Iow
	Yc9zh5YXaWoFR+tcQP0SaCqMq0qihILf2MGMGm6vjZJ/sHBNZ4Dl2zx5tY+B7mkR04VNzTaA4KOEP
	T5/7Wbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw72-0000000Grqf-38Sy;
	Sun, 27 Sep 2026 21:08:44 +0000
Received: from mail-oo2-f42.google.com ([74.125.231.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw70-0000000GrqD-0vHv
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:08:43 +0000
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81be26ba237so307924a34.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543321; x=1791148121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8OCvE7enPzYeS+ZD/b1+wgUiD3d8fgb6HgQLR5dMYs=;
        b=LOayl6jjCuDjU5OjMk6hRQe+CC7+u9lxQc3ybxLp9qXgdj4QEfM1VPmElxLRwpYjCv
         LEAP4l3LtbBKd/iroVt2sTg7GxTKWI9/j+mIvFPrC9AingCDFcS6/4z+gjZpypqaq0Hw
         oaRnoto1ujm3KWQk3dy8sFqMfo9GfMODyzRx8EC5d3D/ymUid0QMBwpjIefrk9bwJNU3
         p38UdD+t65xuOOR5OK/4MDVY9dHiC1tu8B8Z4LC3HkegyDIm/RPERwsvg+zrFpjqcZtJ
         JtZLkyzSMKD6hZ64jsjNylzkOCuHrpzuTUTJa5SP3xVI9YNe4gS4w832prKuoyfYY5md
         HRtg==
X-Forwarded-Encrypted: i=1; AKwUvBzx5M00oImbQSXvycyTm7U7DkYA9ufMdQSGJepxh545b5Ejg/WBrqe7JISxr47UVVUsIxxkz3yVvAgrhRU4XA==@lists.infradead.org
X-Gm-Message-State: AFuF++l3Kir4vB5rXHsk6zsdNFm2pQ1+s2bvs/No1Co8doV678kSAvRI
	Us9gMX4zBX7JSthF4eoVtaQR6dzCvZnkGv6JOIf0Odce85LWgnviMfEOUjlMz3PI
X-Gm-Gg: AYBFou2HiM3j5KpJqYXUvf2g22sKaMgZxHAMvVGHx9vlB8oBdgUzylTxheJRfO1BaUX
	1M7BZzB8s6NUJMiXmF9RWaKPZBtn3Pg7JGM4WJLcwhLImHT0eETvLKcldDz5KVdCTvBV7wKTq7Y
	VZZ6WE/Ce4V4eu/l6kkzaLq6Gvewf3sZb52nZuH+2BXELnsBG9/F0wIbXIZJaf/6PwrKAHghZTB
	cTwHHH/QDwxnqWBVxZKcruOFqkNjPbvqytTAbWAt8OP1G0bOWHu9Az3e7f1eLJ450KJHdqwFBIj
	ias4/3d8zX6OO9GFb+94BF3f4APVrPgmEtQHAK4VZ6Id3yPc/OGen/gzRCm7a8ZJWteJm8YuIxP
	y8nbA9+lWCtwipfqjBNQw6Uhf0ENQkx3kxBLvu2JPkZhiXb9I6l1FlDjGSa43KFrhWi5CTsnraK
	XWB/qDqS1XDBBGN0kdCyiBLsfciTwPIA1YGM8daKcNGqdoNE3KY7fJgSIhr9HzvWbkh3E8FCNiC
	1g5u9aCSUlN7CBtjFTSMlCcSx+TzcgQjMcqKvZvd08ovjne+rypZxpScoCr1+igk3LrwQ==
X-Received: by 2002:a05:690c:ec5:b0:89a:63da:fa96 with SMTP id 00721157ae682-8a648ec58e4mr47317247b3.81.1790542994491;
        Sun, 27 Sep 2026 14:03:14 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:14 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH 00/23] wifi: mt76: mt7925: add NAN security and improve NDP reliability (part 2)
Date: Sun, 27 Sep 2026 16:02:42 -0500
Message-ID: <20260927210306.737669-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_140842_261001_163B9C81 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

This is part 2 of the MT7925 NAN work. It continues the 15-patch series
that fixed NAN operation and NDP performance:

https://lore.kernel.org/all/20260824195227.12589-1-sean.wang@kernel.org/

This series adds NAN MAC address randomization, low power event control,
and key management for secure NAN and NAN data interfaces. It also makes
unicast management TX respect peer availability and discovery windows,
and fixes shared BSS teardown, cluster event ordering, and device removal
and frame lifetime issues found during NDP setup and teardown.

The 23 patches here cover the mt76 follow-up work. The separate mac80211
NAN receive-filter change is not included in this series.

Chengwei Yu (10):
  wifi: mt76: mt7925: make NMI address TLV tail padding explicit
  wifi: mt76: mt7925: add NMI/NDI MAC address setter helpers
  wifi: mt76: mt7925: implement NAN MAC address randomization
  wifi: mt76: mt7925: wire up NAN MAC randomization lifecycle
  wifi: mt76: mt7925: add NAN low power event control on suspend/resume
  wifi: mt76: mt7925: implement NAN key management MCU command
  wifi: mt76: mt7925: add per-peer RX IGTK/BIGTK and RX GTK WTBLs
  wifi: mt76: mt7925: add NDC-aware TX GTK table for NAN_DATA
  wifi: mt76: mt7925: implement mt7925_nan_set_key for NAN security
  wifi: mt76: mt7925: install NAN BIP keys standalone in sta_key_tlv

Jacobs Wu (13):
  wifi: mt76: mt7925: do not disable RX NAPI twice on unload
  wifi: mt76: mt7925: assign the interface WTBL to the NAN management
    TXQ
  wifi: mt76: mt7925: do not deactivate shared NAN BSS on peer STA
    removal
  wifi: mt76: gate NAN unicast mgmt by peer availability via STA queues
  wifi: mt76: mt7925: hold NAN mgmt TX to the discovery window
  wifi: mt76: mt7925: double the retry budget for NAN unicast management
  wifi: mt76: mt7925: let TX status of DW-held NAN frames outlive the DW
    period
  wifi: mt76: mt7925: defer the NAN joined-cluster event out of
    NAN_START
  wifi: mt76: mt7925: steer NAN handshake frames by committed-bitmap
    state
  wifi: mt76: mt7925: disable only the RX NAPI instances that exist
  wifi: mt76: mt7925: stop queueing resets once the device is being
    removed
  wifi: mt76: mt7925: bound the lifetime of NAN unicast management
    frames
  wifi: mt76: mt7925: always deliver the joined-cluster event through
    the deferred work

 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  23 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 147 +++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  30 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  11 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   3 +
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 710 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 131 ++++
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  19 +-
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  58 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  98 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  34 +-
 drivers/net/wireless/mediatek/mt76/tx.c       |  25 +-
 13 files changed, 1248 insertions(+), 42 deletions(-)

-- 
2.43.0

