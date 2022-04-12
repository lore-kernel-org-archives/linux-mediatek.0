Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 08:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CI167fgdArFjPsS1ophvyoKpAr8dMbBMOXzkegt5wsE=; b=PZTcDxb2m1b6d1
	YOn37evAedYBcTJPMt70b/Dsk3Hcp/0KQlKCDY8jk78nlCo5eg+M101P63bP19b4CWpdJRiQdpMCL
	RHPXBxzcWCE7tmALCSu8KfJUcfnr/mBnkb0BKhGVcanUzuDGhf7KiDzS203zJ5/gRIA09HLOsj0T7
	8bqSBE7tcX68AYLyi/jGTm9nBH5KPkIhnuPj/TOasOSQKr+7BkWoR6dVuoEzTDCcQaLzviYUaDaL7
	fezgUka97WHsmEocS+vcEgKx2VVmdObXcC0wxPd3mlzUOt2ajNgt4oqr4l3nj3rh2FeHnVkYrCg4n
	xNOaUHmr953YNjwgaKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCDs-00Cg6y-8i; Tue, 12 Apr 2022 08:50:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCDe-00Cg1v-0v; Tue, 12 Apr 2022 08:49:52 +0000
X-UUID: bcad9fe879074b15a0e4afc56d5c9d6f-20220412
X-UUID: bcad9fe879074b15a0e4afc56d5c9d6f-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 909226356; Tue, 12 Apr 2022 01:49:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 01:39:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 12 Apr 2022 16:39:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 16:39:36 +0800
Message-ID: <d900f8181bddb20a56231310d46b9427c40e77b8.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] PM / devfreq: mediatek: Introduce MediaTek CCI
 devfreq driver
From: Johnson Wang <johnson.wang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>
CC: <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 12 Apr 2022 16:39:36 +0800
In-Reply-To: <76d58182-2f56-32b2-42e9-2ecbdd09ba3d@linaro.org>
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
 <20220408052150.22536-3-johnson.wang@mediatek.com>
 <76d58182-2f56-32b2-42e9-2ecbdd09ba3d@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_014950_122786_2DC3CDF7 
X-CRM114-Status: GOOD (  28.83  )
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

Hi Krzysztof,
On Fri, 2022-04-08 at 10:21 +0200, Krzysztof Kozlowski wrote:
> On 08/04/2022 07:21, Johnson Wang wrote:
> > We introduce a devfreq driver for the MediaTek Cache Coherent
> > Interconnect
> > (CCI) used by some MediaTek SoCs.
> > 
> 
> (...)
> 
> > index 87eb2b837e68..d985597f343f 100644
> > --- a/drivers/devfreq/Kconfig
> > +++ b/drivers/devfreq/Kconfig
> > @@ -120,6 +120,16 @@ config ARM_TEGRA_DEVFREQ
> >  	  It reads ACTMON counters of memory controllers and adjusts
> > the
> >  	  operating frequencies and voltages with OPP support.
> >  
> > +config ARM_MEDIATEK_CCI_DEVFREQ
> > +	tristate "MEDIATEK CCI DEVFREQ Driver"
> > +	depends on ARM_MEDIATEK_CPUFREQ
> > > COMPILE_TEST? And check if it test compiles.

Thank you for your review.
I will add COMPILE_TEST and see if this driver is compiled with it.

> 
> (...)
> 
> > +
> > +static int mtk_ccifreq_remove(struct platform_device *pdev)
> > +{
> > +	struct device *cci_dev = &pdev->dev;
> 
> s/cci_dev/dev/
> Everywhere.
> 

Sure, I will modify it in the next version.

> > +	struct mtk_ccifreq_drv *drv;
> > +
> > +	drv = platform_get_drvdata(pdev);
> > +
> > +	dev_pm_opp_unregister_notifier(cci_dev, &drv->opp_nb);
> > +	dev_pm_opp_of_remove_table(cci_dev);
> > +	clk_disable_unprepare(drv->inter_clk);
> > +	clk_disable_unprepare(drv->cci_clk);
> > +	regulator_disable(drv->proc_reg);
> > +	if (!IS_ERR(drv->sram_reg))
> > +		regulator_disable(drv->sram_reg);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct mtk_ccifreq_platform_data mt8183_platform_data
> > = {
> > +	.min_volt_shift = 100000,
> > +	.max_volt_shift = 200000,
> > +	.proc_max_volt = 1150000,
> > +	.sram_min_volt = 0,
> > +	.sram_max_volt = 1150000,
> > +};
> > +
> > +static const struct mtk_ccifreq_platform_data mt8186_platform_data
> > = {
> > +	.min_volt_shift = 100000,
> > +	.max_volt_shift = 250000,
> > +	.proc_max_volt = 1118750,
> > +	.sram_min_volt = 850000,
> > +	.sram_max_volt = 1118750,
> > +};
> > +
> > +static const struct of_device_id mtk_ccifreq_machines[] = {
> > +	{ .compatible = "mediatek,mt8183-cci", .data =
> > &mt8183_platform_data },
> > +	{ .compatible = "mediatek,mt8186-cci", .data =
> > &mt8186_platform_data },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_ccifreq_machines);
> > +
> > +static struct platform_driver mtk_ccifreq_platdrv = {
> > +	.probe	= mtk_ccifreq_probe,
> > +	.remove	= mtk_ccifreq_remove,
> > +	.driver = {
> > +		.name = "mtk-ccifreq",
> > +		.of_match_table = of_match_ptr(mtk_ccifreq_machines),
> 
> You use of_match_ptr() so is it possible to build it without OF? If
> so,
> then mtk_ccifreq_machines needs maybe_unused.
> 

No, this driver must be built with OF due to our CPU arch.
Should I add some dependencies in Kconfig to ensure OF is enabled?

> > +	},
> > +};
> > +
> > +static int __init mtk_ccifreq_platdrv_init(void)
> > +{
> > +	return platform_driver_register(&mtk_ccifreq_platdrv);
> > +}
> > +module_init(mtk_ccifreq_platdrv_init)
> > +
> > +static void __exit mtk_ccifreq_platdrv_exit(void)
> > +{
> > +	platform_driver_unregister(&mtk_ccifreq_platdrv);
> > +}
> > +module_exit(mtk_ccifreq_platdrv_exit)
> 
> Why not module_platform_driver()?

I will try to use module_platform_driver() and update it in the next
version.

> 
> > +
> > +MODULE_DESCRIPTION("MediaTek CCI devfreq driver");
> > +MODULE_AUTHOR("Jia-Wei Chang <jia-wei.chang@mediatek.com>");
> > +MODULE_LICENSE("GPL v2");
> 
> 
> Best regards,
> Krzysztof

BRs,
Johnson Wang


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
