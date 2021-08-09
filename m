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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E65AC4320A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8E960F38
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D8E960F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEIc8gZPN+b4+4omqa3llLGEtUJ7wuYEgXZfKmKVeMM=; b=oaFWuoLMq4DcjB
	7bMyID8PF3nhF6Brhgm9iYyJ1X9nlMKyiQzeje2kittPrrgGGb/x970lG2IFEpEznLaK4TvMPphny
	rua35i/5tzrMlBn0ZcYt8fk06m35XPO/RgTtEzJRhuMbcK1Az/eNCCQz6a58QzI8oTOP08sHqgrQy
	VOxVVjMLCQbol6ucbigVyZhx9EpJunAVpB5L33b29emejM+68O3rixVVWVeSFvkh8EtmAzegPC3H6
	caeV5rqzuzs1i2fwLhjwR0QN9n20+yTj92j+fjCCgPuFEer0OATg7Mk/BJpFUH7IDNoEqhO6Hawip
	Pko3A/0gxhFdMnodx3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCxiO-00H9sq-3P; Mon, 09 Aug 2021 05:20:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCxht-00H9gF-GL; Mon, 09 Aug 2021 05:20:16 +0000
X-UUID: 1a1984cf716f4d66b0863d01527ee173-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=svOxZ3Huh3JXN9iCB4GeRPioetGX0FgZEdz9sKkyoJI=; 
 b=Oof9Ykwt3USZAiCrqLyH09YUBxIMJpAg+PmcWIAMriCP5z19/szuNmAxH8miMDU/54ayR+5TIhOl/zwAidTTdsSUTtXxviRqztsPsMu8AtT/ckj+JK8SMd3l5MRWvDf3mfTtHvUkRYOWdV+zVNRTag8y8ySOGHkOtRAsgVxJIT4=;
X-UUID: 1a1984cf716f4d66b0863d01527ee173-20210808
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 458688777; Sun, 08 Aug 2021 22:20:06 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 22:20:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 13:20:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 13:20:02 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, 
 <krzysztof.kozlowski@canonical.com>, <shawnguo@kernel.org>,
 <sam@ravnborg.org>, <linux@rempel-privat.de>, <daniel@0x0f.com>,
 <Max.Merchel@tq-group.com>, <geert+renesas@glider.be>, <fanghao11@huawei.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v6 4/6] remoteproc: mediatek: Support mt8195 scp
Date: Mon, 9 Aug 2021 13:19:57 +0800
Message-ID: <20210809051959.31136-5-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210809051959.31136-1-tinghan.shen@mediatek.com>
References: <20210809051959.31136-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_222013_622874_B991C07A 
X-CRM114-Status: GOOD (  17.38  )
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

The SCP clock design is changed on mt8195 that doesn't need to control
SCP clock on kernel side.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/mtk_common.h |  1 +
 drivers/remoteproc/mtk_scp.c    | 48 +++++++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 61901f5efa05..5ff3867c72f3 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -72,6 +72,7 @@ struct scp_ipi_desc {
 struct mtk_scp;
 
 struct mtk_scp_of_data {
+	int (*scp_clk_get)(struct mtk_scp *scp);
 	int (*scp_before_load)(struct mtk_scp *scp);
 	void (*scp_irq_handler)(struct mtk_scp *scp);
 	void (*scp_reset_assert)(struct mtk_scp *scp);
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9679cc26895e..36e48cf58ed6 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -312,6 +312,32 @@ static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
 	return -ENOENT;
 }
 
+static int mt8183_scp_clk_get(struct mtk_scp *scp)
+{
+	struct device *dev = scp->dev;
+	int ret = 0;
+
+	scp->clk = devm_clk_get(dev, "main");
+	if (IS_ERR(scp->clk)) {
+		dev_err(dev, "Failed to get clock\n");
+		ret = PTR_ERR(scp->clk);
+	}
+
+	return ret;
+}
+
+static int mt8192_scp_clk_get(struct mtk_scp *scp)
+{
+	return mt8183_scp_clk_get(scp);
+}
+
+static int mt8195_scp_clk_get(struct mtk_scp *scp)
+{
+	scp->clk = NULL;
+
+	return 0;
+}
+
 static int mt8183_scp_before_load(struct mtk_scp *scp)
 {
 	/* Clear SCP to host interrupt */
@@ -785,12 +811,9 @@ static int scp_probe(struct platform_device *pdev)
 	if (ret)
 		goto destroy_mutex;
 
-	scp->clk = devm_clk_get(dev, "main");
-	if (IS_ERR(scp->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		ret = PTR_ERR(scp->clk);
+	ret = scp->data->scp_clk_get(scp);
+	if (ret)
 		goto release_dev_mem;
-	}
 
 	/* register SCP initialization IPI */
 	ret = scp_ipi_register(scp, SCP_IPI_INIT, scp_init_ipi_handler, scp);
@@ -852,6 +875,7 @@ static int scp_remove(struct platform_device *pdev)
 }
 
 static const struct mtk_scp_of_data mt8183_of_data = {
+	.scp_clk_get = mt8183_scp_clk_get,
 	.scp_before_load = mt8183_scp_before_load,
 	.scp_irq_handler = mt8183_scp_irq_handler,
 	.scp_reset_assert = mt8183_scp_reset_assert,
@@ -864,6 +888,19 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 };
 
 static const struct mtk_scp_of_data mt8192_of_data = {
+	.scp_clk_get = mt8192_scp_clk_get,
+	.scp_before_load = mt8192_scp_before_load,
+	.scp_irq_handler = mt8192_scp_irq_handler,
+	.scp_reset_assert = mt8192_scp_reset_assert,
+	.scp_reset_deassert = mt8192_scp_reset_deassert,
+	.scp_stop = mt8192_scp_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+};
+
+static const struct mtk_scp_of_data mt8195_of_data = {
+	.scp_clk_get = mt8195_scp_clk_get,
 	.scp_before_load = mt8192_scp_before_load,
 	.scp_irq_handler = mt8192_scp_irq_handler,
 	.scp_reset_assert = mt8192_scp_reset_assert,
@@ -877,6 +914,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
+	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
