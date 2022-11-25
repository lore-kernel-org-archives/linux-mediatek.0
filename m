Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED34C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Ci7vAjFSMvVShTWjw32xBpk+rQe/kFg6Mfyn9Eypi4=; b=K1z70/rRkhMK9u6Xopv+kREFOH
	4vDW0798BaCAWNUCCKKyCQJZ+/qxGXQnrtH4AMDBgPr+iS2AYHH1zhWgt5ruxJx/tMwpBYTd/5FEw
	DpZ81COB7+eFnaSGtIKUeVlPG/asGAnCfAJEBkUYL86zKBTfZL6GMO4tNHiYzU3N6GXsO9YnW0glK
	3iB598wmZi7a8rahxCSuFYSLRCc6jAih+t3jL/E2rdE9LsJn9zl7kXrqFFVhDXMPEYOBSVbx0gTrH
	UiaWiqLJKbAjAVNvvI22yQPaThghPA5jEFXsKmjhpBi6irSroP4asjgAVQ5NMWmcg43DJeh1IhJsQ
	AdynqkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyUau-00Ejco-05; Fri, 25 Nov 2022 09:02:00 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyUah-00EjXF-Iw; Fri, 25 Nov 2022 09:01:49 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NJTP06jpzz15Mt7;
	Fri, 25 Nov 2022 17:01:08 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 25 Nov 2022 17:01:41 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <chaotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
	<matthias.bgg@gmail.com>, <drinkcat@chromium.org>, <wenbin.mei@mediatek.com>,
	<cuigaosheng1@huawei.com>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] mmc: mtk-sd: Fix missing clk_disable_unprepare in msdc_of_clock_parse()
Date: Fri, 25 Nov 2022 17:01:41 +0800
Message-ID: <20221125090141.3626747-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_010147_812705_6C65FC8E 
X-CRM114-Status: UNSURE (   8.66  )
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

The clk_disable_unprepare() should be called in the error handling
of devm_clk_bulk_get_optional, fix it by replacing devm_clk_get_optional
and clk_prepare_enable by devm_clk_get_optional_enabled.

Fixes: f5eccd94b63f ("mmc: mediatek: Add subsys clock control for MT8192 msdc")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/mmc/host/mtk-sd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 0f06cc5fec86..abadfc319053 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2605,13 +2605,11 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
 			return PTR_ERR(host->src_clk_cg);
 	}
 
-	host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
+	/* If present, always enable for this clock gate */
+	host->sys_clk_cg = devm_clk_get_optional_enabled(&pdev->dev, "sys_cg");
 	if (IS_ERR(host->sys_clk_cg))
 		host->sys_clk_cg = NULL;
 
-	/* If present, always enable for this clock gate */
-	clk_prepare_enable(host->sys_clk_cg);
-
 	host->bulk_clks[0].id = "pclk_cg";
 	host->bulk_clks[1].id = "axi_cg";
 	host->bulk_clks[2].id = "ahb_cg";
-- 
2.25.1


