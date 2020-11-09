Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7B1C61DD8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:15:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F66207BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UXI3u/Iu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eTJjZYS+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F66207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3k3dQhJXOz5TXJJuETqL32Wv9UFcBluUirXoIAfu090=; b=UXI3u/IuZDmGcpsgxeKySA5za
	0MKLR46va557rXKXRAi7CX9vsa0o/7vW2sXgrm/7X5dZdW4VTYvRlFO2NqNve3D+/z1y1LHUeFwH4
	qeSMidmyPLjk5rA/PAJzmtlunEWF+qXIuF/ql4eLfNTEHEAiVK/4Y30DW8Ocea37tBshizzyEQgAV
	tOaE7h5GarP5jdWqJ7/l3Dxb/bEMiyBc2mBncVCL85BwZ+zp/Re2th/gf7suLF3RIG5PyU+iYZNTj
	vK88SWKJazdbVmkWDC/AZHdOS6Gn3Ef4hnBjEokE4c8C37i/xmPolg6au6HvpAkNQEQ0BQnnl94R5
	oIhOhTDYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwh0-0006hJ-Sd; Mon, 09 Nov 2020 02:14:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwgy-0006f7-Iy; Mon, 09 Nov 2020 02:14:01 +0000
X-UUID: 8bd30a6a77f34ace9c02500dfefd6172-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KWoaUsgI+zjVJXwTc8Wv7WIGoNFF40Fig+xVi6bBjS0=; 
 b=eTJjZYS+oR6IsN5IC20p+Zuq2fc9/8GVUb+xz+m86DhNBPaEk21gIj3UnUmyGRHzGYSTShM+x1avAqrIzSEr2hJ3G4VpCvv2pRtzFjqtmQG9o14DAnHRln2eqbpSwGsvbNkf0exrYn9WbyKF3+6ldB5rjfQ3fta4EcpNPyNEvCg=;
X-UUID: 8bd30a6a77f34ace9c02500dfefd6172-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1038539960; Sun, 08 Nov 2020 18:13:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:36 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 02/13] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT2712
Date: Mon, 9 Nov 2020 10:13:17 +0800
Message-ID: <1604888008-30555-3-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_211400_815122_E40943DD 
X-CRM114-Status: GOOD (  12.46  )
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
