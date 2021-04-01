Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25C5C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 06:39:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8268D600EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 06:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8268D600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=18T/fgRrNr9yjLfh2cqJsz/w/JaskgR9Rcue7lkXVNs=; b=BI9FneP6KNY5IjTlykR8yfENx
	5CovTAk2kVmx2ktdIr/B090MIkNm19fPJn3hq6jPd7GE38X2/MgoiiO1500+Dbqlfb7VzSHFFYJNY
	h5Z2ij2DLMJVLKc17USaBykcXD1XFfSwQPUSV931BYG54vSaJp9RT5E7D7gLgLpUH2Qwrtz7UOqZe
	48+dGkq4eSUy/6GApRrBkxnS4+tuxEKsOkrGNUaReYrV8J0/LD6uaSOuemuGGN6MdGFLBovmq2Oqi
	BDy64w4zAQAnn4t12YKL+DUPPO2vLMTozH9+qX1WXRaMWHb6On4ttTE33YV7pAUZBla2d4d9SVHCw
	qRSFtppcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqzZ-008h8k-1I; Thu, 01 Apr 2021 06:39:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqzR-008h6z-Tk; Thu, 01 Apr 2021 06:39:42 +0000
X-UUID: c9356ed29d53463c9d8ffc5ff169c152-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rlFo2Z+gRh4Fo5OKcfVgBgemg4RjhnedgFAH2kMQ9R0=; 
 b=iSfWy1WSCcXx6FqWnxlIIKuz1g1s6HqBzd6idfAytm7bk3AkjaMC+z9pGGSNQQHRjcCsz4m6m+jEacHHHFGMzBraVKOpoLXAMoi+iEpKaAGYqjapUYSWzKR0eflcdGYxr9aylcAjhKrbeWb4xSXekKhh6Z6wzinLizeq9i4TIio=;
X-UUID: c9356ed29d53463c9d8ffc5ff169c152-20210331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1430487978; Wed, 31 Mar 2021 23:39:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 23:39:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Apr 2021 14:39:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 1 Apr 2021 14:39:27 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Nina Wu <Nina-CM.Wu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Subject: [PATCH v2 2/6] soc: mediatek: devapc: move 'vio_idx_num' info to DT
Date: Thu, 1 Apr 2021 14:38:03 +0800
Message-ID: <1617259087-5502-2-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_073938_668657_C723281A 
X-CRM114-Status: GOOD (  16.73  )
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
The number of devices controlled by each devapc (i.e. 'vio_idx_num'
in the code) varies.
We move this info from compatible data to DT so that we do not need
to add n compatible for a certain IC which has n devapc HWs with
different 'vio_idx_num', respectively.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f1cea04..a0f6fbd 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -32,9 +32,6 @@ struct mtk_devapc_vio_dbgs {
 };
 
 struct mtk_devapc_data {
-	/* numbers of violation index */
-	u32 vio_idx_num;
-
 	/* reg offset */
 	u32 vio_mask_offset;
 	u32 vio_sta_offset;
@@ -49,6 +46,7 @@ struct mtk_devapc_data {
 struct mtk_devapc_context {
 	struct device *dev;
 	void __iomem *infra_base;
+	u32 vio_idx_num;
 	struct clk *infra_clk;
 	const struct mtk_devapc_data *data;
 };
@@ -60,10 +58,10 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
 
 	reg = ctx->infra_base + ctx->data->vio_sta_offset;
 
-	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
+	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
 		writel(GENMASK(31, 0), reg + 4 * i);
 
-	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0),
+	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1), 0),
 	       reg + 4 * i);
 }
 
@@ -80,15 +78,15 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
 	else
 		val = 0;
 
-	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
+	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
 		writel(val, reg + 4 * i);
 
 	val = readl(reg + 4 * i);
 	if (mask)
-		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
+		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
 			       0);
 	else
-		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
+		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
 				0);
 
 	writel(val, reg + 4 * i);
@@ -216,7 +214,6 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
 }
 
 static const struct mtk_devapc_data devapc_mt6779 = {
-	.vio_idx_num = 511,
 	.vio_mask_offset = 0x0,
 	.vio_sta_offset = 0x400,
 	.vio_dbg0_offset = 0x900,
@@ -256,6 +253,9 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	if (!ctx->infra_base)
 		return -EINVAL;
 
+	if (of_property_read_u32(node, "vio_idx_num", &ctx->vio_idx_num))
+		return -EINVAL;
+
 	devapc_irq = irq_of_parse_and_map(node, 0);
 	if (!devapc_irq)
 		return -EINVAL;
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
