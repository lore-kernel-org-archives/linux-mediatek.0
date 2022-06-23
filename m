Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE84C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 02:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucjqEYJh5s/372EbHu35ghd0/cCPI0TncnRquBSXogs=; b=fd3l4nulbLn0X8yjmcTTU45Ywy
	gTh2IjajdEPcnWMdjpwsoFjnyvmTqTN/qkS4cwSuisCohxp0LALR5bk+vCkZz6ZiiibBdmrQmEXLV
	iBSil9U50XKE1yLO5Wtxqc5mmx5khCReGBOn6vmjMwbz2C/SUFXBSjk6RpnNeHfMlekcCd3eMVjPi
	ATKrYsjIoITE7NLvOuUzgN0mBEY22jnZl2CXv6o2bvosgo9dALqAh6KbBSYSYYRnYnboUIVNt3QAG
	EMEVjz4zBLRwn01Iyq1m6EqSiydfD2KoYogvYXXgjqzdPNGkitfA/+L1tk9PNzO7D6BE6nbv33dbQ
	PBRpbkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4CxK-00D6Pc-Lp; Thu, 23 Jun 2022 02:52:30 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Cx9-00D6MT-FP; Thu, 23 Jun 2022 02:52:21 +0000
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LT4VD4hzZz1KC7y;
	Thu, 23 Jun 2022 10:49:56 +0800 (CST)
Received: from dggpeml100012.china.huawei.com (7.185.36.121) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 10:52:04 +0800
Received: from zelda.huawei.com (10.175.103.14) by
 dggpeml100012.china.huawei.com (7.185.36.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 10:52:03 +0800
From: Jin Xiaoyun <jinxiaoyun2@huawei.com>
To: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<khilman@baylibre.com>, <zhengbin13@huawei.com>, <gaochao49@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Jin
 Xiaoyun" <jinxiaoyun2@huawei.com>
Subject: [PATCH v2 -next] soc: mediatek: SVS: Use the new PM macros
Date: Thu, 23 Jun 2022 11:09:31 +0800
Message-ID: <20220623030931.2816013-1-jinxiaoyun2@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622013410.2786760-1-jinxiaoyun2@huawei.com>
References: <20220622013410.2786760-1-jinxiaoyun2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.14]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml100012.china.huawei.com (7.185.36.121)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_195219_717140_49B56D80 
X-CRM114-Status: GOOD (  10.64  )
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

Use DEFINE_SIMPLE_DEV_PM_OPS() instead of the SIMPLE_DEV_PM_OPS()
macro, along with using pm_sleep_ptr() as this driver doesn't handle
runtime PM.

Fix build error:
drivers/soc/mediatek/mtk-svs.c:1515:12: error: ‘svs_resume’ defined but not used [-Werror=unused-function]
drivers/soc/mediatek/mtk-svs.c:1481:12: error: ‘svs_suspend’ defined but not used [-Werror=unused-function]

Signed-off-by: Jin Xiaoyun <jinxiaoyun2@huawei.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
v1->v2:
- Remove the #ifdef CONFIG_PM guard around the suspend/resume functions
- Use DEFINE_SIMPLE_DEV_PM_OPS along with using pm_sleep_ptr()
---
 drivers/soc/mediatek/mtk-svs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 606a00a2e57d..fae7376bd083 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2381,13 +2381,13 @@ static int svs_probe(struct platform_device *pdev)
 	return ret;
 }

-static SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);

 static struct platform_driver svs_driver = {
 	.probe	= svs_probe,
 	.driver	= {
 		.name		= "mtk-svs",
-		.pm		= &svs_pm_ops,
+		.pm		= pm_sleep_ptr(&svs_pm_ops),
 		.of_match_table	= of_match_ptr(svs_of_match),
 	},
 };
--
2.25.1


