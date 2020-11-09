Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CE6C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:23:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E528206CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:23:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CiG94WRK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nJ0oeEUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E528206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IgSL2zoMWV+SSYrBAW+05y2qyYAOOjSiHe6xu8s+E2U=; b=CiG94WRKz/tvw9e3h/tvWcemq
	Nd+HPFOopqRd2p/29isrN7r6uUmsDTLdQTqwaZKnKnpTYAPVcBDqIkkIQBQQ6O1DekFH4Ae9+KVoE
	64O70OZzjIW5HHBtLUlogmIo5TgLCNUw/oyAQp10tigIOZ2O3iDtjyfwnLy+ge26p+tJX+qQ5efVu
	oTwSUx8Mt2h/apkvwJ23WXSOsYUu6Wi8YaEIrx9FMaIlolnPHBD4Vcaf9SwqurqkaXSd0IzsPfpF4
	XvFtt8uKYH82HDRrmyUPEPYu8ql3spB2Nm+o1EvDVYK7IQphIucX9U8mpX8GbdE4pY90dfB15lo16
	zB057EP0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwpp-0003Q1-CM; Mon, 09 Nov 2020 02:23:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwp3-00032o-NF; Mon, 09 Nov 2020 02:22:23 +0000
X-UUID: 53612f792d304b90a731a4c393115163-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xfFFhc2gV/OgD18gox/0R0iq1oeGZPhA6hnB/jP1lj8=; 
 b=nJ0oeEUN2VZV/wqDItiHwDqSNPjFyoLxD2d9EDZttC2fsVCJika2XnOrcaWBIzeYQ9143Y/sZIphpFEZdpb/dPpsHvegVnOSin/qt+EAe6fkK2e8qe849nGsJkEd4saYqjy+bsgnHA7r5suLP96iAzzZx/+hrcp9jlmiJH4EDlk=;
X-UUID: 53612f792d304b90a731a4c393115163-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 263290714; Sun, 08 Nov 2020 18:22:09 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:37 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 05/13] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT6797
Date: Mon, 9 Nov 2020 10:13:20 +0800
Message-ID: <1604888008-30555-6-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_212221_997188_747C27DA 
X-CRM114-Status: GOOD (  12.70  )
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
 drivers/clk/mediatek/clk-mt6797.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index 428eb24..32f46e7 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -634,25 +634,25 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 			NULL)
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0xF0000101, PLL_AO,
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0xF0000100, PLL_AO,
 	    21, 0x220, 4, 0x0, 0x224, 0),
-	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0230, 0x023C, 0xFE000011, 0, 7,
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0230, 0x023C, 0xFE000010, 0, 7,
 	    0x230, 4, 0x0, 0x234, 14),
-	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0x00000101, 0, 21,
+	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0x00000100, 0, 21,
 	    0x244, 24, 0x0, 0x244, 0),
-	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0x00000121, 0, 21,
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0x00000120, 0, 21,
 	    0x250, 4, 0x0, 0x254, 0),
-	PLL(CLK_APMIXED_IMGPLL, "imgpll", 0x0260, 0x026C, 0x00000121, 0, 21,
+	PLL(CLK_APMIXED_IMGPLL, "imgpll", 0x0260, 0x026C, 0x00000120, 0, 21,
 	    0x260, 4, 0x0, 0x264, 0),
-	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0270, 0x027C, 0xC0000121, 0, 21,
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0270, 0x027C, 0xC0000120, 0, 21,
 	    0x270, 4, 0x0, 0x274, 0),
-	PLL(CLK_APMIXED_CODECPLL, "codecpll", 0x0290, 0x029C, 0x00000121, 0, 21,
+	PLL(CLK_APMIXED_CODECPLL, "codecpll", 0x0290, 0x029C, 0x00000120, 0, 21,
 	    0x290, 4, 0x0, 0x294, 0),
-	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x02E4, 0x02F0, 0x00000121, 0, 21,
+	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x02E4, 0x02F0, 0x00000120, 0, 21,
 	    0x2E4, 4, 0x0, 0x2E8, 0),
-	PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0x00000131, 0, 31,
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0x00000130, 0, 31,
 	    0x2A0, 4, 0x2A8, 0x2A4, 0),
-	PLL(CLK_APMIXED_APLL2, "apll2", 0x02B4, 0x02C4, 0x00000131, 0, 31,
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x02B4, 0x02C4, 0x00000130, 0, 31,
 	    0x2B4, 4, 0x2BC, 0x2B8, 0),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
