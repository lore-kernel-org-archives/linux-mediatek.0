Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43D1C07E9C
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 02:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26C7613EC
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 02:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26C7613EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPiHJzGx4SIuYdHCgN9d5b9ugVJvIasDwwV6TfsdQuE=; b=EPBst1wi+cHjrF
	C5LQpe2HTOy0nExH7cRQHplBZbBAvG1u82wvncXHQ1FDCmTZ2vXLwKM5jK9Qt4GvuodJJ4VYm6uL0
	oHAEnGyb0b/9uNLgA1PNp6FSthI/xPJVwRdV35edIj2PVhgMP/0GslVY+eNx5Uce8tfGn54fVCEF7
	xLr5RQAxsd4aQOUB6taPXlJzHXA/xoPPMbtHjZ/CnTkqXk28hCySLBlsD0I+KfP0m1ibrWBlO95V2
	6anJ79xdGRuCsOS++ChQJ15Y7OSaRvgFWO+HcLrcGetRiaYgVtKglikRv3RhufyARWvR+7ajvykDd
	OJpaWm7Qj2HzymUTq0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m22dk-002nG4-3V; Sat, 10 Jul 2021 02:22:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m22dN-002n2x-RI; Sat, 10 Jul 2021 02:22:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE2CD613E6;
 Sat, 10 Jul 2021 02:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883745;
 bh=N9tg4uOowuFl6i9wi0x5B9WKbHwNGTjWXkUqtqYIuno=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=swyS7SKCsqM3yDLRaE2A+hDf1c3nyOkKXW5SX4LsiRAQNumIu9SU7jrLEI1uAT46b
 2Zf2p6iceP5WpF8aNqwNTh7Vpyu7kBLMNewDOGtkufegJhQGfV2CF2/9ZToeuFkvZu
 l8QdhO2lSzOG+0c3S7GQINs/lYK6Jd4Pqyo26b8c0aQjfw4zxyW4K7apa0xdgd6m6f
 9xVG+l73kYFv6wPlHI1PFHpMbSkuWE1F2zYqGkqh/eMz5jnmLQwa6BoUg4RDrKCMwL
 VjdFJ0Dx79LtqXYgw3KnMQa69i4336ta/Mm0SWtvVs8LHnLcqSS7PBfThT7iriCeOR
 E0Q2u2K/XOolA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 022/104] usb: common: usb-conn-gpio: fix NULL
 pointer dereference of charger
Date: Fri,  9 Jul 2021 22:20:34 -0400
Message-Id: <20210710022156.3168825-22-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_192225_920415_A0AF158D 
X-CRM114-Status: GOOD (  14.37  )
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

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

[ Upstream commit 880287910b1892ed2cb38977893b947382a09d21 ]

When power on system with OTG cable, IDDIG's interrupt arises before
the charger registration, it will cause a NULL pointer dereference,
fix the issue by registering the power supply before requesting
IDDIG/VBUS irq.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/common/usb-conn-gpio.c | 44 ++++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 6c4e3a19f42c..c9545a4eff66 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -149,14 +149,32 @@ static int usb_charger_get_property(struct power_supply *psy,
 	return 0;
 }
 
-static int usb_conn_probe(struct platform_device *pdev)
+static int usb_conn_psy_register(struct usb_conn_info *info)
 {
-	struct device *dev = &pdev->dev;
-	struct power_supply_desc *desc;
-	struct usb_conn_info *info;
+	struct device *dev = info->dev;
+	struct power_supply_desc *desc = &info->desc;
 	struct power_supply_config cfg = {
 		.of_node = dev->of_node,
 	};
+
+	desc->name = "usb-charger";
+	desc->properties = usb_charger_properties;
+	desc->num_properties = ARRAY_SIZE(usb_charger_properties);
+	desc->get_property = usb_charger_get_property;
+	desc->type = POWER_SUPPLY_TYPE_USB;
+	cfg.drv_data = info;
+
+	info->charger = devm_power_supply_register(dev, desc, &cfg);
+	if (IS_ERR(info->charger))
+		dev_err(dev, "Unable to register charger\n");
+
+	return PTR_ERR_OR_ZERO(info->charger);
+}
+
+static int usb_conn_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct usb_conn_info *info;
 	bool need_vbus = true;
 	int ret = 0;
 
@@ -218,6 +236,10 @@ static int usb_conn_probe(struct platform_device *pdev)
 		return PTR_ERR(info->role_sw);
 	}
 
+	ret = usb_conn_psy_register(info);
+	if (ret)
+		goto put_role_sw;
+
 	if (info->id_gpiod) {
 		info->id_irq = gpiod_to_irq(info->id_gpiod);
 		if (info->id_irq < 0) {
@@ -252,20 +274,6 @@ static int usb_conn_probe(struct platform_device *pdev)
 		}
 	}
 
-	desc = &info->desc;
-	desc->name = "usb-charger";
-	desc->properties = usb_charger_properties;
-	desc->num_properties = ARRAY_SIZE(usb_charger_properties);
-	desc->get_property = usb_charger_get_property;
-	desc->type = POWER_SUPPLY_TYPE_USB;
-	cfg.drv_data = info;
-
-	info->charger = devm_power_supply_register(dev, desc, &cfg);
-	if (IS_ERR(info->charger)) {
-		dev_err(dev, "Unable to register charger\n");
-		return PTR_ERR(info->charger);
-	}
-
 	platform_set_drvdata(pdev, info);
 
 	/* Perform initial detection */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
