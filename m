Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE56E6FE51
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gjUW/uYkuz8sFPxy9AC86eiYCFTms33dOOEd0bgxyhA=; b=C3xFERAq2v3AIwwf7VtF6hjOs2
	feKABoYAzYnFVSZOhJG0x5EWXEou5h4E1rYdUavKUKlcyYy7kcLlw09lMEIfrYWHwKmdNQGtDken4
	TR5GtOG86QvSCKk7xpR6p/n+OguAB8wCuZT9pcPTXsT8yDQ+r6dQIYVu8ulgxsDjamCb+EuhKAsKP
	B+gVOAIDgylzqxAIK3Z7vtVSlm3qohQDFEJGWladyUKP0LejEMWcIY9p06kgV2K6DVX8eGHaSUp+J
	Sg39VJ1+iGtYD/i57mRPqMQinEVmC96PCDpSgenOHa1mkRWX7z7s4GwzqXPloA3gUhRk1YSK7Klk4
	yN0JQl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqoE-0000000Ef8u-1dDI;
	Sat, 07 Sep 2024 08:28:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqnC-0000000EerW-3xTS;
	Sat, 07 Sep 2024 08:27:41 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X15mV1CKCzyRYD;
	Sat,  7 Sep 2024 16:26:50 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (unknown [7.193.23.20])
	by mail.maildlp.com (Postfix) with ESMTPS id 63BD61800F2;
	Sat,  7 Sep 2024 16:27:31 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemm600016.china.huawei.com
 (7.193.23.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Sat, 7 Sep
 2024 16:27:30 +0800
From: Lin Ruifeng <linruifeng4@huawei.com>
To: <b-liu@ti.com>, <gregkh@linuxfoundation.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH -next v2] usb: musb: mediatek: Simplify code with dev_err_probe()
Date: Sat, 7 Sep 2024 16:13:51 +0800
Message-ID: <20240907081351.19879-1-linruifeng4@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600016.china.huawei.com (7.193.23.20)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_012739_287598_691A0C17 
X-CRM114-Status: GOOD (  11.13  )
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

The combination of dev_err() and the returned error code could be
replaced by dev_err_probe() in driver's probe function. Let's,
converting to dev_err_probe() to make code more simple.

Signed-off-by: Lin Ruifeng <linruifeng4@huawei.com>
---
v2:
- The wrong message is modified.
 drivers/usb/musb/mediatek.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index 0a35aab3ab81..63c86c046b98 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -416,10 +416,9 @@ static int mtk_musb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = of_platform_populate(np, NULL, NULL, dev);
-	if (ret) {
-		dev_err(dev, "failed to create child devices at %p\n", np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				"failed to create child devices at %p\n", np);
 
 	ret = mtk_musb_clks_get(glue);
 	if (ret)
@@ -448,23 +447,19 @@ static int mtk_musb_probe(struct platform_device *pdev)
 		glue->role = USB_ROLE_NONE;
 		break;
 	default:
-		dev_err(&pdev->dev, "Error 'dr_mode' property\n");
-		return -EINVAL;
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				"Error 'dr_mode' property\n");
 	}
 
 	glue->phy = devm_of_phy_get_by_index(dev, np, 0);
-	if (IS_ERR(glue->phy)) {
-		dev_err(dev, "fail to getting phy %ld\n",
-			PTR_ERR(glue->phy));
-		return PTR_ERR(glue->phy);
-	}
+	if (IS_ERR(glue->phy))
+		return dev_err_probe(dev, PTR_ERR(glue->phy),
+				"fail to getting phy\n");
 
 	glue->usb_phy = usb_phy_generic_register();
-	if (IS_ERR(glue->usb_phy)) {
-		dev_err(dev, "fail to registering usb-phy %ld\n",
-			PTR_ERR(glue->usb_phy));
-		return PTR_ERR(glue->usb_phy);
-	}
+	if (IS_ERR(glue->usb_phy))
+		return dev_err_probe(dev, PTR_ERR(glue->usb_phy),
+				"fail to registering usb-phy\n");
 
 	glue->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(glue->xceiv)) {
-- 
2.17.1


