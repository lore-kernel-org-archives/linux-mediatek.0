Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8706C3271E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wU10Slj9rAnvBK1nq0gnwTI6g6o8HVgf6xfWPzjhhDc=; b=TVUzDzbeSzFYoxsloWSM+425Qp
	R80ByyjrB88KWo8Qf9Jyx4umAMW0wWZSj7gVusCg04hisIn3oiy1dkOQWD4Ohcp3vzWofDdz7nR8X
	g+G1aM/yynrlvliMcn7lW2QjPExRWHQygzXaXu8E9KIv7M29u4jgVDkfJ9EYjLsy943louypc7mzb
	OuJcKaEtWwMvRvB04xyayTNnDQyZ7Y4euDx4Vr58/TxcglWtvSa3MuBik3v6jEkNTg+fj2oRx0ROm
	Fui0dDgALDIneEskrn0SrifUDGFmbkyf3q/GH9RqFSdTssXEIyzloif98/PDDrSjb9OhxdJwqXzOE
	zR6uyFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kY-0000000BWwf-2tMK;
	Wed, 03 Jul 2024 21:42:50 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kV-0000000BWw6-2Vfm
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:42:48 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-25dff23459cso3501fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042966; x=1720647766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU10Slj9rAnvBK1nq0gnwTI6g6o8HVgf6xfWPzjhhDc=;
        b=QL6iarf9ltpGpGKb+T5wCE4/UQJ1kWcfoeVgGY63cMM9fnJWQJJW7yufQuAQcLmWEL
         3JUjshCqcA4RvVXGZp9Rcpims0clp0s3A1fKFE75JEa4pqxB5VRDocvoysxE80zjw/X7
         OJrr1glfFqqK0UKgrDeC+C4sxeR3JLBKnhPpZmkbKYV193fP7++ADfollbntYbnreCqo
         ILo5u656sjjzNbVe9VqjoiuXv3p3xjbPlWGyYhds9RD5QudY2hCN9UUXsHS0B5c6CSi7
         ca+ndRR7kwGor6UUq4O3fIxmMxPV/nIwN7sZPFOWn/Mk2XdcQldaicdwASWPRBhx2s/J
         Ddaw==
X-Forwarded-Encrypted: i=1; AJvYcCVL2JWD3YARwbHi99qof3rOHZRjuQvY7PAk2+PrZBiNmfP2eDs1tJylh0u5pU0Ftx8+d3S9GpU2QIWV7l+Gk0/ftFSJEABgmuW77p+k/ypBf5sZ
X-Gm-Message-State: AOJu0YwfN64lvFBHy52ratJwkQT498PLztMIn5mC8X4kI9AwQ2pl+n/r
	IAaZI9x8MvP3u5sfD+i0fvh61dJTajrpnZCV2N61KUv/8E0qO2N4wanDOcSi
X-Google-Smtp-Source: AGHT+IGs9LjiOOX50n/PkLYnHZ65tqk8YD1duswUnhyNDzZ1E3riWbqCJWGulMSNkxlMUIwgmwKypg==
X-Received: by 2002:a05:6830:45aa:b0:702:39:1fbc with SMTP id 46e09a7af769-70207726e80mr11937436a34.2.1720042965736;
        Wed, 03 Jul 2024 14:42:45 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:42:44 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH 00/29] Enabling MT7925 MLO Mode Support
Date: Wed,  3 Jul 2024 14:42:05 -0700
Message-Id: <cover.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144247_663298_F2F0245C 
X-CRM114-Status: UNSURE (   8.34  )
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

From: Sean Wang <sean.wang@kernel.org>

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

Sean Wang (29):
  wifi: mt76: mt7925: update mt76_connac_mcu_uni_add_dev for MLO
  wifi: mt76: mt7925: update mt7925_mac_link_sta_[add, remove] for MLO
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
  wifi: mt76: mt7925: enabling MLO when the firmware supports it

 drivers/net/wireless/mediatek/mt76/mac80211.c |   5 +
 drivers/net/wireless/mediatek/mt76/mt76.h     |   7 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |   2 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  11 +
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   6 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  66 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 660 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 397 +++++++++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  40 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  13 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  26 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  49 +-
 12 files changed, 1134 insertions(+), 148 deletions(-)

-- 
2.25.1


