Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8416C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 02:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAnSS9vLR6DjOhkJH73/2oDSMWImk4+eWVNi2Gx3ABg=; b=apHcxvVrvChNEW
	YOlSQ48b3zyjgdmV/nuLZ4Q5qNg/x/2zy2R2bBiguE8v0PY09/WMz5ZY1XUjN58a136s98a8dlt6N
	ImkMtmW5hzKF8qH5gqxCXPV0UCcy3jTE8V477+7YgROOck3sIdfl1aQc0jTWe2o9tjTbZUel+iBMh
	KiCC58WO2xvbgZxBpgc6nxtyEmYTizStS4L8FmPdQAxkzyU0vk11cIbnnO2HX8c/nw6MJMz2+iP39
	pba3dolCbY/god4FJc+lUKfBOynprBcjyctE0LSMUPAMQV4ojpvrRZtNE4L3PadnkVrEXDZQtoBoO
	4Cl5YjAdvmQNil+qtKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqR4D-0091sU-Fl; Fri, 26 Nov 2021 02:34:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqR3h-0091ab-E3; Fri, 26 Nov 2021 02:33:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCBAE61216;
 Fri, 26 Nov 2021 02:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637894033;
 bh=XcuOgcUdbTwCSa9SaaIdRMs1PJjFve2WsNdd9Ot6f5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gqBsFMumeRJdtQEJQ2v+Y8mwW1yVlpZPyZc+cd9VGcj1vxHwU6aKiFZUUDJrSBDws
 lz2uPNmYxhazsXbyTePuqISnDLvIDoQ9AOrDT+VQMHPYZnoF3nYwE5291V41UEKE5T
 Bh7y1n4rz3NmbpBOsJxue1WxNWktcg+dSCqEApbe9gvGOpRQeznBSPhrGcbyfa1Z8f
 ooCgF4yXFxuyfwENvS+/7phH6vQ+moa7SmlUza8w+uy6Uc5+Gm6MEH8cf7pPAQ2C/j
 SuhzyTLBmOAXO4lBtr1kVh/QmYKgBNYqG0O58HeTNZCSXAz+YKkMftsN9EYKpu/MQ2
 Sp8/0n8/0R0CQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xing Song <xing.song@mediatek.com>,
 Johannes Berg <johannes.berg@intel.com>, Sasha Levin <sashal@kernel.org>,
 johannes@sipsolutions.net, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 05/28] mac80211: do not access the IV when it was
 stripped
Date: Thu, 25 Nov 2021 21:33:20 -0500
Message-Id: <20211126023343.442045-5-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023343.442045-1-sashal@kernel.org>
References: <20211126023343.442045-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_183353_518921_933CCBA8 
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
index b7979c0bffd0f..6a24431b90095 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1945,7 +1945,8 @@ ieee80211_rx_h_decrypt(struct ieee80211_rx_data *rx)
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
