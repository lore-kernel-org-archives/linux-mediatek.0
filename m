Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E33C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 12:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xiA1XaECpdcwK7c8+j8fljdKrKhBHuap+BUSsrHrhB4=; b=oJBnjcnwRVSUCzeoTUja35L/ap
	n2wNj5CYG8sG7Anq8NZ0edNznsw82zm85t2b05z4Zc+C84RZ5z5TtoMfscYZqCL5xEJUWGfQlGjfO
	LQpLywstB5zPcWClsUDwY9a9zK5oSquRFLfyh3UBKUr2KzIEI4kgHFBE4UzNrxxzoP0W8FMDxKTT1
	Ug9Nq6QqUkrrisiZgDBA7wdBIAWEki3Mw69DuD9q/GStua0aQ2FyrWH0Qb76VtCOSG48g3qLJ6zJ0
	mUoFAWR4YLS1rNWTiM+feacSYR6rP0SGeNixmxwVxtzMW9GFqumm8OXNUHsmpLI6oKLi/KYmo4wpG
	2ruhpRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoXr-002MOP-1H;
	Tue, 01 Aug 2023 12:32:11 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoV4-002LSY-2V;
	Tue, 01 Aug 2023 12:29:20 +0000
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFZB23DB2zVjpT;
	Tue,  1 Aug 2023 20:27:22 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 20:29:05 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <wangzhu9@huawei.com>
Subject: [PATCH -next] usb: typec: tcpci_mt6370: remove redundant dev_err_probe()
Date: Tue, 1 Aug 2023 20:28:34 +0800
Message-ID: <20230801122834.89168-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_052919_025637_F8D2397A 
X-CRM114-Status: GOOD (  11.63  )
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

When platform_get_irq() is called, the error message has been printed,
so it need not to call dev_err_probe() to present error messages.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6370.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
index 2a079464b398..9cda1005ef01 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -147,7 +147,7 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return dev_err_probe(dev, irq, "Failed to get irq\n");
+		return irq;
 
 	/* Assign TCPCI feature and ops */
 	priv->tcpci_data.auto_discharge_disconnect = 1;
-- 
2.17.1


