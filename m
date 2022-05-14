Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F170C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 May 2022 02:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blbXvsiiEc1ppBNyHtFAok38EGUmYot0kypciw0zMh8=; b=yDbRgXSUK+4Sdr
	l4s/6DGbZvtP+1l2U2uveh2ImPns+PmT0U2OvqlHBoArtbi+VrxH1st2KoB0nAhFhO5Om9s/wv9Ki
	8uFdphH1zBEMvihP3dEHjhyUX9CEICWEnHUCIOullmJVOAcBVeRSP1FMvQ/6boNRJUbVqRYDVMTwa
	zOHuJGZIhoeRCEIpJx7cFuvvEkyJXAkWi0KUtiWCsl9YSJgc6awmt5cNyH1qvC+uQXLsGHlXRP6gc
	2sDMzT9tzReV6gZ1iVkBLUFBxmkKU4tZSKbJ59z+Prm25eikwmkXsXYH1W9SI5PMZfqZ6TLOS+zET
	FBUoszzvrKYMnx5LH7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nphOj-000ZRA-BS; Sat, 14 May 2022 02:20:49 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nphOS-000ZL4-I5; Sat, 14 May 2022 02:20:34 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4L0TjB1ryWz1JC4m;
 Sat, 14 May 2022 10:19:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:20:25 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 14 May
 2022 10:20:25 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
CC: <matthias.bgg@gmail.com>, <sr@denx.de>, <wsa@the-dreams.de>,
 <christophe.jaillet@wanadoo.fr>
Subject: [PATCH -next v2 2/2] i2c: mt7621: Use
 devm_platform_get_and_ioremap_resource()
Date: Sat, 14 May 2022 10:31:48 +0800
Message-ID: <20220514023148.305457-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220514023148.305457-1-yangyingliang@huawei.com>
References: <20220514023148.305457-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_192032_788597_B65CCB4F 
X-CRM114-Status: UNSURE (   8.57  )
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

Use devm_platform_get_and_ioremap_resource() to simplify
code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Stefan Roese <sr@denx.de>
---
 drivers/i2c/busses/i2c-mt7621.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 901f0fb04fee..cfe6de8175dd 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -270,18 +270,15 @@ static void mtk_i2c_init(struct mtk_i2c *i2c)
 
 static int mtk_i2c_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct mtk_i2c *i2c;
 	struct i2c_adapter *adap;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct mtk_i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
-	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
