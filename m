Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409B0C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 13:31:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C3E20829
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 13:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PbdytqBA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tRDq7tvq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C3E20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WH1UsVcL7+XgWeAquO5sqSiwQ2y+Gm98wAc4xAnO7Yc=; b=PbdytqBA/eSPfP5JAVkrQq551
	Qm6dzLjtNPWqDxxH/9g0b8CmOaGUSOy+tj2e+6R+YvqjI6dk+NsU5CIb3ID9NA83HsglaiZWNo+Rb
	hakXkhhHEOLCbrwkZsOwpZ2YcHRtAtQE7P+02Xpfm2pXPLjumvVK5nNN0SN1bbIyiEpZna2yGWPyB
	/uX0i0vgYt5deN1W4V7PnjKp5u0jMG8eeWXO4L2y/yRkF9rP8lIWw3K7xpV3BIub5xbZ8eNSYO6c1
	LVE6gWuWUXZG/oAJpjTvrXcuCzXFqkEwR98MtQaGJeCWSz8t9UU4atBb0OEzQvLN3bpA/I86RCQK/
	22n89phXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k18e2-0004Av-3u; Thu, 30 Jul 2020 13:30:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k18dr-000469-Pe; Thu, 30 Jul 2020 13:30:40 +0000
X-UUID: 33a9ca8e81ba40f6abb3964649fd63b5-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bItawRI4WETjkWbsEIQmhgb5ptmHRsFuKCwxFVOHsUs=; 
 b=tRDq7tvqsZ+6Ukc0BSZjtM64ueBBtjCJXGmw9y50K1hSSisZyX3KLs7rvzyfM06bXwTWg7A8rAyNkiQzap+68FJxIC1ewOzJaTN5YR7HHmdgTDjjcsWwiR7hp9mPdzmIw2He6wcm7BZ2nODFdAIWuAX1wQwX8PuB2CNzWjVgaY8=;
X-UUID: 33a9ca8e81ba40f6abb3964649fd63b5-20200730
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1709544602; Thu, 30 Jul 2020 05:30:20 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 06:30:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 21:30:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Jul 2020 21:30:16 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
Date: Thu, 30 Jul 2020 21:30:16 +0800
Message-ID: <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3BA704DB6C7DA6D467F870690FBF3F154F2185A65B7A8BB18CAA73AC904410942000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_093039_985610_9837DE42 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Andy Teng <andy.teng@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Loda Chou <loda.chou@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT6779 UART0 clock support.

Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/clk/mediatek/clk-mt6779.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 9766cccf5844..6e0d3a166729 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -919,6 +919,8 @@ static const struct mtk_gate infra_clks[] = {
 		    "pwm_sel", 19),
 	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm",
 		    "pwm_sel", 21),
+	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0",
+		    "uart_sel", 22),
 	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1",
 		    "uart_sel", 23),
 	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
