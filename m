Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBCBC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 09:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D546103E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 09:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21D546103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0I4jk9kcq6KjesDhGKmxphDtLoQtvBvdT0X4MvQKI8=; b=0jjB5s1TuhpR75
	75CqZDOUKK9cQr7O6vjxrnD1Ena5u/gJkcnyQpqThS9+icCKjPGjxanqgP0RnDr8zhoW1W7hUSPEd
	XIu6qQJtbxFWrvEe6r46R9VVyQlqjXOkUvJq6P93xLrHrYBlF1xuA/wWUEcyy8rIn8pGM+Kwxk/BY
	DwCO0XXNWaikJlSZCqXO6C35ibBDy1mgM1/uj6/24f0z5crCBOmN0FO5iDnr588bB5FpMIQpmfdha
	ctuAGSxAQf1ne96k9hldnV9IQ9j1FTGrLz3Gw24g9oc/QaFh0JCuZZSMxeCYBMnBBusmS5CU8k4KO
	GS1oY7Vln7i0tQVf6zCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mISf4-002Ido-1n; Tue, 24 Aug 2021 09:24:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mISeT-002IXf-T7; Tue, 24 Aug 2021 09:23:30 +0000
X-UUID: 4c3de1dbce474cb8a93f4a867e7ab3da-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VGiegjZFNB7xTpkG42aGbJ+oLNnmsZeUt3AHwH3TOFY=; 
 b=o7Cqn1UjnO1d5BWrwi5SRoOlsvfKRyhh1bVHyj/AWu3i9ihwcsPGvkoFasFMAdVSaBSyQZT3LGUZKtRTS/kYOQuAJIlcBLJUwond/lPb6YMF63PX6L2xxcxF/e1irVrPebON+vNk/YFA3k1rOfAWrmOVKHr3wt8nqEA8NfgzaS0=;
X-UUID: 4c3de1dbce474cb8a93f4a867e7ab3da-20210824
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 994287831; Tue, 24 Aug 2021 02:23:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 02:23:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 24 Aug 2021 17:23:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 17:23:12 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Stanley Chu
 <stanley.chu@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <fengquan.chen@mediatek.com>
Subject: [v5,
 1/1] clocksource/drivers/timer-mediatek: optimize systimer irq clear
 flow on shutdown
Date: Tue, 24 Aug 2021 17:23:09 +0800
Message-ID: <1629796990-28361-1-git-send-email-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_022325_985517_C3F448AB 
X-CRM114-Status: UNSURE (   8.61  )
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

From: "fengquan.chen" <fengquan.chen@mediatek.com>

mtk_syst_clkevt_shutdown is called after irq disabled in suspend flow,
clear any pending systimer irq when shutdown to avoid suspend aborted
due to timer irq pending

Also as for systimer in mediatek socs, there must be firstly enable
timer before clear systimer irq

fengquan.chen (1):
  [v5, 1/1] clocksource/drivers/timer-mediatek: optimize systimer irq   
     clear flow on shutdown

 drivers/clocksource/timer-mediatek.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
