Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A99CF2564
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEMVwz5nnQ7Xs43B82q/jvwAQGy/9H92XKTIqJTpiqU=; b=JReVA5rV6/fpFphHnndDvXUlXz
	TnxJcguBABDfTDxSyRoBN49CRkFStaHP2CLT4kKB/y4wRWqkKtz4XbYRrI3HSI/uNbKutuRo2xS/T
	J/MmD6pWxvYq7F5RJszKHoyY9js30bpXYz3Vm1uRYa+dj75PyfAgSjtg2Wzo3GSbKAhTZqPKxaofI
	aA74HWS3LMOeZE0HLoU3pv7I+8FDP4pUd8QRULDWyIlwwACKgTfLUVnZtkugS5QcpdJURheDdjYmb
	v2YkozTb0m7wJZjQw1Hh4bEsc2N8loZOsPneIdQk04Neafy1dJYBYuw/UFAe/A8ti/AB7z06GWsIx
	+QYHQA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szaJJ-0000000142r-2NQR;
	Sat, 12 Oct 2024 11:29:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szaHq-000000013co-2z4A;
	Sat, 12 Oct 2024 11:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41FF3A40571;
	Sat, 12 Oct 2024 11:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90137C4CEC6;
	Sat, 12 Oct 2024 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728732473;
	bh=Lw3xV5CQbRpHj7Suwhvn/ROZHULgNHJAEmyajtD6PGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lljsPDCXyj8TBE846ZEmWDWDi1iRtyL8hgSgKh+ueveO44nWZfs0SuukTaLnJpI3a
	 gd3AEALGGRc8bBE2K/HIo4urXpCfXF4Iuyloygw70rJquvQFYh78Fu4f79u23gj+JD
	 vz8ds4hSfzseNp/phZHb9LD8Ay+7qO1VNhcD71P4lCDaASFLAaUKeihFvxUVBnq3TS
	 kPOdPB9ibMxosl1Uv+duYyT5dwCb7vW4iiyVZsNSl7J+3bQox2M36rI5yFykFGgSob
	 pc7xIXGlUSNcYOeqg6RpnAmgeX+TGucjluWOtQCLJ7cWmMkqc8itQTVEGEOx1LuFl+
	 U6+BjNwpjZb8w==
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
	hao.zhang@mediatek.com,
	emmanuel.grumbach@intel.com,
	leon.yen@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 15/20] wifi: mt76: mt7921: fix NULL pointer access in mt7921_ipv6_addr_change
Date: Sat, 12 Oct 2024 07:26:47 -0400
Message-ID: <20241012112715.1763241-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012112715.1763241-1-sashal@kernel.org>
References: <20241012112715.1763241-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.56
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_042754_845041_51ADBA12 
X-CRM114-Status: GOOD (  11.10  )
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


