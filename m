Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA39EC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:58:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08DB60F4B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B08DB60F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6wRZYgRc+uwDStR9wGMhOcyZ73a5IMOWe5D5YQ6s6C4=; b=xPaikU+riBpVJR
	K6kOf2EdG/EQPEl6ZIsWaMENJdH7/txjW1BNG0bqBL92cW5Ny2IJGjIqs7/j9C/qHUuTV1eAYzPWs
	ezi9DwkE42XoXOtQCianyyGPNMtohTXq+D9NwTa91zfq7d7vM81kqiQtjlhgtZAHBCco+V7EFkdWA
	zJ4TVd/GyRoxFpSSETsHcUU1pBex4FY6vDDtuXkdLdIdjLub0DZfMplMb6k9UQI4tIR5LJAg+aD/R
	N/3OCF4YdS7wcxnbBbsJl4JIcDpqrZ9cHnH2MgmunXjX5rbOrptHAeqinXx1zM7liFnC2ydoCa47i
	XCFBFzv7D0hIAMOlQG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLJG7-0042XW-UE; Wed, 01 Sep 2021 05:58:04 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLJD6-0040jo-3n; Wed, 01 Sep 2021 05:54:57 +0000
Received: from BC-Mail-Ex26.internal.baidu.com (unknown [172.31.51.20])
 by Forcepoint Email with ESMTPS id 741CA1A34A86FA8A283E;
 Wed,  1 Sep 2021 13:54:54 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex26.internal.baidu.com (172.31.51.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 1 Sep 2021 13:54:54 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:54:53 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Sean Wang <sean.wang@mediatek.com>, Sean Young <sean@mess.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: rc: mtk-cir: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Wed, 1 Sep 2021 13:54:47 +0800
Message-ID: <20210901055448.7129-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_225456_405091_DD0C8363 
X-CRM114-Status: GOOD (  11.38  )
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

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/rc/mtk-cir.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 65a136c0fac2..840e7aec5c21 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -292,7 +292,6 @@ static int mtk_ir_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node;
-	struct resource *res;
 	struct mtk_ir *ir;
 	u32 val;
 	int ret = 0;
@@ -320,8 +319,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
 		ir->bus = ir->clk;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ir->base = devm_ioremap_resource(dev, res);
+	ir->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ir->base))
 		return PTR_ERR(ir->base);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
