Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1643FC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 01:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xuqjIfY0PBIfx15jhTLaY6Pt60tgGESsk+GQewUinlE=; b=RRPB9H0CzbfsWVeLQv0m9OqZHp
	5XOr76u9UQCnQWPMTGCDyvxRZOwZ+OpchPhzK8j3pui011UgN57izofcQpPu8nnjRipBgtOWR3Y7g
	M7FnwFNZn2CCmad6xZPRxgr7S+abclSen8h9XmOVRMuZXEXuC4KL8QI60o1+rdzYck0zG52dmmSvS
	cUhC998wCtSaCGDP65Oou6PAjOYuKJ40gs55W/xW5BqIleOmrzXwq6FoQw18SOGP9Ctrt24WP3zE9
	aiFWDZiuXbre2+7SR2ZBp4hNGNol6lk+Lq/LJ1/jKtnGA1ftGktEA7lS6GEZvd1l/P0hr/UxZqBv3
	xMgwK/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRN4d-006MDs-0r;
	Thu, 03 Aug 2023 01:24:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRN4Z-006MCl-0s;
	Thu, 03 Aug 2023 01:24:17 +0000
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RGWLf6ctvzrS7V;
	Thu,  3 Aug 2023 09:23:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 09:24:10 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <rafael@kernel.org>, <daniel.lezcano@linaro.org>, <amitk@kernel.org>,
	<rui.zhang@intel.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <aouledameur@baylibre.com>,
	<void0red@hust.edu.cn>, <robh@kernel.org>, <daniel@makrotopia.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <chenjiahao16@huawei.com>
Subject: [PATCH -next] thermal/drivers/mediatek: Remove repeating warn msg after devm_thermal_add_hwmon_sysfs()
Date: Thu, 3 Aug 2023 09:23:41 +0800
Message-ID: <20230803012341.2388831-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_182415_482594_03B33D1B 
X-CRM114-Status: GOOD (  10.41  )
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

Referring to commit 8416ecfb32923 ("thermal/hwmon: Add error
information printing for devm_thermal_add_hwmon_sysfs()"),
return value has already been checked if ret != 0 in
devm_thermal_add_hwmon_sysfs(). Error handling has also been
performed in this case, including print warning message for
debugging.

Removing dev_warn() following devm_thermal_add_hwmon_sysfs()
to clean up redundant warning message.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index c537aed71017..7f8450c66646 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1289,9 +1289,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	if (IS_ERR(tzdev))
 		return PTR_ERR(tzdev);
 
-	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
-	if (ret)
-		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
+	devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
 
 	return 0;
 }
-- 
2.34.1


