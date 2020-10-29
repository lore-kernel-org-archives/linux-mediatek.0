Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF19C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 10:51:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F187220728
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 10:51:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7lbNjcN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hcqG9Gar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F187220728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6/U59krwwix3DFUB7YH8beHZrBuHNVzxJvs3anmJijE=; b=I7lbNjcNUz9ir1EEPHJDOb2e2
	Btz1lapt67zZlJuWsZGezduAylFrrOo3DTjWOQkiZ5nWDxlk0wpD7E7ApwPZgNc9hlNeKHvP+UYkN
	8QJaydXSooqrQxRetzN5ff5ebwZ1Z2MYfM/oFJHogJdcEQnjlA27mCDgd0mPMhK3mPjFAC1P26c8t
	iRJ+VvtUlSqpi8eKaW+Bpql8uazuIlLpUTsdHlU8A/K9BfkU3Bij6V2MFhXieYYPjvBMgEBBAUmy0
	AgSm6yC+d/unM8fwOaUXbNT89PtxZYCXgjRzgOm0voBh4t41f1Mx3EzX54z2nZ07B8bY5pHFldUi4
	znNf6HuIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY5WX-00057l-Tg; Thu, 29 Oct 2020 10:51:18 +0000
Received: from mail-am6eur05on2085.outbound.protection.outlook.com
 ([40.107.22.85] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY5WQ-000558-Nd; Thu, 29 Oct 2020 10:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZHDkp69MbVu+QyhUJ4wH37B0IL3USmujjHhbWQ4c+VZlSdwUT1Q5rXcoyrltslEjeuK5xX+4d33s0nO9cRSW0+2zaS4quRuSEa3N3abACHcW08V/XskzyCqfI8vr7narQeIHhBgltXEix4lFgBho6EavqFytG8RhnroQxhKig1AIXDP39hdeT1G+reYTC/B+0cNs2un6JTg1Ktn7P5OLA16EY2iweB0U0s5nZlT7JsBrrlgiERNn9Q+U2MCnMkoV7/IAGg2awk5KbjNhy+gkJsVRv38ou4nD2aqzYORzlSMcdyx3dinGaZKYg316R30b3Bdya6e1AXnqaaAIe3KMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sLca1kSh9kP+8B8dLWBPJUfWWxBAWS4aNKSoEWkzxo=;
 b=Ln0UonMF5Ue3wBTMiHPtfiRW9XSjOfmVVOIK/EZnXihhExQMw61qV7aNbLpmLTJ5uOeppE1CJVJRjpVblanSaj1r2WxhJuVjA8N42Hnt8D4mrTePWhTFKGPiQjpY501vislislGVh2Xx+hEej3rHPH4MX/pwEa+scAv0maKS3a1XB2wdGY2OlbykFi8IcKBd5uX3vr30aLMUQWozdGCyX9AhHeSali4/tSikz+BQbx0NuiLJvO287xOcHk48NXGli6NkxzZCxPluzaxMe2aUMwcKcjk6V71lPhJAt8LkCCMoUZ7UPKFzQK7bEe8PIleLFtATIfAS3hXGQ/wQ3TmHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sLca1kSh9kP+8B8dLWBPJUfWWxBAWS4aNKSoEWkzxo=;
 b=hcqG9GarKuRNyEiZ3IFm1VF6wAksqzDBhAmVdyZaoyYUEoyIqpEhgo8S1f6HOtdf3vmVcDdR0w+xSsD+Gi3sneZwvwBSvj4Ud9wXeO2BSQYPdZjfV0I7sgBOUpCLxOh0c42z7ugklG71OWpq1y/KqWOfORrOarTbDjxUaoNxZlE=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 10:51:08 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 10:51:08 +0000
From: Peter Chen <peter.chen@nxp.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 05/17] phy: freescale: convert to
 devm_platform_ioremap_resource
Thread-Topic: [PATCH 05/17] phy: freescale: convert to
 devm_platform_ioremap_resource
Thread-Index: AQHWrZ7+eyIXOPN/lEm5LqW1eUAhZKmuZ2+A
Date: Thu, 29 Oct 2020 10:51:08 +0000
Message-ID: <20201029105039.GD30677@b29397-desktop>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
 <1603940079-8131-5-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1603940079-8131-5-git-send-email-chunfeng.yun@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2a6c8b44-b161-47c0-7f26-08d87bf88ad1
x-ms-traffictypediagnostic: AM0PR04MB6849:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB68492438EB84BC0BC407CF208B140@AM0PR04MB6849.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MWSm5wH0cV4tNW8lyMQoKfhzu+9p9CGTyb9M3iuVa2/Ad3K8KuYJIPnRw/OLJaDg3YBKuB2d6v87g6Y4p3bt4vfi3dmzYuEQJE2H/S41KZaK9lNUw/eKiuvwa1KVczDfxWP9SBRgSPe4tTsx1sH9aPW2Bzms09c2Q8DxeZp8XRqCAxw0WxA9w+6DfXEucWx5LRgdRPgj1X/VMuGqP0H02gkrW+burAhoQTuNgw1D+sD9Jsf8ioXoCjlLthuo6fz07RZiEZNYqpFmC6+bdJFkUWI8f2IgAiSdGomvYREAmTEWMwjhXn9JuXb7OJYR9jtcoSgqtLxGuuSEbRHx+RuTWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7300.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(396003)(376002)(136003)(39860400002)(366004)(66556008)(66476007)(1076003)(6486002)(316002)(64756008)(6512007)(83380400001)(4326008)(71200400001)(8936002)(9686003)(6916009)(76116006)(44832011)(91956017)(66946007)(66446008)(8676002)(5660300002)(7416002)(7406005)(2906002)(186003)(478600001)(6506007)(26005)(54906003)(33656002)(33716001)(86362001)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ToCoI16rgWH1HMqSJUKQ6tLvFZmltIbisBv0uAFf854oyVe24RIgoSsxlUbG5Zwqt4szIXs2SESn2jWPkBEOL0UXupoL/VU08QzB/m2r7JKXCdfPlu7VE/7q/jJ72IViTRgSA3bqdNf+esWJpNJeaf9wzdzT5jQlDxveZAPUr9QcHwnUpcr8vZoU49Zy4RWkQM6repXTGpFKqX+hTa+suNrJCxnsHjRmjlxvs/kFGawXyrrvt/z9sOOyHqE0ulOEa/0Qx1XzqkBfmXHmV0bE72heBqZUxON9qkJWUP62hzyJzi/fgHu4EDvuz2pEMPEFG6oW5rQ73lhVdQM0Nr6JOd6HoNPlvOTpuNPoyr98GG5JJKNOT6CXkhPkbTTFCopkwL95Fa/qKzN8tyLx1x6blOA+ACy6lXppOku9ul4H67lSjS1024sjewyo83X4Hnf2WvpDldDpR/NARHdfB2sjxMQdzeKr3cj4j8uIZ70G0yVd4nMi/wZ8RElVZq7n9IDKBQKhXhzXbCtBkLvITf9kKwZPg/inms2grEL/JGUhkBt8Vbdv5M+Kd4kKOq2wIhsB72duHgXnM5K0h7vor4sOuUc6f89oSdaXR2NGCJbUX+MFVPGHQ5oIH/qeygHNl4AZhTWMmKL3P7FfyrbBCbayeQ==
Content-ID: <FCE28ECC80A9694B95AB18F74BAA4158@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6c8b44-b161-47c0-7f26-08d87bf88ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 10:51:08.2941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvA03lufXxSIAYn2xFHeAHJtDlBNmq6sNmOV98KpPyrC66J+JSsE34WXjq5sGnfXIAGAEUhgHp0jmyc/+j1M0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6849
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_065110_818812_14C64874 
X-CRM114-Status: GOOD (  15.93  )
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

On 20-10-29 10:54:27, Chunfeng Yun wrote:
> Use devm_platform_ioremap_resource to simplify code
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c | 4 +---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c     | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> index 9f2c1da14f5a..a95572b397ca 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> @@ -434,7 +434,6 @@ static int mixel_dphy_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	struct phy_provider *phy_provider;
>  	struct mixel_dphy_priv *priv;
> -	struct resource *res;
>  	struct phy *phy;
>  	void __iomem *base;
>  
> @@ -449,8 +448,7 @@ static int mixel_dphy_probe(struct platform_device *pdev)
>  	if (!priv->devdata)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 62d6d6849ad6..0b9ee2b1716f 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -152,7 +152,6 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct device *dev = &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
> -	struct resource *res;
>  	const struct phy_ops *phy_ops;
>  
>  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
> @@ -165,8 +164,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(imx_phy->clk);
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	imx_phy->base = devm_ioremap_resource(dev, res);
> +	imx_phy->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>  

Reviewed-by: Peter Chen <peter.chen@nxp.com>

-- 

Thanks,
Peter Chen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
