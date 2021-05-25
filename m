Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C701C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 06:00:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573B1613AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 06:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573B1613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lw4RVipmA+3gZP5kIB0HB/ZE0JIbyG4SvkT7zZz5RCQ=; b=GHQMUn71Zv1vXh
	EAs+slVkwLs+eLa/C2tvE/VamYV3i9pO7agE3JY6JghPJvqHmL5YRKFkOxBsgR53sRzNRk++4jqJX
	ifSdNvINI7RgYgCiCYxIQs7K2QqmvCI2J3pLleWVQCLAJenDxrRxKAVf+duvazYfEvsU/9ZqGKq4P
	nHfwNeaqu8N7aVQAXGQj3+MUYJ7dmi2ctZjyduw+SrETMMj3bUamwmukxFkx53VVOIFuju2BHbkkf
	jIOZUsVkXkrBYc8pktfXr82T42uDcHeun1IKYXswShIVCwO3+BsNU0U+PHQ1vEBhd7DOgg731Gjms
	azT8ImqW88u6WljCSWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llQ7L-003WBu-VZ; Tue, 25 May 2021 06:00:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llQ6n-003W56-Bd; Tue, 25 May 2021 06:00:06 +0000
X-UUID: 8cd11f3f81ea4fd1a7b50de3eb6602eb-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zEKHr+ci2JttY8gj6nUAGYKf8GY5L0tjVJhMALr70gI=; 
 b=HolRojYZC1TjoomOATJN2ioBXJ1BYcW9cicJX56VLR3FOR1EM4LxOBhC3uF/BxCl4+wH8fH2UTmJUEzpLuuaOdRoDp7wIz/ORJI5dFpwtLIGtsgOTcLooT/3q0EpvRuX7kLUtCszxQx9tXobrjLeIJVE3V9V5l0cmVYKI5DVWtA=;
X-UUID: 8cd11f3f81ea4fd1a7b50de3eb6602eb-20210524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 294518170; Mon, 24 May 2021 23:00:03 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 22:53:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 13:53:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 May 2021 13:53:29 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Zhen Lei <thunder.leizhen@huawei.com>, Nina Wu <Nina-CM.Wu@mediatek.com>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 2/7] soc: mediatek: devapc: get 'vio_idx_num' info from DT
Date: Tue, 25 May 2021 13:53:01 +0800
Message-ID: <1621921986-20578-2-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1621921986-20578-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1621921986-20578-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_230005_459277_DD1E7158 
X-CRM114-Status: GOOD (  19.54  )
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
The number of devices controlled by each devapc (i.e. 'vio_idx_num')
will be set in DT for per devapc node.
On the other hand, for old ICs which have only one devapc HW, the
'vio_idx_num' info is set in compatible data.
To be backward compatible, the 'vio_idx_num' in compatible data is set
as the default value. Only when the default value is 0 will we get the
'vio_idx_num' from DT.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f1cea04..71643d1 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -32,7 +32,7 @@ struct mtk_devapc_vio_dbgs {
 };
 
 struct mtk_devapc_data {
-	/* numbers of violation index */
+	/* default numbers of violation index */
 	u32 vio_idx_num;
 
 	/* reg offset */
@@ -51,6 +51,9 @@ struct mtk_devapc_context {
 	void __iomem *infra_base;
 	struct clk *infra_clk;
 	const struct mtk_devapc_data *data;
+
+	/* numbers of violation index */
+	u32 vio_idx_num;
 };
 
 static void clear_vio_status(struct mtk_devapc_context *ctx)
@@ -60,10 +63,10 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
 
 	reg = ctx->infra_base + ctx->data->vio_sta_offset;
 
-	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
+	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num) - 1; i++)
 		writel(GENMASK(31, 0), reg + 4 * i);
 
-	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0),
+	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num) - 1, 0),
 	       reg + 4 * i);
 }
 
@@ -80,15 +83,15 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
 	else
 		val = 0;
 
-	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
+	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num) - 1; i++)
 		writel(val, reg + 4 * i);
 
 	val = readl(reg + 4 * i);
 	if (mask)
-		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
+		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num) - 1,
 			       0);
 	else
-		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
+		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num) - 1,
 				0);
 
 	writel(val, reg + 4 * i);
@@ -256,6 +259,16 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	if (!ctx->infra_base)
 		return -EINVAL;
 
+	/* Set vio_idx_num to default value.
+	 * If the value is 0, get the info from DT.
+	 */
+	ctx->vio_idx_num = ctx->data->vio_idx_num;
+	if (!ctx->vio_idx_num)
+		if (of_property_read_u32(node,
+					 "vio-idx-num",
+					 &ctx->vio_idx_num))
+			return -EINVAL;
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
