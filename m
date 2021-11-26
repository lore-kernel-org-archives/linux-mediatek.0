Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86597C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 02:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suJ9fYW6Wk80iJJaT0Nzfuh/vnxDYxld8Umj+SOo6IM=; b=rjXXvT1AZ8COb1
	FjnoiSXRZIOcgj9NOUxUAy5xNp9tw2m1IOxEsuAGi78TIsghu0tK6QFNb30o+ZUw2y4u4WMoZxDlW
	vfmIFE9b8eiuODAhhOPdYTybhxVQ04cjpvvXI6DYwziOCpy8duC3rTv0IBRgl49ZlgDiJbv933tVd
	SWWgEY3IRuGLhftWSQHEWIx7F0waHvLf2EQTBMP1YkMBFlJpEOqoInuYW/6dzHQ/abDnZ7jRrC79O
	5+hDehmAuZhpE7Hs5T4cUwbvGEhhsUVERuKVlx2X+ofpR520s8lJo2jjS6sGZMtuxyGdTndlq6Zv8
	4DiyUSi27Xqgtd6xIZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqR5W-0092e0-81; Fri, 26 Nov 2021 02:35:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqR4g-0092AW-7A; Fri, 26 Nov 2021 02:34:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 919016125F;
 Fri, 26 Nov 2021 02:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637894093;
 bh=8n2IBl+k1S/Bq+MjR5lhlxC6Vz+D8xdsiTdby2ApKEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bt4+np51pe+p07qFgTRmCmrgZgXpZlcsRuZvHwUnb/Cc+n1YL5KduUgA1RiTY3Ej6
 NztwP+pfJw023+3fFE7Vmo72VlBpOFWOnDeOCVN6zPyHONSnjcdqd7JNBVuC1IHnj/
 8uy+j/KEEezU7uXvd4xWACHoy6fqE6KtZnKblfSObt7qUvTxXeatJ+PJR/McZle8Yd
 MnAUy79pa4zSnTFSOfZhUVLilbEMjoIbUC5KIm/nMq7YyWL2YJ3CrfJaoK5aZk2xdl
 TQHfPn+jYeqcPq85+k4irHh1EffK698u7vS8n4XBUYWeK0lEzaRKa9hizPfqJbjGJz
 WD7LG11Cz4d+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xing Song <xing.song@mediatek.com>,
 Johannes Berg <johannes.berg@intel.com>, Sasha Levin <sashal@kernel.org>,
 johannes@sipsolutions.net, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 03/19] mac80211: do not access the IV when it was
 stripped
Date: Thu, 25 Nov 2021 21:34:32 -0500
Message-Id: <20211126023448.442529-3-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023448.442529-1-sashal@kernel.org>
References: <20211126023448.442529-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_183454_343288_E23F9E9B 
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
index c7e6bf7c22c78..282bf336b15a4 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1918,7 +1918,8 @@ ieee80211_rx_h_decrypt(struct ieee80211_rx_data *rx)
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
