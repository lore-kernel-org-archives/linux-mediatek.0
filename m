Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B17C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdmz871EpNNvKM5LdL5DS7+ZmxRsGTxvcqpB6ODz3z4=; b=YHdhoX6257BX0I
	n4Us6VmT1xQbYrtd4972LTsLb53OvFcMINmLktGyalUEge4UtUth0vkk6B8YIuazNoxZLx+eSmCWu
	NAXaEu5q8I8vBrW+b6/iyuks9PFGhDG0feKR2zApV9WeC7R2erCsjsE2u3/wYOnkQvYrNT68c25a9
	Ll9wfp32LLybVxL9Q2lOOZ5sGwBz2LjzqV4zHdjSlFWMzJiB90AuH8Qt3J1Ql9H9TMx0FIIVVTVPK
	786e6IZtPMwcqwJBzBoBlOsfoQh5HiV5mRnnrXai+CLeX+LIr9hYMP2ae9RBzU508AH7wX7WnNZoV
	YuFNbuJC/g0nvn0JQZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmDlV-00Ad4I-IM; Wed, 04 May 2022 12:05:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmDkv-00AcpJ-Hk; Wed, 04 May 2022 12:05:27 +0000
X-UUID: 5551dd99ae29430880b3a18753d38e06-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f3116fc4-5202-4b33-bfd5-4b5a9b6311aa, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:cb792b16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5551dd99ae29430880b3a18753d38e06-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1560991433; Wed, 04 May 2022 05:05:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 04:55:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 19:55:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 19:55:03 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>
CC: <runyang.chen@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v2 2/3] soc: mediatek: devapc: Separate register offsets from
 mtk_devapc_data
Date: Wed, 4 May 2022 19:55:00 +0800
Message-ID: <20220504115501.3490-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
References: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_050521_610473_FED77EAA 
X-CRM114-Status: GOOD (  17.04  )
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

The register offsets is the same between MT6779 and MT8186. To reuse the
register offsets, we move these register offsets to another structure
"mtk_devapc_regs_ofs".

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 37 ++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index 7c65ad3d1f8a..f27e22cbb770 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -31,10 +31,7 @@ struct mtk_devapc_vio_dbgs {
 	u32 vio_dbg1;
 };
 
-struct mtk_devapc_data {
-	/* numbers of violation index */
-	u32 vio_idx_num;
-
+struct mtk_devapc_regs_ofs {
 	/* reg offset */
 	u32 vio_mask_offset;
 	u32 vio_sta_offset;
@@ -46,6 +43,12 @@ struct mtk_devapc_data {
 	u32 vio_shift_con_offset;
 };
 
+struct mtk_devapc_data {
+	/* numbers of violation index */
+	u32 vio_idx_num;
+	const struct mtk_devapc_regs_ofs *regs_ofs;
+};
+
 struct mtk_devapc_context {
 	struct device *dev;
 	void __iomem *infra_base;
@@ -58,7 +61,7 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
 	void __iomem *reg;
 	int i;
 
-	reg = ctx->infra_base + ctx->data->vio_sta_offset;
+	reg = ctx->infra_base + ctx->data->regs_ofs->vio_sta_offset;
 
 	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
 		writel(GENMASK(31, 0), reg + 4 * i);
@@ -73,7 +76,7 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
 	u32 val;
 	int i;
 
-	reg = ctx->infra_base + ctx->data->vio_mask_offset;
+	reg = ctx->infra_base + ctx->data->regs_ofs->vio_mask_offset;
 
 	if (mask)
 		val = GENMASK(31, 0);
@@ -116,11 +119,11 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
 	u32 val;
 
 	pd_vio_shift_sta_reg = ctx->infra_base +
-			       ctx->data->vio_shift_sta_offset;
+			       ctx->data->regs_ofs->vio_shift_sta_offset;
 	pd_vio_shift_sel_reg = ctx->infra_base +
-			       ctx->data->vio_shift_sel_offset;
+			       ctx->data->regs_ofs->vio_shift_sel_offset;
 	pd_vio_shift_con_reg = ctx->infra_base +
-			       ctx->data->vio_shift_con_offset;
+			       ctx->data->regs_ofs->vio_shift_con_offset;
 
 	/* Find the minimum shift group which has violation */
 	val = readl(pd_vio_shift_sta_reg);
@@ -161,8 +164,8 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
 	void __iomem *vio_dbg0_reg;
 	void __iomem *vio_dbg1_reg;
 
-	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
-	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
+	vio_dbg0_reg = ctx->infra_base + ctx->data->regs_ofs->vio_dbg0_offset;
+	vio_dbg1_reg = ctx->infra_base + ctx->data->regs_ofs->vio_dbg1_offset;
 
 	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
 	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
@@ -200,7 +203,7 @@ static irqreturn_t devapc_violation_irq(int irq_number, void *data)
  */
 static void start_devapc(struct mtk_devapc_context *ctx)
 {
-	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
+	writel(BIT(31), ctx->infra_base + ctx->data->regs_ofs->apc_con_offset);
 
 	mask_module_irq(ctx, false);
 }
@@ -212,11 +215,10 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
 {
 	mask_module_irq(ctx, true);
 
-	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
+	writel(BIT(2), ctx->infra_base + ctx->data->regs_ofs->apc_con_offset);
 }
 
-static const struct mtk_devapc_data devapc_mt6779 = {
-	.vio_idx_num = 511,
+static const struct mtk_devapc_regs_ofs devapc_regs_ofs_mt6779 = {
 	.vio_mask_offset = 0x0,
 	.vio_sta_offset = 0x400,
 	.vio_dbg0_offset = 0x900,
@@ -227,6 +229,11 @@ static const struct mtk_devapc_data devapc_mt6779 = {
 	.vio_shift_con_offset = 0xF20,
 };
 
+static const struct mtk_devapc_data devapc_mt6779 = {
+	.vio_idx_num = 511,
+	.regs_ofs = &devapc_regs_ofs_mt6779,
+};
+
 static const struct of_device_id mtk_devapc_dt_match[] = {
 	{
 		.compatible = "mediatek,mt6779-devapc",
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
