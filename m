Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1CBC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 08:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4j626TCb5sSK6/O9BNAoP9I9bB8KkcMrh2xVfyp7Ktg=; b=kBafnT2p4FMU+6xGD40obwZ25+
	e9olgoWwMkgT2hq+xtWflybYMCanEi+eKMVb8zIfn6wqmXgV0IO0XHZsWk/c4AZ9IxWNIpw8IgRCN
	WUJxrGdGL9brn47dLTMnqrnQ3XCG6BifkJWnhcPBLd2gTLZpHt1OnqbQAEVJ6iRie/lY9IWAXjYF2
	1JXGguQSTQoiNnkAr+lHIJ+TR7zi+cOuRPK5ugpvBZQnoan3PjbCoBtLRvF0syw+EoRDipspfIkMV
	KtsG9T4lAxAUQowxR8Sxytqzi5LOwtWCesLm6ypvjqJfXEo8HhfYEth2nJRw1vgLdA2MJ1Ke8V9wf
	AhpnHN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3xY-00HVBF-7j; Wed, 18 Jan 2023 08:38:16 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3xG-00HV50-5u; Wed, 18 Jan 2023 08:38:01 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NxfKG2Wkwz508D2;
	Wed, 18 Jan 2023 16:37:54 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 30I8bi8n021856;
	Wed, 18 Jan 2023 16:37:44 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 18 Jan 2023 16:37:47 +0800 (CST)
Date: Wed, 18 Jan 2023 16:37:47 +0800 (CST)
X-Zmail-TransId: 2af963c7afdbffffffffa170dd25
X-Mailer: Zmail v1.0
Message-ID: <202301181637472073620@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <daniel.lezcano@linaro.org>
Cc: <rafael@kernel.org>, <amitk@kernel.org>, <rui.zhang@intel.com>,
        <matthias.bgg@gmail.com>, <linux-pm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSB0aGVybWFsL2RyaXZlcnMvbXRrX3RoZXJtYWw6IFVzZcKgZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 30I8bi8n021856
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID 63C7AFE2.000 by FangMail milter!
X-FangMail-Envelope: 1674031074/4NxfKG2Wkwz508D2/63C7AFE2.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63C7AFE2.000/4NxfKG2Wkwz508D2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_003758_401872_AE519CA2 
X-CRM114-Status: UNSURE (   9.95  )
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/thermal/mtk_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 0084b76493d9..9a8b107900e9 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -990,7 +990,6 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	int ret, i, ctrl_id;
 	struct device_node *auxadc, *apmixedsys, *np = pdev->dev.of_node;
 	struct mtk_thermal *mt;
-	struct resource *res;
 	u64 auxadc_phys_base, apmixed_phys_base;
 	struct thermal_zone_device *tzdev;
 	void __iomem *apmixed_base, *auxadc_base;
@@ -1009,8 +1008,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	if (IS_ERR(mt->clk_auxadc))
 		return PTR_ERR(mt->clk_auxadc);

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mt->thermal_base = devm_ioremap_resource(&pdev->dev, res);
+	mt->thermal_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(mt->thermal_base))
 		return PTR_ERR(mt->thermal_base);

-- 
2.25.1

