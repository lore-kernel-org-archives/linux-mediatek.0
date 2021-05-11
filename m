Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5ACC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:22:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C05D86143B
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C05D86143B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TePxkJHJFrmI2Y9cNGpW6JnOl3gFCyZ1TyafAT7kzhY=; b=UH/h+8cRxq0FsyQFONjm2ksOAW
	zn7nWwDiD6nP9TB5F8visXe7EFmF3sKz/BNqeML9TOvWFDBFyGBVDH/AVjlZ4ovAXn9DyxqDAdnhP
	x2JxnibFANAxlk3joKNjL2GulRI0LamdmOFLJWldYhMBtAOQ/YCbrrcAyFN6x8cQBtyp0b+FM5jrX
	nO3cQstYaOXK3st82oxoOQfxSTYqPNwx+5rWtGnYk+hOA/dg0krwtjD5DXalZzCXjryrJvzc3wKZm
	5DrCwrEvSTmW5wi/abWlZsuE1Exp5+LTTIGX3AXEoZ9/eBSIbb+dNz4FBg66QgSukFXKLjRNu3YwF
	uCERU7sQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSKj-0004KY-UH; Tue, 11 May 2021 13:21:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgRRq-00HNAC-59; Tue, 11 May 2021 12:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=R4vZ8yVFCen7CbGOhmvEP7B59z1qmfsSbg2OmxW5zKU=; b=vN42DF2DMl6xxZyrk3pJhOyMXh
 D9At9u1pqlMqjYHMv8X/wx6TL3rzbclzJMNb3p5KbksvUqVhQieAxxFWeQHjWLKRnwneXUIEIri88
 eUPKR+W28tFe6vD+GBDMCUpKVOgVkw99RWxB3L4hlwXjtZbxdtoRJHPnb43wCGHVBFCG34HfFPIL3
 EGDj7sSib5Z7fc0G46330/a2TE+OYCmYgX+8IOrEQZ63QTnXM46unCpGHQwOD+ii2AhbHA3dlOMWD
 bEapBplK20T93M+fmcEELW2VeUPN5s5sxEQ4s1MUNo3vHiD46fAQF3o2exfG8yJCzBkm3pvkoMWMY
 eEgv/QQA==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgRRn-009Z6t-4C; Tue, 11 May 2021 12:25:12 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfcW73mDnz1BLKg;
 Tue, 11 May 2021 20:22:27 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 20:24:58 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, linux-pci
 <linux-pci@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] PCI: mediatek: Remove redundant error printing in
 mtk_pcie_subsys_powerup()
Date: Tue, 11 May 2021 20:24:53 +0800
Message-ID: <20210511122453.6052-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_052511_351191_B4139E33 
X-CRM114-Status: UNSURE (   9.50  )
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

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/pci/controller/pcie-mediatek.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 62a042e75d9a2f4..25bee693834f95e 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -991,10 +991,8 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "subsys");
 	if (regs) {
 		pcie->base = devm_ioremap_resource(dev, regs);
-		if (IS_ERR(pcie->base)) {
-			dev_err(dev, "failed to map shared register\n");
+		if (IS_ERR(pcie->base))
 			return PTR_ERR(pcie->base);
-		}
 	}
 
 	pcie->free_ck = devm_clk_get(dev, "free_ck");
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
