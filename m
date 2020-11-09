Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A44EC5517A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:22:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF9A9206D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AqzzDLX6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S4JxHUL6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF9A9206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bOmO6no7esDzMDoyWt4pSYLgq0OnWBFUn5rQItzInn4=; b=AqzzDLX6RjnaYIIjC4zrV3p8x
	utsUTWy6K/Byg+Zsj/HF19s++XNOjKlEs0Mo/PZU062qPXu1y5D9vxLMsDa9zN7O5UoWRF9mx3pRi
	FgU30JpMcBLKN9WQ4s6PvtJL0HisvrCeeVO8c4p+5Cwa+hbRB9yYXZRjXc3eMW5O5oTmMBxQb2RSf
	2rCXHZBfrrgNx233DRB9W9OFvQGN413/M7tp//Fqh9MLB3iX2dtUZKuSfAOMGF2BDAmRLbRairN4W
	IffFhwizrPuqfYTUjDq2ghXYta7ehkhxLisNqKqrBFa5rf1Ko41XAS54o7QtHRgMnBc28ccp9tU8p
	oApj1vF/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwp2-00036V-7v; Mon, 09 Nov 2020 02:22:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwow-000336-Br; Mon, 09 Nov 2020 02:22:16 +0000
X-UUID: 2bf5e42fd1bd4b7d9030748e03b5e9dc-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=R7kQ4iyGnQIaE6lDrJpu7+mldNflg+ZXwJa13WTpe38=; 
 b=S4JxHUL6mSQvn7NCIq54KBFXp9yvI7Kx2BvrTagAJHxxZxw/kVhtJAKOYjWewQHSzgtNuAJukaMtspJFIYmLUzPxq9VO13Gjy+ZUrkyTsdfmaJasg6Q+Q4vJBgW1ezM+A5YzQl2S7S8UvB/vrki1oU9zuE9ji7++d6pycURRp5w=;
X-UUID: 2bf5e42fd1bd4b7d9030748e03b5e9dc-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 536718333; Sun, 08 Nov 2020 18:22:09 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:37 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 03/13] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT6765
Date: Mon, 9 Nov 2020 10:13:18 +0800
Message-ID: <1604888008-30555-4-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_212214_541945_DF25AE98 
X-CRM114-Status: GOOD (  12.25  )
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
 drivers/clk/mediatek/clk-mt6765.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index d77ea5a..ab2ff8f 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -747,26 +747,26 @@
 			_pcw_reg, _pcw_shift, NULL)	\
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL_L, "armpll_l", 0x021C, 0x0228, BIT(0),
+	PLL(CLK_APMIXED_ARMPLL_L, "armpll_l", 0x021C, 0x0228, 0,
 	    PLL_AO, 22, 8, 0x0220, 24, 0, 0, 0, 0x0220, 0),
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x020C, 0x0218, BIT(0),
+	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x020C, 0x0218, 0,
 	    PLL_AO, 22, 8, 0x0210, 24, 0, 0, 0, 0x0210, 0),
-	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x022C, 0x0238, BIT(0),
+	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x022C, 0x0238, 0,
 	    PLL_AO, 22, 8, 0x0230, 24, 0, 0, 0, 0x0230, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x023C, 0x0248, BIT(0),
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x023C, 0x0248, 0,
 	    (HAVE_RST_BAR | PLL_AO), 22, 8, 0x0240, 24, 0, 0, 0, 0x0240,
 	    0),
-	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x024C, 0x0258, BIT(0),
+	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x024C, 0x0258, 0,
 	    0, 22, 8, 0x0250, 24, 0, 0, 0, 0x0250, 0),
-	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x025C, 0x0268, BIT(0),
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x025C, 0x0268, 0,
 	    0, 22, 8, 0x0260, 24, 0, 0, 0, 0x0260, 0),
-	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x026C, 0x0278, BIT(0),
+	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x026C, 0x0278, 0,
 	    HAVE_RST_BAR, 22, 8, 0x0270, 24, 0, 0, 0, 0x0270, 0),
-	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x027C, 0x0288, BIT(0),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x027C, 0x0288, 0,
 	    0, 22, 8, 0x0280, 24, 0, 0, 0, 0x0280, 0),
-	PLL(CLK_APMIXED_APLL1, "apll1", 0x028C, 0x029C, BIT(0),
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x028C, 0x029C, 0,
 	    0, 32, 8, 0x0290, 24, 0x0040, 0x000C, 0, 0x0294, 0),
-	PLL(CLK_APMIXED_MPLL, "mpll", 0x02A0, 0x02AC, BIT(0),
+	PLL(CLK_APMIXED_MPLL, "mpll", 0x02A0, 0x02AC, 0,
 	    PLL_AO, 22, 8, 0x02A4, 24, 0, 0, 0, 0x02A4, 0),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
