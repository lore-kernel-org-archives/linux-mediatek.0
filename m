Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B36C47080
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 10:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D50F6124C
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 10:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D50F6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXd030zl5Nf9nUSm0kt0gs3VRGdaMIaESJ6gcfUuLUE=; b=Nsqalv9OIn1ajA
	f6J8dTjZ8HueZxF5sANsXsEoKmyWnjoDcJsI6ceiNHNYaDNO/Xv3O+OFnSJ/wSeHVWrT9JmLgnO7W
	5n/sYgb5+sTzHDgDJiTUvlt3JRxP27z96GxcEAbVCVhYbgS49DV4z33L/xCx3UcqAZ3LtDzt/307Q
	Z3Oi6Pz7g9JV3g9TWrNUufIahOLb2EzZtFg1GmFlIYdQtxUgcliStxQLoHe+zFDtmrMMZxI4tolRR
	Z7oWDg0dkcnogt0veGi6wtHM1APssuIOpVHnUnsmYodwdQN65lPbPK9OZgS0RH9mal7QKjhnbVbxF
	YCbwKKcFb6oQ5ntTs8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnfOA-00Bswl-8v; Mon, 31 May 2021 10:43:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnfO5-00Bsvn-Or; Mon, 31 May 2021 10:43:16 +0000
X-UUID: ce910df170d745879bb70bde907b1b57-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q6CDHgMb9mKPjp4x1SNulaupT/UhuvJHScgAw4+1iTQ=; 
 b=ko6mlvE4fPSKbOHJf3EOa9rD1aJvdjO8XfICi/mlJYtxSwEl4oT0bqdaclb1kpELf/8GJv5NwPXQQav7kkNcuiFoa+RcbN/U4gdUruiI60INGoH9W0E+GsUmnVO5vs8Lt5kU5z/oTneaBANcMzTPxWdPnhkRkNHqoPsuKfmEPdg=;
X-UUID: ce910df170d745879bb70bde907b1b57-20210531
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1819986232; Mon, 31 May 2021 03:43:10 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 03:43:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 18:42:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 May 2021 18:42:57 +0800
Message-ID: <45480f3e65a58141132b2e8f17815fb21157b32c.camel@mediatek.com>
Subject: Re: [PATCH 1/3] soc: mtk-pm-domains: Fix the clock prepared issue
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>,
 <chun-jie.chen@mediatek.corp-partner.google.com>, Yong Wu
 <yong.wu@mediatek.com>
Date: Mon, 31 May 2021 18:42:57 +0800
In-Reply-To: <20210531043502.2702645-1-hsinyi@chromium.org>
References: <20210531043502.2702645-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C6DBC4AF376BB256ECC1E5347F85EB167520B767E3D2E466CDFB52E29ED2C8192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_034315_242953_ECB0687C 
X-CRM114-Status: GOOD (  26.23  )
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

On Mon, 2021-05-31 at 12:35 +0800, Hsin-Yi Wang wrote:
> From: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> In this new power domain driver, when adding one power domain
> it will prepare the depenedent clocks at the same.
> So we only do clk_bulk_enable/disable control during power ON/OFF.
> When system suspend, the pm runtime framework will forcely power off
> power domains. However, the dependent clocks are disabled but kept
> preapred.
> 
> In MediaTek clock drivers, PLL would be turned ON when we do
> clk_bulk_prepare control.
> 
> Clock hierarchy:
> PLL -->
>        DIV_CK -->
>                  CLK_MUX
>                  (may be dependent clocks)
>                          -->
>                              SUBSYS_CG
>                              (may be dependent clocks)
> 
> It will lead some unexpected clock states during system suspend.
> This patch will fix by doing prepare_enable/disable_unprepare on
> dependent clocks at the same time while we are going to power on/off
> any power domain.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: chun-jie.chen <chun-jie.chen@mediatek.com>

> ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 31 +++++++----------------
> ----
>  1 file changed, 8 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c
> b/drivers/soc/mediatek/mtk-pm-domains.c
> index 0af00efa0ef8..536d8c64b2b4 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -211,7 +211,7 @@ static int scpsys_power_on(struct
> generic_pm_domain *genpd)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_bulk_enable(pd->num_clks, pd->clks);
> +	ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
>  	if (ret)
>  		goto err_reg;
>  
> @@ -229,7 +229,7 @@ static int scpsys_power_on(struct
> generic_pm_domain *genpd)
>  	regmap_clear_bits(scpsys->base, pd->data->ctl_offs,
> PWR_ISO_BIT);
>  	regmap_set_bits(scpsys->base, pd->data->ctl_offs,
> PWR_RST_B_BIT);
>  
> -	ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
> +	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd-
> >subsys_clks);
>  	if (ret)
>  		goto err_pwr_ack;
>  
> @@ -246,9 +246,9 @@ static int scpsys_power_on(struct
> generic_pm_domain *genpd)
>  err_disable_sram:
>  	scpsys_sram_disable(pd);
>  err_disable_subsys_clks:
> -	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> +	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd-
> >subsys_clks);
>  err_pwr_ack:
> -	clk_bulk_disable(pd->num_clks, pd->clks);
> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>  err_reg:
>  	scpsys_regulator_disable(pd->supply);
>  	return ret;
> @@ -269,7 +269,7 @@ static int scpsys_power_off(struct
> generic_pm_domain *genpd)
>  	if (ret < 0)
>  		return ret;
>  
> -	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> +	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd-
> >subsys_clks);
>  
>  	/* subsys power off */
>  	regmap_clear_bits(scpsys->base, pd->data->ctl_offs,
> PWR_RST_B_BIT);
> @@ -284,7 +284,7 @@ static int scpsys_power_off(struct
> generic_pm_domain *genpd)
>  	if (ret < 0)
>  		return ret;
>  
> -	clk_bulk_disable(pd->num_clks, pd->clks);
> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>  
>  	scpsys_regulator_disable(pd->supply);
>  
> @@ -405,14 +405,6 @@ generic_pm_domain *scpsys_add_one_domain(struct
> scpsys *scpsys, struct device_no
>  		pd->subsys_clks[i].clk = clk;
>  	}
>  
> -	ret = clk_bulk_prepare(pd->num_clks, pd->clks);
> -	if (ret)
> -		goto err_put_subsys_clocks;
> -
> -	ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
> -	if (ret)
> -		goto err_unprepare_clocks;
> -
>  	/*
>  	 * Initially turn on all domains to make the domains usable
>  	 * with !CONFIG_PM and to get the hardware in sync with the
> @@ -427,7 +419,7 @@ generic_pm_domain *scpsys_add_one_domain(struct
> scpsys *scpsys, struct device_no
>  		ret = scpsys_power_on(&pd->genpd);
>  		if (ret < 0) {
>  			dev_err(scpsys->dev, "%pOF: failed to power on
> domain: %d\n", node, ret);
> -			goto err_unprepare_clocks;
> +			goto err_put_subsys_clocks;
>  		}
>  	}
>  
> @@ -435,7 +427,7 @@ generic_pm_domain *scpsys_add_one_domain(struct
> scpsys *scpsys, struct device_no
>  		ret = -EINVAL;
>  		dev_err(scpsys->dev,
>  			"power domain with id %d already exists, check
> your device-tree\n", id);
> -		goto err_unprepare_subsys_clocks;
> +		goto err_put_subsys_clocks;
>  	}
>  
>  	if (!pd->data->name)
> @@ -455,10 +447,6 @@ generic_pm_domain *scpsys_add_one_domain(struct
> scpsys *scpsys, struct device_no
>  
>  	return scpsys->pd_data.domains[id];
>  
> -err_unprepare_subsys_clocks:
> -	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> -err_unprepare_clocks:
> -	clk_bulk_unprepare(pd->num_clks, pd->clks);
>  err_put_subsys_clocks:
>  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  err_put_clocks:
> @@ -537,10 +525,7 @@ static void scpsys_remove_one_domain(struct
> scpsys_domain *pd)
>  			"failed to remove domain '%s' : %d - state may
> be inconsistent\n",
>  			pd->genpd.name, ret);
>  
> -	clk_bulk_unprepare(pd->num_clks, pd->clks);
>  	clk_bulk_put(pd->num_clks, pd->clks);
> -
> -	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
