Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DF2ECD6F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 23:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PFu2SOmWrm/nbzG9ruuprU6hwr4OlKTZsj8iLqtcgK8=; b=MwZnx5BxIs4BOh
	+pAM3FPIgn1ylvDty89NDBs9LcbxcI2O4ChyTQ+zBPouCKbdyY0xU4rmlflGZdxJ76MbDASoBbW2f
	w7gCli5kNT/O5+t6Bv/G0yJENin8+l9ivUp8P7D3JNbEABf5I091v3oDxPTAuSy9nnYpo4BjS0bhg
	PZJ0WYcmvlUN+4pyNajHT6mM+nZ/Hhwz38roG2W6jXN7O4UwYTuUEAfETBCetc/zrUsG1QrFvt96i
	wDBhWYwzEDDyvvIW6EOQyzNBgzfLo3E+SXPKkJpQKZJwrWWLL/5Bqujiqt5t6f4/G+qYLWXJfAF6U
	4Wy/ZLS/IBPRcbXRU8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqJn7-00000001Be6-2N6V;
	Wed, 11 Feb 2026 23:38:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqJn3-00000001BdR-2ryP;
	Wed, 11 Feb 2026 23:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62E0443AC7;
	Wed, 11 Feb 2026 23:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F80C4CEF7;
	Wed, 11 Feb 2026 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770853116;
	bh=it7xxqR3nRf+CWdhr3flpBFaO+KXJCAoNFC9nnWszxM=;
	h=From:Subject:Date:To:Cc:From;
	b=TtUCrbYACGpciyM1n42bkifcm+nlbRdf4HbtPAUW3Ty6YogNiA/lb/OdcA/g8TjSe
	 9f4r1oUUozspNN0h+8KLogq+odaOWdvX3d31WHnFfVU3ofkGHt14oLc2Ga9s5szp/E
	 AHFBPDPiuhsa4sxqF2MHXwOY+VRoKpJOVb/4SPYVWiH0PmNC3xHdKQcAxJ2iPeDjmH
	 zgvNjK/T4BGjvRL9IIcqzUbHjxnC6z2+FO7tN45fdGxRaq4InEIPLjehcjJEUZyxn4
	 mylprGQ8pIUNVlCkW3AsT27YXEH8ykA+ujIjVVuWLNgaBLsJW61QtYv48K86RfuiOK
	 b+SiaaexhXaXw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH RFC 0/2] Add the capability to offload MLO link
 reconfiguration countdown in the NIC fw
Date: Thu, 12 Feb 2026 00:38:10 +0100
Message-Id: <20260212-mt7996-link-reconf-v1-0-2b110340d6c4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwMT3dwSc0tLM92czLxs3aLU5Py8NF1DM1NLs1TTJAsDczMloMaCotS
 0zAqwodFKQW7OSrG1tQA8XSbkaQAAAA==
X-Change-ID: 20260204-mt7996-link-reconf-16596e5b8076
To: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>, 
 Ping-Ke Shih <pkshih@realtek.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_153837_754384_3715FF72 
X-CRM114-Status: UNSURE (   8.95  )
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

Introduce the capability to offload the countdown for MLO link
reconfiguration IE if supported by the underlay driver/firmware.
The driver is supposed to set the WIPHY_FLAG_MLO_RECONF_ADV_OFFLOAD flag
to notify mac80211/hostapd it supports this capability in hw/fw.
Moreover, the driver is supposed to generate an event to notify
mac80211/hostapd when the countdown is completed.

---
Lorenzo Bianconi (1):
      wifi: mac80211: Add the capability to offload MLO link reconfiguration countdown in the NIC fw

Shayne Chen (1):
      wifi: mt76: mt7996: Add beacon_reconf IE parsing support

 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |   5 +
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |   3 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 185 +++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h    |  69 +++++++-
 include/net/cfg80211.h                             |  13 ++
 include/net/mac80211.h                             |  13 ++
 include/uapi/linux/nl80211.h                       |  12 ++
 net/mac80211/cfg.c                                 |  16 ++
 net/mac80211/ieee80211_i.h                         |   5 +
 net/mac80211/iface.c                               |  14 ++
 net/wireless/nl80211.c                             |  61 +++++++
 11 files changed, 394 insertions(+), 2 deletions(-)
---
base-commit: 4eefc435c985f4dfdba9afb1c705f0e17377c084
change-id: 20260204-mt7996-link-reconf-16596e5b8076

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


