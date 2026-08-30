Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FFBC61DD9
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bPE+U1XTC2rPtpA2+zgnnPhk4X8bJnKcvw9nvU64ML4=; b=35wDkcvu/cH+3a1FLKdApfFNeb
	5UcB6gpVHl4Mv/dyLOLNcGptJtS+QIIeIEaH8QlFOoaxhvlysYNqrBJbYiEanMB1AlJ1Admfk3w6C
	78FJE3UNZ7idNi8NxlZqM+iii63NWg6bG3H55EUeJS3ER/+CMTDbdUw70hJ63gmfejk0TuNBD3mwR
	9JkgeueCl/TdweY31HYZBibZgo5YHeMvSG7jo3t+FElpED0V04FznZYtVrbI0mOuCgPrU/vQcRlyz
	kXp1/J2haeI5t+VlM2EGktIWGB6Ffqs7+QAxrWacTO+UMUaYZcqDe7xsgAsqWVbQ8FpFYqdf/7aL+
	nL6plUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ZF4-00000007Wks-3eGL;
	Sun, 30 Aug 2026 06:42:10 +0000
Received: from out-237.mta1.migadu.com ([2001:41d0:203:375::ed] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ZF1-00000007WkL-20zy
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 06:42:09 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BSvuPWNInRSNN0xT6NPa8YHVirxgprFPCBEG8neHW0I=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788072124; v=1; x=1788676924;
 b=ELPGBrYlBkEjAPxZwNZXI0+WLqCbAhaaTHRoyCjqzlfr+K7t83eNZ1rQc9DLwbtNrPzRZaZ8
 udPnHL3GgqJ1aHwlQ0OCgwTLFX6UGfaSkWy+iBJcKQ7TqTr50+RtdiP9kH/PHONZLNGFniG/fua
 2Ye1rn+AxvZdGzEWlb/kesAQORR+kEpVUwqH4A0uDP/ZzwJzgxs/0SjS441z5GCw7Spcw3DZcR3
 ZT5XlEah4tW6L3e9NkJYO4OcVuxk58WcEaVEZo+tTDbD/pSVF64cBhOQFuRV0hUd8s50V7yL1Ka
 eAK7KRbEeQ+1S6jBkxRj59GPLR4h08CCcv/m+YlUoMCiw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 36d2ef1c74f41eac;
	Sun, 30 Aug 2026 06:42:04 +0000
X-Mizu-Trace-ID: 36d2ef1c74f41eac
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH wireless 0/2] wifi: mt76: the same lock inversion in suspend and resume
Date: Sat, 29 Aug 2026 23:41:59 -0700
Message-ID: <20260830064201.92285-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_234207_930518_21D8EA46 
X-CRM114-Status: UNSURE (   4.44  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Follow-up to the config-path fix taken on 10 August. Suspend and resume
do the same thing and were missed. One word each, four sites.

Devin Wittmayer (2):
  wifi: mt76: mt7921: fix the lock inversion in suspend and resume
  wifi: mt76: mt7925: fix the lock inversion in suspend and resume

 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 16 ++++++++--------
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.55.0


