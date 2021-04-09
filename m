Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A80DC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:46:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E28E9611AB
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E28E9611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=74esv/UoM5AdYC3Y6vOmIiDxfCLxDi2fiA24OXs7TNw=; b=IrUYMygVFrpL8oiNE50YHKyYf
	5LCm72fOynid/QES6tCs0XcCFVXuB1Huh7GqYMpsbTQGvCYGCv2HjsIqGqKjAgO7g8lh0f4jfXwQy
	CSz3sGNAWw5vVNtyXBcM4SBktet3bYttGMo1VcU0TVuaL6ZhvSvi7Vuw4aH9aCAzZ2ZZ0J14evMxf
	lgfkHpfU/PJA6Pb3D5q9Wgbak8W7e1ogdhodX0SYCMSPLj+NyrG/MiVxjBdAcGNZDfOG/TjIujg5Z
	fzYu9M1i81XfrQXZ5cJJGAabltGJ60CLNnk3N9XRSZGLfxTcZ87RfLuTXVHDFx3Fup+l1y+ao3HTb
	SxOrwOn6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUmmo-0005rd-0G; Fri, 09 Apr 2021 08:46:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmmR-0005mg-Qd; Fri, 09 Apr 2021 08:46:21 +0000
X-UUID: 757abc5153b84b2ca5d26ca4068aba6f-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UJYgVBPEZ+z1Gg39WhIHVJGSE9l0qw37U1qwcZzApPI=; 
 b=T6FcOj5tDwdvfGZDsWnH4d9Uc2GYWb0ZQ6bNn9bKgKUiKGlP0l/VyHH4UspbwTA9NGJEsJ+ZyDDFayOkmE1ij6OWTxu3nmbR3qQGoEWL7IGB4PGeV1KlyIynMoimGnLAY1Ccb8x5UNZlBxCSlW0Td73ipPEfiZY/abmRGFkylD4=;
X-UUID: 757abc5153b84b2ca5d26ca4068aba6f-20210409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1166032607; Fri, 09 Apr 2021 01:46:12 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 01:36:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 16:36:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 16:36:27 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <fengquan.chen@mediatek.com>, <dehui.sun@mediatek.com>, Fengquan Chen
 <Fengquan.Chen@mediatek.com>
Subject: [PATCH] [v3,
 1/1] clocksource/drivers/timer-mediatek: optimize systimer irq clear
 flow on shutdown
Date: Fri, 9 Apr 2021 16:36:07 +0800
Message-ID: <1617957367-479-2-git-send-email-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617957367-479-1-git-send-email-Fengquan.Chen@mediatek.com>
References: <1617957367-479-1-git-send-email-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D50B5F8EB4DA75930AEADF960CA9BFDBADFF81711B1575D17A97B24A553E917A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_094620_230844_7DF3190D 
X-CRM114-Status: GOOD (  11.98  )
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

mtk_syst_clkevt_shutdown is called after irq disabled in suspend flow,
clear any pending systimer irq when shutdown to avoid suspend aborted
due to timer irq pending

Also as for systimer in mediatek socs, there must be firstly enable
timer before clear systimer irq

Fixes: e3af677607d9("clocksource/drivers/timer-mediatek: Add support for
		system timer")
Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>

Change-Id: I1cd408cef4af4c5d7965eab27eda305ee4356315
---
 drivers/clocksource/timer-mediatek.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 9318edc..6461fd3 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -60,9 +60,9 @@
  * SYST_CON_EN: Clock enable. Shall be set to
  *   - Start timer countdown.
  *   - Allow timeout ticks being updated.
- *   - Allow changing interrupt functions.
+ *   - Allow changing interrupt status,like clear irq pending.
  *
- * SYST_CON_IRQ_EN: Set to allow interrupt.
+ * SYST_CON_IRQ_EN: Set to enable interrupt.
  *
  * SYST_CON_IRQ_CLR: Set to clear interrupt.
  */
@@ -75,6 +75,7 @@
 static void mtk_syst_ack_irq(struct timer_of *to)
 {
 	/* Clear and disable interrupt */
+	writel(SYST_CON_EN, SYST_CON_REG(to));
 	writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
 }
 
@@ -111,6 +112,9 @@ static int mtk_syst_clkevt_next_event(unsigned long ticks,
 
 static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
 {
+	/* Clear any irq */
+	mtk_syst_ack_irq(to_timer_of(clkevt));
+
 	/* Disable timer */
 	writel(0, SYST_CON_REG(to_timer_of(clkevt)));
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
