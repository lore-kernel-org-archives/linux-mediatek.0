Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AD1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 02:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bULslQt8Q0cYfcBE04OSh9/mXSR9ZvyVQK5uV+vBlBE=; b=jwVQa0ANWRWAa1
	wtenycs9xpubo47N3CfnfQqODmKTAj2hh2tnLFAqSdEzV+2njiyVZ5M9gfKd0gxEVIBzhaztxPBEp
	sfi9aDKbZelFRa9nFaR97s/zLlb6zE5U5kW9dRtTo/KWYZT/AGK0O1Vv/g0RyFRW4mE0UPiJDu0aO
	3+eRrOV/5Ei6F1jzjJBKenJBlZXksvDEp8FaxoYO9318S3bOtau4+1QrtVonmywBIuNgi1qIzYVxz
	61ujwpLh9xLM/4I4PgG7ArqQo8Phhj/XozBU0KK4ztLJbTsdnoCXCNbyJyLEp95RsCEvdUIIXM3uW
	INoaO/s30IFefbUzLBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRPZ2-002S9G-1N; Tue, 08 Mar 2022 02:27:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRPYt-002S7h-5a
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 02:26:56 +0000
X-UUID: 7569868a9543422bb65d48358f7702cc-20220307
X-UUID: 7569868a9543422bb65d48358f7702cc-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1775782177; Mon, 07 Mar 2022 19:26:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 18:16:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 8 Mar 2022 10:16:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 10:16:47 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Subject: [PATCH] mac80211: correct legacy rates check in
 ieee80211_calc_rx_airtime
Date: Tue, 8 Mar 2022 10:16:45 +0800
Message-ID: <20220308021645.16272-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_182655_229945_9F46ED14 
X-CRM114-Status: GOOD (  10.35  )
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

There are no legacy rates on 60GHz or sub-1Ghz band, so modify the check.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
 net/mac80211/airtime.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index 26d2f8ba7029..c0e58eb7c7fb 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -477,7 +477,9 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
 		bool sp = status->enc_flags & RX_ENC_FLAG_SHORTPRE;
 		bool cck;
 
-		if (WARN_ON_ONCE(status->band > NL80211_BAND_5GHZ))
+		/* on 60GHz or sub-1Ghz band, there are no legacy rates */
+		if (WARN_ON_ONCE(status->band == NL80211_BAND_60GHZ ||
+				 status->band == NL80211_BAND_S1GHZ))
 			return 0;
 
 		sband = hw->wiphy->bands[status->band];
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
