Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A42BC388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 23:42:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E958F24650
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 23:42:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAhWLa6s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H5eAbHi9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E958F24650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ST4bgipN8sQqbSb2uyXXsciKUvYmmm32VN3HS7b5DKk=; b=nAhWLa6sdK5m8j+xL0H2Co0DG
	DxV6R7jWxDRqQoD7NaN+BGA+iXoE7kNgYYbK508tFwlj9V8p0MVZut41GyZ9EEQV43Xq93rMcHDDr
	/w75r3x3sNJW8QLIZNdgXVhNYVq5WfX0XUmJALYfNy7dgtJ2sEW+dkNXljZPUqIzx7y7sk7ClUVWd
	aF6FWU48dGIaBJjklfAX09hxMy+QUdNFnIX8bb8XxG/S6eKgMPl7bAc9aehHoEEN3DeZITzAmFO+D
	vcgMfA7gW84coZQM4ZDxPq6FUjjWaRSk2A2m1l6k9vW8pLGSlRsSIQnjioyZwgjUSIc3a+Myb6Xwy
	4vFhSnWow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVkDj-0005zJ-Gt; Thu, 22 Oct 2020 23:42:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa8f-0002vH-Bx; Thu, 22 Oct 2020 12:56:23 +0000
X-UUID: 6519f703c05b4ee5b42e0070ef578438-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wi2FfHDUviFWRGjbJAxecTKg5y6KMeXLiAAcMbDHRS8=; 
 b=H5eAbHi9UnHN3yqqAL8iwD9G1iuGrQK2Nz7blG7wpEyvw2vLZFGnBCyzc9D+BGkTWQM5j6YZ/3qnkEfbCz9KkF68vsqy49ewis9T4t5CcKvgC164LVFTqryaxfpnMHl0ChxpiAXNF6zoIeJHNY5cAaXUMHwvcEwvrzDwyqxiesE=;
X-UUID: 6519f703c05b4ee5b42e0070ef578438-20201022
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 6946869; Thu, 22 Oct 2020 04:56:10 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:56:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:56:07 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 01/12] clk: mediatek: Clean up the pll_en_bit from en_mask on
 MT2701
Date: Thu, 22 Oct 2020 20:55:54 +0800
Message-ID: <1603371365-30863-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_085617_607095_4D90947C 
X-CRM114-Status: GOOD (  11.41  )
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
 drivers/clk/mediatek/clk-mt2701.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 695be0f..462a998 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -934,31 +934,31 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	}
 
 static const struct mtk_pll_data apmixed_plls[] = {
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x200, 0x20c, 0x80000001,
+	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x200, 0x20c, 0x80000000,
 			PLL_AO, 21, 0x204, 24, 0x0, 0x204, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x210, 0x21c, 0xf0000001,
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x210, 0x21c, 0xf0000000,
 		  HAVE_RST_BAR, 21, 0x210, 4, 0x0, 0x214, 0),
-	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x220, 0x22c, 0xf3000001,
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x220, 0x22c, 0xf3000000,
 		  HAVE_RST_BAR, 7, 0x220, 4, 0x0, 0x224, 14),
-	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x230, 0x23c, 0x00000001, 0,
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x230, 0x23c, 0, 0,
 				21, 0x230, 4, 0x0, 0x234, 0),
-	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x240, 0x24c, 0x00000001, 0,
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x240, 0x24c, 0, 0,
 				21, 0x240, 4, 0x0, 0x244, 0),
-	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x250, 0x25c, 0x00000001, 0,
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x250, 0x25c, 0, 0,
 				21, 0x250, 4, 0x0, 0x254, 0),
-	PLL(CLK_APMIXED_AUD1PLL, "aud1pll", 0x270, 0x27c, 0x00000001, 0,
+	PLL(CLK_APMIXED_AUD1PLL, "aud1pll", 0x270, 0x27c, 0, 0,
 				31, 0x270, 4, 0x0, 0x274, 0),
-	PLL(CLK_APMIXED_TRGPLL, "trgpll", 0x280, 0x28c, 0x00000001, 0,
+	PLL(CLK_APMIXED_TRGPLL, "trgpll", 0x280, 0x28c, 0, 0,
 				31, 0x280, 4, 0x0, 0x284, 0),
-	PLL(CLK_APMIXED_ETHPLL, "ethpll", 0x290, 0x29c, 0x00000001, 0,
+	PLL(CLK_APMIXED_ETHPLL, "ethpll", 0x290, 0x29c, 0, 0,
 				31, 0x290, 4, 0x0, 0x294, 0),
-	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x2a0, 0x2ac, 0x00000001, 0,
+	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x2a0, 0x2ac, 0, 0,
 				31, 0x2a0, 4, 0x0, 0x2a4, 0),
-	PLL(CLK_APMIXED_HADDS2PLL, "hadds2pll", 0x2b0, 0x2bc, 0x00000001, 0,
+	PLL(CLK_APMIXED_HADDS2PLL, "hadds2pll", 0x2b0, 0x2bc, 0, 0,
 				31, 0x2b0, 4, 0x0, 0x2b4, 0),
-	PLL(CLK_APMIXED_AUD2PLL, "aud2pll", 0x2c0, 0x2cc, 0x00000001, 0,
+	PLL(CLK_APMIXED_AUD2PLL, "aud2pll", 0x2c0, 0x2cc, 0, 0,
 				31, 0x2c0, 4, 0x0, 0x2c4, 0),
-	PLL(CLK_APMIXED_TVD2PLL, "tvd2pll", 0x2d0, 0x2dc, 0x00000001, 0,
+	PLL(CLK_APMIXED_TVD2PLL, "tvd2pll", 0x2d0, 0x2dc, 0, 0,
 				21, 0x2d0, 4, 0x0, 0x2d4, 0),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
