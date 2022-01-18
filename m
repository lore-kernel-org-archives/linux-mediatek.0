Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EE8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 02:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZ0rg/YyOWTxnRYp3i3oiMh4Iut9393Wj7vJLpXQPnc=; b=Zl2Wth2kDTUW5y
	pruQiIJ+OwtayIWknG2SEqbHXaR5LjUNVliP9+chB3ou33vK6a+G/HSQOeLR39V91UhFoak8vbA7P
	sIBOUCNMysU8f7K6VUNFz7JjBJHN6Jndnq9QoK1K0xuGobneu0E2Z+NtDv+zVUrvxGz8VMuJd06XG
	8icItUSL3WoW2x4i9sM6BN7yKQHMImtQy1hEIMsCqllp/gRQC++wSDCdIFUF7vzuGEP0mINM95Won
	BaVjhNZXMty0QMbkWI5XTHNDEQGE+uwYTmUvTEF7KcwJb1vjqFILMz0Snb3OVioZOH5lOEH+/Nb+W
	c7MudLgqivFAuJkxiy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ePV-00H2kl-Aj; Tue, 18 Jan 2022 02:39:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eDw-00GwRD-VY; Tue, 18 Jan 2022 02:27:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D059B811FF;
 Tue, 18 Jan 2022 02:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE99C36AE3;
 Tue, 18 Jan 2022 02:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472871;
 bh=d/Y/dKHv4FKlCXeMXYlteoOcfs+yj883sgrx/JUCzZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FjuBrf7qSJ+kvKvsrOOVAF4jg2NiUFsJDabYvTPRZkueFrp1rfxRBbWgxPUaqXprH
 SzPX0y216qgbP2QM7z6pa/jlR0lhUYSGds3xxQ0lXcQ44KDqVTmDI5xsEq4STt6h2G
 XPaZKFOVu5oFopnoFr4yncnRrRixgI2YOlxkWji/1blKDx5a/HOwcfB060UiDldqK3
 ShHBuaD2AP1cRKkw1U/tWDYVINmuoKh0WSbl7qTuu3D8P48oPHEK2tJdYH4P5i7qWP
 ja2XCD/q8y3tRJqD0u4YQZZbbUjkHX3FtakEQhKcd4hWJI+VViMb1b7Rzl5S5YrhyF
 BT9rSFJcTclgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 156/217] mt76: mt7615: improve wmm index
 allocation
Date: Mon, 17 Jan 2022 21:18:39 -0500
Message-Id: <20220118021940.1942199-156-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182753_225507_8104227A 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 70fb028707c8871ef9e56b3ffa3d895e14956cc4 ]

Typically all AP interfaces on a PHY will share the same WMM settings, while
sta/mesh interfaces will usually inherit the settings from a remote device.
In order minimize the likelihood of conflicting WMM settings, make all AP
interfaces share one slot, and all non-AP interfaces another one.

This also fixes running multiple AP interfaces on MT7613, which only has 3
WMM slots.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 890d9b07e1563..b308d5ab5f9a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -211,11 +211,9 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	mvif->mt76.omac_idx = idx;
 
 	mvif->mt76.band_idx = ext_phy;
-	if (mt7615_ext_phy(dev))
-		mvif->mt76.wmm_idx = ext_phy * (MT7615_MAX_WMM_SETS / 2) +
-				mvif->mt76.idx % (MT7615_MAX_WMM_SETS / 2);
-	else
-		mvif->mt76.wmm_idx = mvif->mt76.idx % MT7615_MAX_WMM_SETS;
+	mvif->mt76.wmm_idx = vif->type != NL80211_IFTYPE_AP;
+	if (ext_phy)
+		mvif->mt76.wmm_idx += 2;
 
 	dev->mt76.vif_mask |= BIT(mvif->mt76.idx);
 	dev->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
