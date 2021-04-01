Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1EAC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 06:50:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B520610A5
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 06:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B520610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Z+9UNV0hpOgIfIPMuqJAydO4Hm2gbqTN7e5PiWJl2U=; b=khXyyTTQB7t39BVORwsqY9EBA
	CnDR79n9U1n6Q1P6P2H45zAnHc4iviqEJ31J4e8PwcAgt9yFRrDEPZixLvKRdglPYy7ayEKJV+bJm
	u3hfTm+dYArZ6MBAYG0xQD3zplHzzYCA9dn82qlPyldHmuGNmkzYwrBwXfXS+Ct08KmHwKucysJE2
	mrYmA2vribR0QzHsNx0Ec+WjZ9ELkuLqIz/x6vEPj8ONOQR6Qrh8ZcOQ5iLree5TUaHYjNeWSmXoh
	29O788Yvu6AU+/Ib2SqWulqucasD1/NH/jcSuuEGk1hB/gh0jrt6gNldkrMPn4bn/2/QOYJpnHypm
	xC4xmQYrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRr9q-008jg0-EP; Thu, 01 Apr 2021 06:50:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRr9k-008jdQ-PD; Thu, 01 Apr 2021 06:50:19 +0000
X-UUID: b7923b7c0bb44df88b503d305521c26d-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UxYeDNJXQ0H2K7Tt4vWAJOzQTeMEXo9VX7j9ajNuVdo=; 
 b=bHfueJWNfPkSWWvt4Q1Scle9D/qVLtcI9UFLMzbahAyu9PbmcZOyyD6iijMlru86CeQCZSId8aTSa3aLuvyIvNWXmOz4WdWRoAC3uLnDPwsE85dZwVvC4svJ2t6UrSuJTOA+QHWq6d+yByJtEwIFYrO3D6Gq9KUl//P/WE1Uk/M=;
X-UUID: b7923b7c0bb44df88b503d305521c26d-20210331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 792109936; Wed, 31 Mar 2021 23:50:10 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 23:40:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Apr 2021 14:40:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 1 Apr 2021 14:40:00 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Nina Wu <Nina-CM.Wu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Subject: [PATCH v2 4/6] soc: mediatek: devapc: rename variable for new IC
 support
Date: Thu, 1 Apr 2021 14:38:05 +0800
Message-ID: <1617259087-5502-4-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 364F31474881FC23DBD493D6B787402F121E93BF61208FF85A79730EBA4AABE52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_075017_185916_FA8FF965 
X-CRM114-Status: GOOD (  15.12  )
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
index 68c3e35..bcf6e3c 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -45,7 +45,7 @@ struct mtk_devapc_data {
 
 struct mtk_devapc_context {
 	struct device *dev;
-	void __iomem *infra_base;
+	void __iomem *base;
 	u32 vio_idx_num;
 	struct clk *infra_clk;
 	const struct mtk_devapc_data *data;
@@ -56,7 +56,7 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
 	void __iomem *reg;
 	int i;
 
-	reg = ctx->infra_base + ctx->data->vio_sta_offset;
+	reg = ctx->base + ctx->data->vio_sta_offset;
 
 	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
 		writel(GENMASK(31, 0), reg + 4 * i);
@@ -71,7 +71,7 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
 	u32 val;
 	int i;
 
-	reg = ctx->infra_base + ctx->data->vio_mask_offset;
+	reg = ctx->base + ctx->data->vio_mask_offset;
 
 	if (mask)
 		val = GENMASK(31, 0);
@@ -113,11 +113,11 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
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
@@ -159,8 +159,8 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
 	void __iomem *vio_dbg0_reg;
 	void __iomem *vio_dbg1_reg;
 
-	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
-	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
+	vio_dbg0_reg = ctx->base + ctx->data->vio_dbg0_offset;
+	vio_dbg1_reg = ctx->base + ctx->data->vio_dbg1_offset;
 
 	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
 	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
@@ -198,7 +198,7 @@ static irqreturn_t devapc_violation_irq(int irq_number, void *data)
  */
 static void start_devapc(struct mtk_devapc_context *ctx)
 {
-	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
+	writel(BIT(31), ctx->base + ctx->data->apc_con_offset);
 
 	mask_module_irq(ctx, false);
 }
@@ -210,7 +210,7 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
 {
 	mask_module_irq(ctx, true);
 
-	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
+	writel(BIT(2), ctx->base + ctx->data->apc_con_offset);
 }
 
 static const struct mtk_devapc_data devapc_mt6779 = {
@@ -249,8 +249,8 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	ctx->data = of_device_get_match_data(&pdev->dev);
 	ctx->dev = &pdev->dev;
 
-	ctx->infra_base = of_iomap(node, 0);
-	if (!ctx->infra_base)
+	ctx->base = of_iomap(node, 0);
+	if (!ctx->base)
 		return -EINVAL;
 
 	if (of_property_read_u32(node, "vio_idx_num", &ctx->vio_idx_num))
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
