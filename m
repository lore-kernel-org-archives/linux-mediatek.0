Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B51C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 06:40:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B09920707
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 06:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q81dzKeL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B09920707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=inC0yh7Luc2L65IPXfwloTCdJDBtypQqFtTPfiGd3uU=; b=q81dzKeLYfdvv2eH5lXTs4sFAz
	ZN/bXimPtpRKO08z4pHnNMGR3WvexsVMajsm84QKNnLFjUZp5DC459Pyt+dm9TiXRs8kgjxymrjJd
	vH7uKpUuiUxdDsZqkOhMXQrtBc6EGmjktcOMNUYIP2bJNhuqPJHGgp2mrfBuK+tbdGMYfh8EBrNt6
	8l86j7knl7ahGv37KskXd2woJf0dX/quTwc+ziBPr/KGmoLmR6pPD6jIOdDzc0woKKnKEPazDHQLL
	Ovjl72Gm73efYh65O6jyvnLtIvAWxEzvSqwVYm6akzdJ/Nt/t9UdxUEQx0/Y3XyxOKnvOmW8sLweK
	q13/QJBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInaG-0005JY-2s; Thu, 17 Sep 2020 06:39:56 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kInaC-0005GZ-4f; Thu, 17 Sep 2020 06:39:53 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DCF45C1115718EE0FF4F;
 Thu, 17 Sep 2020 14:39:36 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 14:39:29 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <sean.wang@kernel.org>, <linus.walleij@linaro.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH -next] pinctrl: mediatek: use
 devm_platform_ioremap_resource_byname()
Date: Thu, 17 Sep 2020 14:41:51 +0800
Message-ID: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_023952_447980_D4B104BB 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 11 ++---------
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  9 +--------
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 11 ++---------
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index aa1068d2867f..5e00f93ac998 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -589,7 +589,6 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc)
 {
 	struct pinctrl_pin_desc *pins;
-	struct resource *res;
 	struct mtk_pinctrl *hw;
 	int err, i;
 
@@ -612,14 +611,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 
 	for (i = 0; i < hw->soc->nbase_names; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   hw->soc->base_names[i]);
-		if (!res) {
-			dev_err(&pdev->dev, "missing IO resource\n");
-			return -ENXIO;
-		}
-
-		hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
+		hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
+						hw->soc->base_names[i]);
 		if (IS_ERR(hw->base[i]))
 			return PTR_ERR(hw->base[i]);
 	}
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 2f3dfb56c3fa..e8622c7e117a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -354,7 +354,6 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
@@ -366,13 +365,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	if (!hw->eint)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "eint");
-	if (!res) {
-		dev_err(&pdev->dev, "Unable to get eint resource\n");
-		return -ENODEV;
-	}
-
-	hw->eint->base = devm_ioremap_resource(&pdev->dev, res);
+	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
 	if (IS_ERR(hw->eint->base))
 		return PTR_ERR(hw->eint->base);
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index a23c18251965..623af4410b07 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -940,7 +940,6 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 {
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
-	struct resource *res;
 	int err, i;
 
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
@@ -963,14 +962,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 
 	for (i = 0; i < hw->soc->nbase_names; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   hw->soc->base_names[i]);
-		if (!res) {
-			dev_err(&pdev->dev, "missing IO resource\n");
-			return -ENXIO;
-		}
-
-		hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
+		hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
+					hw->soc->base_names[i]);
 		if (IS_ERR(hw->base[i]))
 			return PTR_ERR(hw->base[i]);
 	}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
