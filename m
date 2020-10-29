Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561A6C55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 10:51:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AEB20754
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 10:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DfroZQ/e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VBbueE3H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AEB20754
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A4IJ9to7tPaIF85SqMvnSbgcx5gT2zuCOTTvPOZTFPE=; b=DfroZQ/e2R9UbHyxyY0heaYYZ
	1kK8yA0AdFqtKygNERKScQbwfAjttHlgttjoLEH4OiLbLcpJQREyzYHYQ2Wm8x9YZXa2y/u6Rutzn
	xWeZpx7aAMa7rFit+zHkkh1vuBPBar/ljfjmlTZbD27bsqzD0sNNMnq90WIMzrbhVzdeQDaOqRxqf
	2MWNrM+mfD/oG8cN18quRnyWu32XofFGg8dvKEW7ADRjUaStHREIMkTXMPX95arwCbs3SloLKaxzi
	DICOsF/oQbfDPcitvftuT1GMY5M2BesE4B7JeavXCA5QWiVd3oSnKiuopEwaZMKadQK9m+RdeCTXn
	B3XqYlvag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY5W1-0004z8-6K; Thu, 29 Oct 2020 10:50:45 +0000
Received: from mail-am6eur05on2050.outbound.protection.outlook.com
 ([40.107.22.50] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY5Vu-0004wm-Lb; Thu, 29 Oct 2020 10:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/aLlaAaWYbH9lHA70/BCfaFze/OvLPh1VBazy1FBE1F84seQ+ILSqDrBA7VVtXMvQzNQaS4xmitDFXQAUMyojmSvOSN7zmxfW8gxXe+RyTdWXk8yi/JBnz/leY92Xcq3Tlmvc1+ZvXSnw+vIBXe1HygEd6loqX+nMwBIfG/G3snQOiREvVmZdX/hW3pnX9y0O4jzcjz1KOEuAvL9dCJq7nADgVedr6oAaQ/c7JUmDgxBb/yhz5cefoXe0gs/bNQzK/za2hA77aiXiP9x8XhN0r8FdTU/mA/8310e9dUNc9XCJB7etpI2cEqf7b8uxrQv6OZMl/BnZudxV0VZkzZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5k577hyCvEzLfhKaSfulAryoBU4dcEdhD6Nt1r84Kw=;
 b=FMechsBQWXX7CAirN3eyLaGIkfRKZWt9BSL2fag9ecOEcUC7bNPbaZ+5fD7rXsBamg9O9pLYu2q12dBY1846E4+61C3z+JVgBb3ngx6hPiNy9ZbQUiW4KKwiGMsAL00SR7/kyYqp+mr4KGPkoq0RyvslQhgLoNtX8y/2AB1G9OP2Glcx1PhZcOEpu7ko0nKqqyNOGTfv1TTZq/B/FAFBTaaTxM0rbv8RDAqtCTWkYH16FN9mfWezFhM9ceYdNPxrk9CaiTv1zc/Ucj4Fun5FFOGaMzejItTjxOSXBIEzq+PcY8cNvxcf8sgIQvWIF5Vie65C28p3A334YJnv6hSBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5k577hyCvEzLfhKaSfulAryoBU4dcEdhD6Nt1r84Kw=;
 b=VBbueE3HDShwMokAl2AlRLUuR3prxF28P10KIKsjhwIGEZpWd8DAGu9ddbtwtpjP1jTn+NWu25+xf2GxbIMhU4WdOvbf/g1H/1GU6MDBQIszm0ROUvPSLkjsvgEdwndtDGcSCYjYJbGsiZjx/gkJAtlk7Y4hW5pkZXGqBW9GfNY=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 10:50:34 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 10:50:34 +0000
From: Peter Chen <peter.chen@nxp.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 04/17] phy: cadence: convert to
 devm_platform_ioremap_resource
Thread-Topic: [PATCH 04/17] phy: cadence: convert to
 devm_platform_ioremap_resource
Thread-Index: AQHWrZ79HoPsXManfEu7l56QIQ802qmuZ0eA
Date: Thu, 29 Oct 2020 10:50:34 +0000
Message-ID: <20201029105004.GC30677@b29397-desktop>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
 <1603940079-8131-4-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1603940079-8131-4-git-send-email-chunfeng.yun@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b65114c3-b56e-44b3-4bfb-08d87bf8768d
x-ms-traffictypediagnostic: AM0PR04MB6849:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB68495ABED848D2DB8EE102D98B140@AM0PR04MB6849.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vU5QJuFqZ1G+bNV/r86J3XMMK1VO5rn2Aklcq4JMIn7PASHwD1j+udCUvA7jDH6rL2agNO7+Zg0EeBHEvLYK/vyhZxzSBHnS1/tVd24zdryF1Ge6T1gqU9+BqDUs/XIei5Ih670qebx1gkndUo3Si89dLubI/ju5OS0W29VU5rcJkcGOt5ziQapNhZvvpX/rzmE6LqN5LnVVD6uGzK0tH9e1qbuglmYEy2b36QUTJXqFBalTyYkGShkJ9YFk/M2ZPMr8iQWxrzv9hQBHILI+fcVtV9JNYZRKzdriRkhbNXpwtal93v2XlXy0Lls7kwKUcpFwTKOK+MrKQzwSkiNO4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7300.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(396003)(376002)(136003)(39860400002)(366004)(66556008)(66476007)(1076003)(6486002)(316002)(64756008)(6512007)(83380400001)(4326008)(71200400001)(8936002)(9686003)(6916009)(76116006)(44832011)(91956017)(66946007)(66446008)(8676002)(5660300002)(7416002)(7406005)(2906002)(186003)(478600001)(6506007)(26005)(54906003)(33656002)(33716001)(86362001)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: hTML+6E4FqEJLmz6tVZXlmZ4Gk/E4xerwj/YNQV/9LfqUspBpCk6KIWdBPE5JNuJuX00if48KGr5imLt/AZ51MwdbpyPCPjo9/HAaX1ppnQNpqH2mGGLn3Z21S/uEF5lDfiZCteXndZo06hvMlIe5UUQ6L1NtSBhtIp01d81ObDSf3eIV+KBSwMHMIDceOFJD8DfEUKY8anYhVAyv+Y0oCwXq+8JZEj96uD7+/QqFP9YRWkZAGMJe/tQaH0vBWYBjvuIEyrh4+wrtNG0nlZL3tu5q5qjc07R4EE2+TOxD9P8vjE0RL26I2NRHqbwG0Xu7BdIqNPnc7Msdqij7Xw0R4/MlgP6MOiZ+8tMV0FOwyppUGF4GCrcVJRVk9OY+8W10MBDeGVZ1ydC8gQPLQDy0nxx5L2a4aj/lpZTCG+YlAeiTtBd5ebguJhJ6HLwNHn/H8m3MaGYHNl2/U1t3rdGO372j3buYjY/V/xRx6u2VpQK+ZIftzkwdWui2QaWM1rY/tBwoVAcdTkOfkiM3wCnUlnDDdYsuApL9kZWq2BL6Mkn0Hb8py4c41rosnSjZD7oU+ekMznQbxUsPyODnRFGhfS7m72jMZebTebNKujTBmjdMkLjIoKlCUT1dzp/ANOpbET/6Y2jNZIzqM2NhMpVCA==
Content-ID: <E666853BC4238D4784104C8256E2F1AD@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65114c3-b56e-44b3-4bfb-08d87bf8768d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 10:50:34.3106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sej4EAnnGQLGZz+lWNl/3ubyGNRigeJ6d0R23DGvU5q3iUV5Jy1P8hNEWrGh9midwRSg2VnJ6s5qoqzoV4Ekhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6849
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_065038_849961_CDDF5C66 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: Ondrej Jirman <megous@megous.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Anil Varughese <aniljoy@cadence.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, dl-linux-imx <linux-imx@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Remi Pommarel <repk@triplefau.lt>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Ma Feng <mafeng.ma@huawei.com>, Scott Branden <sbranden@broadcom.com>,
 Randy Dunlap <rdunlap@infradead.org>, Jyri Sarha <jsarha@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Sanket Parmar <sparmar@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20-10-29 10:54:26, Chunfeng Yun wrote:
> Use devm_platform_ioremap_resource to simplify code
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/cadence/cdns-dphy.c          | 4 +---
>  drivers/phy/cadence/phy-cadence-salvo.c  | 4 +---
>  drivers/phy/cadence/phy-cadence-sierra.c | 4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
> index 90c4e9b5aac8..ba042e39cfaf 100644
> --- a/drivers/phy/cadence/cdns-dphy.c
> +++ b/drivers/phy/cadence/cdns-dphy.c
> @@ -314,7 +314,6 @@ static int cdns_dphy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
>  	struct cdns_dphy *dphy;
> -	struct resource *res;
>  	int ret;
>  
>  	dphy = devm_kzalloc(&pdev->dev, sizeof(*dphy), GFP_KERNEL);
> @@ -326,8 +325,7 @@ static int cdns_dphy_probe(struct platform_device *pdev)
>  	if (!dphy->ops)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dphy->regs = devm_ioremap_resource(&pdev->dev, res);
> +	dphy->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dphy->regs))
>  		return PTR_ERR(dphy->regs);
>  
> diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
> index 88e239adc3b8..51c0b98f5fd7 100644
> --- a/drivers/phy/cadence/phy-cadence-salvo.c
> +++ b/drivers/phy/cadence/phy-cadence-salvo.c
> @@ -263,7 +263,6 @@ static int cdns_salvo_phy_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct device *dev = &pdev->dev;
>  	struct cdns_salvo_phy *salvo_phy;
> -	struct resource *res;
>  	const struct of_device_id *match;
>  	struct cdns_salvo_data *data;
>  
> @@ -281,8 +280,7 @@ static int cdns_salvo_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(salvo_phy->clk))
>  		return PTR_ERR(salvo_phy->clk);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	salvo_phy->base = devm_ioremap_resource(dev, res);
> +	salvo_phy->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(salvo_phy->base))
>  		return PTR_ERR(salvo_phy->base);
>  
> diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
> index 453ef26fa1c7..26a0badabe38 100644
> --- a/drivers/phy/cadence/phy-cadence-sierra.c
> +++ b/drivers/phy/cadence/phy-cadence-sierra.c
> @@ -479,7 +479,6 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
>  	const struct of_device_id *match;
>  	struct cdns_sierra_data *data;
>  	unsigned int id_value;
> -	struct resource *res;
>  	int i, ret, node = 0;
>  	void __iomem *base;
>  	struct clk *clk;
> @@ -502,8 +501,7 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
>  	sp->dev = dev;
>  	sp->init_data = data;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
>  		dev_err(dev, "missing \"reg\"\n");
>  		return PTR_ERR(base);
> -- 
> 2.18.0

Acked-by: Peter Chen <peter.chen@nxp.com> for phy-cadence-salvo.c.

-- 

Thanks,
Peter Chen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
