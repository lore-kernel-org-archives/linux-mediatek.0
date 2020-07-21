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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F739C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 05:41:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10C720792
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 05:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AULXflxG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JD2UIFk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10C720792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NkNdHSZ8SCN4tdV4XUYecb8htIfbgQZ9u8ykRqv3eAo=; b=AULXflxGAgWK6Rs0TXiXC8imA
	kEe62EdZ3GBkVJNhI+nSEv0cEsIMb56HaLirpOHT9HJj5GtNuQtbCSEZJGPot5vDj907Y/hMXzk23
	k9EfJ5IhMypPBBFSja8gFdZ5xCG4Ut5HV/gx74xO7ZrTVq3sqCxvWMuw4j0VL/A1ayTmRmcAfC/3/
	Eo/LQQGw9bGTJIp0o2YCIT7/EmB7nx2wYAg4FcoYsjz/maB8ohC2qDL99VNQk+Z+By7aRLfkEhnXK
	9eEpS+Y8+/PRWF5y3kX72wM3/+CTQKA6cSPMhNkMp2A4AWI5ReUiRwyNvpzttdFZira5GnyPMhYIT
	2I7ytEX2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxl1X-0004di-7M; Tue, 21 Jul 2020 05:41:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxl1N-0004aA-JR; Tue, 21 Jul 2020 05:40:59 +0000
X-UUID: a41a4e0b7b4a4ebfbee4267e2434c187-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=r1JvQq55o9JWsO0xHx5gj1UaxvorN44u2V1IJpLE4Ow=; 
 b=JD2UIFk+9YfH90ji/NS7zQ+OZJ4vVQZ7AWlqJF8KrZ1qgLliII4J5Om1zY9vIzNJFA6mfEgGIrFMl8/VQ5OBTip28qi1zicLyoWgwFrnxJV90FKUVHzEhYE/PlZvHx5QqS02+sNLS8WR5SNB+HqVUQW6xScH+A3ralSObw3CLPA=;
X-UUID: a41a4e0b7b4a4ebfbee4267e2434c187-20200720
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1907051967; Mon, 20 Jul 2020 21:40:36 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 22:40:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 13:40:35 +0800
Received: from mtkslt209.mediatek.inc (10.21.15.96) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 13:40:35 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH 2/2] clk: mediatek: remove UART3 clock support
Date: Tue, 21 Jul 2020 13:40:33 +0800
Message-ID: <20200721054033.18520-3-hanks.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200721054033.18520-1-hanks.chen@mediatek.com>
References: <20200721054033.18520-1-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 260778E1BAA8E2DC087EAC720C4C06B45F5F973202C578C7CC33AA0E0F17F9CE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_014057_823126_4D9F5862 
X-CRM114-Status: GOOD (  10.09  )
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

Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
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
