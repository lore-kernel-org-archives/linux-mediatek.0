Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29571C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 07:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F0C60F92
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2F0C60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O/BCH/7PxxgGaRqSmV9DkubFJd9FRy+1vRFbHFBY/Hg=; b=NhOwbhuA1bDykg
	p6/suC6r95UHzxTozgs8qadTwpMmxQ+CQKWElBCY1Vi261D9xwAoGHRK1iz/tqfOftkBj9JJnSRyO
	VMasT0puP/Ho+myfk301Wsx/Ri6IKCMFWZS+boJ7vyZWJuXEszywIIdELveRJeYQW2ST7PtE/V8GL
	JLUSAXv006g8w4kmqGWGZaCbBxA/23EAIcc1RXpywGP/rhHAvtYZfpfMlOZ3mSWvmC6KQVMdg+rgb
	jMBn2bp6ZlXqWi1shI6NRDxd+4OIDvf8HeRe/G0ltZvCB5hwt0KbknoOI9JLEN7W4Abwx+1Z0qBIB
	JR57FSyrFoyxORFmQBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLKqq-004M1z-6w; Wed, 01 Sep 2021 07:40:04 +0000
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLKqd-004LzO-GO; Wed, 01 Sep 2021 07:39:52 +0000
Received: from BC-Mail-Ex17.internal.baidu.com (unknown [172.31.51.11])
 by Forcepoint Email with ESMTPS id 8B2E7113A80747849D84;
 Wed,  1 Sep 2021 15:39:48 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex17.internal.baidu.com (172.31.51.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 15:39:48 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:39:47 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] PCI: mediatek: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Date: Wed, 1 Sep 2021 15:39:41 +0800
Message-ID: <20210901073942.8733-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_003951_775074_19773FD1 
X-CRM114-Status: GOOD (  11.11  )
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
 drivers/pci/controller/pcie-mediatek.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 4cb5ea8e1069..90913025da05 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -980,16 +980,12 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct resource *regs;
 	int err;
 
 	/* get shared registers, which are optional */
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "subsys");
-	if (regs) {
-		pcie->base = devm_ioremap_resource(dev, regs);
-		if (IS_ERR(pcie->base))
-			return PTR_ERR(pcie->base);
-	}
+	pcie->base = devm_platform_ioremap_resource_byname(pdev, "subsys");
+	if (IS_ERR(pcie->base))
+		return PTR_ERR(pcie->base);
 
 	pcie->free_ck = devm_clk_get(dev, "free_ck");
 	if (IS_ERR(pcie->free_ck)) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
