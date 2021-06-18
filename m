Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0ACC48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F21B9611CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F21B9611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amle6OYIzLyeUDiI/GBGmqHjyr2ILt5GC2lAZeDqI0E=; b=pgytHf8INwt41K
	IxtUufS+sQPxIalF3CbZPm+qGYdjsOWxRWeDZJ239KzhEp5zJ3yTqTtAHpP5Ru0ep1jQcQzhZm/bb
	VgztBOJFu874c5LGMSk5Cpexo4dY+dRYRypi5895eL1dmIbT29MuGfrq7ZexiLE6glz1AZnolI/r9
	jYSnAyGFdTJB+qbwd03wjRZpRTL38Mh8siiGc6d/7lauwn7saflpWrFFE44dk6YuqkkJc5M5s1BoS
	86eqBGaMczEtrUrySHXdHNgTLpVKxumAAma27YANLbPU43YT5zJhj17e5AzNF02YYlpox+uc8/FO/
	fpHdRvxBlaW5IyOnW9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luF0Y-00ENk9-MS; Fri, 18 Jun 2021 13:58:06 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luEzi-00ENLR-BK; Fri, 18 Jun 2021 13:57:17 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G60j023FYz1BNMQ;
 Fri, 18 Jun 2021 21:52:04 +0800 (CST)
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 21:57:08 +0800
Received: from huawei.com (10.90.53.225) by dggema755-chm.china.huawei.com
 (10.1.198.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 21:57:07 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH -next 1/2] ASoC: mediatek: mt8192:Fix Unbalanced
 pm_runtime_enable in mt8192_afe_pcm_dev_probe
Date: Fri, 18 Jun 2021 22:11:03 +0800
Message-ID: <20210618141104.105047-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20210618141104.105047-1-zhangqilong3@huawei.com>
References: <20210618141104.105047-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema755-chm.china.huawei.com (10.1.198.197)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_065714_925503_092A6D15 
X-CRM114-Status: GOOD (  12.02  )
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

Add missing pm_runtime_disable() when probe error out. It could
avoid pm_runtime implementation complains when removing and probing
again the driver.

Fixes:125ab5d588b0b ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 27 ++++++++++++++--------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 7a1724f5ff4c..31c280339c50 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2229,12 +2229,13 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
 		dev_err(dev, "could not get regmap from parent\n");
-		return PTR_ERR(afe->regmap);
+		ret = PTR_ERR(afe->regmap);
+		goto err_pm_disable;
 	}
 	ret = regmap_attach_dev(dev, afe->regmap, &mt8192_afe_regmap_config);
 	if (ret) {
 		dev_warn(dev, "regmap_attach_dev fail, ret %d\n", ret);
-		return ret;
+		goto err_pm_disable;
 	}
 
 	/* enable clock for regcache get default value from hw */
@@ -2244,7 +2245,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
 	if (ret) {
 		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
-		return ret;
+		goto err_pm_disable;
 	}
 
 	pm_runtime_put_sync(&pdev->dev);
@@ -2257,8 +2258,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->memif_size = MT8192_MEMIF_NUM;
 	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
 				  GFP_KERNEL);
-	if (!afe->memif)
-		return -ENOMEM;
+	if (!afe->memif) {
+		ret = -ENOMEM;
+		goto err_pm_disable;
+	}
 
 	for (i = 0; i < afe->memif_size; i++) {
 		afe->memif[i].data = &memif_data[i];
@@ -2272,22 +2275,26 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->irqs_size = MT8192_IRQ_NUM;
 	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
 				 GFP_KERNEL);
-	if (!afe->irqs)
-		return -ENOMEM;
+	if (!afe->irqs) {
+		ret = -ENOMEM;
+		goto err_pm_disable;
+	}
 
 	for (i = 0; i < afe->irqs_size; i++)
 		afe->irqs[i].irq_data = &irq_data[i];
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id < 0)
-		return irq_id;
+	if (irq_id < 0) {
+		ret = irq_id;
+		goto err_pm_disable;
+	}
 
 	ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret) {
 		dev_err(dev, "could not request_irq for Afe_ISR_Handle\n");
-		return ret;
+		goto err_pm_disable;
 	}
 
 	/* init sub_dais */
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
