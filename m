Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57409C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E06TU7tORTIp1Dl7GfCplzqVmDomqwcyRCsmOXebXvE=; b=bTGkjHJo7QLOna
	48y3ovmzz8LqzcNn28BOFG2h4kbWAXjnY0brvP33WuIHUBpxU80nAQ1ArRpObCYKF8JzPvRJENp32
	FMlw9KiLJjtT3zBzrDet4IbUIBPDd+JcvoRPK8Mp2AdnM5xy/BC92GEOogfxTy193w+jp+6wbyws8
	46g8whR9i4lsvHsqv8sjj3SrwFfGqid5LMKI4jXop4pkLk4Ez3X3JiUWgJ2OjoMSywwfg6TRjTlQV
	xJeJddZRf8aOGQ6Yf3ZwDwB2TvgzIBKSRKN9uIbdC+TK+sx/q5647f8nm9Widr2Z1VpTsDlHgnYyT
	szEQ89JmJ1LIJX6m02rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmYkO-00FG8S-Bb; Thu, 05 May 2022 10:30:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmYkK-00FG67-Cp; Thu, 05 May 2022 10:30:10 +0000
X-UUID: a22940bebff34536abef5c3efe2881c8-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8f410c41-4f5f-4214-a49b-ff5634e20e82, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:71d5afb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a22940bebff34536abef5c3efe2881c8-20220505
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 401238872; Thu, 05 May 2022 03:30:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 03:30:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 18:30:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 5 May 2022 18:30:00 +0800
Message-ID: <696e3b1659d60e128b006cc0b41bbb21528a3949.camel@mediatek.com>
Subject: Re: [PATCH v5 3/9] cpufreq: mediatek: Move voltage limits to
 platform data
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 5 May 2022 18:29:59 +0800
In-Reply-To: <20220505085200.rzwzblirsprkvcz7@vireshk-i7>
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
 <20220504130540.5902-4-rex-bc.chen@mediatek.com>
 <20220505085200.rzwzblirsprkvcz7@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_033008_506184_109E7DD7 
X-CRM114-Status: GOOD (  33.83  )
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

On Thu, 2022-05-05 at 14:22 +0530, Viresh Kumar wrote:
> On 04-05-22, 21:05, Rex-BC Chen wrote:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > Voltages and shifts are defined as macros originally.
> > There are different requirements of these values for each MediaTek
> > SoCs.
> > Therefore, we add the platform data and move these values into it.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 90 ++++++++++++++++++++----
> > ------
> >  1 file changed, 61 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index 363ebecb2c80..80a3d4cd49ed 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -10,15 +10,21 @@
> >  #include <linux/cpumask.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_opp.h>
> >  #include <linux/regulator/consumer.h>
> >  
> > -#define MIN_VOLT_SHIFT		(100000)
> > -#define MAX_VOLT_SHIFT		(200000)
> > -#define MAX_VOLT_LIMIT		(1150000)
> >  #define VOLT_TOL		(10000)
> >  
> > +struct mtk_cpufreq_platform_data {
> > +	int min_volt_shift;
> > +	int max_volt_shift;
> > +	int proc_max_volt;
> > +	int sram_min_volt;
> > +	int sram_max_volt;
> > +};
> > +
> >  /*
> >   * The struct mtk_cpu_dvfs_info holds necessary information for
> > doing CPU DVFS
> >   * on each CPU power/clock domain of Mediatek SoCs. Each CPU
> > cluster in
> > @@ -46,8 +52,11 @@ struct mtk_cpu_dvfs_info {
> >  	struct notifier_block opp_nb;
> >  	unsigned int opp_cpu;
> >  	unsigned long opp_freq;
> > +	const struct mtk_cpufreq_platform_data *soc_data;
> >  };
> >  
> > +static struct platform_device *cpufreq_pdev;
> > +
> >  static LIST_HEAD(dvfs_info_list);
> >  
> >  static struct mtk_cpu_dvfs_info *mtk_cpu_dvfs_info_lookup(int cpu)
> > @@ -65,6 +74,7 @@ static struct mtk_cpu_dvfs_info
> > *mtk_cpu_dvfs_info_lookup(int cpu)
> >  static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info
> > *info,
> >  					int new_vproc)
> >  {
> > +	const struct mtk_cpufreq_platform_data *soc_data = info-
> > >soc_data;
> >  	struct regulator *proc_reg = info->proc_reg;
> >  	struct regulator *sram_reg = info->sram_reg;
> >  	int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
> > @@ -76,7 +86,8 @@ static int mtk_cpufreq_voltage_tracking(struct
> > mtk_cpu_dvfs_info *info,
> >  		return pre_vproc;
> >  	}
> >  	/* Vsram should not exceed the maximum allowed voltage of SoC.
> > */
> > -	new_vsram = min(new_vproc + MIN_VOLT_SHIFT, MAX_VOLT_LIMIT);
> > +	new_vsram = min(new_vproc + soc_data->min_volt_shift,
> > +			soc_data->sram_max_volt);
> >  
> >  	if (pre_vproc < new_vproc) {
> >  		/*
> > @@ -99,10 +110,11 @@ static int mtk_cpufreq_voltage_tracking(struct
> > mtk_cpu_dvfs_info *info,
> >  				return pre_vproc;
> >  			}
> >  
> > -			vsram = min(new_vsram, pre_vproc +
> > MAX_VOLT_SHIFT);
> > +			vsram = min(new_vsram,
> > +				    pre_vproc + soc_data-
> > >min_volt_shift);
> >  
> > -			if (vsram + VOLT_TOL >= MAX_VOLT_LIMIT) {
> > -				vsram = MAX_VOLT_LIMIT;
> > +			if (vsram + VOLT_TOL >= soc_data-
> > >sram_max_volt) {
> > +				vsram = soc_data->sram_max_volt;
> >  
> >  				/*
> >  				 * If the target Vsram hits the maximum
> > voltage,
> > @@ -120,7 +132,7 @@ static int mtk_cpufreq_voltage_tracking(struct
> > mtk_cpu_dvfs_info *info,
> >  				ret = regulator_set_voltage(sram_reg,
> > vsram,
> >  							    vsram +
> > VOLT_TOL);
> >  
> > -				vproc = vsram - MIN_VOLT_SHIFT;
> > +				vproc = vsram - soc_data-
> > >min_volt_shift;
> >  			}
> >  			if (ret)
> >  				return ret;
> > @@ -154,7 +166,8 @@ static int mtk_cpufreq_voltage_tracking(struct
> > mtk_cpu_dvfs_info *info,
> >  				return pre_vsram;
> >  			}
> >  
> > -			vproc = max(new_vproc, pre_vsram -
> > MAX_VOLT_SHIFT);
> > +			vproc = max(new_vproc,
> > +				    pre_vsram - soc_data-
> > >max_volt_shift);
> >  			ret = regulator_set_voltage(proc_reg, vproc,
> >  						    vproc + VOLT_TOL);
> >  			if (ret)
> > @@ -163,10 +176,11 @@ static int
> > mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
> >  			if (vproc == new_vproc)
> >  				vsram = new_vsram;
> >  			else
> > -				vsram = max(new_vsram, vproc +
> > MIN_VOLT_SHIFT);
> > +				vsram = max(new_vsram,
> > +					    vproc + soc_data-
> > >min_volt_shift);
> >  
> > -			if (vsram + VOLT_TOL >= MAX_VOLT_LIMIT) {
> > -				vsram = MAX_VOLT_LIMIT;
> > +			if (vsram + VOLT_TOL >= soc_data-
> > >sram_max_volt) {
> > +				vsram = soc_data->sram_max_volt;
> >  
> >  				/*
> >  				 * If the target Vsram hits the maximum
> > voltage,
> > @@ -197,13 +211,14 @@ static int
> > mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
> >  
> >  static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info,
> > int vproc)
> >  {
> > +	const struct mtk_cpufreq_platform_data *soc_data = info-
> > >soc_data;
> >  	int ret;
> >  
> >  	if (info->need_voltage_tracking)
> >  		ret = mtk_cpufreq_voltage_tracking(info, vproc);
> >  	else
> >  		ret = regulator_set_voltage(info->proc_reg, vproc,
> > -					    MAX_VOLT_LIMIT);
> > +					    soc_data->proc_max_volt);
> >  	if (!ret)
> >  		info->pre_vproc = vproc;
> >  
> > @@ -583,9 +598,17 @@ static struct cpufreq_driver
> > mtk_cpufreq_driver = {
> >  
> >  static int mtk_cpufreq_probe(struct platform_device *pdev)
> >  {
> > +	const struct of_device_id *match;
> >  	struct mtk_cpu_dvfs_info *info, *tmp;
> >  	int cpu, ret;
> >  
> > +	match = dev_get_platdata(&pdev->dev);
> > +	if (!match || !match->data) {
> > +		dev_err(&pdev->dev,
> > +			"failed to get mtk cpufreq platform data\n");
> > +		return -ENODEV;
> > +	}
> > +
> >  	for_each_possible_cpu(cpu) {
> >  		info = mtk_cpu_dvfs_info_lookup(cpu);
> >  		if (info)
> > @@ -597,6 +620,7 @@ static int mtk_cpufreq_probe(struct
> > platform_device *pdev)
> >  			goto release_dvfs_info_list;
> >  		}
> >  
> > +		info->soc_data = match->data;
> >  		ret = mtk_cpu_dvfs_info_init(info, cpu);
> >  		if (ret) {
> >  			dev_err(&pdev->dev,
> > @@ -632,20 +656,27 @@ static struct platform_driver
> > mtk_cpufreq_platdrv = {
> >  	.probe		= mtk_cpufreq_probe,
> >  };
> >  
> > +static const struct mtk_cpufreq_platform_data mt2701_platform_data
> > = {
> > +	.min_volt_shift = 100000,
> > +	.max_volt_shift = 200000,
> > +	.proc_max_volt = 1150000,
> > +	.sram_min_volt = 0,
> > +	.sram_max_volt = 1150000,
> > +};
> > +
> >  /* List of machines supported by this driver */
> >  static const struct of_device_id mtk_cpufreq_machines[]
> > __initconst = {
> > -	{ .compatible = "mediatek,mt2701", },
> > -	{ .compatible = "mediatek,mt2712", },
> > -	{ .compatible = "mediatek,mt7622", },
> > -	{ .compatible = "mediatek,mt7623", },
> > -	{ .compatible = "mediatek,mt8167", },
> > -	{ .compatible = "mediatek,mt817x", },
> > -	{ .compatible = "mediatek,mt8173", },
> > -	{ .compatible = "mediatek,mt8176", },
> > -	{ .compatible = "mediatek,mt8183", },
> > -	{ .compatible = "mediatek,mt8365", },
> > -	{ .compatible = "mediatek,mt8516", },
> > -
> > +	{ .compatible = "mediatek,mt2701", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt2712", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt7622", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt7623", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt8167", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt817x", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt8173", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt8176", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt8183", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt8365", .data =
> > &mt2701_platform_data },
> > +	{ .compatible = "mediatek,mt8516", .data =
> > &mt2701_platform_data },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_cpufreq_machines);
> > @@ -654,7 +685,6 @@ static int __init mtk_cpufreq_driver_init(void)
> >  {
> >  	struct device_node *np;
> >  	const struct of_device_id *match;
> > -	struct platform_device *pdev;
> >  	int err;
> >  
> >  	np = of_find_node_by_path("/");
> > @@ -678,11 +708,12 @@ static int __init
> > mtk_cpufreq_driver_init(void)
> >  	 * and the device registration codes are put here to handle
> > defer
> >  	 * probing.
> >  	 */
> > -	pdev = platform_device_register_simple("mtk-cpufreq", -1, NULL,
> > 0);
> > -	if (IS_ERR(pdev)) {
> > +	cpufreq_pdev = platform_device_register_data(NULL, "mtk-
> > cpufreq", -1,
> > +						     match,
> > sizeof(*match));
> 
> Why pass match here instead of just the data ?
> 

Hello Viresh,

Thanks for your review.
I will pass data directly in next version.

> > +	if (IS_ERR(cpufreq_pdev)) {
> >  		pr_err("failed to register mtk-cpufreq platform
> > device\n");
> >  		platform_driver_unregister(&mtk_cpufreq_platdrv);
> > -		return PTR_ERR(pdev);
> > +		return PTR_ERR(cpufreq_pdev);
> >  	}
> >  
> >  	return 0;
> > @@ -691,6 +722,7 @@ module_init(mtk_cpufreq_driver_init)
> >  
> >  static void __exit mtk_cpufreq_driver_exit(void)
> >  {
> > +	platform_device_unregister(cpufreq_pdev);
> 
> You fixed a bug silently :)
> 
> That's not right.
> 

I will move this modification to another patch.

BRs,
Rex

> >  	platform_driver_unregister(&mtk_cpufreq_platdrv);
> >  }
> >  module_exit(mtk_cpufreq_driver_exit)
> > -- 
> > 2.18.0
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
