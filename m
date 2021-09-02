Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224E3C4320E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:38:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA19A60F21
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA19A60F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdR05S+Dkmf9la3krJmkTIK489W8ge8b4RKYszvD4uM=; b=bD1E81YBCpDzfH
	RIUAa3ErhgbvKsNOzSzVfzuhN3Wxa+jSIXcLlYbojKll6pVCWItmydcLlafjqtKAULK3xi84tv4Ry
	xVqc6L8RQtY/aG72jb2O/tzWW8DkaTVdL+dnuCQZFfUIfaSijb45aBJX0lcQFV4/dhzcDEkyJbEIQ
	Rn5rqRVPN2shUrVfX8CER31EnMQvmZrPRf9wQvwFMgXedHQem+th0WPIC7bIW30NyBNc3NPOHAU1z
	LaQoB0RvWF6bmJKQUqDYx88vRZAxfvHi8z9jrhfhkGD0ExbRt/YqyBDeZUPC/BpYA944TGxHy6DXx
	eNVwVpRTtjgmFWdff3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLgMM-008iSJ-Lt; Thu, 02 Sep 2021 06:38:02 +0000
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLgLc-008iKm-SA; Thu, 02 Sep 2021 06:37:18 +0000
Received: from BJHW-Mail-Ex06.internal.baidu.com (unknown [10.127.64.16])
 by Forcepoint Email with ESMTPS id 60EBCE156FEC99B0549B;
 Thu,  2 Sep 2021 14:37:10 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex06.internal.baidu.com (10.127.64.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 14:37:10 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 14:37:09 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <patrice.chotard@foss.st.com>, <mchehab@kernel.org>,
 <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <lorenzo.pieralisi@arm.com>, <robh@kernel.org>, <kw@linux.com>,
 <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH v2 1/3] driver core: platform: Add the helper function
 devm_platform_get_and_ioremap_resource_byname()
Date: Thu, 2 Sep 2021 14:37:00 +0800
Message-ID: <20210902063702.32066-2-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210902063702.32066-1-caihuoqing@baidu.com>
References: <20210902063702.32066-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex28.internal.baidu.com (172.31.51.22) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex06_2021-09-02 14:37:10:371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_233717_271363_F684DFD5 
X-CRM114-Status: GOOD (  15.58  )
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

Since provide the helper function devm_platform_ioremap_resource_byname()
which is wrap platform_get_resource_byname() and devm_ioremap_resource().
But sometimes, many drivers still need to use the resource variables
obtained by platform_get_resource(). In these cases, provide this helper
function devm_platform_get_and_ioremap_resource_byname().

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Resend this patch as part of a patch series that uses
	the new function. 

 drivers/base/platform.c         | 30 ++++++++++++++++++++++++++----
 include/linux/platform_device.h |  3 +++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 652531f67135..34bb581338d9 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -124,6 +124,31 @@ void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
 
+/**
+ * devm_platform_get_and_ioremap_resource_byname - call devm_ioremap_resource() for a
+ *						   platform device and get resource
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource management
+ * @name: name of the resource
+ * @res: optional output parameter to store a pointer to the obtained resource.
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
+ */
+void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name, struct resource **res)
+{
+	struct resource *r;
+
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (res)
+		*res = r;
+	return devm_ioremap_resource(&pdev->dev, r);
+}
+EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource_byname);
+
 /**
  * devm_platform_ioremap_resource_byname - call devm_ioremap_resource for
  *					   a platform device, retrieve the
@@ -140,10 +165,7 @@ void __iomem *
 devm_platform_ioremap_resource_byname(struct platform_device *pdev,
 				      const char *name)
 {
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	return devm_ioremap_resource(&pdev->dev, res);
+	return devm_platform_get_and_ioremap_resource_byname(pdev, name, NULL);
 }
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_byname);
 #endif /* CONFIG_HAS_IOMEM */
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 7c96f169d274..50eb1a5b503a 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -66,6 +66,9 @@ extern void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
 			       unsigned int index);
 extern void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name, struct resource **res);
+extern void __iomem *
 devm_platform_ioremap_resource_byname(struct platform_device *pdev,
 				      const char *name);
 extern int platform_get_irq(struct platform_device *, unsigned int);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
