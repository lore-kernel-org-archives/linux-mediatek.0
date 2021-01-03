Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DADC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 13:58:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A7D320C56
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 13:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A7D320C56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=By3swuhyIXsuqU+6fZ0xWaP58947qgZBxlyA1aMMg/U=; b=rNaReSpXspzL+X1c/+1TlX9IzT
	cm3kYUHS12C6WW49GG7Y2RdYiQliB/J6ZinfmBsk6GviLLSyTyzGVypcO/2mhVPyyT1X29lu53qKQ
	A/qgEWojHQpRqk9GAKZK7pro8CHhLLdjRfoTmJ9XtvlvXFnEPWGnJwCkgQ8YfMjauGk/Ee2LrK/MM
	iC79eYiZSI/9CahXzaksqqJB5DbGItfJtsUpBu0SvwVbk3MEAtZ2jpOxptuwx9/mYgXYubaasR/Dg
	e0kculrILnu6B9AFiQ8LGTZiNXK9OXhywxhbNClqYOpwADLQWsXutspHjrPyV+jxptPZ2F3NZQOQr
	3wh6VJ3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw3tk-0000Qf-62; Sun, 03 Jan 2021 13:58:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw3th-0000Pe-0m; Sun, 03 Jan 2021 13:58:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7521B20782;
 Sun,  3 Jan 2021 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609682296;
 bh=GJ3TiDbcI7Vu/JRfRThabclQjLmoFf/NfkaYgzUh29A=;
 h=From:To:Cc:Subject:Date:From;
 b=XILYV6zSwLXgZzW2kxk7c5CgaTvvA9NqMcRtliWJ8emVmxcIHNTio8+2Cwqlmsr0x
 HGjeo8uMQYAHzy4Kf7I2GDRgwztbb1EudBf+qCLlEKR2GQwzSNzwENeB6BSefyLszR
 ImwG+2Y8EktwUuOUlc3p0C/6DUf5+M3BK9mD1b77oNviaUrBMqwXGOSrWzjIspIgU6
 WYt79zuHJYKbzRJM7lvomLbg2L5gdejeC6J/w4TFboMNTJl+AFefMdC0Tt7ScuQtHV
 +wVxC9DcPHtEMVgwabrHeucIO/4TwD3I7XQvYyA7x5DjLGLB3y/DCkMLEUYdjj6QVA
 VdT2/fRnJbYyw==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Subject: [PATCH] mt76: mt7915: fix misplaced #ifdef
Date: Sun,  3 Jan 2021 14:57:55 +0100
Message-Id: <20210103135811.3749775-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_085817_140160_C014203A 
X-CRM114-Status: GOOD (  10.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

The lone '|' at the end of a line causes a build failure:

drivers/net/wireless/mediatek/mt76/mt7915/init.c:47:2: error: expected expression before '}' token

Replace the #ifdef with an equivalent IS_ENABLED() check.

Fixes: af901eb4ab80 ("mt76: mt7915: get rid of dbdc debugfs knob")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index ed4635bd151a..f1fb3ae0f7f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -40,10 +40,9 @@ static const struct ieee80211_iface_limit if_limits[] = {
 		.types = BIT(NL80211_IFTYPE_ADHOC)
 	}, {
 		.max = 16,
-		.types = BIT(NL80211_IFTYPE_AP) |
-#ifdef CONFIG_MAC80211_MESH
-			 BIT(NL80211_IFTYPE_MESH_POINT)
-#endif
+		.types = BIT(NL80211_IFTYPE_AP)
+			 | IS_ENABLED(CONFIG_MAC80211_MESH) ?
+			   BIT(NL80211_IFTYPE_MESH_POINT) : 0
 	}, {
 		.max = MT7915_MAX_INTERFACES,
 		.types = BIT(NL80211_IFTYPE_STATION)
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
