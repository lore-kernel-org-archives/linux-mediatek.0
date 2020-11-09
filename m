Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A57BC56202
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:15:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A8E206E3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QzzUDNC4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tZr/46No"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A8E206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tRgP0NwFykM3PPSYJs84or5N0UekgyhDiJJnMfd8pMk=; b=QzzUDNC4WTbdWreH2Z2VzkEeW
	el5mQNPryRowB+yK3HJL8it8vea2AuCbNECRIimrJL9LXOZvfvR/efaHHLR67FYzyZ4VhsDLjEEls
	b/ETei4V2oBmD99B/wOsnqE2W9VcpHtqv9Yz8C7XlJG3N4N0w4KnbjJcxOdB8UD6OCu0yU3wWn8OX
	F6L5UrLi82GtcT+c21tlYxzJAKjbK1wvI5rxGWtp5pUhzWLf0I8eruhvregcRomGSCa2sZ96BJUus
	ClkVPi+A2ebA07ZlmXa10VrbsPB0TmkXqhzqcPCADVbHza6Sv8RgVcbahgGHDpSWHkuYzyD1Q+wXa
	DUNne1cLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwi6-0007Cl-Lr; Mon, 09 Nov 2020 02:15:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwh3-0006fG-GV; Mon, 09 Nov 2020 02:14:08 +0000
X-UUID: 9b613b7e1cc6463db48aac07d8769719-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FKhZuwpPHP3D4MgABPAntEpB83EFCx5rbahAxeXDleI=; 
 b=tZr/46NozoS/5gzw68mkGlCgpiScF4msnYbQI5JMFru4hjeIKjxrk+MczG6Q9ETyug41I04yPavWsM7nKzRBT6pa7KbnO5QFf0bc+nivzuOfnP6TShrRUvULGApa+TZVP2yCUYSHCDNrEusI5zPABptnSO9NcIzG+Wha5RmdVJI=;
X-UUID: 9b613b7e1cc6463db48aac07d8769719-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 614110955; Sun, 08 Nov 2020 18:13:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:37 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 04/13] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT6779
Date: Mon, 9 Nov 2020 10:13:19 +0800
Message-ID: <1604888008-30555-5-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_211406_084988_DC51FBC1 
X-CRM114-Status: GOOD (  11.97  )
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
index 6e0d3a1..89e1bd4 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1180,33 +1180,33 @@
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
