Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1A6C433E5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:00:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A356320729
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pv1lxjIA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hFPE3BNu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A356320729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a6BMDara9LY1B+7+zxIPWEeIsfQ30tld3i+ALA9StIU=; b=Pv1lxjIAA0EWQ6HuDqAMxP3tk
	qwdvEY4m7YeZ0z3QvIT7BfsyUs2Yr+HeMGNoA4nIV/b/HzH1LjfeO63/SEpLOsnxmKu59CMAlkQxn
	T4YO2XGiUQncFCsTsNQ9XJVQBipAYYf982IvEzAzurBDhJ9F7WwBg8FqBms7Zt6atbBiqklzF+2FJ
	eh2Mv4aOM181iGHChJ55Ou5yhbt83sBnkD4Dps4KZCZn01dqAU9HOQWbUq/Q4Y9pb+Iunumjv69G1
	blnOPO2YinWwsieqCfM2aA8Ju+KxCsFoX/ZpOIO2xPlZ+3eqTuqo4W2FwWuKVYYq/xo7Aq0RWxWuJ
	zPdggwf8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy8ju-00005d-Di; Wed, 22 Jul 2020 07:00:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy8jj-0008T7-MJ; Wed, 22 Jul 2020 07:00:21 +0000
X-UUID: b5ef7bac9d354700b4053986f3204c44-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xL2c15rMm6n2+VIEB3St5dv1LPcg+CbSCv0clpzLX0E=; 
 b=hFPE3BNubhi0y7W+oB6eZ/O5Zh3clLYHzaY8SOnESE3KvTYlI33/OYSEvUjdgFUX6Ikhqp6zIT7Dspg3vA0flQlMcRlYmuyhZNBtHXkEsQfZ52Z4oSihYAq4b4tNiX3Kv8T2FCtJ4MNip4ymIZItTuO4dpRgWl2llHHKRepN5ww=;
X-UUID: b5ef7bac9d354700b4053986f3204c44-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2026852729; Tue, 21 Jul 2020 23:00:20 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 23:50:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 14:50:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Jul 2020 14:50:03 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 3/4] clk: mediatek: Add configurable enable control to
 mtk_pll_data
Date: Wed, 22 Jul 2020 14:50:00 +0800
Message-ID: <1595400601-26220-4-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595400601-26220-1-git-send-email-weiyi.lu@mediatek.com>
References: <1595400601-26220-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8AB9C873B56F031AD0C2855AC0E93D53A97E5A87F77F9EDAA49315D4E812308E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_030019_874980_548A942A 
X-CRM114-Status: GOOD (  15.39  )
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

In all MediaTek PLL design, bit 0 of CON0 register is always
the enable bit.
However, there's a special case of usbpll on MT8192.
The enable bit of usbpll is moved to bit 2 of other register.
Add configurable en_reg and base_en_bit for enable control or
using the default if without setting in pll data.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 drivers/clk/mediatek/clk-pll.c | 26 ++++++++++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index c3d6756..8bb0b3d 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -233,6 +233,8 @@ struct mtk_pll_data {
 	uint32_t pcw_chg_reg;
 	const struct mtk_pll_div_table *div_table;
 	const char *parent_name;
+	uint32_t en_reg;
+	uint8_t base_en_bit;
 };
 
 void mtk_clk_register_plls(struct device_node *node,
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index f440f2cd..b8ccd42 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -44,6 +44,7 @@ struct mtk_clk_pll {
 	void __iomem	*tuner_en_addr;
 	void __iomem	*pcw_addr;
 	void __iomem	*pcw_chg_addr;
+	void __iomem	*en_addr;
 	const struct mtk_pll_data *data;
 };
 
@@ -56,7 +57,10 @@ static int mtk_pll_is_prepared(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 
-	return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
+	if (pll->en_addr)
+		return (readl(pll->en_addr) & BIT(pll->data->base_en_bit)) != 0;
+	else
+		return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
 }
 
 static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
@@ -251,6 +255,12 @@ static int mtk_pll_prepare(struct clk_hw *hw)
 	r |= pll->data->en_mask;
 	writel(r, pll->base_addr + REG_CON0);
 
+	if (pll->en_addr) {
+		r = readl(pll->en_addr);
+		r |= BIT(pll->data->base_en_bit);
+		writel(r, pll->en_addr);
+	}
+
 	__mtk_pll_tuner_enable(pll);
 
 	udelay(20);
@@ -277,9 +287,15 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
 
 	__mtk_pll_tuner_disable(pll);
 
-	r = readl(pll->base_addr + REG_CON0);
-	r &= ~CON0_BASE_EN;
-	writel(r, pll->base_addr + REG_CON0);
+	if (pll->en_addr) {
+		r = readl(pll->en_addr);
+		r &= ~BIT(pll->data->base_en_bit);
+		writel(r, pll->en_addr);
+	} else {
+		r = readl(pll->base_addr + REG_CON0);
+		r &= ~CON0_BASE_EN;
+		writel(r, pll->base_addr + REG_CON0);
+	}
 
 	r = readl(pll->pwr_addr) | CON0_ISO_EN;
 	writel(r, pll->pwr_addr);
@@ -321,6 +337,8 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 		pll->tuner_addr = base + data->tuner_reg;
 	if (data->tuner_en_reg)
 		pll->tuner_en_addr = base + data->tuner_en_reg;
+	if (data->en_reg)
+		pll->en_addr = base + data->en_reg;
 	pll->hw.init = &init;
 	pll->data = data;
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
