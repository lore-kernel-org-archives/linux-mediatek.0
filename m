Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 02:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOaxuM7SGR/hSFDjBRit3NQrXS89f6EGXVAXnclaNqI=; b=H/9LSk6JhaqaZf
	CmkXOpm+HxXSI233mJ35a/NCsZq7XwTLAOoA2KdXM8Ir7X7mUrpDAalrCkCXaysPywKi3X3Fv1r8G
	hxJtOO6LQdewoxSa25aQGCO22/WUue7hvsj2aY+lmknLMcX6oNP03iaYEkHi6urQMSZ+PnULiv035
	K8ockRqtcjEBVXcPib7ZJFJmYyALjPd/0XLJnnhl0t6amDYG8CPJOTHXtQyYdD0UJ2fRLcsG5ivvg
	uuJ4siSngfaArn8YEoPp6hw9+TmCiuNRXdu6Bwoq7Mol0j1PI32u0CzZ4BDia8YRydXoOvPIoHFdt
	EudPD2LdN8mIzwQXGn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9eO6-00H1y6-ID; Tue, 18 Jan 2022 02:38:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eDf-00GwHU-CJ; Tue, 18 Jan 2022 02:27:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0766B8124C;
 Tue, 18 Jan 2022 02:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33618C36AF5;
 Tue, 18 Jan 2022 02:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472852;
 bh=PVYBpWgLxzFqn93XSAf0x7uJa2crGkS0cprCA6JoWiE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QmQIS5I56YTs5s2TjBtTZJO0tG1CVN46V/PtifFNEJTBlBbQORyg181c2lzMW51SB
 cPrUZpPqjsMiECSX4w6NWgLdBnzy6TXKtuToJUKJuzcu4PwhyHpJwvYbMiMMKiKIHQ
 pHMK06GOS6a03eJasClJbOClwlWWLIZFYNv9qf1qv1V5mFihpni6W+YgqAsOXLQmz1
 Ar60yRQLtWf8X8WRYtMT7ZO9ChRoPkPCzpO8p1hrIX7pinDMK4ZQ2Yy5KqZ21XCtRo
 t5nlsOvAq5AYmn0+3wWlpq6MYEFIGuWcLWgElaUEL/grf3dZ7h+PH4GTCRePGMJMLN
 a5RopO8FHvKRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 154/217] mt76: connac: fix a theoretical NULL
 pointer dereference in mt76_connac_get_phy_mode
Date: Mon, 17 Jan 2022 21:18:37 -0500
Message-Id: <20220118021940.1942199-154-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182735_613512_C69751F6 
X-CRM114-Status: GOOD (  13.98  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit c9dbeac4988f6d4c4211b3747ec9c9c75ea87967 ]

Even if it is not a real bug since mt76_connac_get_phy_mode runs just
for mt7921 where only STA is supported, fix a theoretical NULL pointer
dereference if new added modes do not support HE

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 26b4b875dcc02..bcb596664b3e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1179,7 +1179,7 @@ mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		if (ht_cap->ht_supported)
 			mode |= PHY_MODE_GN;
 
-		if (he_cap->has_he)
+		if (he_cap && he_cap->has_he)
 			mode |= PHY_MODE_AX_24G;
 	} else if (band == NL80211_BAND_5GHZ || band == NL80211_BAND_6GHZ) {
 		mode |= PHY_MODE_A;
@@ -1190,7 +1190,7 @@ mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		if (vht_cap->vht_supported)
 			mode |= PHY_MODE_AC;
 
-		if (he_cap->has_he) {
+		if (he_cap && he_cap->has_he) {
 			if (band == NL80211_BAND_6GHZ)
 				mode |= PHY_MODE_AX_6G;
 			else
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
