Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB960FC6165
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 20:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G4ImuRF3VbvO9uYx7tT0KAIoCmTeaN1WiLwF/Wm090=; b=CAHFPPQCU2p7M8UXiZyMDQnOLG
	jZuw+1DW6a+8HlrZIzJo2AW5j1YiA9Wm+wT042SvY+MNlYRy+zVAqBiUPzki6HbhkEedA8zcRqnuQ
	Gmu8a0+gMjzipPqqoEVv1/MtE/sZ1Z/+47VvpCBLECmTXn7dW1aQc/b4yZIE1UQAqLdDumcioAlKE
	4wlE1ffJHp1g1RU4N4IbVn9vIS2RN5hP1lU7KgMg1Ji8DEOSwdK92EfQebJRYojJHwL+Xj622rdFU
	hU+v2cdUMIHX0QB6AgSvb6Z8WeJofAMm6fhT764fi0EGhojEYAktOKxZAyNu6T+A/A+9bY4BSrlF7
	vzPRBIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMn-00000008gfc-1bho;
	Fri, 02 Jan 2026 20:03:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMl-00000008gef-0XBW
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 20:03:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a1388cdac3so113972995ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767384198; x=1767988998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G4ImuRF3VbvO9uYx7tT0KAIoCmTeaN1WiLwF/Wm090=;
        b=KFJWfKM1dcwizLUz5N2W1rMw7qGJh+vEsKDGSfDNkBjkwCO7Edq1hr9aGPDXpMIQrA
         T299zeNGg1lqBc3m6zFiNvM1dOXFeemqvzbScGWM628iZHQ7fO9NIPstsrS3gkjTdkNc
         O58Z0W4N849cy4jCf2ZfQ46uXS/g/19oSTclCxWIHpxm6l7vA942n9C9MCW2+saeWwk8
         jBFkc+b6jm7oyBnFCBnVBsWjeE/VnqXW5lYzoXx3qAtAyZHvZqgL/NDyKysC6CUNydMw
         PYY/QE7EKu3ivsXWFC/OU43a/V0DPZX1OvoPZHWgI5fJCXiDcyaGuxycd2NcQWlmMW8Q
         N+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767384198; x=1767988998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2G4ImuRF3VbvO9uYx7tT0KAIoCmTeaN1WiLwF/Wm090=;
        b=w99Z3JhzgZ/ucPX9iOD8P17kbriYfC/CgN7wBmVQucTgGm5pcEQDXpgR2AmZlWVpmj
         n/mMLk8KmEFxLfvedHucmlpDo06IAroPuEH9fiOgLS0ToIqZhYrCyFqAB9qpI3kPioVe
         umT6h7ov+tqCuA79TR3AI8XY6qtsI9h2Ffvkuaqfm0GDayc4uZ1Z/My7wgPkhYXxFQUs
         H5l638n1M6ZiVsBXeD5oX661QHkGq31oFtkRL8e3F1RfcDnxRFxBe3pZ+Wkx4OjG6zNA
         NZ2Zb7aNeUB83Kfalz/Clg1ej6NcG2zdG/xBqwuThGCBoPo1f8dLh4xs9gLmKC9iKEP/
         Qe3A==
X-Forwarded-Encrypted: i=1; AJvYcCVH9fVaPDB/BPwlu1akvklGF/TfMC8X0Ing19ngvJdC4MKvUR6E98+OVHtE2RNq2i9btt4BAHUtLBLhI/apzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4fMlCKCi6IPyZoIU5Ft5ZzKAWvcnpHy0FaHu+Q64d2ewW27ky
	4QZmjGdFyaHwozj8t9kWcg6WHNUteo3cJudQaJOQ5x5hJ/r+d6mH4rJF
X-Gm-Gg: AY/fxX5Dx0xUjAJAn75GWfrj9+avd/ND8Qmg9ZvdUj1C7khw93Dyz02ZwGRfI+Yvr6r
	yDzwLdGtdTfjtdnZFInvVphSBJ8h77ENQygVB4SrUr+yUJmUB6c8OeCha0UtnadPfV1Jo8C5Dv/
	Q3jIQnVqD/NtbwkgA4YcMZn5vehmv6qA1sHviQGg1qMRlcq3pOj+QRC/7Fyuu9oEs3boziO9hTR
	5zyS5LkYtDabnuN3WSotG1ijlSIrdFZEyWdSbbRal9rMUE/Wyn9JYlTMJx3oFEPKUOwOiOOn4hB
	hT7AyF8ck7AdzRxdo4Dqj+a9SghtBx0ORHlwkxXxzZNmkKGwaau/o+iORxwPvyFeA4cK/haxWfK
	9Xjr0vNXQxQsinmZNr9+t9Tgj+9+NF1ip9dTdqgCPIBnK7KbDv2y0/aVZbNKaVBLeDKrhEqdW4B
	D9KHjrUFn02cSWiT2XpRUALjibtwYZPWeBUo3392LRSQI4acoq5lIuK6qhwXLpIuQ=
X-Google-Smtp-Source: AGHT+IFKqvVGthWN24o7nYHTavjyGNiAOtKDNOq7RpmLHmYQZqv8sAIrpZUOjEgpt+0P2SSiW5Emkw==
X-Received: by 2002:a05:7022:608c:b0:11a:273c:dd98 with SMTP id a92af1059eb24-121722b50b9mr40737332c88.20.1767384197392;
        Fri, 02 Jan 2026 12:03:17 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm120203795c88.10.2026.01.02.12.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:03:16 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH v2 0/6] wifi: mt76: mt7925/mt792x: additional stability fixes
Date: Fri,  2 Jan 2026 12:03:09 -0800
Message-ID: <20260102200315.290015-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101062543.186499-1-zbowling@gmail.com>
References: <20260101062543.186499-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_120319_173128_0CF5A3DE 
X-CRM114-Status: GOOD (  10.74  )
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

From: Zac Bowling <zac@zacbowling.com>

This series contains additional fixes for the MT7925 WiFi driver that
address issues discovered through further testing and static analysis.
These patches build on my previous series [1] and address the remaining
stability issues I've encountered on the Framework Desktop.

Changes since v1:
- 6 new patches addressing MLO roaming, firmware recovery, and resume path

Summary of fixes:

Patch 12: Fix key removal failure during MLO roaming
  During MLO link teardown, mac80211 may request key removal after
  driver state is already cleaned up. Return success instead of -EINVAL
  when the link is already gone, as the key is effectively removed.

Patch 13: Fix kernel warning in MLO ROC setup
  Replace WARN_ON_ONCE() with proper NULL checks in mt7925_mcu_set_mlo_roc().
  During MLO AP setup, the channel may not be configured yet when this
  function is called. Return -ENOLINK instead of triggering a warning.

Patch 14: Add NULL checks for MLO link pointers in MCU functions
  Several MCU functions dereference mt792x_sta_to_link() and
  mt792x_vif_to_link() without checking for NULL. Add defensive checks
  in sta_hdr_trans_tlv, wtbl_update_hdr_trans, sta_amsdu_tlv,
  sta_mld_tlv, and sta_update.

Patch 15: Fix firmware reload after previous load crash (mt792x)
  Backport the MT7915 fix (commit 79dd14f) to MT792x. If firmware loading
  crashes after acquiring the patch semaphore, subsequent loads fail with
  "Failed to get patch semaphore". Release the semaphore and restart MCU
  before loading to ensure clean state.

Patch 16: Add mutex protection in resume path
  The resume path was missing mutex protection around mt7925_mcu_set_deep_sleep()
  and mt7925_regd_update() calls. Found by static analysis (sparse/coccinelle).

Patch 17: Add NULL checks and error handling
  Add NULL checks in mt7925_mac_link_sta_add() and mt7925_conf_tx().
  Add error logging for MCU calls in mt7925_regd_update() to help
  diagnose regulatory domain update failures.

These fixes have been tested on a Framework Desktop (AMD Ryzen AI Max 300)
with the MT7925 (RZ717) WiFi card. The system is now stable through
suspend/resume cycles, MLO roaming, and firmware recovery scenarios that
previously caused crashes or hangs.

[1] https://lore.kernel.org/all/20260101062543.186499-1-zbowling@gmail.com/

Zac Bowling (6):
  wifi: mt76: mt7925: fix key removal failure during MLO roaming
  wifi: mt76: mt7925: fix kernel warning in MLO ROC setup
  wifi: mt76: mt7925: add NULL checks for MLO link pointers in MCU
  wifi: mt76: mt792x: fix firmware reload after failed load
  wifi: mt76: mt7925: add mutex protection in resume path
  wifi: mt76: mt7925: add NULL checks and error handling

 drivers/net/wireless/mediatek/mt76/mt7925/init.c |  13 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  19 +++-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  |  45 +++++---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  |   2 +
 drivers/net/wireless/mediatek/mt76/mt792x_core.c |  14 +++
 5 files changed, 75 insertions(+), 18 deletions(-)

-- 
2.43.0


