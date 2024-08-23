Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205E0C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEMVwz5nnQ7Xs43B82q/jvwAQGy/9H92XKTIqJTpiqU=; b=pmk5KY1nVRmzf+kWNj4iFKESXC
	MqR1g5PoNXMDdCTarO3l/nivfzJOk3sJWpHLVTOoiJGrRCGub1by9G0TELsyu/gJ3sc/6g/K89WSq
	kuvZ+yszRC/L2Gqu33xflESctN1HqQyh02m5FvJf2WpJJUpFGhJg+/asW8JPmRa1lucjvP00IjNgI
	JDV7P2Zh1z4olYXcziElpBmTI8YxCy7t5Fx6GXEq9RcbtbfzpsjKdbS3S4fPcffiUEC3/Wlxkvt/e
	AQ25g2jNcS2yoIWF5ElGJQPHRd1+iYxWp2XmMjV67Yv3/3UJuBYJ6Nj/8aWuUrzSQ9STRnws6aHt+
	X2bwt7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUuS-0000000H04u-3NDl;
	Fri, 23 Aug 2024 14:05:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUtP-0000000Gzfv-0arx;
	Fri, 23 Aug 2024 14:03:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52592CE10E3;
	Fri, 23 Aug 2024 14:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F65C32786;
	Fri, 23 Aug 2024 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724421832;
	bh=Lw3xV5CQbRpHj7Suwhvn/ROZHULgNHJAEmyajtD6PGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TYWnl5YwwCBIArKeuw5YgI16un7qi9Ghfxz+P1bUe5Bfop9Jl5R9xnMAqGKFmf/Ys
	 f0FKm9hYcRE/b0nveJtd+S6FtYaqmo6KOUI5QGNratyPuyau4vmAMPlSCe8UMu4oOf
	 nOkCq48j5ebGp74SasoUiAVU3MQq7dVbbKH6lCB25wJUNeKXLZfwr6w992vSh4kwZ6
	 UbBc1cffpBCKW/Z6GOhd/CPykQkx9i+1Ho7P1IGF4EXVU2ZjVsms6qV8Sl4KeuQ2Zm
	 0QZB52ajVHpSuA8todpWFr5vHiz/quvFj9VDXWAUPK/hCHCTn2AgqwOfOerYw8Ol6u
	 bJHUu77c56izw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	Felix Fietkau <nbd@nbd.name>,
	Kalle Valo <kvalo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	johannes.berg@intel.com,
	emmanuel.grumbach@intel.com,
	hao.zhang@mediatek.com,
	leon.yen@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 15/20] wifi: mt76: mt7921: fix NULL pointer access in mt7921_ipv6_addr_change
Date: Fri, 23 Aug 2024 10:02:29 -0400
Message-ID: <20240823140309.1974696-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823140309.1974696-1-sashal@kernel.org>
References: <20240823140309.1974696-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.47
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_070355_380844_842CCF44 
X-CRM114-Status: GOOD (  11.61  )
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

From: Bert Karwatzki <spasswolf@web.de>

[ Upstream commit 479ffee68d59c599f8aed8fa2dcc8e13e7bd13c3 ]

When disabling wifi mt7921_ipv6_addr_change() is called as a notifier.
At this point mvif->phy is already NULL so we cannot use it here.

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Kalle Valo <kvalo@kernel.org>
Link: https://patch.msgid.link/20240812104542.80760-1-spasswolf@web.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index d8851cb5f400b..da17a29a4ce57 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1095,7 +1095,7 @@ static void mt7921_ipv6_addr_change(struct ieee80211_hw *hw,
 				    struct inet6_dev *idev)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_dev *dev = mvif->phy->dev;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct inet6_ifaddr *ifa;
 	struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];
 	struct sk_buff *skb;
-- 
2.43.0


