Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84A2C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 05:41:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45D720B1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 05:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xes/tTS0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TSRbl2hx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45D720B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=phgFURukCJb2pvSqj15WnWrPkDpHnyg/OHIdgEHMNSk=; b=Xes/tTS01APdR3L3YwcvMq80k
	cXSl+VShW3x+VNaUnVk2T/hOa53NG1BqPdhG2lpF+eg4CUpJ4kXcXJHSAanOeU1RjYmMsLutm4EzT
	+fuPCPswSg+K9kYMKJwYw6L8n75Bc9MXsTkKB9PrtCucOHPL79fGAlRhwpbTliGclhcXpIqJivb4+
	xa6Pu/UC+wxiDp2QEMcOs9Bl1bZGZTtcYmiPuzS1az30beQlRZcyGtLEk8MYONIVn1/hUY+/hDG4u
	I8jsGPy4XAIcyjK6faKTvPQ4jSuwLI/WhaIw6aw5dqhPf/A1QBrag/AonYHjM1qLgZypp2HNsOI8S
	IdZwnHNkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxl1Q-0004bg-L8; Tue, 21 Jul 2020 05:41:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxl1N-0004aH-Jy; Tue, 21 Jul 2020 05:40:59 +0000
X-UUID: cbff1c83567247b7a6bb6056d890075a-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=eWGLaIff1b5fkIGfcrTBbKrRw56MLBclARuf7ORFwYI=; 
 b=TSRbl2hxl9TchwnuA4LaHCjKDdlTPI1icBpkoGXq114J7G9G7zI6ajJM+SckXX8o0SOI4SebOU1DG21/4tr3csbx34W5bvgFrIhNJ+8QpPsWyvt0cdTRGscSfcSBsrN+4SIbPgxIFs1tR5ENGPx/62dZ0NpYNRgd8NnqZ5QlGT0=;
X-UUID: cbff1c83567247b7a6bb6056d890075a-20200720
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1160659177; Mon, 20 Jul 2020 21:40:46 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 22:40:48 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 13:40:35 +0800
Received: from mtkslt209.mediatek.inc (10.21.15.96) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 13:40:35 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: clock: remove UART3 clock support
Date: Tue, 21 Jul 2020 13:40:32 +0800
Message-ID: <20200721054033.18520-2-hanks.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200721054033.18520-1-hanks.chen@mediatek.com>
References: <20200721054033.18520-1-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_014057_824668_6696C5CE 
X-CRM114-Status: GOOD (  10.93  )
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

Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 include/dt-bindings/clock/mt6779-clk.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt6779-clk.h b/include/dt-bindings/clock/mt6779-clk.h
index b083139afbd2..2b5f2354d7eb 100644
--- a/include/dt-bindings/clock/mt6779-clk.h
+++ b/include/dt-bindings/clock/mt6779-clk.h
@@ -229,7 +229,6 @@
 #define CLK_INFRA_UART0			21
 #define CLK_INFRA_UART1			22
 #define CLK_INFRA_UART2			23
-#define CLK_INFRA_UART3			24
 #define CLK_INFRA_GCE_26M		25
 #define CLK_INFRA_CQ_DMA_FPC		26
 #define CLK_INFRA_BTIF			27
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
