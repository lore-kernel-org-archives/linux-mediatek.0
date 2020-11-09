Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CECC388F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:23:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C696206CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u5bdgp8a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S6mAJT5E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C696206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RO9oyhhEOYA6gw5BgY/CYWJTCFXnhgIrPH7A/ozg4i8=; b=u5bdgp8aznGPWKUNUehcE1PUf
	aBiytYKES+ElIed9B80DUrIJUw2uhurLwNpyBiKsoAaqdPFjEiDU1mBj/U3Y6y/2xOiDxPko5enVo
	udSV5brRQr+wWeeNt1Rl8u351YqjYKvsUTxThNq7AoPf6pXSMieMSyX4yxA0UGvE26ZbJ0Eo1kxGL
	nirFFPxnJhdQ2yvgRZqDn71CYPdSB/WP1kaQD3ZBC60umjxVOcKg710zCvaZb/KWdXZwqcTJSZQbm
	oTAWFiizPxMLomb7zQQSkc3HqzxzfrsAVFso4Qb1OcwO3segc4x8wHmJNnzqAXEz/Ui5xhyT1OMoe
	IrAFJuEQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwpe-0003KI-7L; Mon, 09 Nov 2020 02:22:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwp0-00032o-Ga; Mon, 09 Nov 2020 02:22:21 +0000
X-UUID: c7a7216fc26d4689a0d5a70f91f10e4d-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EwpeqP52K3ZSx+ruSt6bPmBj7eBSE0Npgc0sGXbT4jw=; 
 b=S6mAJT5EZBBiKc2Ta0WHjc/5ehwfQ2ZpIcB8ZQdYIiujiY7dyXyzU0fKI6EC0GgdKctVUTr1xB1axQyUDfzE2jyE828nN5egJHKOY+npJl6QKNrD6VR5HZY602LpLVTN54EX3+rkxA9rJzzFqb5KXF1RwKdjmqBTVbC9iNdHChA=;
X-UUID: c7a7216fc26d4689a0d5a70f91f10e4d-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1941513767; Sun, 08 Nov 2020 18:22:09 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:46 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:45 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 11/13] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT8183
Date: Mon, 9 Nov 2020 10:13:26 +0800
Message-ID: <1604888008-30555-12-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_212218_859893_89CE9E68 
X-CRM114-Status: GOOD (  12.05  )
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
 drivers/clk/mediatek/clk-mt8183.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 5046852..608108c 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1121,34 +1121,34 @@
 };
 
 static const struct mtk_pll_data plls[] = {
-	PLL_B(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0200, 0x020C, 0x00000001,
+	PLL_B(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0200, 0x020C, 0,
 		HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0204, 24, 0x0, 0x0, 0,
 		0x0204, 0, 0, armpll_div_table),
-	PLL_B(CLK_APMIXED_ARMPLL_L, "armpll_l", 0x0210, 0x021C, 0x00000001,
+	PLL_B(CLK_APMIXED_ARMPLL_L, "armpll_l", 0x0210, 0x021C, 0,
 		HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0214, 24, 0x0, 0x0, 0,
 		0x0214, 0, 0, armpll_div_table),
-	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0290, 0x029C, 0x00000001,
+	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0290, 0x029C, 0,
 		HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0294, 24, 0x0, 0x0, 0,
 		0x0294, 0, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0x00000001,
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0,
 		HAVE_RST_BAR, BIT(24), 22, 8, 0x0224, 24, 0x0, 0x0, 0,
 		0x0224, 0, 0),
-	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0230, 0x023C, 0x00000001,
+	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0230, 0x023C, 0,
 		HAVE_RST_BAR, BIT(24), 22, 8, 0x0234, 24, 0x0, 0x0, 0,
 		0x0234, 0, 0),
-	PLL_B(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0x00000001,
+	PLL_B(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0,
 		0, 0, 22, 8, 0x0244, 24, 0x0, 0x0, 0, 0x0244, 0, 0,
 		mfgpll_div_table),
-	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0x00000001,
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0,
 		0, 0, 22, 8, 0x0254, 24, 0x0, 0x0, 0, 0x0254, 0, 0),
-	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0260, 0x026C, 0x00000001,
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0260, 0x026C, 0,
 		0, 0, 22, 8, 0x0264, 24, 0x0, 0x0, 0, 0x0264, 0, 0),
-	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0270, 0x027C, 0x00000001,
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0270, 0x027C, 0,
 		HAVE_RST_BAR, BIT(23), 22, 8, 0x0274, 24, 0x0, 0x0, 0,
 		0x0274, 0, 0),
-	PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0x00000001,
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0,
 		0, 0, 32, 8, 0x02A0, 1, 0x02A8, 0x0014, 0, 0x02A4, 0, 0x02A0),
-	PLL(CLK_APMIXED_APLL2, "apll2", 0x02b4, 0x02c4, 0x00000001,
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x02b4, 0x02c4, 0,
 		0, 0, 32, 8, 0x02B4, 1, 0x02BC, 0x0014, 1, 0x02B8, 0, 0x02B4),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
