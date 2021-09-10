Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD52C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 00:31:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D32E61041
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 00:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D32E61041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ha0DGzpmggsJEDDAUMV1zm8Yyu/fvCyh8ZoKO8Q6WtQ=; b=GKbcE8EEE6Tt8R
	LZB3rxfFXzhBfMEVgiQYEzrAUETiXKMiC/mIgHNCcDzyeYhPzJq+3tc0elh5o712R0px7EQANE5b4
	E90gdiihLsk2TRZEIoEEEJo0dkf6NcZeDkTKJMlL1rQ1o5+EOnj6Fa5YC3LSJy1Lu70NJKJZvv03m
	IXoXAiLj1/EFHbFY7Tnay6mZmxkaUTFuVCcBA2Wio4apV7S6PjWzj7mscttpSdQmKwHooJ8CtTMSj
	7qNpVVHfOk85gJa5NbqbcgiKbDlqLc3OUc8GEECKKwhb3+rTL18jHEFL2wghjQkhqRRclf3h3OpG5
	cRgzup10zv467g8k7Jpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOUSC-00BKNj-6a; Fri, 10 Sep 2021 00:31:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOUHa-00BFOJ-9c; Fri, 10 Sep 2021 00:20:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9D6E610A3;
 Fri, 10 Sep 2021 00:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233241;
 bh=UeNb57tKzwWRAwXejt0MpMewHQPDGOuLS/1eXFaB9G0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SsX+qOKPynB4VpqK+8lJpwyUc7EDDgutRshu1AjE3COPg6tv3ftejwXipQBA+x2vE
 6j/qsGG/m5ILTnhGgBwe8E5g7KtPbNejaWXF5R8C5a4b4W+mYjkcbCR1m0GWyi0TlO
 ciNIfdL2oD59YTSNoqbvznECKCA3AK8DzHHG5RtEYFhPw9/wMnKJsxdf9c53uF8126
 MrXfDFN82E58Az3Lsu5fUMznTZAAIryPeBN9rDI/UBMV6My5viFrldD9cvL246iVqD
 uN8cpQDgTbXAbXhEdWjPh4h7yVPjsQENp0b50v5cPRkHzprk3eSNdLKsGyv6osQJd4
 U5cTd+Qaj1zIA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Ikjoon Jang <ikjn@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Sasha Levin <sashal@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 09/53] clk: mediatek: Fix asymmetrical PLL enable
 and disable control
Date: Thu,  9 Sep 2021 20:19:44 -0400
Message-Id: <20210910002028.175174-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002028.175174-1-sashal@kernel.org>
References: <20210910002028.175174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_172042_393476_BBF8CF65 
X-CRM114-Status: GOOD (  13.09  )
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

From: Chun-Jie Chen <chun-jie.chen@mediatek.com>

[ Upstream commit 7cc4e1bbe300c5cf610ece8eca6c6751b8bc74db ]

In fact, the en_mask is a combination of divider enable mask
and pll enable bit(bit0).
Before this patch, we enabled both divider mask and bit0 in prepare(),
but only cleared the bit0 in unprepare().
In the future, we hope en_mask will only be used as divider enable mask.
The enable register(CON0) will be set in 2 steps:
first is divider mask, and then bit0 during prepare(), and vice versa.
But considering backward compatibility, at this stage we allow en_mask
to be a combination or a pure divider enable mask.
And then we will make en_mask a pure divider enable mask in another
following patch series.

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Link: https://lore.kernel.org/r/20210726105719.15793-7-chun-jie.chen@mediatek.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/mediatek/clk-pll.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index f440f2cd0b69..11ed5d1d1c36 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -238,6 +238,7 @@ static int mtk_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
+	u32 div_en_mask;
 
 	r = readl(pll->pwr_addr) | CON0_PWR_ON;
 	writel(r, pll->pwr_addr);
@@ -247,10 +248,15 @@ static int mtk_pll_prepare(struct clk_hw *hw)
 	writel(r, pll->pwr_addr);
 	udelay(1);
 
-	r = readl(pll->base_addr + REG_CON0);
-	r |= pll->data->en_mask;
+	r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
 	writel(r, pll->base_addr + REG_CON0);
 
+	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
+	if (div_en_mask) {
+		r = readl(pll->base_addr + REG_CON0) | div_en_mask;
+		writel(r, pll->base_addr + REG_CON0);
+	}
+
 	__mtk_pll_tuner_enable(pll);
 
 	udelay(20);
@@ -268,6 +274,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
+	u32 div_en_mask;
 
 	if (pll->data->flags & HAVE_RST_BAR) {
 		r = readl(pll->base_addr + REG_CON0);
@@ -277,8 +284,13 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
 
 	__mtk_pll_tuner_disable(pll);
 
-	r = readl(pll->base_addr + REG_CON0);
-	r &= ~CON0_BASE_EN;
+	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
+	if (div_en_mask) {
+		r = readl(pll->base_addr + REG_CON0) & ~div_en_mask;
+		writel(r, pll->base_addr + REG_CON0);
+	}
+
+	r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
 	writel(r, pll->base_addr + REG_CON0);
 
 	r = readl(pll->pwr_addr) | CON0_ISO_EN;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
