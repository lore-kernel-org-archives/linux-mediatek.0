Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D46C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:44:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8AD207D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:44:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H4HNhJ57";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sHbQ/xTd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C8AD207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Op6Jt0VIePYkbsu9HuwdVnqxm2NGUipzK6/XhVMzDJs=; b=H4HNhJ578NY/mC
	WGPPgVjGQMbws8O1kWiEQ01iIOydWrm5BcHypaJ33zHRHM+yUOTRGax9JDBjLU6XtL7fN8hiiSPI4
	MSmF4wtBrrlNal/YHvgCSBovfxCvQs2TzgdWHP5C/9vS4FJVWxa4Zax21rsyMZf7q1Bd5dvdpqn1a
	rVOrjR+kNg0VHAvNvBAlSKe1cUVXrHq6I0mJ0v+S+DrxfS4r8hJk0vofHGiGL5ll+UUa+9zkesDIC
	in8YpT6b4895ozL2s8HiOHLwm0vbEcTSikn1Uylnu1G8MMVVI26ciGCHl5uzEhLxlOfC8Q46knBVn
	xBARlunztZkJR9n+RQhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlsyM-000880-Lt; Thu, 18 Jun 2020 11:44:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlsxl-0007Jp-HW; Thu, 18 Jun 2020 11:44:10 +0000
X-UUID: ace47a543cad4369b23ece3e9d6766d5-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x+yhsVMil1EiA17Zrkn38qhTWyswuL0rzxglJr9tsjs=; 
 b=sHbQ/xTdUa7cf9TnlKCE4vPS/Hh78/uF/W7/4+oKcCWL8vxUIpa1i+nBn6oPTt1d2zFBUGQJaKsJTcU4cmdJOo4Qyjk9tzIvlx7i0SWJXdI9ofP/pQhTso5+GtW56yJLzbXyyHzUYHfmAIXTW0cRYdxCM37n/SlJaOkdtjxyrNg=;
X-UUID: ace47a543cad4369b23ece3e9d6766d5-20200618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1080512499; Thu, 18 Jun 2020 03:43:55 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 04:34:10 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 19:34:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Jun 2020 19:34:02 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH v6 6/7] clk: mediatek: add UART0 clock support
Date: Thu, 18 Jun 2020 19:33:37 +0800
Message-ID: <1592480018-3340-7-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB95E0EE193F82EDDAB6AE7DE289638071D94AEE1E98FE6F6EB8A722D1B67CE12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_044409_583706_C6F9105F 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT6779 UART0 clock support.

Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
Signed-off-by: mtk01761 <wendell.lin@mediatek.com>
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
