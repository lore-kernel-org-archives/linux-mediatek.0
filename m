Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F75C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:22:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3D9206CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vXJRwsqi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OvFgy8w8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC3D9206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Va1DqhCLOt5fcMio8UDls4XapeYpP9SsFz4DGkcROw=; b=vXJRwsqiwDhunb8OuBAhbxevB
	d9COqy7eFDDW027MzWg5EdRQwYhG4IIzC8NOTBazZX2+/62RYshv8ISfagN2rkDF6JUF7U7Zp4nch
	7A4bC8bSWBVMErU/C+d4Y+h0ybUgLH7bCWnakSrbrYxE2cB7QwSZomDBhNMCOgi4dYO9XAPrZ0Zu6
	qOTDCv300dqybh6vafuL5HdicLne33s4fXd0VfwUY5wi/p+p0xQp4eQq/87AzT8Zhirvj0USuHcqT
	TJHH515SFyrDmGyYsK/PaACDNdXZHd5nUSOzF4QglouH/WeDUVRNgW4qtH6vj34yu6bZ6crapgdA1
	iwQ/4kn7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwpG-0003BR-Rx; Mon, 09 Nov 2020 02:22:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwoy-000336-Ol; Mon, 09 Nov 2020 02:22:18 +0000
X-UUID: 9cf7f6d1080a41f08294f73f6f5cb170-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2fjDethbyJB+P+fUMcxjxVjamkgr83Ie5SZqyhoUYSo=; 
 b=OvFgy8w8wyy+pgk5Zjou8Z85gmQ6uXyh38kBAfT5vVHoxC8m4QmWfPden/pc213qsoG3+zB/lm3tG1MVDsX4risAdFOwr010j/Lwrp2uQL2J5nl6OXRZpTQRaIm6zUi/ib7CyENxPwLIIQaoPRg0zd6CESg8CIMNaOyMVphh96Y=;
X-UUID: 9cf7f6d1080a41f08294f73f6f5cb170-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1234985998; Sun, 08 Nov 2020 18:22:09 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:47 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:45 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 13/13] clk: mediatek: use en_mask as a pure div_en_mask
Date: Mon, 9 Nov 2020 10:13:28 +0800
Message-ID: <1604888008-30555-14-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_212217_013992_F4ADFA56 
X-CRM114-Status: GOOD (  14.02  )
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

Because all pll data has been updated. We no longer allow
en_mask to be a combination of pll_en_bit and div_en_mask.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-pll.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 11ed5d1..e0b00bc 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -238,7 +238,6 @@ static int mtk_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
-	u32 div_en_mask;
 
 	r = readl(pll->pwr_addr) | CON0_PWR_ON;
 	writel(r, pll->pwr_addr);
@@ -251,9 +250,8 @@ static int mtk_pll_prepare(struct clk_hw *hw)
 	r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
 	writel(r, pll->base_addr + REG_CON0);
 
-	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
-	if (div_en_mask) {
-		r = readl(pll->base_addr + REG_CON0) | div_en_mask;
+	if (pll->data->en_mask) {
+		r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
 		writel(r, pll->base_addr + REG_CON0);
 	}
 
@@ -274,7 +272,6 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
-	u32 div_en_mask;
 
 	if (pll->data->flags & HAVE_RST_BAR) {
 		r = readl(pll->base_addr + REG_CON0);
@@ -284,9 +281,8 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
 
 	__mtk_pll_tuner_disable(pll);
 
-	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
-	if (div_en_mask) {
-		r = readl(pll->base_addr + REG_CON0) & ~div_en_mask;
+	if (pll->data->en_mask) {
+		r = readl(pll->base_addr + REG_CON0) & ~pll->data->en_mask;
 		writel(r, pll->base_addr + REG_CON0);
 	}
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
