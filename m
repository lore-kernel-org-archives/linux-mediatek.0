Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4110C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5+9sCETA5CNRJA0LCGkWGOXOTk1EqLMTFhnYEilWNyc=; b=zQSv6YH7SpWkcw5eLHrUfqr6fX
	cXKcC+LhvVBd17geSo66ezbpSflbbhRxwLh7HuK8CUsuE7tvugr9WZpdrsaIFDl1e9hpmft8livBJ
	+Wv3ysXvPwYZtPj8N5UPfrA1lYzjmgqrYklBT5uCMwNB+5hQlx2KyDxx9eFhmI1csZapOPYaSvRtZ
	d7uW+12wjyCQFUrFnZjZ5SVzvoMrR+gl+Mkzb2qCQU1YTu26TTuTapArOjOqXeh/nqJKCeTrCS/l3
	vThtDB6jThz/vE2ltPuuMqWcoCMv9/uhjofb/BxnCpq7yM/SfzK7woiNSe/K6+giZP21lO+H4X6UD
	2JjxdoPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mP-0000000HXeq-2zzS;
	Sat, 06 Jul 2024 08:28:25 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mM-0000000HXdi-1KRp
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:23 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25075f3f472so367165fac.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254500; x=1720859300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+9sCETA5CNRJA0LCGkWGOXOTk1EqLMTFhnYEilWNyc=;
        b=Pv1rn2QaECwrtL4pwoI9euDwmUnHu1oZ7K/1jZCjsOEed+Tc+dNCjWqWQQRmJ4yf7N
         WzEBWErVLXZx+innX9GwIAb9l6okAddsDkT3ppBdA6jb4XDSgHN5J9542pZEql45Vioj
         Sg4BZRKCMm81LPtVudSqqPzBTUPqjOrBZHI/pqEUgNq481FHs6n8Id5Rj8nFfipudEtO
         wKmi+6EK0SPyJPKIl6PQweekcrgxNn2otcHHM2+O1hmAqbra9rKjLd5y+N+Wgcspj1o3
         kGgZXcW523Dbsyd8Jx5S2a7FDjYz8TvpoB5HNX6Ir2eQJS7U6hh5KiFiG8ZMCyoXRzfR
         /5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXJdvLBQdaVV8ixge9K4vk3pPn8VOhpqD9sdwj9/RRD26SKqbATaF9yoCzIoCCwSIeM0z7qKysyLDLg9uPv6Cw8zzqIcZY8XjFbW2I9X8vx3A6I
X-Gm-Message-State: AOJu0Yxn2jXx1s9UkKprMmHeC+8e1OgVF8Zc3vNtVpaixrvQKKBBkf+c
	gGp8rKy7W/kb81D8096qBF88AnzPxDsQ7F4M2435v/x4Jr25qyv0
X-Google-Smtp-Source: AGHT+IFwmm+1y8/oYaoSFh2YBKxpxKSVCuGifrFXNZi9Vo4mr3Auh4YXT0ufIBJaVZv8cZHo3RDKgQ==
X-Received: by 2002:a05:6870:c1d1:b0:258:476d:a781 with SMTP id 586e51a60fabf-25e2bef2b1fmr6754403fac.3.1720254500457;
        Sat, 06 Jul 2024 01:28:20 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:19 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v2 00/37] Enabling MT7925 MLO Mode Support
Date: Sat,  6 Jul 2024 01:27:40 -0700
Message-Id: <cover.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012822_387416_F00C2F98 
X-CRM114-Status: GOOD (  14.12  )
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

From: Sean Wang <sean.wang@kernel.org>

Hi nbd,

We've worked diligently to prepare the driver for the upcoming MLO-enabled
firmware integration in the 6.11 kernel.

We are posting v2 to further enhance and refine the v1 patchset. We hope these
improvements can be included in the mt76 pull request for the merge window.

These patches are rebased on commit "74861fbe2d25" (wifi: mt76: mt7925: simplify
mt7925_mcu_sta_cmd logic by removing fw_offload) in the mt76 tree. If these
changes look okay to you, could you please update them in your tree?

Thank you very much for your assistance.

The details in v2:

Address missing parts and improve driver for the firmware for multilink support

- Added 8 new patches:
  - wifi: mt76: mt7925: add link handling in the BSS_CHANGED_ARP_FILTER handler
  - wifi: mt76: mt7925: add link handling in mt7925_vif_connect_iter
  - wifi: mt76: mt7925: add link handling in the mt7925_ipv6_addr_change
  - wifi: mt76: mt7925: update mt7925_mcu_sta_phy_tlv for MLO
  - wifi: mt76: mt7925: update mt7925_mcu_set_timing for MLO
  - wifi: mt76: mt7925: update mt7925_mcu_bss_basic_tlv for MLO
  - wifi: mt76: mt7925: update mt7925_mac_link_bss_add for MLO
  - wifi: mt76: mt7925: remove the unused mt7925_mcu_set_chan_info

- Updated the following v1 patches with changes:
  - wifi: mt76: mt7925: update mt7925_mcu_bss_mld_tlv for MLO
    1. Update group_mld_id with primary link

  - wifi: mt76: mt7925: update mt7925_mcu_add_bss_info for MLO
    1. Set the bss index per link
    2. Set the BC entry per link

  - wifi: mt76: mt7925: add link handling in mt7925_set_key
    1. Set bss index per link
    2. Fix the issue for setting up the BC key

  - wifi: mt76: mt7925: add mt7925_[assign, unassign]_vif_chanctx
    1. Set the channel context per link

  - wifi: mt76: mt7925: add link handling to mt7925_change_chanctx
    1. Get the channel context per link

  - wifi: mt76: mt7925: add link handling in mt7925_mac_sta_assoc
    1. Set the channel context per link
    2. Update mt7925_mac_select_links to properly calculate the sel_links

  - wifi: mt76: mt7925: update mt76_connac_mcu_uni_add_dev for MLO
    1. Set the omac, band index per link

  - wifi: mt76: mt7925: update mt7925_mcu_sta_update for MLO
    1. Set the bss index per link

  - wifi: mt76: mt7925: add link handling in mt7925_mcu_set_beacon_filter
    1. Add link handling in the call path of disabling beacon filter

  - wifi: mt76: mt7925: update mt7925_mcu_sta_rate_ctrl_tlv for MLO
    1. Get the channel context per link

  - wifi: mt76: mt7925: update mt7925_mac_link_sta_[add, assoc, remove] for MLO
    1. Set the channel context per link
    2. Simplify the logic to get mconf
    3. Get phy idx per link
    4. Also update assoc logic to include the above (1), (2), and (3)

The details in v1:

This patchset introduces comprehensive support for MLO (Multi-Link-
Operation) mode on the MT7925 Wi-Fi driver. It includes driver
modifications to ensure seamless operation specifically with MLO-enabled
firmware environments. The patches included are:

1) Enable the link handling in the existing neccessary functions
   in the driver for MLO mode.
2) Add MCU TLV handling tailored for the MLO-enabled firmware.
3) Implement .change_vif_links and .change_sta_links callbacks for MLO
   mode.
4) Register the MLO capability with mac80211 when the driver is operating
   with the MLO-enabled firmware.

These changes maintain compatibility with non-MLO mode and the older
firmware versions.

Sean Wang (37):
  wifi: mt76: mt7925: update mt76_connac_mcu_uni_add_dev for MLO
  wifi: mt76: mt7925: update mt7925_mac_link_sta_[add, assoc, remove]
    for MLO
  wifi: mt76: mt7925: set Tx queue parameters according to link id
  wifi: mt76: mt7925: set mt7925_mcu_sta_key_tlv according to link id
  wifi: mt76: mt7925: add mt7925_set_link_key
  wifi: mt76: mt7925: extend mt7925_mcu_uni_roc_event
  wifi: mt76: mt7925: add mt7925_change_vif_links
  wifi: mt76: mt7925: add mt7925_change_sta_links
  wifi: mt76: mt7925: add link handling in mt7925_mac_sta_add
  wifi: mt76: mt7925: add link handling in mt7925_mac_sta_remove
  wifi: mt76: mt7925: add link handling to txwi
  wifi: mt76: mt7925: add link handling in mt7925_set_key
  wifi: mt76: mt7925: add link handling to mt7925_change_chanctx
  wifi: mt76: mt7925: add link handling in the BSS_CHANGED_PS handler
  wifi: mt76: mt7925: add link handling in mt7925_mcu_set_beacon_filter
  wifi: mt76: mt7925: add link handling in mt7925_txwi_free
  wifi: mt76: mt7925: add link handling in mt7925_mac_sta_assoc
  wifi: mt76: mt7925: add link handling in mt7925_sta_set_decap_offload
  wifi: mt76: mt7925: add link handling in mt7925_vif_connect_iter
  wifi: mt76: mt7925: add link handling in the BSS_CHANGED_ARP_FILTER
    handler
  wifi: mt76: mt7925: add link handling in the mt7925_ipv6_addr_change
  wifi: mt76: mt7925: update rate index according to link id
  wifi: mt76: mt7925: report link information in rx status
  wifi: mt76: add def_wcid to struct mt76_wcid
  wifi: mt76: mt7925: add mt7925_[assign,unassign]_vif_chanctx
  wifi: mt76: mt7925: update mt7925_mcu_sta_mld_tlv for MLO
  wifi: mt76: mt7925: update mt7925_mcu_bss_mld_tlv for MLO
  wifi: mt76: mt7925: update mt7925_mcu_add_bss_info for MLO
  wifi: mt76: mt7925: update mt7925_mcu_sta_update for MLO
  wifi: mt76: mt7925: add mt7925_mcu_sta_eht_mld_tlv for MLO
  wifi: mt76: mt7925: update mt7925_mcu_sta_rate_ctrl_tlv for MLO
  wifi: mt76: mt7925: update mt7925_mcu_sta_phy_tlv for MLO
  wifi: mt76: mt7925: update mt7925_mcu_set_timing for MLO
  wifi: mt76: mt7925: update mt7925_mcu_bss_basic_tlv for MLO
  wifi: mt76: mt7925: update mt7925_mac_link_bss_add for MLO
  wifi: mt76: mt7925: remove the unused mt7925_mcu_set_chan_info
  wifi: mt76: mt7925: enabling MLO when the firmware supports it

 drivers/net/wireless/mediatek/mt76/mac80211.c |   5 +
 drivers/net/wireless/mediatek/mt76/mt76.h     |   7 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |   6 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  11 +
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   6 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  80 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 730 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 538 +++++++++----
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  42 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  16 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  26 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  49 +-
 12 files changed, 1249 insertions(+), 267 deletions(-)

-- 
2.25.1


