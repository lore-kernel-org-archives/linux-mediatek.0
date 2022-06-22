Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9237EC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 01:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r+pqw0lVLKpkoUxBjbVytWnG69u1Bj1sw9D9pvX7brU=; b=OlVFg0xWuwXws31xwBgaoiH25O
	c6N4Gqaq4UgTdxVfoWdRJuPjXbyBbPmq5dPmJQbfLKWRvMfDb0NRT9kEO2yvFUMX1eEjkJGnNyEwV
	EW5WOlknkbmVxTcW7BOnM13AGHTYcPqcNZuTk8I3u8pQa0kRg8EbArtcuQXg+Y83ir+YvOeuabIhm
	5j0VOO1jl8SujFbwSOnA/d2ZRdhuZ4IkfK1cNTnB4KKVafVpGXTxJCvx422HSbT1ZfxNBetb9CYP+
	f5ZtMFSs7b0bg/gn52+vfO6SK3nhYvMAIGu6tL2xLrWLPiG9TB8YNh+NkdS9Umv/9SLZvoHC1Ee6I
	6XN/GU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ozJ-007yAY-7y; Wed, 22 Jun 2022 01:16:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3oz8-007y7h-4E; Wed, 22 Jun 2022 01:16:48 +0000
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LSQRT21M1zkWbq;
	Wed, 22 Jun 2022 09:15:17 +0800 (CST)
Received: from dggpeml100012.china.huawei.com (7.185.36.121) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 09:16:29 +0800
Received: from zelda.huawei.com (10.175.103.14) by
 dggpeml100012.china.huawei.com (7.185.36.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 09:16:28 +0800
From: Jin Xiaoyun <jinxiaoyun2@huawei.com>
To: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<khilman@baylibre.com>, <zhengbin13@huawei.com>, <gaochao49@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Jin
 Xiaoyun" <jinxiaoyun2@huawei.com>
Subject: [PATCH -next] soc: mediatek: SVS: Make svs_resume and svs_suspend defined when CONFIG_PM_SLEEP is y
Date: Wed, 22 Jun 2022 09:34:10 +0800
Message-ID: <20220622013410.2786760-1-jinxiaoyun2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.14]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml100012.china.huawei.com (7.185.36.121)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_181646_376727_52DA2BE3 
X-CRM114-Status: UNSURE (   8.12  )
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

The svs_resume and svs_suspend is defined through SIMPLE_DEV_PM_OPS. If CONFIG_PM_SLEEP
is not defined, SIMPLE_DEV_PM_OPS is equivalent to an empty function. In this case,
the defination of svs_resume and svs_suspend is meaningless.

Fix build error:
drivers/soc/mediatek/mtk-svs.c:1515:12: error: ‘svs_resume’ defined but not used [-Werror=unused-function]
drivers/soc/mediatek/mtk-svs.c:1481:12: error: ‘svs_suspend’ defined but not used [-Werror=unused-function]

Signed-off-by: Jin Xiaoyun <jinxiaoyun2@huawei.com>
---
 drivers/soc/mediatek/mtk-svs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 606a00a2e57d..8440058784dc 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1478,6 +1478,7 @@ static int svs_start(struct svs_platform *svsp)
 	return 0;
 }

+#ifdef CONFIG_PM_SLEEP
 static int svs_suspend(struct device *dev)
 {
 	struct svs_platform *svsp = dev_get_drvdata(dev);
@@ -1537,6 +1538,7 @@ static int svs_resume(struct device *dev)

 	return 0;
 }
+#endif

 static int svs_bank_resource_setup(struct svs_platform *svsp)
 {
--
2.25.1


