Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B54CC27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wjwbybjfnlPDTGv5o9qP6JskFHBy1UjXTbEViuKqIyc=; b=BVvz7GNDOk1lbJ/QjWoBXbJer+
	r114jdeE1gTYiucmubl9UyoyHFPkE+OEqQIl3ne6RgfWJp+NHPEEF1sKO+1bCGBOju4P1nlXhLdne
	2zeFZZKZaEkjpf80SlCQjZSWyzif3rYfCGAidUdpw0Axx4UhWn8bE004b1ZkVg8LteasYm8F/Pmlo
	b6vHON4DkaIuqUj/UUAH7xf+jsuH1kstpTWl8ckJvMhL1RIh+4+WhQSq/vCEU7v+8nKiGqALDthmn
	FPMqpsHgCtahA3NgiKQvWfFYwA21Fdc3t+oqKFMfXjYvM1cp2K61VaLw/EJzQievzvYw6+ZRbkZop
	4rV6oC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajl-0000000EvTp-1CyN;
	Thu, 13 Jun 2024 03:02:53 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaji-0000000EvSk-0T8T
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:02:52 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5bad7941dcfso26242eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247766; x=1718852566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjwbybjfnlPDTGv5o9qP6JskFHBy1UjXTbEViuKqIyc=;
        b=uiXjDTUbZ+q2D8+OalummQ/EU/cGl8jR7AlnZuA7/JTJ+zxSksOFptNWXU5+zGRXwc
         aekE7XY66CZdxDpPPk5WfbsV+7bXsqr+ACFV6MTEWcO5xmJq8dJ1KHI+BpG9gZGYtFB0
         UN5RA/9RqLAvxDTfTGjlGMLN6CMIcrhvfgaaj6MR+2m5adkyiyHSxThRBj5CBvU9wPEL
         2hvgq5c8sFJGGU4t3uNPcoIaILxZQY+/cbSqXTrjiyfpXuAM1MDrUM4MZWqwHrLl602Z
         DzC5xpdtbvEWSgJRvOyVUq43gNtTuqT6GKZhW45T9JD20FBGO6JUeu+XXI95EFk7Eryu
         lVOA==
X-Forwarded-Encrypted: i=1; AJvYcCUo2FDOcbxDfxD02qajTb9YKo0COMa64DV0JySeKH2ZnagzzEoh295N8CE0b1fKucV3kE9xFoEjZGk617KB6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRl7kA5YYNLDDjh0KwlzUqSIUxptRa+WnljJIqf+Qoa9uyLN1M
	KPwDCkPAFVNfNUFfUrf0ZYYIXdhQ1fONZrzono0e22kqf1u+H/0k
X-Google-Smtp-Source: AGHT+IER9+Uy+9LreQRT6aeUwKH/q1c4bW65weR/CmRHz5fIl/mNx4PfWXC2BSSQSFLZkz07u24dig==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr3995097eaf.0.1718247766411;
        Wed, 12 Jun 2024 20:02:46 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:02:45 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 00/47] Prerequisite Refactoring for Enabling MLO on MT7925
Date: Wed, 12 Jun 2024 20:01:54 -0700
Message-Id: <20240613030241.5771-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200250_279850_284008E9 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Sean Wang <sean.wang@mediatek.com>

I'm submitting some patches that are essential preliminary steps for getting
Multi-Link Operation (MLO) up and running smoothly on the MT7925 driver.

Before we can activate MLO, we need to do some necessary refactoring work.
This involves adjusting how the driver handles certain commands and data to
support per-link STA and per-BSS operations. It's like laying down a strong
foundation so that MLO can seamlessly integrate with our existing setup.

It's important to note that these patches focus solely on refactoring work.
We're not changing any of the current functions or logic; we're just making
sure everything is structured properly to support MLO when it's enabled.

I've tested these patches to make sure they're reliable and won't mess up
anything that's already working. 

Deren Wu (5):
  wifi: mt76: mt792x: add struct mt792x_bss_conf
  wifi: mt76: mt792x: add struct mt792x_link_sta
  wifi: mt76: mt792x: add struct mt792x_chanctx
  wifi: mt76: mt7925: support for split bss_info_changed method
  wifi: mt76: mt7925: extend mt7925_mcu_set_tx with for per-link BSS

Sean Wang (42):
  wifi: mt76: mt792x: extend mt76_connac_mcu_uni_add_dev for per-link
    BSS
  wifi: mt76: mt7925: extend mt7925_mcu_add_bss_info for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_set_timing for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_bss_ifs_tlv for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_bss_color_tlv for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_bss_he_tlv for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_bss_qos_tlv for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_bss_mld_tlv for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_bss_bmc_tlv for per-link BSS
  wifi: mt76: mt7925: remove unused parameters in mt7925_mcu_bss_bmc_tlv
  wifi: mt76: mt7925: extend mt7925_mcu_bss_sec_tlv for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_bss_basic_tlv for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_set_bss_pm for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_[abort, set]_roc for per-link
    BSS
  wifi: mt76: mt7925: extend mt7925_mcu_uni_bss_bcnft for per-link BSS
  wifi: mt76: mt7925: extend mt7925_mcu_uni_bss_ps for per-link BSS
  wifi: mt76: mt7925: add mt7925_mcu_bss_rlm_tlv to constitue the RLM
    TLV
  wifi: mt76: mt7925: mt7925_mcu_set_chctx rely on
    mt7925_mcu_bss_rlm_tlv
  wifi: mt76: mt7925: extend mt7925_mcu_sta_update for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_state_v2_tlv for per-link
    STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_rate_ctrl_tlv with per-link
    STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_eht_tlv for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_he_6g_tlv for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_he_tlv for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_amsdu_tlv for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_vht_tlv for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_ht_tlv for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_phy_tlv for per-link STA
  wifi: mt76: mt7925: extend mt7925_get_phy_mode_ext for per-link STA
  wifi: mt76: mt7925: extend mt7925_get_phy_mode for per-link STA
  wifi: mt76: mt792x: extend mt76_connac_get_phy_mode_v2 for per-link
    STA
  wifi: mt76: mt762x:  extend mt76_connac_mcu_sta_basic_tlv for per-link
    STA
  wifi: mt76: mt7925: extend mt7925_mcu_sta_hdr_trans_tlv for per-link
    STA
  wifi: mt76: mt7925: extend mt7925_mcu_add_bss_info for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_bss_mld_tlv for per-link STA
  wifi: mt76: mt7925: extend mt7925_mcu_bss_basic_tlv for per-link STA
  wifi: mt76: mt7925: add mt7925_mac_link_sta_add to create per-link STA
  wifi: mt76: mt7925: add mt7925_mac_link_sta_assoc to associate
    per-link STA
  wifi: mt76: mt7925: add mt7925_mac_link_sta_remove to remove per-link
    STA
  wifi: mt76: mt7925: add mt7925_mac_link_bss_add to create per-link BSS
  wifi: mt76: mt7925: add mt7925_mac_link_bss_remove to remove per-link
    BSS
  wifi: mt76: mt7925: simpify mt7925_mcu_sta_cmd logic by removing
    fw_offload

 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |   8 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  56 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  19 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   4 +-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  66 +--
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 143 +++--
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  46 +-
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |   4 +-
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  69 +--
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 452 +++++++++-------
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 500 ++++++++++--------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  25 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  15 +-
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |   4 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  78 ++-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  70 ++-
 .../net/wireless/mediatek/mt76/mt792x_mac.c   |   8 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   |   2 +-
 18 files changed, 896 insertions(+), 673 deletions(-)

-- 
2.34.1


