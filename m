Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B647C63798
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:15:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96C46206D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UuF5v0yR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NKVln1wv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96C46206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PTUdIUQLNDjlW2MaCpR2Fk8D//uQQaCBVn1IlW5ujWw=; b=UuF5v0yRnflOLz81vfwRLQsIW
	eQYpGtW4nRbfCF9uQ+85gPcRpSKBwMWfXa+n4a3/NuMIQxmqGXisOmV5pcmOybGwh6RtVr9B/knuJ
	zhCkBH7NGPz/1fT+Ujbh1lpEHXMoeTCnaoI/RnYfazyEhJqDtYdjlEzj3ENZ33kZwQosu22cyswep
	92Jb0LtlqPszHFNvoh6gMPDW3ysLjcBco9TE4cFmOd03tIlB1x8qlVGTzJdn5ff9mRQSqRtpdh1fK
	BvtZ/40ilbGKWuSeqB2baDjyVnaRpUak/hp+r9DBNtNjpMwNhggaTSPfdt2VZjzQFokkPjoxqSnis
	U3ojPO59A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwiH-0007LL-Ix; Mon, 09 Nov 2020 02:15:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwh6-0006f7-Qn; Mon, 09 Nov 2020 02:14:11 +0000
X-UUID: 6a14af61ad274907a780fe5377ffacef-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EUkS5vMfyxWNPzqJNif1jjSdSlifFVaP4B0ZERrWUm4=; 
 b=NKVln1wvqb29v078sikiS8YZjefEI6nBgITYiubc4kYYIL5t38j+49VejwwNUZXred9H0AMqY/oq4/UcZhsB4m3+PnOP4eAL9A0NP80t6xQy79XWl0e852K4hRqEeMz6YMp2TqoQAn5hNpHEVrqsnxAZ17+C6Si0fncerHXS1xc=;
X-UUID: 6a14af61ad274907a780fe5377ffacef-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 203685673; Sun, 08 Nov 2020 18:13:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:39 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:37 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 06/13] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT7622
Date: Mon, 9 Nov 2020 10:13:21 +0800
Message-ID: <1604888008-30555-7-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_211409_087117_50FD6F22 
X-CRM114-Status: GOOD (  12.27  )
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
 drivers/clk/mediatek/clk-mt7622.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index ef5947e1..2fdb27a 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -328,23 +328,23 @@
 };
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x00000001,
+	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0,
 	    PLL_AO, 21, 0x0204, 24, 0, 0x0204, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0210, 0x021C, 0x00000001,
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0210, 0x021C, 0,
 	    HAVE_RST_BAR, 21, 0x0214, 24, 0, 0x0214, 0),
-	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0220, 0x022C, 0x00000001,
+	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0220, 0x022C, 0,
 	    HAVE_RST_BAR, 7, 0x0224, 24, 0, 0x0224, 14),
-	PLL(CLK_APMIXED_ETH1PLL, "eth1pll", 0x0300, 0x0310, 0x00000001,
+	PLL(CLK_APMIXED_ETH1PLL, "eth1pll", 0x0300, 0x0310, 0,
 	    0, 21, 0x0300, 1, 0, 0x0304, 0),
-	PLL(CLK_APMIXED_ETH2PLL, "eth2pll", 0x0314, 0x0320, 0x00000001,
+	PLL(CLK_APMIXED_ETH2PLL, "eth2pll", 0x0314, 0x0320, 0,
 	    0, 21, 0x0314, 1, 0, 0x0318, 0),
-	PLL(CLK_APMIXED_AUD1PLL, "aud1pll", 0x0324, 0x0330, 0x00000001,
+	PLL(CLK_APMIXED_AUD1PLL, "aud1pll", 0x0324, 0x0330, 0,
 	    0, 31, 0x0324, 1, 0, 0x0328, 0),
-	PLL(CLK_APMIXED_AUD2PLL, "aud2pll", 0x0334, 0x0340, 0x00000001,
+	PLL(CLK_APMIXED_AUD2PLL, "aud2pll", 0x0334, 0x0340, 0,
 	    0, 31, 0x0334, 1, 0, 0x0338, 0),
-	PLL(CLK_APMIXED_TRGPLL, "trgpll", 0x0344, 0x0354, 0x00000001,
+	PLL(CLK_APMIXED_TRGPLL, "trgpll", 0x0344, 0x0354, 0,
 	    0, 21, 0x0344, 1, 0, 0x0348, 0),
-	PLL(CLK_APMIXED_SGMIPLL, "sgmipll", 0x0358, 0x0368, 0x00000001,
+	PLL(CLK_APMIXED_SGMIPLL, "sgmipll", 0x0358, 0x0368, 0,
 	    0, 21, 0x0358, 1, 0, 0x035C, 0),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
