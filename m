Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F283C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 07:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2664061053
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 07:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2664061053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mPwvgOqJ+ZMPIFUB5m8BOFdZa83MoFOYYsuxElcJXEo=; b=C3Ec1geYoj5jLV
	hSnwKC6aDWJmGmrJiFvvHtbJJSlXgEO6qkP4KY5Z1OzTOzloquHzT9G/NHmtEiPx4eF5OEzNxpPNE
	Pml56I/CHakDS9ovVB1pNwN1HcdiNpnIdQ/+NwcXYKxuncr9gvSRvbSivmOAExT3xocyj43K+yocg
	hioZc4SFum26tsmJpl0Yqd6xJOKZUf448TKAyFyqa8UmpzZzsbo6CtbsMnBYWQWlYZQjn5v6dkT8L
	Q+8N9PtDqXT8qJcUfEwPw/MWB3hZLptGPtxXMN7HCA6Zf3VDerhyR+OIWdpdIZkFSpDSdAESI7I5f
	aoXE99B/C0uIHvNYLGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLKrD-004M7y-OM; Wed, 01 Sep 2021 07:40:27 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLKr0-004M3r-Fw; Wed, 01 Sep 2021 07:40:15 +0000
Received: from BJHW-Mail-Ex05.internal.baidu.com (unknown [10.127.64.15])
 by Forcepoint Email with ESMTPS id 24362C7D596DE45E233D;
 Wed,  1 Sep 2021 15:40:13 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex05.internal.baidu.com (10.127.64.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:40:13 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:40:12 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] PCI: mediatek-gen3: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Date: Wed, 1 Sep 2021 15:40:06 +0800
Message-ID: <20210901074006.8783-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex05_2021-09-01 15:40:13:153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_004014_753396_405480CB 
X-CRM114-Status: UNSURE (   9.02  )
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

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 17c59b0d6978..014747c6dcd4 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -715,10 +715,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie_port *port)
 	struct resource *regs;
 	int ret;
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
-	if (!regs)
-		return -EINVAL;
-	port->base = devm_ioremap_resource(dev, regs);
+	port->base = devm_platform_ioremap_resource_byname(pdev, "pcie-mac");
 	if (IS_ERR(port->base)) {
 		dev_err(dev, "failed to map register base\n");
 		return PTR_ERR(port->base);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
