Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B6AC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:23:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856552080C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQ1DkXyt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GmcOmGcg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 856552080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q5WQQ/RU5nRF1/WEsN3sAk2vJ1yOej3qCD4MeIO2/Ps=; b=VQ1DkXytGijEq39y7YMskxb9F
	8ZAD+c2RWsklZ/kJKDS6BMnEem4XyB82IBeRc3SXT3kH3PBh3W4+poNjwZDfoBuOg9UsWUhKaZ5h4
	UeVCTsP0KnlqJ5Kozn9YC178/sAm3IdddH+ucY15ddfYBt0OPE04hgvS/te1Gi3nYbcDJt01CjYXV
	/0g7ewPDWJlHCU5DVNMEZ0MJPyGZxWNz2WjdPo9aplvu9NYR/zvtChqZZViTtTK8pHOLVwV6wIt+m
	Lq0/fg8E9fpKxzldN8hXVNfSxg7Kl0sBoJS/u8qJGcH9O984Zc2wBK+UsYpQcwjQoKaJAl0A5SpIf
	3HMSuP7Ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDfqg-0003lX-Un; Thu, 03 Sep 2020 03:23:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDfqX-0003hs-OH; Thu, 03 Sep 2020 03:23:35 +0000
X-UUID: e5fb8de63756471183dd2dfee8786307-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6GC5eAEhDoBuRbi+wwESswcqG++nDs52pqdjgqQ4Kzg=; 
 b=GmcOmGcg5ODq6pzJRiuKhETv8OU3gliwCfSKMW5Ig+47/NOSeoSt6G8HjqF9gCh+PpBnSKZrJ65ZezowOkJugJR/F23Yy+HXcvwK4l+xVh5N/vcDUJdgO+ra0Kjdi5RM181Lb57TTny1jDTu1KprBf0yvz7KC7+altu74mn1LCc=;
X-UUID: e5fb8de63756471183dd2dfee8786307-20200902
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 100851545; Wed, 02 Sep 2020 19:23:28 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:23:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:23:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Sep 2020 11:23:25 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v3 8/9] clk: mediatek: Add configurable enable control to
 mtk_pll_data
Date: Thu, 3 Sep 2020 11:22:59 +0800
Message-ID: <1599103380-4155-9-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
References: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_232333_948218_33731C7A 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Wendell Lin <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In all MediaTek PLL design, bit0 of CON0 register is always
the enable bit.
However, there's a special case of usbpll on MT8192.
The enable bit of usbpll is moved to bit2 of other register.
Add configurable en_reg and pll_en_bit for enable control or
default 0 where pll data are static variables.
Hence, CON0_BASE_EN could also be removed.
And there might have another special case on other chips,
the enable bit is still on CON0 register but not at bit0.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 drivers/clk/mediatek/clk-pll.c | 16 ++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index c3d6756..c580663 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -233,6 +233,8 @@ struct mtk_pll_data {
 	uint32_t pcw_chg_reg;
 	const struct mtk_pll_div_table *div_table;
 	const char *parent_name;
+	uint32_t en_reg;
+	uint8_t pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 };
 
 void mtk_clk_register_plls(struct device_node *node,
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index e0b00bc..bd91113 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -16,7 +16,6 @@
 #define REG_CON0		0
 #define REG_CON1		4
 
-#define CON0_BASE_EN		BIT(0)
 #define CON0_PWR_ON		BIT(0)
 #define CON0_ISO_EN		BIT(1)
 #define PCW_CHG_MASK		BIT(31)
@@ -44,6 +43,7 @@ struct mtk_clk_pll {
 	void __iomem	*tuner_en_addr;
 	void __iomem	*pcw_addr;
 	void __iomem	*pcw_chg_addr;
+	void __iomem	*en_addr;
 	const struct mtk_pll_data *data;
 };
 
@@ -56,7 +56,7 @@ static int mtk_pll_is_prepared(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 
-	return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
+	return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
 }
 
 static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
@@ -247,8 +247,8 @@ static int mtk_pll_prepare(struct clk_hw *hw)
 	writel(r, pll->pwr_addr);
 	udelay(1);
 
-	r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
-	writel(r, pll->base_addr + REG_CON0);
+	r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
+	writel(r, pll->en_addr);
 
 	if (pll->data->en_mask) {
 		r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
@@ -286,8 +286,8 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
 		writel(r, pll->base_addr + REG_CON0);
 	}
 
-	r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
-	writel(r, pll->base_addr + REG_CON0);
+	r = readl(pll->en_addr) & ~BIT(pll->data->pll_en_bit);
+	writel(r, pll->en_addr);
 
 	r = readl(pll->pwr_addr) | CON0_ISO_EN;
 	writel(r, pll->pwr_addr);
@@ -329,6 +329,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 		pll->tuner_addr = base + data->tuner_reg;
 	if (data->tuner_en_reg)
 		pll->tuner_en_addr = base + data->tuner_en_reg;
+	if (data->en_reg)
+		pll->en_addr = base + data->en_reg;
+	else
+		pll->en_addr = pll->base_addr + REG_CON0;
 	pll->hw.init = &init;
 	pll->data = data;
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
