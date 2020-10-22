Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5288C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:53:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2122022267
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kWZox/sa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aCZYEsND"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2122022267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=haVhYRcKCEVUkJ36HIy3FIBK2vBSZB/MLImIxdaSjEk=; b=kWZox/saJR1OEkgFfrQ9aG9Yx
	p6vBgkK0DaihMw0E1LWgJ5N7wb1xKl0tMZz6FpNmRSzNucrQrF4BXKGhGaXzc6NU92649HJABmlL9
	HQEDIULmeBFAEIwlx8uAq1OvTmCFFHVyWo8to0sZQPBmsuXuGIr1l99eausTBIg/upNw6JPx2HTYd
	VZKK+dCM6GdR0xjFLIOu6vNnGzj0LQIOeXNyQrhHsvHmLMNiaMU8IHZcs5ZL6bLn4qguQSFipS8Gg
	bzr66aO3P9OWVYwU7h1jHqAhgcs1/l7meuWXeTPIMcvbTk66Kfm/QWIA0Z00kD4zqsRXBb12WMYit
	n5WGCgkKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa5n-0001JJ-LE; Thu, 22 Oct 2020 12:53:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0q-0007BO-8z; Thu, 22 Oct 2020 12:48:16 +0000
X-UUID: ef94a7ea641b4931a2a23900c2ead15a-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ftPxtc+iQCzrE74P/pq+OCJL4UAyhW8S1+eTiI7YSZ4=; 
 b=aCZYEsNDSyYUfUJ3Mx6eR+zp/3TDAnvDVARWhx9xw3sMfyWyK8eJBHgArgvlrKvJS+fIRAow6zFkZmGqq9ymtYweHbEgILf2dStJAM6WNDJYC8Tu7GcEJwjtlQvqxaOUSVa91C0f16tGkZInNXq1zGaWr0H0IYOk1FX7x1KHxTI=;
X-UUID: ef94a7ea641b4931a2a23900c2ead15a-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1268509796; Thu, 22 Oct 2020 04:47:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:52 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 10/34] clk: mediatek: Add configurable enable control to
 mtk_pll_data
Date: Thu, 22 Oct 2020 20:37:03 +0800
Message-ID: <1603370247-30437-11-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084812_487959_9D3FB812 
X-CRM114-Status: GOOD (  17.88  )
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
 drivers/clk/mediatek/clk-pll.c | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

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
index 11ed5d1..7fb001a 100644
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
