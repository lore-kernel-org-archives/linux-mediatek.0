Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8506C433E4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 12:58:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AB3208B8
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 12:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2lC7Jesw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="frxiHNXJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AB3208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iii16bHVTPRTmRGFAvtpkwUPwlgSDy7uMzwAdbnxXME=; b=2lC7JeswvHveW3MKmykaomM1f
	wL/IRU3jURDfSb2KE3UkhlePzgnBmaoMuMeMcHbiL+xCDBJ1tiYsPeIp/Wwj1QaCc6fRYhhP2TJE2
	x2bVUzMwQGXornvUecY5lccVMnowVqZ+41P/KR6mbJ8YxCF67Q5iNFM8NjLHhWRvQhVx3wLb7udpl
	BMhhfWxggNulK8o6jTpKKj5ZxokAuTNDcdkhYW7h7ldKngHoBzHczN/geE2Yl0tdyHUk6cCHvL+FZ
	yj8E+AEH3m4xbff31LbtJJQ7+9n+dJRaOdfzAi4favV3KnHTMCcMAPE7tgeyZculvsoyrbtVStxYn
	s6XXNTvHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqymj-0007N8-Vi; Thu, 02 Jul 2020 12:57:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqymZ-0007Gq-5S; Thu, 02 Jul 2020 12:57:40 +0000
X-UUID: b27dc24ade734e128248ba872907516f-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=raRNsu9byZBHDzYCxjWLVEnVGhHYBvlatRQc7UZLxyk=; 
 b=frxiHNXJSvBWy2yQscEEJgR2zoy7r9sQ/aqv/sJJonfnsOdMcnhx7eolJsUi3N7kGgN6lFVvJC4CWwgTevi7V7Or59IkHVmSA74P4NwJtAPwfOWghIiL0+8rusm3tLr5XsJNGFyruEjrQMurVfJQ+I+KkjuDzLtZybsstfh1pVA=;
X-UUID: b27dc24ade734e128248ba872907516f-20200702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 22029132; Thu, 02 Jul 2020 04:57:23 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 05:57:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 20:57:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Jul 2020 20:57:26 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH v7 6/7] clk: mediatek: add UART0 clock support
Date: Thu, 2 Jul 2020 20:57:09 +0800
Message-ID: <1593694630-26604-8-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5913775F9D7C5787756D71C66F43D079A3B204BE6CE65BC875C068193B96F5CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_085739_366148_62C022DE 
X-CRM114-Status: GOOD (  10.48  )
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
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT6779 UART0 clock support.

Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt6779.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 9766ccc..6e0d3a1 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -919,6 +919,8 @@
 		    "pwm_sel", 19),
 	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm",
 		    "pwm_sel", 21),
+	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0",
+		    "uart_sel", 22),
 	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1",
 		    "uart_sel", 23),
 	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
