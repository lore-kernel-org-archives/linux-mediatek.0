Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DEFC021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0cmbr9jBGa0NbdXF0HuSaEAqb2Dv4R7e7vsetjwb9w=; b=eoEbN3FKHJkBYv
	8TfoPm3Vy8n3yG+hnlXPmhpSPMnhfChJ77MuXEhlhR3aAWak4DfEpb3w0WRzAjR/jHXfxw1lE6M4F
	o6jGgdJnPg38LaXVP4pEr4Kfn1mVpN/a1IQ5HGB8RQkp7XtSrO7b2HMw+RX4JDDlPE8lp7nvDDwS7
	kC1NHM6+xYCVgq7YEvkmAbBybebScugtRv0IXB8wvb7KsNzuQzmZAckA4eAfjch/6EiNGKRQxSrx/
	CY3avy0mYseHDl1dGRKFFEDNkuRaJF9lHF7roysHAX+YRI4Wmg0RwNtrZhzArXVTSI5eLx0laKWW2
	T0/FR59TbkK7atkUbpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6VY-000000011tt-2NIZ;
	Thu, 20 Feb 2025 13:22:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6SO-0000000116F-2eNy;
	Thu, 20 Feb 2025 13:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C82A5C5A91;
	Thu, 20 Feb 2025 13:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1384CC4CED1;
	Thu, 20 Feb 2025 13:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740057551;
	bh=UUnURo3zAoASQKC54eJodNprMU55Mn36QZREdJKHOP4=;
	h=From:Subject:Date:To:Cc:From;
	b=rvpG0kjEEFZwtA3tN7346VbqUyXJN6XjOn5sg61RVR7h2Xp7mHm0kNCKV5qBaveZX
	 YnrrnrhaDFiNwowrhzG0RtnHJQccMC4RhbVAkvdN21n90/gjFUS6dYOD1ec6byRsX1
	 U5CFfNbP0sfszHIAzcQaE8A4uB2gnVxshhRdRjbVh6HcP5qPU1aILZke08oTmV3pwW
	 dA0Z7WyCMiBVEeLRd4r0ieHcVU3XcIUDy8SucIhCAJz3HmpT3i50QO5Asoy5krvzC6
	 X7+6F7tzgbZ3TJ7mQ2ZDQKAd163smG7MRtQsx5DVN2b+9pDJS5RLp1Gbgifwl3hs1v
	 Er4XhFbnFxGhA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 00/14] wifi: mt76: mt7996: Preliminary work to support MLO
Date: Thu, 20 Feb 2025 14:18:46 +0100
Message-Id: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALYrt2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3dwSc0tLM93cnHxdS9NUy7RUY4NEy1QDJaCGgqLUtMwKsGHRsbW
 1AB7VReFcAAAA
X-Change-ID: 20250220-mt7996-mlo-95e9fe30a9e0
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051912_764003_A32F5486 
X-CRM114-Status: UNSURE (   7.96  )
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

This series is a the first preliminary work needed to support MLO in
MT7996 driver.

---
Lorenzo Bianconi (10):
      wifi: mt76: mt7996: Add chage_vif_links stub
      wifi: mt76: mt7996: Introduce mt7996_sta_link container
      wifi: mt76: mt7996: Add mt7996_sta_link struct in mt7996_vif_link
      wifi: mt76: mt7996: Add vif_cfg_changed callback
      wifi: mt76: mt7996: Add link_info_changed callback
      wifi: mt76: Add mt76_sta_common_init utility routine
      wifi: mt76: Move wcid cleanup logic in SoC driver codebase
      wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks
      wifi: mt76: mt7996: Support MLO in mt7996_mac_sta_event()
      wifi: mt76: mt7996: Rely on mt7996_vif_link and mt7996_sta_link in mt7996_mac_twt_teardown_flow signature

Shayne Chen (4):
      wifi: mt76: mt7996: Add mt7996_mac_sta_change_links callback
      wifi: mt76: Check link_conf pointer in mt76_connac_mcu_sta_basic_tlv()
      wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support
      wifi: mt76: mt7996: Rely on mt7996_vif_link in mt7996_mcu_twt_agrt_update signature

 drivers/net/wireless/mediatek/mt76/mac80211.c      |  62 ++-
 drivers/net/wireless/mediatek/mt76/mt76.h          |  11 +-
 drivers/net/wireless/mediatek/mt76/mt7603/main.c   |   9 +
 drivers/net/wireless/mediatek/mt76/mt7615/main.c   |   8 +
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |   2 +-
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c  |  10 +-
 drivers/net/wireless/mediatek/mt76/mt7915/main.c   |   8 +
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   |   8 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c   |   8 +
 .../net/wireless/mediatek/mt76/mt7996/debugfs.c    |  12 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 125 +++---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 458 +++++++++++++++------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 335 ++++++++-------
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  30 +-
 15 files changed, 699 insertions(+), 389 deletions(-)
---
base-commit: ad4c9a8a980336450631dce8cc0799f9a8de1914
change-id: 20250220-mt7996-mlo-95e9fe30a9e0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


