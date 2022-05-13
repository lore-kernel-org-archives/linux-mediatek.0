Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59724C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 09:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q4KQqk7TZMEKVZn/ncc8ga0416YSwqWhd2MSY++dOm0=; b=pK8LLbPtPgKyKE
	EkztpcDAu3iWovIhMR0O2WY/24I1JQ94SKK3fJMj9SdeX9woDExWpQkH35Tsk7ro5NL+xPjlosin8
	AAppDB65ATrmzgpMHcBX8Ws50OEm3MTE/nyX8prkbFGHElOUt7Lbw1VTeOgErgTLWN/tVsyo4ZU1+
	ZpHlw2G6s4wGW0J/6cAG1BeHDQa9qKacLxq+Rhn0PBEOlBEDpSi2hDWBd6x7IgfMwivRuCx+PG7KD
	ul0MCWtO7tUXti2sRL8r8qfQ74A8fAHiiTIvte3Mt3ivVpVFeTRuzB/SvvWp9ev4D/mUI2DPYtQFq
	iuDC4VckDpU3zoSJnUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npS2w-00FSaV-EO; Fri, 13 May 2022 09:57:18 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npS2c-00FSUd-QS; Fri, 13 May 2022 09:57:00 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L03tz2sr9zhZ2n;
 Fri, 13 May 2022 17:56:11 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 17:56:53 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 13 May
 2022 17:56:52 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
CC: <matthias.bgg@gmail.com>, <sr@denx.de>, <wsa@the-dreams.de>
Subject: [PATCH -next 1/2] i2c: mt7621: fix missing clk_disable_unprepare() on
 error in mtk_i2c_probe()
Date: Fri, 13 May 2022 18:08:18 +0800
Message-ID: <20220513100819.2711845-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_025659_081461_A0EBFC6B 
X-CRM114-Status: UNSURE (   9.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the missing clk_disable_unprepare() before return
from mtk_i2c_probe() in the error handling case.

Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 45fe4a7fe0c0..f117c3d9ca19 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -304,7 +304,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	if (i2c->bus_freq == 0) {
 		dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_disable_clk;
 	}
 
 	adap = &i2c->adap;
@@ -322,10 +323,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(adap);
 	if (ret < 0)
-		return ret;
+		goto err_disable_clk;
 
 	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
 
+err_disable_clk:
+	clk_disable_unprepare(i2c->clk);
+
 	return ret;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
