Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6338C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 09:28:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6370161178
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 09:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6370161178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=74Py2GQkIAOhJNKA1LdGKiFOPtiWe6y1L5jUQ6XTV30=; b=EkmLJIdJ4CmT21xfEPCYZt+5F
	FiS4kArsS4up99Tvv6CFCkEDhTNsp+zhAp6gsYITdsuxFXz7kh85/BwMfMSC92tGGvlS/3fW24uGe
	7p7knm01bmV39dwnr/fzd9TlHWNbMoRtHBEhG0gXNtl5GDtrgyPix8LnF+i2auhxMU3pel0jsGpv9
	iyldGihwNeRVDpqQ50u5dcQhMb0regz4lS/v/Hu8nMvXOy4ag/ELA0Uw04+NKvk7Pj5vZlXTyDpEv
	/1p5yFd9Mbt6GQXWGIJwoDNQXFeKUSvWSCYZSwUsBBKy6SVF9ln6m4rfnN4gcZazgq0Beqd7PTkM8
	d9JwtWuWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUnQh-000EUp-KL; Fri, 09 Apr 2021 09:27:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUnQV-000ETf-8g; Fri, 09 Apr 2021 09:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=67VB2/5dOLWuJVyVMYMYzR5s2ShmPolUoXTDh7Lay8M=; b=O6eanL60QKMPfaFfea+pJbhFsa
 WL+VodTvfXADZ53X/Slbb4ijpjqoRo9skWY5lO21eoAIlOSVs6dw8K+uzc0U4+q6EhoeoMV0OTkHF
 6pXKN+la02XoLpldgNhcks+fTO8S9vgz4cK4ZOE3L6smFYEjMt30QjQ5ll7dsss9dZx0VAlQeXIig
 OJ6Jx4H0RZeh51HYkdd7ajKIcJ5vfy3LLVv8NB28W64mXFt7Igtmml3zx8I4g0cEfwqyEid+jBAnu
 LIuoWA1Ox3qc+7N743T2jj8SGN/1DmGN8bLMwTNhJBno4q1l7VyNuPa6HkOUSTah7jq60tqVFQXJ6
 NShJ33vg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUnQS-0041Nn-0m; Fri, 09 Apr 2021 09:27:41 +0000
X-UUID: d3c92677b958432c9e2763f11c96f298-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=67VB2/5dOLWuJVyVMYMYzR5s2ShmPolUoXTDh7Lay8M=; 
 b=FVEO0PeiVJm7HJ3dojflM6omn8REKXVz4Wj2HZPw7v4C64bhxyQUHE19YzZ6fR8BvChkA9km4DsJA7L4NXSTRdIJfGQFqHszdmw/+1dfs1HIgBpVC9j6e+FvGiKdu/c89Wel4dPCcQtD2oozTTA+PCT4xUAbs/UvRj2sNlmfApE=;
X-UUID: d3c92677b958432c9e2763f11c96f298-20210409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1422972932; Fri, 09 Apr 2021 02:27:35 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 02:22:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 17:22:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 17:22:47 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <fengquan.chen@mediatek.com>, <dehui.sun@mediatek.com>, Fengquan Chen
 <Fengquan.Chen@mediatek.com>
Subject: [PATCH] [v4,
 1/1] clocksource/drivers/timer-mediatek: optimize systimer irq clear
 flow on shutdown
Date: Fri, 9 Apr 2021 17:22:42 +0800
Message-ID: <1617960162-1988-2-git-send-email-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617960162-1988-1-git-send-email-Fengquan.Chen@mediatek.com>
References: <1617960162-1988-1-git-send-email-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 826507B506F2E6CE2B0689A4825496BE862FBCB05A78F7CDF6D4B0793C0B89D32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_022740_089634_A465EFC4 
X-CRM114-Status: GOOD (  11.77  )
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

Fixes: e3af677607d9("clocksource/drivers/timer-mediatek: Add support for system timer")
Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>

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
