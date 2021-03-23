Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BDCC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:48:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3569D619BA
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3569D619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FdntHFYI1Ej3Dfnpuz5XwvexxXcFaJuMszMknS+lFv0=; b=QCPHd3XSmxsJSnzABSX5a0Jox
	PuZL+mbbt6dFyod3JeAkCI+Nf8TDiAS48F1bp2gt60cO96fHKX0+MkfYW12xBTu4rpuIok2JUn8ME
	WHCmPN+fWSqfYL0EdP9T1AXrgmPPOCPHHX2T8Cqk9Cbl1f5heO3GVsF17Ia3cjQyMRaqKalV7iyW4
	lC9z8HDChJuegATaRHsDak406E/QUh0+6RtkcN6GyWayidapI6gxj20YU3UJG0/OeLsLS3aJzO2zu
	5s1jrJduyNXVbj85bU0yzGtg5CHs9vlMt4KGpdi8AOf3ytNlUCgQZ3/UazYUsd4t5Uz4UEJnQi1x8
	yyBZwMbig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfW3-00EnGs-R6; Tue, 23 Mar 2021 11:48:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfUB-00EmG4-Cn; Tue, 23 Mar 2021 11:46:13 +0000
X-UUID: 39c9fee858194847bfa4dbed1df0be57-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M0jHrTs6QoSx82PyOwQpY/2A+WF5G5OVT5bToWkI3Gc=; 
 b=ET9v5OlrIX5X7hFk0VMqkYuCanP63B8Vmdu4BvcBYQLjEnVmrXNdakQtOCw4bAwu56T5OK7nqtpbq8QMWLnMKhz1FLAyikcd3gShkFy1xXmxVlw9nZLR7Bl73u9rbUGcwSTGPLxuyuBpdETHjkBlzg7dpW211B8puwfyWyPJDl4=;
X-UUID: 39c9fee858194847bfa4dbed1df0be57-20210323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2086807353; Tue, 23 Mar 2021 03:45:39 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 04:35:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 19:35:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Mar 2021 19:35:34 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v7 08/22] clk: mediatek: Add configurable enable control to
 mtk_pll_data
Date: Tue, 23 Mar 2021 19:34:58 +0800
Message-ID: <20210323113512.4980-9-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210323113512.4980-1-chun-jie.chen@mediatek.com>
References: <20210323113512.4980-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_114611_834381_F93C6D61 
X-CRM114-Status: GOOD (  16.46  )
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

In all MediaTek PLL design, bit0 of CON0 register is always
the enable bit.
However, there's a special case of usbpll on MT8192.
The enable bit of usbpll is moved to bit2 of other register.
Add configurable en_reg and pll_en_bit for enable control or
default 0 where pll data are static variables.
Hence, CON0_BASE_EN could also be removed.
And there might have another special case on other chips,
the enable bit is still on CON0 register but not at bit0.

Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.h | 20 +++++++++++---------
 drivers/clk/mediatek/clk-pll.c | 15 ++++++++++-----
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index c3d6756b0c7e..31c7cb304508 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -213,13 +213,13 @@ struct mtk_pll_div_table {
 struct mtk_pll_data {
 	int id;
 	const char *name;
-	uint32_t reg;
-	uint32_t pwr_reg;
-	uint32_t en_mask;
-	uint32_t pd_reg;
-	uint32_t tuner_reg;
-	uint32_t tuner_en_reg;
-	uint8_t tuner_en_bit;
+	u32 reg;
+	u32 pwr_reg;
+	u32 en_mask;
+	u32 pd_reg;
+	u32 tuner_reg;
+	u32 tuner_en_reg;
+	u8 tuner_en_bit;
 	int pd_shift;
 	unsigned int flags;
 	const struct clk_ops *ops;
@@ -228,11 +228,13 @@ struct mtk_pll_data {
 	unsigned long fmax;
 	int pcwbits;
 	int pcwibits;
-	uint32_t pcw_reg;
+	u32 pcw_reg;
 	int pcw_shift;
-	uint32_t pcw_chg_reg;
+	u32 pcw_chg_reg;
 	const struct mtk_pll_div_table *div_table;
 	const char *parent_name;
+	u32 en_reg;
+	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 };
 
 void mtk_clk_register_plls(struct device_node *node,
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 11ed5d1d1c36..7fb001a4e7d8 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -44,6 +44,7 @@ struct mtk_clk_pll {
 	void __iomem	*tuner_en_addr;
 	void __iomem	*pcw_addr;
 	void __iomem	*pcw_chg_addr;
+	void __iomem	*en_addr;
 	const struct mtk_pll_data *data;
 };
 
@@ -56,7 +57,7 @@ static int mtk_pll_is_prepared(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 
-	return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
+	return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
 }
 
 static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
@@ -248,8 +249,8 @@ static int mtk_pll_prepare(struct clk_hw *hw)
 	writel(r, pll->pwr_addr);
 	udelay(1);
 
-	r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
-	writel(r, pll->base_addr + REG_CON0);
+	r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
+	writel(r, pll->en_addr);
 
 	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
 	if (div_en_mask) {
@@ -290,8 +291,8 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
 		writel(r, pll->base_addr + REG_CON0);
 	}
 
-	r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
-	writel(r, pll->base_addr + REG_CON0);
+	r = readl(pll->en_addr) & ~BIT(pll->data->pll_en_bit);
+	writel(r, pll->en_addr);
 
 	r = readl(pll->pwr_addr) | CON0_ISO_EN;
 	writel(r, pll->pwr_addr);
@@ -333,6 +334,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
