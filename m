Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBB5C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:06:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835CE222E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C2f4PJac";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TjEROr8w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835CE222E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vqDXv2SFvqvF/TiM0YcOryRTCcV2YCAnayPBsLvwLRs=; b=C2f4PJacLeHQbzo15GEV14dmk
	8KBVuvoi7Halljdrc4OA5tDG9E1gWGlQOy4V4XcpVIaLNxKrYYL6L1KKt98viGgI5vcsq/MfMqEaW
	LZjOhMOWV5VQWUAS9rbO/2RCs2SfqdaELhlykcP8TxtVO+vItHJGtZ51MxqD7v6hWE7kOQ3viXc8s
	qBWr+paPPn57BiyFEn4WDEVE1jgePjL0EKQLThl6qDrKohZwVSsTTfWmMuU4wrrnCPzdirFMceOHf
	UqaZPdGCcRQfajgRyL1dlTRL1MfkAULjfF9+IDMjlswMeqlgtOdKbuVAli/Fx/5B25JAspujnRJ3H
	t0TjIW2DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVaIL-0007nj-JJ; Thu, 22 Oct 2020 13:06:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa9u-0003Yu-9g; Thu, 22 Oct 2020 12:57:42 +0000
X-UUID: 1f136918fd314a848ff3a1e2f6048004-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mSGNi7l7L05+mSCj5St/FOgh02IS/xZLmuOXBQGmUtg=; 
 b=TjEROr8wuuwfI9meNab23rsgm/5i06J0LP2d5GeDkG5iDc2hFF8CYHPZPVHbhmrVgHJdFuJF7d8CoTEXs40KWKaG3OauPS1nWdq7d8Q7N407o6Ml6UDiZilbDqchGR0ydXTdH5lWXZ1KjmYmADO+3gxdwkkn4m/g36esK53yocQ=;
X-UUID: 1f136918fd314a848ff3a1e2f6048004-20201022
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 276558834; Thu, 22 Oct 2020 04:56:10 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:56:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:56:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:56:07 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 04/12] clk: mediatek: Clean up the pll_en_bit from en_mask on
 MT6779
Date: Thu, 22 Oct 2020 20:55:57 +0800
Message-ID: <1603371365-30863-5-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_085734_825374_C440C8E7 
X-CRM114-Status: GOOD (  10.76  )
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
 drivers/clk/mediatek/clk-mt6779.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 9766ccc..d8444ed 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1178,33 +1178,33 @@
 			_pcw_chg_reg, NULL)
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0200, 0x020C, BIT(0),
+	PLL(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0200, 0x020C, 0,
 	    PLL_AO, 0, 22, 8, 0x0204, 24, 0, 0, 0, 0x0204, 0, 0),
-	PLL(CLK_APMIXED_ARMPLL_BL, "armpll_bl", 0x0210, 0x021C, BIT(0),
+	PLL(CLK_APMIXED_ARMPLL_BL, "armpll_bl", 0x0210, 0x021C, 0,
 	    PLL_AO, 0, 22, 8, 0x0214, 24, 0, 0, 0, 0x0214, 0, 0),
-	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x02A0, 0x02AC, BIT(0),
+	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x02A0, 0x02AC, 0,
 	    PLL_AO, 0, 22, 8, 0x02A4, 24, 0, 0, 0, 0x02A4, 0, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0230, 0x023C, BIT(0),
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0230, 0x023C, 0,
 	    (HAVE_RST_BAR), BIT(24), 22, 8, 0x0234, 24, 0, 0, 0,
 	    0x0234, 0, 0),
-	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0240, 0x024C, BIT(0),
+	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0240, 0x024C, 0,
 	    (HAVE_RST_BAR), BIT(24), 22, 8, 0x0244, 24,
 	    0, 0, 0, 0x0244, 0, 0),
-	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x0250, 0x025C, BIT(0),
+	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x0250, 0x025C, 0,
 	    0, 0, 22, 8, 0x0254, 24, 0, 0, 0, 0x0254, 0, 0),
-	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0260, 0x026C, BIT(0),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0260, 0x026C, 0,
 	    0, 0, 22, 8, 0x0264, 24, 0, 0, 0, 0x0264, 0, 0),
-	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0270, 0x027C, BIT(0),
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0270, 0x027C, 0,
 	    0, 0, 22, 8, 0x0274, 24, 0, 0, 0, 0x0274, 0, 0),
-	PLL(CLK_APMIXED_ADSPPLL, "adsppll", 0x02b0, 0x02bC, BIT(0),
+	PLL(CLK_APMIXED_ADSPPLL, "adsppll", 0x02b0, 0x02bC, 0,
 	    (HAVE_RST_BAR), BIT(23), 22, 8, 0x02b4, 24,
 	    0, 0, 0, 0x02b4, 0, 0),
-	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0280, 0x028C, BIT(0),
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0280, 0x028C, 0,
 	    (HAVE_RST_BAR), BIT(23), 22, 8, 0x0284, 24,
 	    0, 0, 0, 0x0284, 0, 0),
-	PLL(CLK_APMIXED_APLL1, "apll1", 0x02C0, 0x02D0, BIT(0),
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x02C0, 0x02D0, 0,
 	    0, 0, 32, 8, 0x02C0, 1, 0, 0x14, 0, 0x02C4, 0, 0x2C0),
-	PLL(CLK_APMIXED_APLL2, "apll2", 0x02D4, 0x02E4, BIT(0),
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x02D4, 0x02E4, 0,
 	    0, 0, 32, 8, 0x02D4, 1, 0, 0x14, 1, 0x02D8, 0, 0x02D4),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
