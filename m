Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2DEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 11:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6443207E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 11:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DQI35LLh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TynRGxKU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6443207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NngxA96/AzSxUKATd2kplwzc9emP+6apCBcVgem9Oy4=; b=DQI35LLhs+0Urj
	UGDIj4GEgXgvVKVRgDRchWvJHMsAk46ODTCZsp+0my6svMmoFeEZ3mLJMMIl5OWJHTvyK4jZU3RcV
	p1I2zcjHzIBraCaIjgzpf7wzN2oPOOClkDPgeaJUqmlKtEzgvhWbCuHlXzyxi7K1i/yqpB5Bxj12Y
	6F+94KykDlWcBow1cLsqbeDPzydbfmgk3mJ522wm8mG4i+5FgxqZLAzu8dGcYJw3pfwB+uWsZ31Ia
	wGe7mPJi+oRzomb+n+YZw8SG2YyU1KmteTQ9BEB8BAO7t9Ihb8P1hPmXQq4ANp/xOC14DqlEPTegy
	rMEYiSZA9rfpn/kCGZ+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jae0L-0001Z8-PV; Mon, 18 May 2020 11:32:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jae03-0001Lr-Q5; Mon, 18 May 2020 11:32:05 +0000
Received: from ziggy.de (unknown [213.195.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9936A20756;
 Mon, 18 May 2020 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589801523;
 bh=W0M3+xyBaxTwy0zGdlE42RieIIyYlAiumGMejijFZ2I=;
 h=From:To:Cc:Subject:Date:From;
 b=TynRGxKUPnxFsPmEYL3HOL/z2OfQVadUTlvUnVKJ8E56OBT2YuMv1hOBp473Q0k7a
 J1QOKpN/69wMSHM2YE+db2r4LnL6LA25krgG079T5vpB5iIMmI5KPzhxB+E82c78a0
 PL/7RlGRJWspBIzeAQf5Sc3W5X5ofFXsFHdhOPhU=
From: matthias.bgg@kernel.org
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/4] clk/soc: mediatek: mt8183: Bind clock driver from
 platform device
Date: Mon, 18 May 2020 13:31:53 +0200
Message-Id: <20200518113156.25009-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_043203_869224_CC61A0C7 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-clk@vger.kernel.org, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <matthias.bgg@gmail.com>

The mmsys driver is now the top level entry point for the multimedia
system (mmsys), we bind the clock driver by creating a platform device.
We also bind the MediaTek DRM driver which is not yet implement and
therefor will errror out for now.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 drivers/clk/mediatek/clk-mt8183-mm.c | 9 ++-------
 drivers/soc/mediatek/mtk-mmsys.c     | 8 ++++++++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
index 720c696b506d..9d60e09619c1 100644
--- a/drivers/clk/mediatek/clk-mt8183-mm.c
+++ b/drivers/clk/mediatek/clk-mt8183-mm.c
@@ -84,8 +84,9 @@ static const struct mtk_gate mm_clks[] = {
 
 static int clk_mt8183_mm_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
 	struct clk_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
 
@@ -95,16 +96,10 @@ static int clk_mt8183_mm_probe(struct platform_device *pdev)
 	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 }
 
-static const struct of_device_id of_match_clk_mt8183_mm[] = {
-	{ .compatible = "mediatek,mt8183-mmsys", },
-	{}
-};
-
 static struct platform_driver clk_mt8183_mm_drv = {
 	.probe = clk_mt8183_mm_probe,
 	.driver = {
 		.name = "clk-mt8183-mm",
-		.of_match_table = of_match_clk_mt8183_mm,
 	},
 };
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index cacafe23c823..783c3dd008b2 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -92,6 +92,10 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
 };
 
+static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
+	.clk_driver = "clk-mt8183-mm",
+};
+
 static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
 					  enum mtk_ddp_comp_id next,
 					  unsigned int *addr)
@@ -339,6 +343,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8173-mmsys",
 		.data = &mt8173_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8183-mmsys",
+		.data = &mt8183_mmsys_driver_data,
+	},
 	{ }
 };
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
