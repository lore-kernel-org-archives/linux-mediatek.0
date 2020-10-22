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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B71C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 22:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EA7223C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 22:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a+aNMLcO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XI2B/jfz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9EA7223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3k3dQhJXOz5TXJJuETqL32Wv9UFcBluUirXoIAfu090=; b=a+aNMLcOUoDsJCtttn1ndyQW5
	WOGjcLkZc4liob6e2dQvgRmdu03FJ4jPwj5GN5j4kCBfRlzqW0jW+WZta1HYYgObgghQxOeqfNF0I
	I/ieR9J6s5ukah7znyP+KyShBVzuXQHpp0RvL+lSXEuSv+5BPro4v6Boi1BAEZIDiWoRe7G1rucEH
	kXf9PP8LgTIc0a7OOlSNM+tHdXvWSukNGUS3Z+aRtoQ/rDgoUEj63WgsLeos6Gn+HhXmGfmCnerI5
	/LDbAtoH2RpdBdxUXFKFk5lOjMlIvjQSd2DZT8FxY4w1p7TxG8GMcH6XzCM8maZcazJl5KFc1jAIw
	kIdAGnYMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVjFC-0000K8-FV; Thu, 22 Oct 2020 22:39:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa8s-0002vH-0s; Thu, 22 Oct 2020 12:56:33 +0000
X-UUID: cee6c73f134c456d875f19c21cc63b22-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KWoaUsgI+zjVJXwTc8Wv7WIGoNFF40Fig+xVi6bBjS0=; 
 b=XI2B/jfzFFpOAKac1exSQWqG3PDu46FAo9Pvxu9ZuCmOIumVj8FwvoxAw6oatEh7V4DyQ/c7lteJqHD/TO+VeKd+gY7R8LOdAVb61qHk4iG0g6HCPJlbe9imANEutzmUANaqE4rzCYyIARGoqUKWet2sKdFi6U5GTxG2tpEKdv4=;
X-UUID: cee6c73f134c456d875f19c21cc63b22-20201022
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1308705746; Thu, 22 Oct 2020 04:56:10 -0800
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
Subject: [PATCH 02/12] clk: mediatek: Clean up the pll_en_bit from en_mask on
 MT2712
Date: Thu, 22 Oct 2020 20:55:55 +0800
Message-ID: <1603371365-30863-3-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_085630_470675_3CEECEB7 
X-CRM114-Status: GOOD (  11.24  )
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
 drivers/clk/mediatek/clk-mt2712.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index a3bd9a1..fd81162 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1222,38 +1222,38 @@
 };
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0230, 0x023C, 0xf0000101,
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0230, 0x023C, 0xf0000100,
 		HAVE_RST_BAR, 31, 0x0230, 4, 0, 0, 0, 0x0234, 0),
-	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0240, 0x024C, 0xfe000101,
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0240, 0x024C, 0xfe000100,
 		HAVE_RST_BAR, 31, 0x0240, 4, 0, 0, 0, 0x0244, 0),
-	PLL(CLK_APMIXED_VCODECPLL, "vcodecpll", 0x0320, 0x032C, 0xc0000101,
+	PLL(CLK_APMIXED_VCODECPLL, "vcodecpll", 0x0320, 0x032C, 0xc0000100,
 		0, 31, 0x0320, 4, 0, 0, 0, 0x0324, 0),
-	PLL(CLK_APMIXED_VENCPLL, "vencpll", 0x0280, 0x028C, 0x00000101,
+	PLL(CLK_APMIXED_VENCPLL, "vencpll", 0x0280, 0x028C, 0x00000100,
 		0, 31, 0x0280, 4, 0, 0, 0, 0x0284, 0),
-	PLL(CLK_APMIXED_APLL1, "apll1", 0x0330, 0x0340, 0x00000101,
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x0330, 0x0340, 0x00000100,
 		0, 31, 0x0330, 4, 0x0338, 0x0014, 0, 0x0334, 0),
-	PLL(CLK_APMIXED_APLL2, "apll2", 0x0350, 0x0360, 0x00000101,
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x0350, 0x0360, 0x00000100,
 		0, 31, 0x0350, 4, 0x0358, 0x0014, 1, 0x0354, 0),
-	PLL(CLK_APMIXED_LVDSPLL, "lvdspll", 0x0370, 0x037c, 0x00000101,
+	PLL(CLK_APMIXED_LVDSPLL, "lvdspll", 0x0370, 0x037c, 0x00000100,
 		0, 31, 0x0370, 4, 0, 0, 0, 0x0374, 0),
-	PLL(CLK_APMIXED_LVDSPLL2, "lvdspll2", 0x0390, 0x039C, 0x00000101,
+	PLL(CLK_APMIXED_LVDSPLL2, "lvdspll2", 0x0390, 0x039C, 0x00000100,
 		0, 31, 0x0390, 4, 0, 0, 0, 0x0394, 0),
-	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0270, 0x027C, 0x00000101,
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0270, 0x027C, 0x00000100,
 		0, 31, 0x0270, 4, 0, 0, 0, 0x0274, 0),
-	PLL(CLK_APMIXED_MSDCPLL2, "msdcpll2", 0x0410, 0x041C, 0x00000101,
+	PLL(CLK_APMIXED_MSDCPLL2, "msdcpll2", 0x0410, 0x041C, 0x00000100,
 		0, 31, 0x0410, 4, 0, 0, 0, 0x0414, 0),
-	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0290, 0x029C, 0xc0000101,
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0290, 0x029C, 0xc0000100,
 		0, 31, 0x0290, 4, 0, 0, 0, 0x0294, 0),
-	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0250, 0x0260, 0x00000101,
+	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0250, 0x0260, 0x00000100,
 		0, 31, 0x0250, 4, 0, 0, 0, 0x0254, 0,
 		mmpll_div_table),
-	PLL_B(CLK_APMIXED_ARMCA35PLL, "armca35pll", 0x0100, 0x0110, 0xf0000101,
+	PLL_B(CLK_APMIXED_ARMCA35PLL, "armca35pll", 0x0100, 0x0110, 0xf0000100,
 		HAVE_RST_BAR, 31, 0x0100, 4, 0, 0, 0, 0x0104, 0,
 		armca35pll_div_table),
-	PLL_B(CLK_APMIXED_ARMCA72PLL, "armca72pll", 0x0210, 0x0220, 0x00000101,
+	PLL_B(CLK_APMIXED_ARMCA72PLL, "armca72pll", 0x0210, 0x0220, 0x00000100,
 		0, 31, 0x0210, 4, 0, 0, 0, 0x0214, 0,
 		armca72pll_div_table),
-	PLL(CLK_APMIXED_ETHERPLL, "etherpll", 0x0300, 0x030C, 0xc0000101,
+	PLL(CLK_APMIXED_ETHERPLL, "etherpll", 0x0300, 0x030C, 0xc0000100,
 		0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
