Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296EFC388F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:05:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCCFE206C1
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R47s161+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HaH2Y7Bz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCCFE206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vo8Ltq8FfcPpGmdIsX1sRI1ZylSj3oHRMJfKp2J2pgw=; b=R47s161+Z1+HSVANIHPequVbU
	9YQbYI/CvsgwQW4Err4rfIw2lyr6HP+QcmDTCdsI1M7KRYqlUgmFtyhpbVBr9Nt1p8JU6i4Okq6Xm
	sKEhLKMZIVT5s4zWTfXMQlS/9sHWTCLeIm/lGJgsMq8LRo2BeFFmWdR9LPpxXdinvt6vCx+r4vxSJ
	TX5fukDbx2bYHyXSZ1flfiD5UVoDL32QCAnHhokg9DmAFJf0L43r9tKBuEgWRW+3ppO3t1xauCF1B
	LiDGMDhtZ9WU28zSJwNGirhkoqKalSe+Qcu3MXBZdjxyAtj/v0ak9GFX6sy6WDbjQqlhhKWGvtFZQ
	0X1AFhTpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwYR-00031I-RB; Mon, 09 Nov 2020 02:05:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwXM-0002Q5-Af; Mon, 09 Nov 2020 02:04:08 +0000
X-UUID: f184963e71224887889bd26c58dd1e5c-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=d6l7X0D9mFaPMITY5GjptKADXM4I1L0bpxI3MpyN6Is=; 
 b=HaH2Y7BzjBnE2f1/wY21MMk5Lw3aj+tH+ut7hKUl4w3XohVyVlDvYk2EgCk/8wNWqrmhVDwrHy3hsXJ+hu1EW/ps7augp/59DBSH8JZG/XQVozObbfY2M3Q4ln1cohPzEivwtgfhd0E1BM/0UHEeVgW15mFt3TU5E4Un8jOJk/Y=;
X-UUID: f184963e71224887889bd26c58dd1e5c-20201108
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 594776429; Sun, 08 Nov 2020 18:03:56 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:03:53 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:03:52 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v5 07/24] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
Date: Mon, 9 Nov 2020 10:03:32 +0800
Message-ID: <1604887429-29445-8-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_210404_616235_42154775 
X-CRM114-Status: GOOD (  15.56  )
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
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-pll.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index f440f2cd..11ed5d1 100644
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
