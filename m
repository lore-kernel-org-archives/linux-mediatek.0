Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AA5C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 12:24:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCC520825
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 12:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TyH0bxkP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sKJUoC7Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BCC520825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w89qNgKJ0H4/8NZ2oKySnJIqyAoVOBjX2TbUSrPDIeA=; b=TyH0bxkP7D0vedBbFimjYcGeGp
	F5OwpUfJBNt2HfMp96zbKO6JDQ2kWhbiUUXpFk6RK/o9+fWW/iyMSXY1IOGm8P1e903rW4OPxILsM
	IGMitXgknsOJWAI4VJhxKZA9UY+YmplK8mZ0yu766jjkIVNVh/rfaEztVT+HnMLcsCFoUW1sorZf9
	EiKoYr/2A27ZqNTrtrF31EaBjtDELMNrPl70DXsnVDu+qkwCFbcY0OKq2Dfjgj0kBAhmiuDL1g9Yv
	9tV04oms6Lu8Q05+MLxannCEsaTrI+ydfypQQ3tnr60M4fqBjhAsHrzURR3r35BK8C43t4s28w842
	9v1UCXCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfMVW-0001Nh-60; Wed, 18 Nov 2020 12:24:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfMVR-0001M4-DC; Wed, 18 Nov 2020 12:24:14 +0000
X-UUID: 52cc0b908b7040a3a75f5435a6b915db-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=18JQNOkgzF1l2pPN5DwtbDXvPcou6brGMs01FhTB1yw=; 
 b=sKJUoC7YCFcQkZ0ftmX++AtM4denTDHq6c9A7p2IrtW16459C6JZy/qUu7Y8EobnPKdy3RZ+YxcibB6LbD2HrRem+C1T7kr7MaxJuSdCh7ZM9jAWwKXpD0u/da3/fkYPz8SdDkWDpPoeKafDPQboQ6ltueWjjhdfHrkNx/1U7us=;
X-UUID: 52cc0b908b7040a3a75f5435a6b915db-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1854206473; Wed, 18 Nov 2020 04:17:42 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 04:17:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 20:17:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 20:17:53 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ phase
Date: Wed, 18 Nov 2020 20:17:41 +0800
Message-ID: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_072413_674430_1B859ADB 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qii Wang <qii.wang@mediatek.com>

Some i2c device driver indirectly uses I2C driver when it is now
being suspended. The i2c devices driver is suspended during the
NOIRQ phase and this cannot be changed due to other dependencies.
Therefore, we also need to move the suspend handling for the I2C
controller driver to the NOIRQ phase as well.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---

Changes in v2:
	- fix the wrong spelling medaitek to mediatek 

 drivers/i2c/busses/i2c-mt65xx.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 33de99b..6f61595 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1258,7 +1258,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	mtk_i2c_clock_disable(i2c);
 
 	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
-			       IRQF_TRIGGER_NONE, I2C_DRV_NAME, i2c);
+			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
+			       I2C_DRV_NAME, i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Request I2C IRQ %d fail\n", irq);
@@ -1285,7 +1286,16 @@ static int mtk_i2c_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int mtk_i2c_resume(struct device *dev)
+static int mtk_i2c_suspend_noirq(struct device *dev)
+{
+	struct mtk_i2c *i2c = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_suspended(&i2c->adap);
+
+	return 0;
+}
+
+static int mtk_i2c_resume_noirq(struct device *dev)
 {
 	int ret;
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
@@ -1300,12 +1310,15 @@ static int mtk_i2c_resume(struct device *dev)
 
 	mtk_i2c_clock_disable(i2c);
 
+	i2c_mark_adapter_resumed(&i2c->adap);
+
 	return 0;
 }
 #endif
 
 static const struct dev_pm_ops mtk_i2c_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, mtk_i2c_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
+				      mtk_i2c_resume_noirq)
 };
 
 static struct platform_driver mtk_i2c_driver = {
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
