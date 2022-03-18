Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92922C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sZfV9fUo3WJZfqRkjC84YkpG4fHAvdIjTF+pwjpNpbM=; b=V0Zj92RJFgSnUR
	NtIL/tt3YB6MpDch6V0Q8xr5SaICxmBLdkNLPkAKac+rP/YSUeV0sJ6Phh4nNQKLO72iMlm9Totpk
	/oFBaX1o2bK3G+U9hBD0yCoLNIKNkFke47ONoqbrTrmrzo55JoDsicf1ZBtwqlcWnSB9VWLd1AuzE
	+tLafU/nlUtKvbk/JqaTgxtjMQ2hYJHXFkOjxcfBYP0dz+OKTLitzrxXH7ZpzJXTIbio3V0pUVuKl
	4s6cozn75QdiAis1P9hRG8q3KVf6rMhp5WoB0jcrvHsV8PchK+8opxZ1+bX2UdbcOmlto9hhPQw64
	ZMeXjaz5IyG6rGJOam3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVKvN-002wmK-VJ; Fri, 18 Mar 2022 22:18:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVKvK-002wm0-JW
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 22:18:21 +0000
X-UUID: e33bca8e049e420b90df49f929f04438-20220318
X-UUID: e33bca8e049e420b90df49f929f04438-20220318
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1833342029; Fri, 18 Mar 2022 15:18:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 15:18:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Mar 2022 06:18:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 19 Mar 2022 06:18:11 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes.berg@intel.com>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mac80211: adjust the replace_state of ieee80211_find_chanctx()
Date: Sat, 19 Mar 2022 06:18:10 +0800
Message-ID: <40aabb3e10302f1d7da92b7a4eb46577d5ed8e05.1647641256.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_151818_677701_B4BDD7D8 
X-CRM114-Status: GOOD (  10.81  )
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

We observe that the condition of chanctx could not be back to
IEEE80211_CHANCTX_REPLACE_NONE occasionally while STA connection.

In this case the state could be IEEE80211_CHANCTX_REPLACE_OTHER, which
fails the check and then creates another chanctx that leads to the next
round of chan_switch failure in cfg80211_check_combinations().

So, modify state to just rule out IEEE80211_CHANCTX_WILL_BE_REPLACED.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index e26d42de14ec..604095ff7a5b 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -477,7 +477,7 @@ ieee80211_find_chanctx(struct ieee80211_local *local,
 	list_for_each_entry(ctx, &local->chanctx_list, list) {
 		const struct cfg80211_chan_def *compat;
 
-		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACE_NONE)
+		if (ctx->replace_state == IEEE80211_CHANCTX_WILL_BE_REPLACED)
 			continue;
 
 		if (ctx->mode == IEEE80211_CHANCTX_EXCLUSIVE)
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
