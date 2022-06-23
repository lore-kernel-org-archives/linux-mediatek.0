Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6D9C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZF8Dm+DtqxJwnmDG5ihQzPu0BtyIyIoETKFDzmppW5o=; b=1j8vwoqOhY0ErFrqCEyKFwKk5t
	uzrYfemnwQuSGZ//tMZ+m5efhRvmGgUJE96MKn01mqYCEgudusvVybgN8OB5A5oLwp3wWTvGe7xwF
	+jpPCZbyML14WRRsVruvsvrhmfIUjdXcQF+VMUQHW1ofsMDtdM74n9z9ZqlxuWON+vQuzbrQ0nSKS
	uF+rZtqsRDJYRiFSyX4ac0jDqXtRQPibo9YS5vUtjaJ8LUUKeHuGltVWRkHTQ1o7C5MDudtPdZXTN
	iEP1IkCV9oS42Nhy6xB7x/ZWfANq9mHrrG6UM5ChQK54EPlbZAFSYx+5J2klIqTQDTVEdtyfWataU
	PWrdRMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4GxR-00Dnxy-FB; Thu, 23 Jun 2022 07:08:53 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4GxF-00DnvI-76; Thu, 23 Jun 2022 07:08:43 +0000
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LTBCD61YwzkWcV;
	Thu, 23 Jun 2022 15:07:20 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500023.china.huawei.com
 (7.221.188.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 23 Jun
 2022 15:08:33 +0800
From: Peng Wu <wupeng58@huawei.com>
To: <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<liwei391@huawei.com>, <wupeng58@huawei.com>
Subject: [PATCH v2] soc: mediatek: fix missing clk_disable_unprepare() on err in svs_resume()
Date: Thu, 23 Jun 2022 07:02:40 +0000
Message-ID: <20220623070240.63382-1-wupeng58@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500023.china.huawei.com (7.221.188.76)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_000841_504444_9F63F9E8 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

Fix the missing clk_disable_unprepare() before return
from svs_resume() in the error handling case.

Signed-off-by: Peng Wu <wupeng58@huawei.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
---
v2:
- Same holds for the error path of svs_init02().
---
 drivers/soc/mediatek/mtk-svs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 606a00a2e57d..87e05ab51552 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1526,16 +1526,20 @@ static int svs_resume(struct device *dev)
 	ret = reset_control_deassert(svsp->rst);
 	if (ret) {
 		dev_err(svsp->dev, "cannot deassert reset %d\n", ret);
-		return ret;
+		goto out_of_resume;
 	}
 
 	ret = svs_init02(svsp);
 	if (ret)
-		return ret;
+		goto out_of_resume;
 
 	svs_mon_mode(svsp);
 
 	return 0;
+
+out_of_resume:
+	clk_disable_unprepare(svsp->main_clk);
+	return ret;
 }
 
 static int svs_bank_resource_setup(struct svs_platform *svsp)
-- 
2.17.1


