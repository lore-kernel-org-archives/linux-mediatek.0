Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B80C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 02:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POekm7q/XbqADnF58lc90sP6omemih8KMzxV6pEdBrU=; b=mMg9S1wb7+8gO/
	dv4v5lwQAURfLwPSiFrkIIhm3Opn2vS19OBS9/EjXT/N/4zA3TQRrsh4EXXDaHKI/6xaZwOg7le8J
	7G+X4Q+3j5y3CBqCaqu3DYugcGzEQ2neL4J7+w/xMX6Npz/NrcYS14/ONqusI26Swek6sKR7Jq2TR
	qDCXUt47JSvfgn6TQ9hU//J7zt4PkmOnTd5/yFI86Ocoeq6cy2ZWyaatbunLLZaBp01UDgdkyQPPY
	2D4LbBieKpE+x6LTgjPVecboMeZSBPThy4wb+EI9PW1erc3loYLeNwA2/NplQ6dh1Efpi7PRF0RhN
	Rs/SyZej5EsFDTv7cKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqR2P-0091BR-MG; Fri, 26 Nov 2021 02:32:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqR20-00914f-Oq; Fri, 26 Nov 2021 02:32:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4863E61185;
 Fri, 26 Nov 2021 02:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637893928;
 bh=Ngs82xBj1LLbXSDmWF4eJlRbBj4Kc8mqIGfH7kS/xA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K4VPe/AxYLPuaLDpoCQRggx+OkU3EiOEYzfQ9bk08gmkMLeD+P0Q69IjZw077Aqbq
 xdOhuICtVvayIci/usScI3RxgL0jLqrB6yUkvLiCfXd196XVZw0SRbj47/MnqpsXpl
 IBuBHlTB8PYmXo35xr0yCyGkewYH/wjgFP7t4IgBtSUd+aCBWHX1vbHbiwNMczcvLT
 Yyxr2XAY5XUp09J/lvwdTx14o5RJdvJi/C+HHg7Kilhn4BlC118k+bvcu/MUBQ/sXs
 ebjVS0xjQP/EW6yo0yjsOGCJw3LbQxVi5QH9ltMUuzMkz7S+axZAa+94VsDcirrY9m
 W4U+qOCMBrCYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xing Song <xing.song@mediatek.com>,
 Johannes Berg <johannes.berg@intel.com>, Sasha Levin <sashal@kernel.org>,
 johannes@sipsolutions.net, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 06/39] mac80211: do not access the IV when it was
 stripped
Date: Thu, 25 Nov 2021 21:31:23 -0500
Message-Id: <20211126023156.441292-6-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023156.441292-1-sashal@kernel.org>
References: <20211126023156.441292-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_183208_896074_45291CB5 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Xing Song <xing.song@mediatek.com>

[ Upstream commit 77dfc2bc0bb4b8376ecd7a430f27a4a8fff6a5a0 ]

ieee80211_get_keyid() will return false value if IV has been stripped,
such as return 0 for IP/ARP frames due to LLC header, and return -EINVAL
for disassociation frames due to its length... etc. Don't try to access
it if it's not present.

Signed-off-by: Xing Song <xing.song@mediatek.com>
Link: https://lore.kernel.org/r/20211101024657.143026-1-xing.song@mediatek.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/mac80211/rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index c4071b015c188..ba3b82a72a604 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1952,7 +1952,8 @@ ieee80211_rx_h_decrypt(struct ieee80211_rx_data *rx)
 		int keyid = rx->sta->ptk_idx;
 		sta_ptk = rcu_dereference(rx->sta->ptk[keyid]);
 
-		if (ieee80211_has_protected(fc)) {
+		if (ieee80211_has_protected(fc) &&
+		    !(status->flag & RX_FLAG_IV_STRIPPED)) {
 			cs = rx->sta->cipher_scheme;
 			keyid = ieee80211_get_keyid(rx->skb, cs);
 
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
