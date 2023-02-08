Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE538C636CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 02:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4SICOJ4kweqN7SFlfBoMnKVIbKjyXli+Q/9caVnN0io=; b=Mwzfoou6nDP2ioe1fFdb7u2+Yu
	jlapvK9wwk09CZFwJJGCbETZofu5+9eZA3P3OJKB67om+wpy3H+Do2dBj3e63xP3hgRLHBowmEJxA
	Gsfh34SRM4HmkQ5j8mFPLLPfnJcd1OFKpG0+/W6TBondZv88cglQTmtXfGaCHDYbsnd21fMd1nA1Y
	QxliasglSty9xyAr78jmPFaPdRn53db4vyCOWPXuKrhp1qwO4qmfADAJBOLZvODKFUG4SeVl950g0
	6KrFxAQg206rHszNz7CLN3eUYpvly5PRtInTi5m/jbBl+lRLL1ApFRn/CLft5zqxXXwMDoj4qD7nV
	DAPJjWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPaVf-00Dsro-Un; Wed, 08 Feb 2023 02:48:35 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPaVT-00DspL-Ga; Wed, 08 Feb 2023 02:48:25 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PBPZ56mMhz6FK2X;
	Wed,  8 Feb 2023 10:48:13 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
	by mse-fl2.zte.com.cn with SMTP id 3182m21w077937;
	Wed, 8 Feb 2023 10:48:02 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 8 Feb 2023 10:48:03 +0800 (CST)
Date: Wed, 8 Feb 2023 10:48:03 +0800 (CST)
X-Zmail-TransId: 2af963e30d634e00a959
X-Mailer: Zmail v1.0
Message-ID: <202302081048037733713@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <tsbogend@alpha.franken.de>
Cc: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?B?W1BBVENIXSBNSVBTOiBwY2ktbXQ3NjIwOiBVc2XCoGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 3182m21w077937
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID 63E30D6D.002 by FangMail milter!
X-FangMail-Envelope: 1675824493/4PBPZ56mMhz6FK2X/63E30D6D.002/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63E30D6D.002/4PBPZ56mMhz6FK2X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_184823_768618_9F66BA93 
X-CRM114-Status: GOOD (  10.47  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 arch/mips/pci/pci-mt7620.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/mips/pci/pci-mt7620.c b/arch/mips/pci/pci-mt7620.c
index e032932348d6..2700d75d41c5 100644
--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -282,21 +282,17 @@ static int mt7628_pci_hw_init(struct platform_device *pdev)

 static int mt7620_pci_probe(struct platform_device *pdev)
 {
-	struct resource *bridge_res = platform_get_resource(pdev,
-							    IORESOURCE_MEM, 0);
-	struct resource *pcie_res = platform_get_resource(pdev,
-							  IORESOURCE_MEM, 1);
 	u32 val = 0;

 	rstpcie0 = devm_reset_control_get_exclusive(&pdev->dev, "pcie0");
 	if (IS_ERR(rstpcie0))
 		return PTR_ERR(rstpcie0);

-	bridge_base = devm_ioremap_resource(&pdev->dev, bridge_res);
+	bridge_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(bridge_base))
 		return PTR_ERR(bridge_base);

-	pcie_base = devm_ioremap_resource(&pdev->dev, pcie_res);
+	pcie_base = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
 	if (IS_ERR(pcie_base))
 		return PTR_ERR(pcie_base);

-- 
2.25.1

