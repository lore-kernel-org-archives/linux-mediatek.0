Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A65AC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RnaZ+w4Gx3Z1KyvumiYS6sired+wbPaZcUhjAyvQTEY=; b=iC23ACcLItYDyinvfuE1kErJ+h
	hsuwO1gaKWpYSEZXEdk9qdVQnPAg8jWtek+7VDym1vmFaaSGt6hZ9BYp/SkL2gcHPBk0/RtXrrW7N
	EmGl/JO/6Xt1G3jyK4SAmLsGcjwFvqOtF9DObact0QTwcHfVxL6ntDhX44pNbgLFUHxbPKAn4h6ud
	kxSUopIq8jzjyN3peUiLOcU47XNy8xeJogdMZjyW3WvA8jWMvPqMAYcI0iGSFqlVVYOuDnBQsK76j
	znUzU9VFSUFL/oykEIXddV5zgL69p5FDEIeU1wSbSR91Au4oyS9D6GsVIBQ2iNLFzkqJxS9p33XNP
	ueF0fb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIR5o-004Cx6-Fa; Thu, 19 Jan 2023 09:20:20 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIR5c-004CuG-TQ; Thu, 19 Jan 2023 09:20:10 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NyHCW3JkTz501RH;
	Thu, 19 Jan 2023 17:20:07 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
	by mse-fl1.zte.com.cn with SMTP id 30J9Juto097433;
	Thu, 19 Jan 2023 17:19:56 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Thu, 19 Jan 2023 17:19:58 +0800 (CST)
Date: Thu, 19 Jan 2023 17:19:58 +0800 (CST)
X-Zmail-TransId: 2af963c90b3e09448b6e
X-Mailer: Zmail v1.0
Message-ID: <202301191719589508843@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <qii.wang@mediatek.com>
Cc: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IGkyYy1tdDY1eHg6IFVzZSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 30J9Juto097433
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63C90B47.000/4NyHCW3JkTz501RH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_012009_133461_A1378BF9 
X-CRM114-Status: GOOD (  10.88  )
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
 drivers/i2c/busses/i2c-mt65xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index d80e59340d97..43dd966d5ef5 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1366,20 +1366,17 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 {
 	int ret = 0;
 	struct mtk_i2c *i2c;
-	struct resource *res;
 	int i, irq, speed_clk;

 	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	i2c->pdmabase = devm_ioremap_resource(&pdev->dev, res);
+	i2c->pdmabase = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
 	if (IS_ERR(i2c->pdmabase))
 		return PTR_ERR(i2c->pdmabase);

-- 
2.25.1

