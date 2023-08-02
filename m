Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EA1C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BW2XvmEW+IPXledMDw7XZf2mTLZJ4WE3BgNw5WmcIQ8=; b=hjiAc8V5rBi37WTsOOisoy0Z6V
	b5WMfxS6JCasxud4n+BVO01xfDk9czIvnEO7LRiCcf4RZlwM4MjLkNn/u6PAPmyTW+lIDUjo2HajX
	RhUI2VEQ8iywCY8qfxihV7y3f7a6Pqckaafsw5YaMIqq5l6yan295fR2pkDEf55Y+DjJSgDsvX2r9
	kHEtynUzRgJcYfWaNk8TB9+q5Uqnkdi+GDzZfbkGbJHsm5rM1aVTfRYGwes8aoQrIW1/EiNwZpJQB
	DGwp2HA9axyxXBIXLO/uqtFlcg2Vmr+mD+rnMV6/8kaBZNIX0EFvmkqCZooOfQ1xnHfemtchFdGQA
	utk86DDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8Qd-004WOy-0b;
	Wed, 02 Aug 2023 09:46:03 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8Qa-004WNT-1l;
	Wed, 02 Aug 2023 09:46:01 +0000
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RG6V96zRYzLp2C;
	Wed,  2 Aug 2023 17:43:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 17:45:56 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <rafael@kernel.org>, <daniel.lezcano@linaro.org>, <amitk@kernel.org>,
	<rui.zhang@intel.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <bchihi@baylibre.com>,
	<wenst@chromium.org>, <robh@kernel.org>, <frank.li@vivo.com>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <chenjiahao16@huawei.com>
Subject: [PATCH -next] thermal: Clean up redundant dev_err_probe()
Date: Wed, 2 Aug 2023 17:45:27 +0800
Message-ID: <20230802094527.988842-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_024600_793863_43B1FBE5 
X-CRM114-Status: GOOD (  10.27  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Referring to platform_get_irq()'s definition, the return value has
already been checked if ret < 0, and printed via dev_err_probe().
Calling dev_err_probe() one more time outside platform_get_irq()
is obviously redundant.

Removing dev_err_probe() outside platform_get_irq() to clean up
above problem.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 054c965ae5e1..371f66e899bd 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1138,7 +1138,7 @@ static int lvts_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return dev_err_probe(dev, irq, "No irq resource\n");
+		return irq;
 
 	ret = lvts_domain_init(dev, lvts_td, lvts_data);
 	if (ret)
-- 
2.34.1


