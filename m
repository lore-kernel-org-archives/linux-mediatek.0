Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99266C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 14:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626776115C
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 14:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 626776115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzJiWgBdkM/tYcff3ROa1I1EL9jKEXpIyTxKzTDu5bQ=; b=oAGUoSrqe7eZcR
	hsRDVD6OhaJsvEt0hMIvCTIjTnrUlJFqAjw72d3/f3P30PZpeGyPgtVpwlVQesoVpzyDUt9gyVJXh
	rI8+plCPusV4sjVMCJNjZXjhSLWnAwyQITD3xBXi/k9+FOzo3sg8f+m6HAAjUpte15KJ6zMoBg7Cg
	+hX6FoUrbFVxMJe62ozlAwU7He4f5JIME1CUVLKLUalWyuoIvsnrkxDBTlRHPHvEiqZ0TOHsMUJJG
	VEM+HFbWX0/CfQYms18z1g6J5L7CzsAmmZkOdmXirfctGPgMGyaD/WRHxdxh2U5nhnpMzsrqKBwTn
	f/TvgNwyvlY6ZN6TSW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgSVt-00B9P4-37; Fri, 29 Oct 2021 14:05:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgSVo-00B9N5-8G; Fri, 29 Oct 2021 14:05:43 +0000
X-UUID: b85b99bbde244171867fb5331c1446eb-20211029
X-UUID: b85b99bbde244171867fb5331c1446eb-20211029
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2095094791; Fri, 29 Oct 2021 07:05:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 06:56:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 29 Oct 2021 21:56:39 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 29 Oct 2021 21:56:39 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
 <hector.yuan@mediatek.com>
Subject: [PATCH v1 1/1] cpufreq: mediatek-hw: Fix double devm_remap in hotplug
 case
Date: Fri, 29 Oct 2021 19:42:23 +0800
Message-ID: <1635507743-17919-2-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1635507743-17919-1-git-send-email-hector.yuan@mediatek.com>
References: <1635507743-17919-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_070540_352645_919E370F 
X-CRM114-Status: GOOD (  15.28  )
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

From: "Hector.Yuan" <hector.yuan@mediatek.com>

When hotpluging policy cpu, cpu policy init will be called multiple times.
Unplug CPU7 -> CPU6 -> CPU5 -> CPU4, then plug CPU4 again.
In this case, devm_remap will double remap and resource allocate fail.
So replace devm_remap to ioremap and release resources in cpu policy exit.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c |   33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 0cf18dd..25317d7 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -36,6 +36,8 @@ enum {
 struct mtk_cpufreq_data {
 	struct cpufreq_frequency_table *table;
 	void __iomem *reg_bases[REG_ARRAY_SIZE];
+	struct resource *res;
+	void __iomem *base;
 	int nr_opp;
 };
 
@@ -156,6 +158,7 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 {
 	struct mtk_cpufreq_data *data;
 	struct device *dev = &pdev->dev;
+	struct resource *res;
 	void __iomem *base;
 	int ret, i;
 	int index;
@@ -170,9 +173,26 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 	if (index < 0)
 		return index;
 
-	base = devm_platform_ioremap_resource(pdev, index);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	if (!res) {
+		dev_err(dev, "failed to get mem resource %d\n", index);
+		return -ENODEV;
+	}
+
+	if (!request_mem_region(res->start, resource_size(res), res->name)) {
+		dev_err(dev, "failed to request resource %pR\n", res);
+		return -EBUSY;
+	}
+
+	base = ioremap(res->start, resource_size(res));
+	if (!base) {
+		dev_err(dev, "failed to map resource %pR\n", res);
+		ret = -ENOMEM;
+		goto release_region;
+	}
+
+	data->base = base;
+	data->res = res;
 
 	for (i = REG_FREQ_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
 		data->reg_bases[i] = base + offsets[i];
@@ -187,6 +207,9 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 	policy->driver_data = data;
 
 	return 0;
+release_region:
+	release_mem_region(res->start, resource_size(res));
+	return ret;
 }
 
 static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
@@ -233,9 +256,13 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct mtk_cpufreq_data *data = policy->driver_data;
+	struct resource *res = data->res;
+	void __iomem *base = data->base;
 
 	/* HW should be in paused state now */
 	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
+	iounmap(base);
+	release_mem_region(res->start, resource_size(res));
 
 	return 0;
 }
-- 
1.7.9.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
