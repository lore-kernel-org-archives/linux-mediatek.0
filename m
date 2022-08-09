Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03280C25B0C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 02:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CXNfkRTv/TiICqlZbezfi5GS0yvhImERGccwjlhF0Zg=; b=uVIb22/0SbwrJQOqSXxPMjuL0W
	+CoGOwLIQJabTy1P3MsOfUl8OQsJcG2Lp2IDeDb//+WNNVn5eC1rocnVlGnlprCwlWk/i3DHYcAQq
	CPfMtJzTc23N/PcDdVB4OagNj59YhQgqAl8vejBt7DAUIU1U28AHWRkXm67P8PdoKkSjynmBgitJf
	tHHuct0O6lDqWehKCD7TveZuqbLoNUN/HLc+NTHXj7Wbb0tZwzwW3OLnsRpLpqzskJ0Oaa9cYsuHh
	dXfK5tLckLiTqKq3RINPt7qWPtpE8veMGgTYkSsAusSPgW+NvIc/Gen4zx8uYOnR5yVEsATORQhUn
	cvoxvSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLFD7-000WvT-7L; Tue, 09 Aug 2022 02:43:13 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLFCt-000Wqa-9z; Tue, 09 Aug 2022 02:43:01 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 419C61E80D95;
	Tue,  9 Aug 2022 10:41:15 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBf77Qdk2HDE; Tue,  9 Aug 2022 10:41:12 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 974601E80D77;
	Tue,  9 Aug 2022 10:41:12 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] clocksource/timer-mediatek: Remove unnecessary (void*) conversions
Date: Tue,  9 Aug 2022 10:42:53 +0800
Message-Id: <20220809024253.3727-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_194259_583779_A59ABFAC 
X-CRM114-Status: UNSURE (   8.25  )
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

Remove unnecessary void* type castings.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/clocksource/timer-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index d5b29fd03ca2..35e08c329d8e 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -264,7 +264,7 @@ static int mtk_gpt_clkevt_next_event(unsigned long event,
 
 static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_id)
 {
-	struct clock_event_device *clkevt = (struct clock_event_device *)dev_id;
+	struct clock_event_device *clkevt = dev_id;
 	struct timer_of *to = to_timer_of(clkevt);
 
 	/* Acknowledge timer0 irq */
-- 
2.18.2


