Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCDFC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 03:41:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3559264DCE
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 03:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3559264DCE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DYuxjPZGfCCIBo5xfJ9Cp1KjEQjbzPI0OSuc0ct2McE=; b=Vx0o7X1DsWtImXQT3a/gK+Da+V
	UAt5RQ5dW/+K0U949NcJTOFsK3nOrru6hCxuMEwNx+DFK4FJfK1o7dbFLE4/22N133P+1+EWGwsdC
	GCockc7RdyGH2L9JjoixiXxmfpORoT9+x2HUZQr0OSfbwpUqdxegW2ZKs5sU/ngL488kh9q6Pt44B
	yZ5BOV4l+cpdc6Cx/R7kW0ctu6W5Q/yaa7cdZeHSIQn9lJgH8hE/JoqYey4tCQRo0fmF+Add48bh6
	23zQaJrcfOohSVbSy6vYV5cq9XBAKjHN19tu7sgrt0pJRybpoIKNIFy2oFwDSExWUKwBQTaoL4FOh
	yDzqKytg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI1L0-00C7vJ-4h; Fri, 05 Mar 2021 03:41:15 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI1Kb-00C7dX-Ny; Fri, 05 Mar 2021 03:40:52 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DsD463P4Hz16GHY;
 Fri,  5 Mar 2021 11:39:02 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Mar 2021 11:40:36 +0800
From: 'Wei Yongjun <weiyongjun1@huawei.com>
To: <weiyongjun1@huawei.com>, Sergio Paracuellos
 <sergio.paracuellos@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 "Vinod Koul" <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] phy: ralink: phy-mt7621-pci: fix return value check in
 mt7621_pci_phy_probe()
Date: Fri, 5 Mar 2021 03:49:31 +0000
Message-ID: <20210305034931.3237558-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_034051_011795_AC9F142D 
X-CRM114-Status: GOOD (  10.24  )
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

From: Wei Yongjun <weiyongjun1@huawei.com>

Fix the return value check which testing the wrong variable
in mt7621_pci_phy_probe().

Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/phy/ralink/phy-mt7621-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index 84ee2b5c2228..753cb5bab930 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -319,9 +319,9 @@ static int mt7621_pci_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy->regmap);
 
 	phy->phy = devm_phy_create(dev, dev->of_node, &mt7621_pci_phy_ops);
-	if (IS_ERR(phy)) {
+	if (IS_ERR(phy->phy)) {
 		dev_err(dev, "failed to create phy\n");
-		return PTR_ERR(phy);
+		return PTR_ERR(phy->phy);
 	}
 
 	phy_set_drvdata(phy->phy, phy);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
