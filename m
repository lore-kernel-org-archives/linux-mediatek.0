Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C57C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:30:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68A2D6191A
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68A2D6191A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7bXYw04gN5GIwSJDOzsBuLa01S13lyrzRX1iTs4Rlgs=; b=Fnmq888ml6cX+cAZH/yO1DPjpr
	IAHisdNs+S4ap7dNh0/5TDx4b5ZPIv0T2u/UhzKNM3Ho7rBOLmTUe8owRUUApABM+n/1OPCTHk0po
	KsUFGCLw8/o4c7ef75FVZDxb32PKnB86y5xZZBB7mDPF7kOPVlioQl8moTDoxdtNvigsF8RNtUysF
	DgsZ+pLtPjyftKAv4IysoKO9VP/axVMy6IaurWabI5k9Oxjqe8RcW/0J1XEYuAhxtbizNjCa49Mr7
	Po1Ge9THkz6Boq8lonUR3l5rciXUMYa0M5IieCJ1x+U/HXzmczffkcvQ1pvRffeUoXmM3yERZ/a4I
	dKMZqIpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOWni-00DOSS-9r; Tue, 23 Mar 2021 02:29:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOWnT-00DONm-7Y; Tue, 23 Mar 2021 02:29:34 +0000
X-UUID: b781952228244180bfccb835fca8b57b-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2GFNDkDPTmHt2F1z/Y5k5IM1I1nPKO/5F5PTBe38m3Y=; 
 b=jZj36DcMU9cfeWtifB0tj8nRaoL1GhDlv5evNbQKtszgX2TJPO1U6I8BKJjl4gqP+maEIS3RHJ8r9b9nzapxB+mczX7VjTuh/fLR9DwA9ZTlvql3yCvE69nQLtmIlO8CPlshrwqZqGCninqab4WMCGm2A9QHg2etJh4B9MVwXDM=;
X-UUID: b781952228244180bfccb835fca8b57b-20210322
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 776629545; Mon, 22 Mar 2021 18:29:15 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 19:29:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 10:29:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 10:29:07 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <fengquan.chen@mediatek.com>, <dehui.sun@mediatek.com>, Fengquan Chen
 <Fengquan.Chen@mediatek.com>
Subject: [v2,
 1/1]Fixes: e3af677607d9(clocksource/drivers/timer-mediatek: optimize
 systimer irq clear flow on shutdown)
Date: Tue, 23 Mar 2021 10:29:02 +0800
Message-ID: <1616466543-13387-1-git-send-email-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: AD58978AA397473FFCE90D8123B5F5C94A91E347620E7C30F0A253083E16BE582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_022931_965485_929DE52D 
X-CRM114-Status: UNSURE (   7.97  )
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

mtk_syst_clkevt_shutdown is called after irq disabled in suspend flow,
clear any pending systimer irq when shutdown to avoid suspend aborted
due to timer irq pending

Also as for systimer in mediatek socs, there must be firstly enable
timer before clear systimer irq

Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>

Fengquan Chen (1):
  [v2, 1/1]Fixes: e3af677607d9(clocksource/drivers/timer-mediatek:
    optimize systimer irq clear flow on shutdown)

 drivers/clocksource/timer-mediatek.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
