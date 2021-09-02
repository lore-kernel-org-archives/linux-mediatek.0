Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61794C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:38:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC04610D2
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CC04610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmgMGAtL3b/mCzX1i6KRIj0akAiBcmqSgxHFXLrHykM=; b=lrzbkbpafFKe2v
	q3cN39cNbqX4yAJmyX+k7Q9vndGWu25pUvUOgLdjY09Cs9dhus2cA3E1g53AJMJFejXyg0Iofpj//
	TTPCpSnoIiAEKbx29vCVxnAx9TQApv/722mtf56jASdBYMN4rMco44uDDP9Fz7MsuP+1weooPTbbn
	D7CiuVqyBjZRRsjofkzDElDz72UDrJaDntWJCs+zpwKKbA+nXlFCK2kU0eY8S+/JjXkIPX19oTblt
	vU2ffoOqgk6sKGuafip3j/+jzSSagD9VEihOqu/Ft+Hch3BBgrj4KxFySPm5g4l/yXvgk4O2eI5Dh
	SF2TOjlRqfjAtoM/dqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLgML-008iS4-LE; Thu, 02 Sep 2021 06:38:01 +0000
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLgLc-008iKp-S3; Thu, 02 Sep 2021 06:37:18 +0000
Received: from BJHW-Mail-Ex08.internal.baidu.com (unknown [10.127.64.18])
 by Forcepoint Email with ESMTPS id 2702A7305C619AF5E1D2;
 Thu,  2 Sep 2021 14:37:12 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex08.internal.baidu.com (10.127.64.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 14:37:12 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 14:37:11 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <patrice.chotard@foss.st.com>, <mchehab@kernel.org>,
 <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <lorenzo.pieralisi@arm.com>, <robh@kernel.org>, <kw@linux.com>,
 <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH v2 3/3] PCI: mediatek-gen3: Make use of the helper function
 devm_platform_get_and_ioremap_resource_byname()
Date: Thu, 2 Sep 2021 14:37:02 +0800
Message-ID: <20210902063702.32066-4-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210902063702.32066-1-caihuoqing@baidu.com>
References: <20210902063702.32066-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex28.internal.baidu.com (172.31.51.22) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex08_2021-09-02 14:37:12:149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_233717_286822_EEAD9D90 
X-CRM114-Status: UNSURE (   9.08  )
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

Use the devm_platform_get_and_ioremap_resource_byname() helper
instead of calling platform_get_resource_byname() and
devm_ioremap_resource() separately.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Use devm_platform_get_and_ioremap_resource_byname()
	instead of devm_platform_ioremap_resource_byname().

 drivers/pci/controller/pcie-mediatek-gen3.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 17c59b0d6978..27009da62ec1 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -715,10 +715,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie_port *port)
 	struct resource *regs;
 	int ret;
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
-	if (!regs)
-		return -EINVAL;
-	port->base = devm_ioremap_resource(dev, regs);
+	port->base = devm_platform_get_and_ioremap_resource_byname(pdev, "pcie-mac", &regs);
 	if (IS_ERR(port->base)) {
 		dev_err(dev, "failed to map register base\n");
 		return PTR_ERR(port->base);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
