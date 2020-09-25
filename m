Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02847C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 10:56:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7146F21D91
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 10:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zgnlyEpR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TWoLkNjQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7146F21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Ett2tQvOZ2iinr93NimQchEXsPAEIcNs6lJ0MZAxG0=; b=zgnlyEpRaBA0psAXMA6dd2sWS
	iOZhTD+MGxiIeVbBaE760ewAIaDvjfpC3YNvOBIjB9u7auGD905njV3SnVQ0GKh1YLnycai74z/x+
	5QdERkjejjzTr/ipExVJUfQZ+pOedSYE+2XUdFgoiJgoPNfQYrRYPwbkMbQKyuwjv/oBiH2IBPB+D
	k4KIiF92U/JZznqFWE3W1cfZpUx2XqDobJgOegqjOiSGFY2mMlWonzJB25JzVnsnmaQSG1VVkkhTF
	KWqWHoYhHCAEWBuz1YekvhjupOsm4e5sn7/P4aNqE85jd0yCWt6Ic1u6+OU2tISd/4kK9XjBioOq8
	4RIbfMSBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLlOa-0000yd-AR; Fri, 25 Sep 2020 10:56:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLlOY-0000xe-10; Fri, 25 Sep 2020 10:56:07 +0000
X-UUID: 4861cb09f90a410cbc25d24202bfbb8c-20200925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QSsY9bGW8QogtB8BuZJoi6P8Bw0CZxSbHu+WA8g8Uzo=; 
 b=TWoLkNjQMHlV/2mvM+1ozpjNM0gv4MJw+MHWCreeILUfB5/wRevpCOiqLU9A8fkOXarDpLqWq+5g2uGq1WvHejxNpVrCzDXo13PckiUB92xvlmEXnuHUA6mEKF7g73ZUfy3c9wlXAA2at2BIvzsHcvtAcHxZVhEG1MhgkPp5H/k=;
X-UUID: 4861cb09f90a410cbc25d24202bfbb8c-20200925
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1824756973; Fri, 25 Sep 2020 02:56:02 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 03:56:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 18:55:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 18:55:52 +0800
Message-ID: <1601031353.1346.71.camel@mtksdaap41>
Subject: Re: [PATCH 08/12] soc: mediatek: pm-domains: Add subsystem clocks
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Fri, 25 Sep 2020 18:55:53 +0800
In-Reply-To: <20200910172826.3074357-9-enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-9-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_065606_206389_92771700 
X-CRM114-Status: GOOD (  26.62  )
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
Cc: drinkcat@chromium.org, linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-10 at 19:28 +0200, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> For the bus protection operations, some subsystem clocks need to be enabled
> before releasing the protection. This patch identifies the subsystem clocks
> by it's name.
> 
> Suggested-by: Weiyi Lu <weiyi.lu@mediatek.com>
> [Adapted the patch to the mtk-pm-domains driver]
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>  drivers/soc/mediatek/mtk-pm-domains.c | 82 +++++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 0802eccc3a0b..52a93a87e313 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2020 Collabora Ltd.
>   */
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -81,6 +82,8 @@ struct scpsys_bus_prot_data {
>  	bool bus_prot_reg_update;
>  };
>  
> +#define MAX_SUBSYS_CLKS 10
> +
>  /**
>   * struct scpsys_domain_data - scp domain data for power on/off flow
>   * @sta_mask: The mask for power on/off status bit.
> @@ -107,6 +110,8 @@ struct scpsys_domain {
>  	struct scpsys *scpsys;
>  	int num_clks;
>  	struct clk_bulk_data *clks;
> +	int num_subsys_clks;
> +	struct clk_bulk_data *subsys_clks;
>  	struct regmap *infracfg;
>  	struct regmap *smi;
>  };
> @@ -309,16 +314,22 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  	val |= PWR_RST_B_BIT;
>  	writel(val, ctl_addr);
>  
> +	ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
> +	if (ret)
> +		goto err_pwr_ack;
> +
>  	ret = scpsys_sram_enable(pd, ctl_addr);
>  	if (ret < 0)
> -		goto err_pwr_ack;
> +		goto err_sram;
>  
>  	ret = scpsys_bus_protect_disable(pd);
>  	if (ret < 0)
> -		goto err_pwr_ack;
> +		goto err_sram;
>  
>  	return 0;
>  
> +err_sram:
> +	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
>  err_pwr_ack:
>  	clk_bulk_disable(pd->num_clks, pd->clks);
>  	dev_err(scpsys->dev, "Failed to power on domain %s\n", genpd->name);
> @@ -342,6 +353,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>  	if (ret < 0)
>  		return ret;
>  
> +	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> +
>  	/* subsys power off */
>  	val = readl(ctl_addr);
>  	val |= PWR_ISO_BIT;
> @@ -374,8 +387,11 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
>  {
>  	const struct scpsys_domain_data *domain_data;
>  	struct scpsys_domain *pd;
> -	int i, ret;
> +	int i, ret, num_clks;
>  	u32 id;
> +	int clk_ind = 0;
> +	struct property *prop;
> +	const char *clk_name;
>  
>  	ret = of_property_read_u32(node, "reg", &id);
>  	if (ret) {
> @@ -410,28 +426,60 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
>  	if (IS_ERR(pd->smi))
>  		pd->smi = NULL;
>  
> -	pd->num_clks = of_clk_get_parent_count(node);
> -	if (pd->num_clks > 0) {
> +	num_clks = of_clk_get_parent_count(node);
> +	if (num_clks > 0) {
> +		/* Calculate number of subsys_clks */
> +		of_property_for_each_string(node, "clock-names", prop, clk_name) {
> +			char *subsys;
> +
> +			subsys = strchr(clk_name, '-');
> +			if (subsys)
> +				pd->num_subsys_clks++;
> +			else
> +				pd->num_clks++;
> +		}
> +

In fact, I don't like the clock naming rules, as Matthias mentioned
before. So in my work v17[1]
I put subsystem clocks under each power domain sub-node without giving
the clock name but put the basic clocks under the power controller node.

[1] https://patchwork.kernel.org/patch/11703191/


>  		pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
>  		if (!pd->clks)
>  			return -ENOMEM;
> -	} else {
> -		pd->num_clks = 0;
> +
> +		pd->subsys_clks = devm_kcalloc(scpsys->dev, pd->num_subsys_clks,
> +					       sizeof(*pd->subsys_clks), GFP_KERNEL);
> +		if (!pd->subsys_clks)
> +			return -ENOMEM;
>  	}
>  
>  	for (i = 0; i < pd->num_clks; i++) {
> -		pd->clks[i].clk = of_clk_get(node, i);
> -		if (IS_ERR(pd->clks[i].clk)) {
> -			ret = PTR_ERR(pd->clks[i].clk);
> +		struct clk *clk = of_clk_get(node, i);
> +		if (IS_ERR(clk)) {
> +			ret = PTR_ERR(clk);
>  			dev_err(scpsys->dev, "%pOFn: failed to get clk at index %d: %d\n", node, i,
>  				ret);
> -			return ret;
> +			goto err_put_clocks;
> +		}
> +
> +		pd->clks[clk_ind++].clk = clk;
> +	}
> +
> +	for (i = 0; i < pd->num_subsys_clks; i++) {
> +		struct clk *clk = of_clk_get(node, i + clk_ind);
> +		if (IS_ERR(clk)) {
> +			ret = PTR_ERR(clk);
> +			dev_err(scpsys->dev, "%pOFn: failed to get clk at index %d: %d\n", node,
> +				i + clk_ind, ret);
> +			goto err_put_subsys_clocks;
>  		}
> +
> +		pd->subsys_clks[i].clk = clk;
>  	}
>  
> +	ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
> +	if (ret)
> +		goto err_put_subsys_clocks;
> +
>  	ret = clk_bulk_prepare(pd->num_clks, pd->clks);
>  	if (ret)
> -		goto err_put_clocks;
> +		goto err_unprepare_subsys_clocks;
>  
>  	/*
>  	 * Initially turn on all domains to make the domains usable
> @@ -456,6 +504,12 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
>  
>  err_unprepare_clocks:
>  	clk_bulk_unprepare(pd->num_clks, pd->clks);
> +err_unprepare_subsys_clocks:
> +	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +err_put_subsys_clocks:
> +	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> +	devm_kfree(scpsys->dev, pd->subsys_clks);
> +	pd->num_subsys_clks = 0;
>  err_put_clocks:
>  	clk_bulk_put(pd->num_clks, pd->clks);
>  	devm_kfree(scpsys->dev, pd->clks);
> @@ -537,6 +591,10 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>  	clk_bulk_unprepare(pd->num_clks, pd->clks);
>  	clk_bulk_put(pd->num_clks, pd->clks);
>  	pd->num_clks = 0;
> +
> +	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> +	pd->num_subsys_clks = 0;
>  }
>  
>  static void scpsys_domain_cleanup(struct scpsys *scpsys)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
