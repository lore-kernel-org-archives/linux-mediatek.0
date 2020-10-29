Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAC1C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 03:03:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6483020782
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 03:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qLulmtqV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IWTRf2WH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6483020782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ckyXMbSby95kQXG53Iol4gPgtdoAbfs32J5K1/fGJyQ=; b=qLulmtqV6RVS15khdKxuUDg9q
	lIVrx6RhSBqAOMcTQUd2l5LSsRu87dj96RajLb9I4O8yW7nJ4xIfosXNYGlbnmh+4TT+bx3hLEeDF
	lROFfD39mGr3uY66fWIauQEy1LMpiZBGDJaEO+9voDnjRNKWfDBb9PaLGTl53KhcsGRaaInp6dpho
	eSx1N1PphO4oTFoQnpCex5/7GrAE3w0Bsgin7QH5OPvU2gqQ9fQs8Quc6s+XrptMLf5sZR1QQ8aqC
	OUbmrJLSeB9zwh7CatLET8iTBK/1b0+NMeV2j5KLLP9qHxtbjQVAkFLpgmkWteQn9S3Vr4qY85jQa
	L32yxtq5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXyDu-0004HQ-Ve; Thu, 29 Oct 2020 03:03:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXyD0-0003sg-2o; Thu, 29 Oct 2020 03:02:42 +0000
X-UUID: e83a8c7e8a7849c89115ffe255b1865b-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4y9u76WZ+K2hCcTwDQC6NP3szNJlB5RuE8t5+ZzRPRQ=; 
 b=IWTRf2WHcbO373YaFsMsTirNQI9iTCNUpTgx3mwbXJhPfyPebqUF35JbunVKWVObOZbQAsql6SzUTeFgFfEiCBei2+Wu9AgXnisURzn3ioz1UoB9+I+y3dzFTCoyA/FCIuVwxcZn1emCfduJoBfpAV0aJi62VjWQ4JJ6JWq6DPg=;
X-UUID: e83a8c7e8a7849c89115ffe255b1865b-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 847699354; Wed, 28 Oct 2020 19:02:29 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 19:55:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:55:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 10:55:25 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 04/17] phy: cadence: convert to devm_platform_ioremap_resource
Date: Thu, 29 Oct 2020 10:54:26 +0800
Message-ID: <1603940079-8131-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CC4BC70B8DDF7A4E63D11A628D469DE6059B1CF05A7EDB2ECBC14449A479BFB62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_230238_430362_651587B9 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Ondrej Jirman <megous@megous.com>, Peter Chen <peter.chen@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Anil Varughese <aniljoy@cadence.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin
 Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Icenowy Zheng <icenowy@aosc.io>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Remi Pommarel <repk@triplefau.lt>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger
 Quadros <rogerq@ti.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Ma Feng <mafeng.ma@huawei.com>, Scott
 Branden <sbranden@broadcom.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Sanket Parmar <sparmar@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/cadence/cdns-dphy.c          | 4 +---
 drivers/phy/cadence/phy-cadence-salvo.c  | 4 +---
 drivers/phy/cadence/phy-cadence-sierra.c | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index 90c4e9b5aac8..ba042e39cfaf 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -314,7 +314,6 @@ static int cdns_dphy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct cdns_dphy *dphy;
-	struct resource *res;
 	int ret;
 
 	dphy = devm_kzalloc(&pdev->dev, sizeof(*dphy), GFP_KERNEL);
@@ -326,8 +325,7 @@ static int cdns_dphy_probe(struct platform_device *pdev)
 	if (!dphy->ops)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dphy->regs = devm_ioremap_resource(&pdev->dev, res);
+	dphy->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dphy->regs))
 		return PTR_ERR(dphy->regs);
 
diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
index 88e239adc3b8..51c0b98f5fd7 100644
--- a/drivers/phy/cadence/phy-cadence-salvo.c
+++ b/drivers/phy/cadence/phy-cadence-salvo.c
@@ -263,7 +263,6 @@ static int cdns_salvo_phy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct cdns_salvo_phy *salvo_phy;
-	struct resource *res;
 	const struct of_device_id *match;
 	struct cdns_salvo_data *data;
 
@@ -281,8 +280,7 @@ static int cdns_salvo_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(salvo_phy->clk))
 		return PTR_ERR(salvo_phy->clk);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	salvo_phy->base = devm_ioremap_resource(dev, res);
+	salvo_phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(salvo_phy->base))
 		return PTR_ERR(salvo_phy->base);
 
diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index 453ef26fa1c7..26a0badabe38 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -479,7 +479,6 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct cdns_sierra_data *data;
 	unsigned int id_value;
-	struct resource *res;
 	int i, ret, node = 0;
 	void __iomem *base;
 	struct clk *clk;
@@ -502,8 +501,7 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 	sp->dev = dev;
 	sp->init_data = data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(dev, "missing \"reg\"\n");
 		return PTR_ERR(base);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
