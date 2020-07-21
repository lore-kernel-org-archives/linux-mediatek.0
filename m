Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D095C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 05:41:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5680720792
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 05:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zcRgJXJy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q9Np3P+Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5680720792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rj53Wa9zflp3JTY7zp0zn9AIerdTjNCqYXcb5SJCsOQ=; b=zcRgJXJySejXSszD3F3sFfL4Cj
	eMzqX/NQ5jPW2E9Fjdp6i7bDQQsWkJmuhIZ95+nlvL6j/ulI+tC7EwX6TVN6UD+OIii2v+n11vfgu
	FF5bw+UQR+LE6dgz+MOJ99fSU1wu49Z0amoSP1xse4ufsz5a8qWgHObzqY5ka42+Tu6Vo2qxkmsd0
	Q1299SykmNcMwOTbVJEEnXFXAPWD0/r6mmglypsRlQBdRu9qCUI68eLsZiKI31PXax0/c5m5g1MxW
	wf0knGOFGc7t5y+hVS/DrJNPCFwKEsBjxWhRh3aWfNPY2RlqwNELk45V4qmgphoF4Smj/dEbkClJq
	s7zgkn+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxl1R-0004bs-5C; Tue, 21 Jul 2020 05:41:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxl1N-0004a9-Iu; Tue, 21 Jul 2020 05:40:59 +0000
X-UUID: 7458785bfa144cca8b16a56fd8aa88e8-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=UYXb9TARtCORQ6Fp7X/Vs8nh9l+XsjGPKgRDOMIH2E0=; 
 b=q9Np3P+Q3XCqTl8lvcAIPF7aPpa37ruvhYUwixwL2+a4aLdY3NxniN+uvTy0zCVzqvOaNBgCBFuu2bU0Ryy4LcGAxnVYzuAnCiyONuP9bh/Mw8D4MU2ch8AJQmOeyBbdHarvOC2VakEw9hu2FA6vkrFSTUlRoCWR9cj1Avi44SQ=;
X-UUID: 7458785bfa144cca8b16a56fd8aa88e8-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 520409582; Mon, 20 Jul 2020 21:40:41 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 22:40:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 13:40:35 +0800
Received: from mtkslt209.mediatek.inc (10.21.15.96) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 13:40:35 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH 0/2] Remove MT6779 UART3 clock support
Date: Tue, 21 Jul 2020 13:40:31 +0800
Message-ID: <20200721054033.18520-1-hanks.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 61CC5E73BF7A47824A55A376016D14F5207F5182A89FA7554CA6AFB7DC8110262000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_014057_779605_1BADA31E 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Hanks Chen <hanks.chen@mediatek.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

remove the redundant clk interface of uart.
CLK_INFRA_UART3 is a dummy clk interface,
it has no effect on the operation of the read/write instruction.

Hanks Chen (2):
  dt-bindings: clock: remove UART3 clock support
  clk: mediatek: remove UART3 clock support

 drivers/clk/mediatek/clk-mt6779.c      | 2 --
 include/dt-bindings/clock/mt6779-clk.h | 1 -
 2 files changed, 3 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
