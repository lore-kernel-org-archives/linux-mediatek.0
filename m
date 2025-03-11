Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E18C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi9vPY8Td4kqkYPHElCXUeYJCkIzWIl2N/4PGPpSgHs=; b=RoVuHnvwRAtucCoD+HCmPjI6QG
	trcX2om6GEUBgf/JSq25w6+WkQ0O62tQs/TgP+LGLOgqSeL485ezEEX+GcHT2+dPRt9GpuBRx7yH6
	do0DFSfbrI/uQpZ38nZEgxdE7JMLtXPM4fqeayqRatsl3fAbc/CkZyNZWbDdYxEAwOw+cMjdJoC4j
	HfEH11kaWSW/9E5JQ1sa4p8xFsv3F42Y9WZeivHxkI7qAgwGzC8tmie6zyoppLEuyuMvv4xe08IDf
	O+ebC/Au6pVEF61oyo7pQ8CV8VV5P/b52K44JSm3Wj//2dHJgt93TNS3UY+1GtnUQJhrQARsTzhEc
	SuHWx9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3p2-00000006Wv5-475Q;
	Tue, 11 Mar 2025 17:55:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fW-00000006VCa-26s0;
	Tue, 11 Mar 2025 17:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36D7C5C65F9;
	Tue, 11 Mar 2025 17:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F7DC4CEEA;
	Tue, 11 Mar 2025 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715129;
	bh=mazpjGa8VjPIR8E7D94wthNV7G/W5waliDEdO1oOjQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D/BSaTEmQYR1+6DRannWuJr6Qm+K84XJ48t1+z6dgIq7QEXx/v/Clgz5NFct26FdN
	 YwvAJufwbqR7B7zhtWeDBefrAzRp5+ts/c8tDKEd8bmwEyEUhMzM2quTGNU8nZEQdq
	 Zj9uEz/XsHfSJQVJmna/SEhfZCGr1hGqMOty9j7yvXvqB5ftg4LbEOJRy9kK4CVzTJ
	 asr1QIaiaJqVXC92JHFpTpL2CgC8tTTzB7ILH764SgUBCMEs61lPqnfmXvmWJcwjd8
	 0gRugKBdX8+drp2sReYfdnef2MHdp3clwKdZojAsbYD55Hla6F9+ctFfrjUX2e3i3D
	 cCYlG8ytEcXkg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:04 +0100
Subject: [PATCH v2 05/13] wifi: mt76: mt7996: Add link_info_changed
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-5-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104530_613321_DAADA769 
X-CRM114-Status: UNSURE (   9.62  )
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

Convert bss_info_changed mac80211 callback in link_info_changed one.
This is a preliminary patch to enable MLO support in MT7996 driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 59a1e5e52450accc5b01fbe0c3af7e84bcc87df6..81a13662db24ec268fdd7a9b3d6b1d829a91430f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -712,10 +712,9 @@ mt7996_vif_cfg_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mutex_unlock(&dev->mt76.mutex);
 }
 
-static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
-				    struct ieee80211_vif *vif,
-				    struct ieee80211_bss_conf *info,
-				    u64 changed)
+static void
+mt7996_link_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			 struct ieee80211_bss_conf *info, u64 changed)
 {
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mt76_vif_link *mvif;
@@ -1719,8 +1718,8 @@ const struct ieee80211_ops mt7996_ops = {
 	.config = mt7996_config,
 	.conf_tx = mt7996_conf_tx,
 	.configure_filter = mt7996_configure_filter,
-	.bss_info_changed = mt7996_bss_info_changed,
 	.vif_cfg_changed = mt7996_vif_cfg_changed,
+	.link_info_changed = mt7996_link_info_changed,
 	.sta_state = mt76_sta_state,
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
 	.link_sta_rc_update = mt7996_sta_rc_update,

-- 
2.48.1


