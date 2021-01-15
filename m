Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E486C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 14:14:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BABF22248
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 14:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BABF22248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tKWUsM8D1CrgfzXDBAJjXplngnE69hstoJFTm7qdiGs=; b=3c6/aCc59jSuXghC7TT0KxuTeE
	iURkFx/H0Ub6VvhoVelKMRyu1iD2WAQzQfqjei7etT2QqFLFmUL+VtPWaBF/vZ0ewiVctYey/1xxg
	dBWWLE7PBVLYqUFyEDlopR3mkibi4R7Xs8UTX/kV3SrzhYErVNci8Bxkpleix08CdyOu2huZ5OFfA
	ejwjaXDIB1uXDQkW37GLSItwLno34Wyr/DgStgilT3SV/4rOLIrCDJAxc0hfyWhLxxogz+GWPyjKh
	u7M9o6JZd5MLzEmNKZOt52CPVkdebrUssHwcieFunpCeKZMZsOz5clZbw0XD6Kp01+jBrzaLF5WuV
	KnCgKj0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0PrE-0005L2-M6; Fri, 15 Jan 2021 14:13:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PrA-0005J1-Am; Fri, 15 Jan 2021 14:13:41 +0000
Received: by mail-pl1-x632.google.com with SMTP id x12so4752765plr.10;
 Fri, 15 Jan 2021 06:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CbZNeMTYUi7Mg7VyMn/xUQXZnoLVOk+YmqoECElgO5I=;
 b=QUTm2d97niOvJWqofhkNL9W7lxALHkiFYLbsnmHT0j6+l2dfDaVQyUZVkUTC1l0mdl
 EICM5zti7BnGQNrwu4DiXRWqFvaBLTaXJp/19o0TYCNYaDP2Snwoj15htcJAHpvMwipe
 NSqam4a9wE5z+mxPyB7GAYPZNLg+w0K4Eal2jElAfNitB8PrVW0VEIN2iAm2FetBHQLN
 W3WhorgQ03TvG6kvqY2qIEI3tH8uYI2+a2xEGi3Jw3GKnrmGg4lsIyr4GXpqFdlkTxQe
 lncTy92kOlFjxnnKl0b7d31JCFUFAgEfJgjr5DMfVuhvkOEkoO5xcdJIOahzNQUrx8b2
 EApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CbZNeMTYUi7Mg7VyMn/xUQXZnoLVOk+YmqoECElgO5I=;
 b=oZFZI5gqwY14FfArEffmAkcETL5n1BtSThzZo6aIDI35rFS+QCm83TbbVMQeyOGbew
 J7+dhBVUpbZQLX8p+b+If33SDgH48TE2VNx19iu6OyCnNPT/g7hLxbqgoM+BGmenxkHi
 rSGNB4+opdQbgrtGwhZDIdGua4gEyqsFT29P2jLrq7FYHRjUnWo9VubejbCiuhaMfNME
 5NtzS9YrzSAH0oFjYMu//uKgZCnzaLgEXU5Mz94YAL/UXH6kQ1LmTa9ar8Z9j/7Tkcdj
 1kAql8c96UNx/rAdHzuoQalQuGwDr10Vr9FKIs/Hr51hntq3V2+cz8zvPPgbyU7w+7/l
 4a5A==
X-Gm-Message-State: AOAM533gFFarSb4iMavdTH6gerX4mMDWkZDv3F5G8NL0vN3KVwJPI/eP
 qDcMmZ13y+6aPztb68HTbAQ=
X-Google-Smtp-Source: ABdhPJyGv8T8Tw0nXwlkPBk1os5KvQGNW2rZCV/3HHX43JkUZJkmNwkV4CuqIo7ieQn+gWYnNXksow==
X-Received: by 2002:a17:90a:b395:: with SMTP id
 e21mr10781383pjr.197.1610720015990; 
 Fri, 15 Jan 2021 06:13:35 -0800 (PST)
Received: from localhost.localdomain (1-171-15-80.dynamic-ip.hinet.net.
 [1.171.15.80])
 by smtp.gmail.com with ESMTPSA id h5sm8898408pgl.86.2021.01.15.06.13.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Jan 2021 06:13:34 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: [PATCH 1/2] usb typec: tcpci: mt6360: Add vsafe0v support and
 external vbus supply control
Date: Fri, 15 Jan 2021 22:13:20 +0800
Message-Id: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_091340_388742_E07D7C96 
X-CRM114-Status: GOOD (  17.13  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

MT6360 not support for TCPC command to control source and sink.
Uses external 5V vbus regulator as the vbus source control.

Also adds the capability to report vsafe0v.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index f1bd9e0..0edf4b6 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/tcpm.h>
 
 #include "tcpci.h"
@@ -36,6 +37,7 @@ struct mt6360_tcpc_info {
 	struct tcpci_data tdata;
 	struct tcpci *tcpci;
 	struct device *dev;
+	struct regulator *vbus;
 	int irq;
 };
 
@@ -51,6 +53,27 @@ static inline int mt6360_tcpc_write16(struct regmap *regmap,
 	return regmap_raw_write(regmap, reg, &val, sizeof(u16));
 }
 
+static int mt6360_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *data, bool src, bool snk)
+{
+	struct mt6360_tcpc_info *mti = container_of(data, struct mt6360_tcpc_info, tdata);
+	int ret;
+
+	/* To correctly handle the already enabled vbus and disable its supply first */
+	if (regulator_is_enabled(mti->vbus)) {
+		ret = regulator_disable(mti->vbus);
+		if (ret)
+			return ret;
+	}
+
+	if (src) {
+		ret = regulator_enable(mti->vbus);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int mt6360_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
 {
 	struct regmap *regmap = tdata->regmap;
@@ -138,7 +161,13 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
 	if (mti->irq < 0)
 		return mti->irq;
 
+	mti->vbus = devm_regulator_get(&pdev->dev, "vbus");
+	if (IS_ERR(mti->vbus))
+		return PTR_ERR(mti->vbus);
+
 	mti->tdata.init = mt6360_tcpc_init;
+	mti->tdata.set_vbus = mt6360_tcpc_set_vbus;
+	mti->tdata.vbus_vsafe0v = 1;
 	mti->tcpci = tcpci_register_port(&pdev->dev, &mti->tdata);
 	if (IS_ERR(mti->tcpci)) {
 		dev_err(&pdev->dev, "Failed to register tcpci port\n");
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
