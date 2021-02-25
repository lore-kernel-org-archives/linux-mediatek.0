Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9608DC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:00:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4553164EDC
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4553164EDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qlLfJgRZaPjAfvKIkz6DXEKXQ+G9X2GRAwqIKMjLe0Y=; b=jfVoYJoSYe+zbo5yku9qqr4Kd
	ScFVVMCNw9rspuB1gRj/xZurE3XgZ+4rFlRsd71ZeKgIbTXtx/bUa2zKUrEcqvxMgqmpjgNZ1Cvfk
	7jMlXvEcjcc5oKqttwNXCxBqMOGM5KwThV4qxR5L/fEY/h4xDuQpbWn0kZy2Z0Re6WEj/nnlQMw54
	FoZY78n6V5qEQMjH6GWo5zT8kudRnSpuFNGV5tNGrQEOzrvkYe/JVO9SH9LtyfM21FW4S7Cnb6EEc
	lLcBujCs1F9XmJb3uAeVOpZj7DNYSRy7kLR+2/HXWh6t47FSdbiPLs7cYoCJxs8KtxLvbvwSwiFTm
	a57302yOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFI81-0003lt-3V; Thu, 25 Feb 2021 15:00:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFI7w-0003ky-RZ; Thu, 25 Feb 2021 15:00:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7024464F17;
 Thu, 25 Feb 2021 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614265226;
 bh=a/04c2nTy0GlyhPSNi1+WMgFD2zAC0g91qf3en1lMLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LEDUqRTCMenTu9MnNcW1qob6RYDrqs1gz1VtBztoWFVDSpAvVZf6RE6B5qU+6cBjk
 E5A8uOpoJvPVDZhA1IAMy2tUVFJQtfqQLp7LRPNIHbxOk2cRaS61LpZHyWdumt/P+B
 rWlN1QvnRZkoVsDDP2HjPlbTl5qVm/kU7hb78IywItFArL2p00/n9Sq/7UrkyzGcvH
 cPbVmKao7NukQmUDujfQcneYHhKc/QWLt10ZMrk8ZHFLEiJo4Gu82nZvidg4q+bdAq
 ar7EvPI7N8wpkhMcwlUkhr/KdtGe5YaxLdm0qhoq9xB83cMehBHqpRd194JPxe+zQq
 S6qMO9MKOCzzQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] mt76: mt7921: remove incorrect error handling
Date: Thu, 25 Feb 2021 15:59:15 +0100
Message-Id: <20210225145953.404859-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225145953.404859-1-arnd@kernel.org>
References: <20210225145953.404859-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_100028_994948_510AC8B3 
X-CRM114-Status: GOOD (  11.31  )
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
 linux-wireless@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Soul Huang <Soul.Huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Clang points out a mistake in the error handling in
mt7921_mcu_tx_rate_report(), which tries to dereference a pointer that
cannot be initialized because of the error that is being handled:

drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variable 'stats' is uninitialized when used here [-Wuninitialized]
                stats->tx_rate = rate;
                ^~~~~
drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initialize the variable 'stats' to silence this warning
        struct mt7921_sta_stats *stats;
                                      ^
Just remove the obviously incorrect line.

Fixes: 1c099ab44727 ("mt76: mt7921: add MCU support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index db125cd22b91..b5cc72e7e81c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -405,10 +405,8 @@ mt7921_mcu_tx_rate_report(struct mt7921_dev *dev, struct sk_buff *skb,
 	if (wlan_idx >= MT76_N_WCIDS)
 		return;
 	wcid = rcu_dereference(dev->mt76.wcid[wlan_idx]);
-	if (!wcid) {
-		stats->tx_rate = rate;
+	if (!wcid)
 		return;
-	}
 
 	msta = container_of(wcid, struct mt7921_sta, wcid);
 	stats = &msta->stats;
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
