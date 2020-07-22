Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7797C433F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:10:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6FD42064C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vndauwAP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hiyF7EPc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6FD42064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WncqGLpOKn1H8WT+FnWBkJdgu6cVOa1pJ0WqM1xezig=; b=vndauwAPysHHFJHqBBgOTysY/
	BK3q0qdG5dMko1uxjeYZ1An+y215t2RKDUems/Y3m+uqn/0KKLByAxYeeY/DZdMZDndorcJkhgjog
	+b8j4cQoj/yRkZ3bYb8u8piT5exHkArAETnHKb3zFFdrtqxD+gN3QlWdzCsFd2gjWX8O3xm5wAzXa
	8iUF8SMUp+MXLNDZkslA+Mv16R41jStvZZXl6faHMMkE6p7tJ5uiG3yDnLQHFBwRKsR4mnzy7pWGk
	K25DE5M6UCUgqFAfDFyEFkU5C5aw3RAkvdS6P2Vxne1zV8xa6HLvJDfe0vY/oeSd843piP4qrQMgi
	WrlC75JDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy595-0003V3-Li; Wed, 22 Jul 2020 03:10:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy590-0003TQ-Vw; Wed, 22 Jul 2020 03:10:12 +0000
X-UUID: 44827adf5d9043ada74b04b9a631f860-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gYjjWtbM06UrnIUXAoV37Admxh7IQJxjUUwdhGjMeJg=; 
 b=hiyF7EPc/GYvjYG4Xyos52/VB9YE9bU/nwP4LvkYLiPjqcH9fUEs4YtWHBXQX/9BljyoXfsR3uRV1Pm/z6WJ/XyEfSNRiYO7a1ZzXD1g6o3Js1vrZNtZcq96yi31m+x6J+z3g8HejTUUYtEKj+3ht4C1BsQ6GbrT8zCcz8WKUMo=;
X-UUID: 44827adf5d9043ada74b04b9a631f860-20200721
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1224080429; Tue, 21 Jul 2020 19:10:05 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 20:10:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 11:09:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Jul 2020 11:09:58 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH v2 2/2] clk: mediatek: remove UART3 clock support
Date: Wed, 22 Jul 2020 11:09:57 +0800
Message-ID: <1595387397-13110-3-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 716ADB503DD77DC1833F55A87B5C4DDD780824AAED33BBDB982B89D486A7B68C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_231011_231622_82E8A510 
X-CRM114-Status: GOOD (  10.66  )
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

CLK_INFRA_UART3 is a dummy clk interface,
it has no effect on the operation of the read/write instruction.

Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt6779.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 9766cccf5844..75f2235486be 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -923,8 +923,6 @@ static const struct mtk_gate infra_clks[] = {
 		    "uart_sel", 23),
 	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
 		    "uart_sel", 24),
-	GATE_INFRA0(CLK_INFRA_UART3, "infra_uart3",
-		    "uart_sel", 25),
 	GATE_INFRA0(CLK_INFRA_GCE_26M, "infra_gce_26m",
 		    "axi_sel", 27),
 	GATE_INFRA0(CLK_INFRA_CQ_DMA_FPC, "infra_cqdma_fpc",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
