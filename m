Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27329C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 05:59:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D84061446
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 05:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D84061446
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xx9RL6q2apxlJ/VoXrd8R7pzZ2rUIWv+8AGEmM5WU4E=; b=HNRrqZhfS3TvqxWbRE7YiG2wW
	YAQhcfZnNy9pYP9nqa7jBkMofKlCNjqbVoeo87TPzaNGiZW7qCBLT44d1tNw9kPg0PMmNmvW3LV7C
	4Nv8EjqcmLmPmftrZ42AR4QZlgB5VtPWcpAVmDy0de7DfFferGW5KEGdXpjzSppmCEvoNhqwgr26Y
	Firl84l8Nexjey5DdCL/l7VJqsvqzo2gDdMV0t9mPhf5f8tbPb6YQiGiOuw5HF6KXq7QZh4mAMuPr
	y10JTaifLJUtwn2COfgKEk1lMpzczkL5PpbVNzfiA/AXqFxuVW0daC6FVxxBH9QE3CQZHr1iRdwPe
	dq0VCzrOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWv1j-00EyNi-N9; Thu, 15 Apr 2021 05:58:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv1X-00EyLZ-CY; Thu, 15 Apr 2021 05:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=kL4Cx6MJpiM1xiNB0QiF5VtimgoT3J5q67h22rvHVOA=; b=zGfbSBjDbxZRmfFLHE4QYIicqF
 BzNiL+wmFWvf3ZztdPpdXMXIoI4wR+nHJjILdM+Q4kge5S7tpycGTVaLJ3xSVsquH6KXwfKWYLfA9
 5v++6t/UZ10gTemPl70RYdsUPP1MKSIQGbsvMavEoVUe24W3thVqyR3Z+MIguTgeTpnbA0PC3kkza
 a5Kjfj+5bIOM7QW5jRPKmn9C8aB67mhVRsTndPP4gRElK+PlpOHPUqcFvEjEg8iuubCnOXwigroYX
 6WYmpu7vrj2UGWJYYo/xZR3Bu4LKHADtNI7nAsQkXOoVHNMxG0AJ3UuStySoXqykoit10Jql/ctRv
 rSthiCeQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv1U-008IFC-MI; Thu, 15 Apr 2021 05:58:42 +0000
X-UUID: 633fddea18c044d7924a9c886e07e243-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kL4Cx6MJpiM1xiNB0QiF5VtimgoT3J5q67h22rvHVOA=; 
 b=bNqpjTFXl3Ehaz757BxMKDrikOvdA7raSoyqQbXTke8NlEqQ9PajTJiYN7+QZBdSJpRbOlYUcPncc89fvnRrAU4ba3WgeBuzLQB++JSrzZCP3t/Ki+m4QuCasIVn1zu8UByZmHvzbAEZNA42USZIUBdrBhOoXgfEbUu+7cvf6h8=;
X-UUID: 633fddea18c044d7924a9c886e07e243-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2032265740; Wed, 14 Apr 2021 22:58:37 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 22:52:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 13:52:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 13:52:49 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, 
 Chiawen Lee <chiawen.lee@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 2/7] clk: mediatek: mt8192: Add APU clocks support
Date: Thu, 15 Apr 2021 13:52:35 +0800
Message-ID: <1618465960-3013-3-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_225840_753891_6A433D02 
X-CRM114-Status: GOOD (  10.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add APU clocks support on MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index bf6a2084a348..4eb61f006306 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -244,6 +244,65 @@ static const char * const ccu_parents[] = {
 	"univpll_d6_d2"
 };
 
+static const char * const dsp_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp1_parents[] = {
+	"clk26m",
+	"npupll_ck",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3",
+	"apupll_ck"
+};
+
+static const char * const dsp1_npupll_parents[] = {
+	"dsp1_sel",
+	"npupll_ck"
+};
+
+static const char * const dsp2_parents[] = {
+	"clk26m",
+	"npupll_ck",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3",
+	"apupll_ck"
+};
+
+static const char * const dsp2_npupll_parents[] = {
+	"dsp2_sel",
+	"npupll_ck"
+};
+
+static const char * const dsp5_parents[] = {
+	"clk26m",
+	"apupll_ck",
+	"univpll_d4_d2",
+	"mainpll_d4",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp5_apupll_parents[] = {
+	"dsp5_sel",
+	"apupll_ck"
+};
+
 static const char * const dsp7_parents[] = {
 	"clk26m",
 	"mainpll_d4_d2",
@@ -255,6 +314,17 @@ static const char * const dsp7_parents[] = {
 	"mmpll_d4"
 };
 
+static const char * const ipu_if_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"univpll_d5",
+	"mainpll_d4",
+	"tvdpll_ck",
+	"univpll_d4"
+};
+
 static const char * const mfg_ref_parents[] = {
 	"clk26m",
 	"clk26m",
@@ -734,9 +804,26 @@ static const struct mtk_mux top_mtk_muxes[] = {
 		cam_parents, 0x030, 0x034, 0x038, 16, 4, 23, 0x004, 10),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_CCU_SEL, "ccu_sel",
 		ccu_parents, 0x030, 0x034, 0x038, 24, 4, 31, 0x004, 11),
+	/* CLK_CFG_3 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP_SEL, "dsp_sel",
+		dsp_parents, 0x040, 0x044, 0x048, 0, 3, 7, 0x004, 12),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP1_SEL, "dsp1_sel",
+		dsp1_parents, 0x040, 0x044, 0x048, 8, 3, 15, 0x004, 13),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP1_NPUPLL_SEL, "dsp1_npupll_sel",
+		dsp1_npupll_parents, 0x040, 0x044, 0x048, 11, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP2_SEL, "dsp2_sel",
+		dsp2_parents, 0x040, 0x044, 0x048, 16, 3, 23, 0x004, 14),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP2_NPUPLL_SEL, "dsp2_npupll_sel",
+		dsp2_npupll_parents, 0x040, 0x044, 0x048, 19, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP5_SEL, "dsp5_sel",
+		dsp5_parents, 0x040, 0x044, 0x048, 24, 3, 31, 0x004, 15),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP5_APUPLL_SEL, "dsp5_apupll_sel",
+		dsp5_apupll_parents, 0x040, 0x044, 0x048, 27, 1, -1, -1),
 	/* CLK_CFG_4 */
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP7_SEL, "dsp7_sel",
 		dsp7_parents, 0x050, 0x054, 0x058, 0, 3, 7, 0x004, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPU_IF_SEL, "ipu_if_sel",
+		ipu_if_parents, 0x050, 0x054, 0x058, 8, 3, 15, 0x004, 17),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
 		mfg_ref_parents, 0x050, 0x054, 0x058, 16, 2, 23, 0x004, 18),
 	MUX_CLR_SET_UPD(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel",
@@ -1175,6 +1262,10 @@ static const struct mtk_pll_data plls[] = {
 		0, 0, 32, 0x031c, 24, 0x0040, 0x000c, 0, 0x0320, 0),
 	PLL_B(CLK_APMIXED_APLL2, "apll2", 0x032c, 0x033c, 0x00000000,
 		0, 0, 32, 0x0330, 24, 0, 0, 0, 0x0334, 0),
+	PLL_B(CLK_APMIXED_APUPLL, "apupll", 0x03a0, 0x03ac, 0xff000001,
+		HAVE_RST_BAR, BIT(23), 22, 0x03a4, 24, 0, 0, 0, 0x03a4, 0),
+	PLL_B(CLK_APMIXED_NPUPLL, "npupll", 0x03b4, 0x03c0, 0x00000001,
+		0, 0, 22, 0x03b8, 24, 0, 0, 0, 0x03b8, 0),
 };
 
 static struct clk_onecell_data *top_clk_data;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
