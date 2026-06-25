Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B934CDB47C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlR8b0vC5oVW3TqsUHgYLtphTYj6J1CxyewvuGXJDbc=; b=BosxTDxZhTlDwleN67roJOJ1eV
	r6fwM0/7b+fX6n+5Mu2rrG/UcRDN9c/GD7WO/6fuFU5uvOEJ+UTRjS2Bh1tbdsQjtDJt5ntOlmRBZ
	qr78vepMfrwrVheTlfCpeIkejNS09MQNZRGaOGfnliZOQNa5XYpb8+bSsrcoz4eEB3kMB1XSkA7aD
	hMNV6jXTQVDLWW8Tkz6/Y/syIxaSrD8ELuykAD0NWtUkeXmlQqSGxLNlDFrRb8rsvV4cDzieY29kS
	oeq7Z2uOLup3tU4Pejfw869rYGUTh6kfs/pPzcxxNJtODwMdlpVFUETRoGt0BVQywWpF1xhLBc0hr
	AsFMF57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXo3-00000008SWZ-3f5S;
	Thu, 25 Jun 2026 00:18:59 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXo1-00000008SWE-3q6y
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 00:18:59 +0000
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37dedd9401eso436776a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 17:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346734; x=1782951534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlR8b0vC5oVW3TqsUHgYLtphTYj6J1CxyewvuGXJDbc=;
        b=a+FFzj+PQQKi3xPaezjkN1d8Ca2PD9ptpn9rryCa/etCXLLkRoO5T+tapZoeSSqPXv
         O7yQAaYo961Mr49Wt7mBBWyln4YawHa0pXPFMv4YQIWgwd8DqG3kG/jTs22tJ7NLY7Pk
         LJAG0K8iTSf9r97afULB77y63Eldh8b1HMzg8KuH6KEQC4dxPh3p0zOAeDZxBlv2Ltd7
         1KbcfQTp1TzJ3CjMt7VS4l+Dj8C1ganPHfSAwNYNnQLVAx/FFwUtL+pXzVnn+UUtMCbs
         PRceaG0CTK5bupjJcmx+UEeEeV5+xo47zWAQ7S0REQlHspBRLYrwllkg0Y49TlE3PkDj
         Y5Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrXWB8oNmZRg4winLfSYKAjl9wpmqPLkXtBr6ZmkUsT3EugM6GoKlHrFK4kjjT5CsjbI3TkglcMGtLs4UbQ4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxS1QtiQF8bW2jXsNujXL2J5N1ZGLtRKIyve42mfCXpyxr/0eAZ
	GeOFiDaSnn/q/fwZ5qPCm5IifWvdT+wVvGp5qIAnprRUFTunn9zcVhqr
X-Gm-Gg: AfdE7ckT6KscruOzElEZDOe0UuO4nLsm22HStVSK+eynfqdKNzqUpQVixvg2pJdOJIH
	v/MeBMnef+Y0yYewxmSRiDmKEuc3wqCnJ0w9KXHEUKv9ZjzkJbx4yOt6lR+unWzDtruNmCGzJ6K
	ezanHLMmIXnIeueldvSCXRCCoeX7fwqsmQkcPSi7p1r/Anconu26WMJjQda5ox/hnbkorqxBGri
	mKzmkSGJZWbMKAChI036F8pREyWvVR6+lBL0wSQeDlNlumDkWjNOAXGHxVF0x/QhZ9zDv37peX+
	WIRri0z1JSxC3AWwoBpI8CkyBCYO1aaj11PBASxwNhfnt1V6Z6ka2w0g0Tn85/6ZdOsRaKxwnJA
	vqua/0UTOmRc5NKojdT2oGOIvsgF3Q8D0SNCu1D/OhjoDKSRzMAXFgfl014EdpFsu44NshovEs1
	BtLjwhSgL2yDFO0nic28RJV5blYKZ3tMWqJoMP4QtdGGXSTfxEX/DH9U4Xp6Ie5dYA4IKCkYJp+
	4xsmZvfOPIF3kawNtZGHAhFo9mqZg==
X-Received: by 2002:a17:90b:534f:b0:366:3517:1a95 with SMTP id 98e67ed59e1d1-37df9d41bb8mr159654a91.0.1782346734311;
        Wed, 24 Jun 2026 17:18:54 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm586839a12.21.2026.06.24.17.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:18:53 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: chengwei.yu@mediatek.com,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v2 0/9] wifi: mt76: add mt7925 NAN support
Date: Wed, 24 Jun 2026 19:18:25 -0500
Message-ID: <20260625001834.475094-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_171857_957045_CD3CC5C5 
X-CRM114-Status: UNSURE (   9.78  )
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

Add NAN support for mt7925.  The series first advertises userspace
management-frame registration and hardens BSS capability lookups used by
partially configured BSS state.

The rest of the series adds the connac NAN connection type, mt7925 NAN 
MCU helpers and event handling, a generic init_wiphy callback, mac80211
NAN operations, firmware-gated interface combinations and NAN data
advertisement.

Changes since v1
  - Rebased and reworked the 7-patch v1 series into 9 focused patches.
  - v1 patch 2 and 3 are folded into one BSS capability guard patch.
  - v1 patch 7 is split into a framework-only interface combination
    patch and a final NAN/NAN_DATA advertisement patch.
  - v1 patch 5 is split into NAN MCU helpers and mt7925 MCU response,
    event and NAN-specific BSS/STA TLV handling.
  - v1 patch 6 is split so NAN PHY capability setup uses a generic
    init_wiphy callback before mac80211 NAN ops are wired.
  - Order init_wiphy before the mt7925 NAN ops patch so each patch
    builds independently.
  - Define MT792x_FW_CAP_NAN in the patch that first uses it. 
  - Move common NAN MCU command/event IDs to the connac patch and handle
    NAN_DATA as a NAN connection type.
  - Add NAN_DATA interface support, 2.4/5 GHz NAN bands and secure NAN 
    advertisement.
  - Add NMI address programming, DW notifications, local availability
    updates, peer schedule updates and NDI STA mapping.
  - Add cleanup and rollback for NAN peer indexes, NDP contexts and MCU 
    failures.
  - Drop temporary NAN channel debug logging and fix checkpatch issues.

Sean Wang (9):
  wifi: mt76: mt792x: advertise mgmt frame registration
  wifi: mt76: mt7925: guard BSS capability lookups
  wifi: mt76: connac: add NAN connection type
  wifi: mt76: mt7925: add NAN MCU helpers
  wifi: mt76: mt7925: add NAN MCU handling
  wifi: mt76: add init_wiphy callback
  wifi: mt76: mt7925: wire up NAN operations
  wifi: mt76: mt792x: build iface combinations dynamically
  wifi: mt76: mt792x: advertise NAN data support

 drivers/net/wireless/mediatek/mt76/mac80211.c |    7 +
 drivers/net/wireless/mediatek/mt76/mt76.h     |    3 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |   14 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |    4 +
 .../wireless/mediatek/mt76/mt7925/Makefile    |    2 +-
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   29 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  201 ++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  125 +-
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 1091 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  440 +++++++
 .../net/wireless/mediatek/mt76/mt7925/regd.c  |   30 +
 .../net/wireless/mediatek/mt76/mt7925/regd.h  |    3 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   43 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  125 +-
 14 files changed, 2077 insertions(+), 40 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/nan.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/nan.h

-- 
2.43.0


