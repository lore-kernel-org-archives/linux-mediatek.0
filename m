Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3E8C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:23:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0753F206E3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C5s1+BDo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TzwXVvWL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0753F206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7KV1eFWDO723mlsBDIGjkNZmXUWMaPOaUuagLAOryO4=; b=C5s1+BDos8UXY6xOA5hXU8BXC
	GJMARuMfCaIXK8V22cUEm5QcA7k6oVbkHIBztWtBkGOdEBb6FWydM7ZaQn6BcyYuhFJP0k5mKf0ce
	MaBZoGhBJeDdYM2CV97cmbYoX2O/CCw0Ave2FeUwdgK+2MjTeW8Sb/W+gdAWTM/SOp6Ibuo7w8CBN
	aRHiKCdpmeE7viC9m1qpdUZHhiuxyX60AiD2UeUNrrT5hoaZFiu+soTgh2FUF7xVtwbDEm8ZKLdsu
	WtDJQqeQ0FH3koPMYsiagGztTcENtofdsKx7u3JlAlgQHWTC6v8Ka3DLCnHM2hThzwUwwjFM8iw97
	l2/2Z5jcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwpk-0003O3-8v; Mon, 09 Nov 2020 02:23:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwp3-000336-JK; Mon, 09 Nov 2020 02:22:23 +0000
X-UUID: d2ddf173700246f39d55947f8f514ee0-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=w61CFNaGLH0hjI+CBsp+FXs3bqb0Iytunpyrf4ubk20=; 
 b=TzwXVvWLYYbXnT6ATHH/Xlp6K/A7r+o9eNCOPCzGkzNTctl31Kgq/gqIB85gQUeSIkJVJJ0Q4+23UvYX35sRWtBlverh8UqksrnjdvaRwCnMRwsaPWWAazqW1bsDINZbmt2am0YihHNWjVdQhtUz20VYR9A1ql8qrBadfNAE7ig=;
X-UUID: d2ddf173700246f39d55947f8f514ee0-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1473094825; Sun, 08 Nov 2020 18:22:09 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:46 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:44 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 09/13] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT8167
Date: Mon, 9 Nov 2020 10:13:24 +0800
Message-ID: <1604888008-30555-10-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_212221_839847_F1911C20 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

remove pll_en_bit(bit0) from en_mask to make en_mask a pure en_mask
that only used for pll dividers.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index e5ea10e..180e24a 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -1016,21 +1016,21 @@ static void __init mtk_infracfg_init(struct device_node *node)
 };
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0100, 0x0110, 0x00000001, 0,
+	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0100, 0x0110, 0, 0,
 		21, 0x0104, 24, 0, 0x0104, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0120, 0x0130, 0x00000001,
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0120, 0x0130, 0,
 		HAVE_RST_BAR, 21, 0x0124, 24, 0, 0x0124, 0),
-	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0140, 0x0150, 0x30000001,
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0140, 0x0150, 0x30000000,
 		HAVE_RST_BAR, 7, 0x0144, 24, 0, 0x0144, 0),
-	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0160, 0x0170, 0x00000001, 0,
+	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0160, 0x0170, 0, 0,
 		21, 0x0164, 24, 0, 0x0164, 0, mmpll_div_table),
-	PLL(CLK_APMIXED_APLL1, "apll1", 0x0180, 0x0190, 0x00000001, 0,
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x0180, 0x0190, 0, 0,
 		31, 0x0180, 1, 0x0194, 0x0184, 0),
-	PLL(CLK_APMIXED_APLL2, "apll2", 0x01A0, 0x01B0, 0x00000001, 0,
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x01A0, 0x01B0, 0, 0,
 		31, 0x01A0, 1, 0x01B4, 0x01A4, 0),
-	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x01C0, 0x01D0, 0x00000001, 0,
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x01C0, 0x01D0, 0, 0,
 		21, 0x01C4, 24, 0, 0x01C4, 0),
-	PLL(CLK_APMIXED_LVDSPLL, "lvdspll", 0x01E0, 0x01F0, 0x00000001, 0,
+	PLL(CLK_APMIXED_LVDSPLL, "lvdspll", 0x01E0, 0x01F0, 0, 0,
 		21, 0x01E4, 24, 0, 0x01E4, 0),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
