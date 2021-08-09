Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956FAC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:12:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53CC960F9F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53CC960F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwBlCp7ZcHJQXsmBmBsOavhCIzHOAz7yd8fZqodX/ms=; b=UGuRJ0iXK+Cl9+
	ieFtyJdCBW81+8AT1kuS+VwB4xfQ8+0Ovz+KFLmGjgOCWnKd53Pqqm8MtnfS9wLI53fuvQsi6p+oC
	lhNk2UOtFF0DDAurOAp2r5DnNLQv7p0fALQEK3ouwgJUdkIU5+7V1dzScdy5QWHXoSk8VvU73+OQH
	hijcmxWru4moCfvP25ncj+mDaEZaXqYORChU2TveU/Bx5QZzI1Jgu1Stp23twooKVNJMT+OfrDwkx
	ewCwXDTmdZRg02gbxkXcA942pt1SXoOqGAJUuP4XCnEPp52er5Qv71RkTvaeob6+W+aHQ+qUC8Ano
	MwW6OkbuXqASgTj+2C/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCvhk-00Gywj-Ui; Mon, 09 Aug 2021 03:11:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCvhL-00Gyod-WE; Mon, 09 Aug 2021 03:11:33 +0000
X-UUID: 307090bb2d664861bcbb92b8c45f31e0-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=e/eGkSPdubNanSBWcU4R72fHTwCXN0I+K6GrD52r470=; 
 b=QY37924wRr/5sEUZqNvnLdu7g0lujY6wzBBqyzjgAfi2vYk5GXiIzyg8svwBMZ/tVWZM+RB3cniOtIP8hjdhkI9Pk7UwLUBBOEoj2f/EG4f83lX39HCMDBguLD0yuKYPahCgzy9QArampw2oMKaKRa1QvbvweDwK7bLPSKNQIRw=;
X-UUID: 307090bb2d664861bcbb92b8c45f31e0-20210808
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 983329273; Sun, 08 Aug 2021 20:11:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 20:08:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 11:08:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 11:08:37 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: 
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nina Wu <Nina-CM.Wu@mediatek.com>, Neal Liu
 <neal.liu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v4 4/7] soc: mediatek: devapc: rename register variable infra_base
Date: Mon, 9 Aug 2021 11:08:16 +0800
Message-ID: <1628478499-29460-4-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1628478499-29460-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1628478499-29460-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_201132_085752_AD855049 
X-CRM114-Status: GOOD (  16.76  )
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

From: Nina Wu <Nina-CM.Wu@mediatek.com>

For new ICs, there are multiple devapc HWs for different subsys.
For example, there is devapc respectively for infra, peri, peri2, etc.
So we rename the variable 'infra_base' to 'base' for code readability.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index abc0962..8eb65dc0 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -48,7 +48,7 @@ struct mtk_devapc_data {
 
 struct mtk_devapc_context {
 	struct device *dev;
-	void __iomem *infra_base;
+	void __iomem *base;
 	struct clk *infra_clk;
 	const struct mtk_devapc_data *data;
 
@@ -61,7 +61,7 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
 	void __iomem *reg;
 	int i;
 
-	reg = ctx->infra_base + ctx->data->vio_sta_offset;
+	reg = ctx->base + ctx->data->vio_sta_offset;
 
 	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num) - 1; i++)
 		writel(GENMASK(31, 0), reg + 4 * i);
@@ -76,7 +76,7 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
 	u32 val;
 	int i;
 
-	reg = ctx->infra_base + ctx->data->vio_mask_offset;
+	reg = ctx->base + ctx->data->vio_mask_offset;
 
 	if (mask)
 		val = GENMASK(31, 0);
@@ -118,11 +118,11 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
 	int ret;
 	u32 val;
 
-	pd_vio_shift_sta_reg = ctx->infra_base +
+	pd_vio_shift_sta_reg = ctx->base +
 			       ctx->data->vio_shift_sta_offset;
-	pd_vio_shift_sel_reg = ctx->infra_base +
+	pd_vio_shift_sel_reg = ctx->base +
 			       ctx->data->vio_shift_sel_offset;
-	pd_vio_shift_con_reg = ctx->infra_base +
+	pd_vio_shift_con_reg = ctx->base +
 			       ctx->data->vio_shift_con_offset;
 
 	/* Find the minimum shift group which has violation */
@@ -164,8 +164,8 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
 	void __iomem *vio_dbg0_reg;
 	void __iomem *vio_dbg1_reg;
 
-	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
-	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
+	vio_dbg0_reg = ctx->base + ctx->data->vio_dbg0_offset;
+	vio_dbg1_reg = ctx->base + ctx->data->vio_dbg1_offset;
 
 	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
 	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
@@ -203,7 +203,7 @@ static irqreturn_t devapc_violation_irq(int irq_number, void *data)
  */
 static void start_devapc(struct mtk_devapc_context *ctx)
 {
-	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
+	writel(BIT(31), ctx->base + ctx->data->apc_con_offset);
 
 	mask_module_irq(ctx, false);
 }
@@ -215,7 +215,7 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
 {
 	mask_module_irq(ctx, true);
 
-	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
+	writel(BIT(2), ctx->base + ctx->data->apc_con_offset);
 }
 
 static const struct mtk_devapc_data devapc_mt6779 = {
@@ -256,8 +256,8 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	ctx->data = of_device_get_match_data(&pdev->dev);
 	ctx->dev = &pdev->dev;
 
-	ctx->infra_base = of_iomap(node, 0);
-	if (!ctx->infra_base)
+	ctx->base = of_iomap(node, 0);
+	if (!ctx->base)
 		return -EINVAL;
 
 	/* Set vio_idx_num to default value.
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
