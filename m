Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0E0C43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 20:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796A420637
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 20:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CoxPqRvG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="k9dDdvdK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 796A420637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=PBAK0Ov5UwZsR0IJP8G68EUjem0IyCvcVMJ0n4KQmt0=; b=CoxPqRvGkQ1X2b
	3Aba8WbyIpIqv+j9itiu2C2chQj7QXfay4+KA1KycEwOiLE9x/pnFe8aXKmyJgCIyxRBqImxPTKR9
	X4gYqR37XYxTS9LJ5h0CfpcveVtaKLsRBdYR6tN+UtP5jBGZLWodV8pIy/pqPOquMSlH0XNUC+eFq
	YsoAqOpXdDZhQLhCTrLZConIg9YIJxMrUOh4Mr2T8q70aKr8781Tj7M2Iciq1wdOY4UKHz9JZtODK
	0S7v8iYWyATJhOaGrg5nv0BhXfJZhilTMjqrjDR9JfjXytBjvin/jVxF4H/TOCkrqBp9/GdHL2vv9
	gtAJPFCoVDMzv2DiWyUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePtl-00065J-Ow; Mon, 09 Dec 2019 20:44:53 +0000
Received: from mail-eopbgr00082.outbound.protection.outlook.com ([40.107.0.82]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePtg-00062P-Et; Mon, 09 Dec 2019 20:44:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N38wIu1ph/vPfUBoS5hcGbpr5BVgF+pydouYx2mwpCoMsHQyBd1YVBu/B8tCBSxnLclgaLWhYbOgHl0FBJ4snMtIHlsIA9UJFqdpFhVH1oJSrOUjbJgiN1Wyy/CNkvdBVUHxSUP4A5g4+WrTTlg1lwoqZkXsOSsKWTAnU3PVUofZITDKOOuJJazzp8PMqB6t8bz3GurbJvd4F7BmiNIpWLr+lm8UPRPan1Sk2rt+C2Y9xCRv5Z5v7pgOwj+XK3Ai2zf4YzkbYnhP1UijNaGmmjBBiaDddCW7wqqXC6GjkotEW3vfZpgow77mRbiVpx8MLQ3hduTBAPoRw3KzR3hgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1VOUAlzAc4WoRjyzGN/xHqfUnNN0m2NiIm5khONxQQ=;
 b=maOJNgAcnhxSRUWA762n8Du0jO+lN+6TE1UpE/XfOu8wzWZePzIN7/wxk7LDbwI7gNEf+9s9oga2NxJpPGdTUPeQLaC5L+CdoTF7QoAUWqomd7OKV/iDMClkHqyvmv90ESINufrEsrLKVskE2XNeVsqnxK2u0IX0OwiEyqnr6CczhOwhCzKWwN8pRCK0infMz5dza1kOYvw+7Btlv4EdbPjZaHcEnDja72gAI/olbxBSsZ7CqN/9tTvnS+fsG2YW+0V/ZSyZOuXn9lnej3Ka5cRybUBwJd80QutlmdfPLGeVvIgI1mFfmhbBnxRRXDqPFlgv6HcCa/CpjWVxl9cqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1VOUAlzAc4WoRjyzGN/xHqfUnNN0m2NiIm5khONxQQ=;
 b=k9dDdvdKE2unSklpz+pIqTdhhfIoJY6yRuyqSiXcdbxVVZM7K2YotCnxORFDD+BjchCmK7t80/YAaFfRA1WrFoiVQy6vGdKHoxeuTLPuq5I0JXpCfNmz8sJWOlq3lUUVNLgZSCmRq0F3Lc+pnR02lGGcSZUujr6GD/Q+uKInoj4=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB2973.eurprd04.prod.outlook.com (10.170.232.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Mon, 9 Dec 2019 20:44:40 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::2c49:44c8:2c02:68b1]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::2c49:44c8:2c02:68b1%5]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 20:44:40 +0000
From: Leonard Crestez <leonard.crestez@nxp.com>
To: Yangtao Li <tiny.windzz@gmail.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
 "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx
 <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Thread-Topic: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Thread-Index: AQHVrsr/8/dokU6K/U2uIVGyaN+gaw==
Date: Mon, 9 Dec 2019 20:44:39 +0000
Message-ID: <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 12791ee1-a653-484d-f0e3-08d77ce89ce3
x-ms-traffictypediagnostic: VI1PR04MB2973:|VI1PR04MB2973:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB2973E280AA26C30BE4C19BBAEE580@VI1PR04MB2973.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(189003)(199004)(55016002)(5660300002)(8936002)(966005)(81166006)(478600001)(33656002)(8676002)(81156014)(86362001)(7366002)(44832011)(2906002)(305945005)(26005)(110136005)(186003)(54906003)(4326008)(6636002)(7416002)(7696005)(316002)(76116006)(6506007)(229853002)(91956017)(66446008)(53546011)(7406005)(71200400001)(66556008)(66476007)(71190400001)(52536014)(64756008)(66946007)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB2973;
 H:VI1PR04MB7023.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5d9PkFROlAcsmOyaIyyfGHdc+nzPmbAadwg8jp0mNATJ68NZhX6uMW1fC3LAZEVAOHqsT8hHPkLbA+6/uGDOS4QKuPMHMNXSN/IKaKyZOnXWv/NjltcaFpcHL+exFjaltBUgIOsn5QaLtAjaZlxoefLJmpsLHczVOr7uYdE5ktX+xmylqvpOGpzUwkM+ll68RAkvuIKyMw00dezp/wS7Xn+kZ8idEeOwOOM/raaxW3NdysFj/OkQZsF0YQ8FHVCX9XM4f8dzV7f5Yi5OEeherUn9YHpcuDaYRuQPwbYX+LSWo9E590O67bqlrTdNDX6pOb8xAX6nuJyG8/ZBRjgOzjGRKVU+mEv1+10tCrqKMrsMKYjEre7VdmXn2s8823Fe3o4A2g57rW/1wkGe92mQw9EhOMxjT36SZNzdoCv16Wqo942MzjIrb6aECJQY2igMSaX9Q9bCdPY29cGql6wOUN+pGy4vMuRNwySii8TS/Iw=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12791ee1-a653-484d-f0e3-08d77ce89ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 20:44:39.9917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dsw/RwzjOE3fUn9Atwt1DQt0zgHQLpoIDTL8ddzfKAjIsKZlxMHBGElAOvv8eiHtLxlbxpbmuyNKHmJEdG9g0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_124448_511156_C5C755F8 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>,
 "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>,
 "rfontana@redhat.com" <rfontana@redhat.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>,
 "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "john@phrozen.org" <john@phrozen.org>, "robh@kernel.org" <robh@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "emilio@elopez.com.ar" <emilio@elopez.com.ar>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "swinslow@gmail.com" <swinslow@gmail.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "allison@lohutok.net" <allison@lohutok.net>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "pdeschrijver@nvidia.com" <pdeschrijver@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "t-kristo@ti.com" <t-kristo@ti.com>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "kgene@kernel.org" <kgene@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "wangyan.wang@mediatek.com" <wangyan.wang@mediatek.com>,
 "afaerber@suse.de" <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09.12.2019 21:58, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>   drivers/clk/imx/clk-imx8qxp-lpcg.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index c0aff7ca6374..10ae712447c6 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -164,7 +164,6 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
>   	struct clk_hw_onecell_data *clk_data;
>   	const struct imx8qxp_ss_lpcg *ss_lpcg;
>   	const struct imx8qxp_lpcg_data *lpcg;
> -	struct resource *res;
>   	struct clk_hw **clks;
>   	void __iomem *base;
>   	int i;
> @@ -173,10 +172,7 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
>   	if (!ss_lpcg)
>   		return -ENODEV;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -EINVAL;
> -	base = devm_ioremap(dev, res->start, resource_size(res));
> +	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (!base)
>   		return -ENOMEM;

This breaks imx8qxp-mek boot by causing most peripherals (like uart) to 
fail to probe.

The old and new paths are not equivalent: devm_platform_ioremap_resource
calls devm_ioremap_resource which differs from devm_ioremap by also 
calling devm_request_mem_region.

This prevents other mappings in the area and imx8qxp-lpcg nodes map 
whole hardware "subsystems" and overlap most peripherals. For example:

                  adma_lpcg: clock-controller@59000000 {
                          compatible = "fsl,imx8qxp-lpcg-adma";
                          reg = <0x59000000 0x2000000>;
                          #clock-cells = <1>;
		};

                 adma_lpuart0: serial@5a060000 {
			reg = <0x5a060000 0x1000>;
			...
		};

I don't know if this issue affects any other platforms (imx8 lpcg 
bindings are unusual) but if you found this with an automated tool 
perhaps it should be adjusted?

By my count it's the 4th time this incorrect cleanup was posted.

Previously: https://lkml.org/lkml/2019/12/4/487

--
Regards,
Leonard

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
