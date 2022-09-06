Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A6BC38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9bzmF3ZoiraH8bSCm3RFyfs5y83CCLS0cNFcKgRys4=; b=ybt0wCsmDTSuSRYKlAf0er1ZtE
	RKkwAKR2fXUSH11dFgNJ2jBEzOXdYqxIm6VES2abQ4j1nXbbUFTaG3Ja8y//l6UKTgrWupitrCZBk
	cekfNltWJw+ksaKiKs/oxVPTQpZgnwwDXP0Pxj9EcRIGQa5vIw4FZnlyi0P5YrhN93B9lz43/3VJg
	6KFDin5ZrGqbXAgDmvtI9RweGbcTAMCsxc84qgDTurn/HtyZ/c8hhxuvaO4rdignW7JZI5sdXKmIS
	aQuD7zyU92hxzotluuiv1gsQ5I2lmhug+GhD0tHFrcev9ZKMqu+dWDSjjWmf8PFPcpEhpjMkeRuYR
	APKudi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVVHG-00C6uX-5l; Tue, 06 Sep 2022 09:53:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVVDL-00C4bS-Pj
	for linux-mediatek@lists.infradead.org; Tue, 06 Sep 2022 09:49:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id b5so14587365wrr.5
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Sep 2022 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Q9bzmF3ZoiraH8bSCm3RFyfs5y83CCLS0cNFcKgRys4=;
        b=KdK4qwT0irjOT2AQeXx/5UpyUeahzWzRRlGp1f3qAcdBjQ3PoHtX2lmiC8yJeFVeWl
         l51ATIXK590R5ssFIRueUCRmSw6uRbub5TPnNIwjRFCKVb7B316cdKuCfGdieqB4Xt6m
         3DxlUcYxxmFktBI1mXDxUFIe/tcZ5I3W+IWRSwmmtOsq1D6O+Nc3zUU7iFyKa/S0HxTt
         M6lYX5jnvxtbFd4WRPIkFYElnbYwgKjtTdydPsoITThKUQGBWA6Wa5qOj5hTeiSsE77e
         sz7rDf/sw8N6BvEqZzXOb70NsZFhGpae/kpBql8JRT5tM4BU/tInO3LzSIzlYW9ONROY
         peqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Q9bzmF3ZoiraH8bSCm3RFyfs5y83CCLS0cNFcKgRys4=;
        b=0Qp1W7+/N+9x+cuF+JTvF/Kqsdsyc3PTC10D93SciJpl4Q21+TJn4f/j7zXx5nADdc
         j6VzXZg3/VGV0JbqsMo7BBLMz/BpgTehvcxOnLvMPS/xC+MZ8dFw/CJx+8CxzmF8qix8
         HCn36i6OhgEX6uDfRHO0kNFj89XlWXMu3tT9rwNDx34H859TRP9g7aLsIXlu+ch4pta9
         mw3ESH0xhKSXUZqkpy0VdLeA0j3AjtP7v0+QFl2eeEj+Xm9OkEObS2zE7eM2dLQ75Z7s
         Np4I/cK4sEy6BqQDdZYn4GTYsM0+hMwreWtbjW4llBEbBO+7rEvPIVHNPv/dI7FI3Gug
         dDbw==
X-Gm-Message-State: ACgBeo3jCIxaG00HCWuYEZ168Pwxx/55xhZmzueMB6R/oQvtYnR4AdqM
	Bh5Ug4CbMpXSd9WsBy7xTVC5oA==
X-Google-Smtp-Source: AA6agR4+Twzcd6vBm/mPzYR2jsCd4XsMTcWdwqeWbofop1Tcdw0vvcLYU8XtK5OByIufbNKXiaYoOg==
X-Received: by 2002:adf:e19b:0:b0:225:448c:9ba8 with SMTP id az27-20020adfe19b000000b00225448c9ba8mr26945008wrb.532.1662457789169;
        Tue, 06 Sep 2022 02:49:49 -0700 (PDT)
Received: from blmsp (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id co18-20020a0560000a1200b0021f15514e7fsm14587231wrb.0.2022.09.06.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 02:49:48 -0700 (PDT)
Date: Tue, 6 Sep 2022 11:49:47 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alexandre Bailon <abailon@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v3 2/4] soc: mediatek: Add support of WAY_EN operations
Message-ID: <20220906094947.ghfy2tj4bj4kaule@blmsp>
References: <20220822144303.3438467-1-msp@baylibre.com>
 <20220822144303.3438467-3-msp@baylibre.com>
 <36dde9aa-b6ea-7194-c1bc-94d52c02649b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <36dde9aa-b6ea-7194-c1bc-94d52c02649b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_024951_882107_B53D68D3 
X-CRM114-Status: GOOD (  41.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On Mon, Aug 22, 2022 at 06:17:58PM +0200, Matthias Brugger wrote:
> 
> 
> On 22/08/2022 16:43, Markus Schneider-Pargmann wrote:
> > From: Alexandre Bailon <abailon@baylibre.com>
> > 
> > This updates the power domain to support WAY_EN operations. These
> > operations enable a path between different units of the chip and are
> > labeled as 'way_en' in the register descriptions.
> > 
> > This operation is required by the mt8365 for the MM power domain.
> > 
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >      Changes in v3:
> >      - Separated the way_en functions for clarity
> >      - Added some checks for infracfg_nao
> >      Changes in v2:
> >      - some minor style fixes.
> >      - Renamed 'wayen' to 'way_en' to clarify the meaning
> >      - Updated commit message
> > 
> >   drivers/soc/mediatek/mtk-pm-domains.c | 162 +++++++++++++++++++++-----
> >   drivers/soc/mediatek/mtk-pm-domains.h |  28 +++--
> >   2 files changed, 149 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> > index 9734f1091c69..c2cbe0de6aa1 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.c
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > @@ -43,6 +43,7 @@ struct scpsys_domain {
> >   	struct clk_bulk_data *clks;
> >   	int num_subsys_clks;
> >   	struct clk_bulk_data *subsys_clks;
> > +	struct regmap *infracfg_nao;
> >   	struct regmap *infracfg;
> >   	struct regmap *smi;
> >   	struct regulator *supply;
> > @@ -117,26 +118,61 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
> >   					MTK_POLL_TIMEOUT);
> >   }
> > -static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
> > +static int __scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd,
> > +				       struct regmap *regmap)
> > +{
> > +	u32 val;
> > +	u32 mask = bpd->bus_prot_mask;
> > +	u32 sta_mask = bpd->bus_prot_sta_mask;
> > +
> > +	if (bpd->bus_prot_reg_update)
> > +		regmap_set_bits(regmap, bpd->bus_prot_set, mask);
> > +	else
> > +		regmap_write(regmap, bpd->bus_prot_set, mask);
> > +
> > +	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta, val,
> > +					(val & sta_mask) == sta_mask,
> > +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > +}
> > +
> > +static int scpsys_bus_way_disable(const struct scpsys_bus_prot_data *bpd,
> > +				  struct regmap *regmap,
> > +				  struct regmap *ack_regmap)
> > +{
> > +	u32 val;
> > +	u32 mask = bpd->bus_prot_mask;
> > +	u32 sta_mask = bpd->bus_prot_sta_mask;
> > +
> > +	if (bpd->bus_prot_reg_update)
> > +		regmap_clear_bits(regmap, bpd->bus_prot_set, mask);
> > +	else
> > +		regmap_write(regmap, bpd->bus_prot_set, mask);
> > +
> > +	if (bpd->ignore_clr_ack)
> > +		return 0;
> > +
> > +	return regmap_read_poll_timeout(ack_regmap, bpd->bus_prot_sta, val,
> > +					(val & sta_mask) == sta_mask,
> > +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > +}
> > +
> > +static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd,
> > +				      struct regmap *regmap, struct regmap *infracfg_nao)
> >   {
> >   	int i, ret;
> >   	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> > -		u32 val, mask = bpd[i].bus_prot_mask;
> > -
> > -		if (!mask)
> > +		if (!bpd[i].bus_prot_mask)
> >   			break;
> > -		if (bpd[i].bus_prot_reg_update)
> > -			regmap_set_bits(regmap, bpd[i].bus_prot_set, mask);
> > +		if (bpd[i].way_en)
> > +			ret = scpsys_bus_way_disable(&bpd[i], regmap, infracfg_nao);
> >   		else
> > -			regmap_write(regmap, bpd[i].bus_prot_set, mask);
> > -
> > -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> > -					       val, (val & mask) == mask,
> > -					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > -		if (ret)
> > +			ret = __scpsys_bus_protect_enable(&bpd[i], regmap);
> > +		if (ret) {
> > +			pr_err("%s %d %d\n", __PRETTY_FUNCTION__, __LINE__, ret);
> >   			return ret;
> > +		}
> >   	}
> >   	return 0;
> > @@ -146,37 +182,71 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
> >   {
> >   	int ret;
> > -	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg, pd->infracfg);
> > +	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg,
> > +					 pd->infracfg, pd->infracfg_nao);
> >   	if (ret)
> >   		return ret;
> > -	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi);
> > +	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi, NULL);
> > +}
> > +
> > +static int __scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
> > +					struct regmap *regmap)
> > +{
> > +	u32 val;
> > +	u32 mask = bpd->bus_prot_mask;
> > +	u32 sta_mask = bpd->bus_prot_sta_mask;
> > +
> > +	if (bpd->bus_prot_reg_update)
> > +		regmap_clear_bits(regmap, bpd->bus_prot_clr, mask);
> > +	else
> > +		regmap_write(regmap, bpd->bus_prot_clr, mask);
> > +
> > +	if (bpd->ignore_clr_ack)
> > +		return 0;
> > +
> > +	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta, val,
> > +					!(val & sta_mask), MTK_POLL_DELAY_US,
> > +					MTK_POLL_TIMEOUT);
> > +}
> > +
> > +static int scpsys_bus_way_enable(const struct scpsys_bus_prot_data *bpd,
> > +				 struct regmap *regmap,
> > +				 struct regmap *ack_regmap)
> > +{
> > +	u32 val;
> > +	u32 mask = bpd->bus_prot_mask;
> > +	u32 sta_mask = bpd->bus_prot_sta_mask;
> > +
> > +	if (bpd->bus_prot_reg_update)
> > +		regmap_set_bits(regmap, bpd->bus_prot_clr, mask);
> > +	else
> > +		regmap_write(regmap, bpd->bus_prot_clr, mask);
> > +
> > +	return regmap_read_poll_timeout(ack_regmap, bpd->bus_prot_sta, val,
> > +					(val & sta_mask) == sta_mask,
> > +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> >   }
> >   static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
> > -				       struct regmap *regmap)
> > +				       struct regmap *regmap,
> > +				       struct regmap *infracfg_nao)
> >   {
> >   	int i, ret;
> >   	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
> > -		u32 val, mask = bpd[i].bus_prot_mask;
> > -
> > -		if (!mask)
> > +		if (!bpd[i].bus_prot_mask)
> >   			continue;
> > -		if (bpd[i].bus_prot_reg_update)
> > -			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, mask);
> > +		if (bpd[i].way_en)
> > +			ret = scpsys_bus_way_enable(&bpd[i], regmap,
> > +						    infracfg_nao);
> >   		else
> > -			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
> > -
> > -		if (bpd[i].ignore_clr_ack)
> > -			continue;
> > -
> > -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> > -					       val, !(val & mask),
> > -					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > -		if (ret)
> > +			ret = __scpsys_bus_protect_disable(&bpd[i], regmap);
> > +		if (ret) {
> > +			pr_err("%s %d %d\n", __PRETTY_FUNCTION__, __LINE__, ret);
> >   			return ret;
> > +		}
> >   	}
> >   	return 0;
> > @@ -186,11 +256,12 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
> >   {
> >   	int ret;
> > -	ret = _scpsys_bus_protect_disable(pd->data->bp_smi, pd->smi);
> > +	ret = _scpsys_bus_protect_disable(pd->data->bp_smi, pd->smi, NULL);
> >   	if (ret)
> >   		return ret;
> > -	return _scpsys_bus_protect_disable(pd->data->bp_infracfg, pd->infracfg);
> > +	return _scpsys_bus_protect_disable(pd->data->bp_infracfg,
> > +			pd->infracfg, pd->infracfg_nao);
> >   }
> >   static int scpsys_regulator_enable(struct regulator *supply)
> > @@ -294,6 +365,21 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
> >   	return 0;
> >   }
> > +static bool scpsys_bp_infracfg_has_way_en(const struct scpsys_bus_prot_data *bpd)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> > +		if (!bpd[i].bus_prot_mask)
> > +			break;
> 
> So MT8365_POWER_DOMAIN_MM will return false as the first member of
> bp_infracfg is BUS_PROT_WR(...)

I am not sure I understand what you mean. Why should it break out of the
loop if the first member is a BUS_PROT_WR()? BUS_PROT_WR() sets a mask
as well which is checked here exactly the same way as is done in
_scpsys_bus_protect_enable() even before this patch.

This is only a loop condition. Actually I can move it into the loop
header as well. Either you define SPM_MAX_BUS_PROT_DATA fields or you
have to exit if you find a field that is empty, basically the mask not
being set.

> 
> Apart from that, why don't you use a CAPS to acheive the same?
> 
> > +
> > +		if (bpd[i].way_en)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >   static struct
> >   generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
> >   {
> > @@ -364,6 +450,20 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
> >   			return ERR_CAST(pd->smi);
> >   	}
> > +	if (scpsys_bp_infracfg_has_way_en(pd->data->bp_smi)) {
> > +		dev_err(scpsys->dev, "bp_smi does not support WAY_EN\n");
> 
> Do we really need to check the correctness of the driver data at runtime?

bp_smi is called without a infracfg_nao regmap. If we don't check it
here, we need to make a check during bus protection operations. Last
time I got a review to not do it during in the bus protection path.

> 
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	pd->infracfg_nao = syscon_regmap_lookup_by_phandle_optional(
> > +		node, "mediatek,infracfg_nao");
> 
> Not in the binding description.

Thanks, I will fix that for the next version.

> 
> > +	if (IS_ERR(pd->infracfg_nao)) {
> > +		if (scpsys_bp_infracfg_has_way_en(pd->data->bp_infracfg))
> > +			return ERR_CAST(pd->infracfg_nao);
> > +
> > +		pd->infracfg_nao = NULL;
> > +	}
> > +
> >   	num_clks = of_clk_get_parent_count(node);
> >   	if (num_clks > 0) {
> >   		/* Calculate number of subsys_clks */
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> > index 7d3c0c36316c..974c68a1d89c 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.h
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> > @@ -41,23 +41,29 @@
> >   #define SPM_MAX_BUS_PROT_DATA		6
> > -#define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
> > -		.bus_prot_mask = (_mask),			\
> > -		.bus_prot_set = _set,				\
> > -		.bus_prot_clr = _clr,				\
> > -		.bus_prot_sta = _sta,				\
> > -		.bus_prot_reg_update = _update,			\
> > -		.ignore_clr_ack = _ignore,			\
> > +#define _BUS_PROT(_mask, _sta_mask, _set, _clr, _sta, _update, _ignore, _way_en) {	\
> > +		.bus_prot_mask = (_mask),				\
> > +		.bus_prot_set = _set,					\
> > +		.bus_prot_clr = _clr,					\
> > +		.bus_prot_sta = _sta,					\
> > +		.bus_prot_sta_mask = _sta_mask,				\
> > +		.bus_prot_reg_update = _update,				\
> > +		.ignore_clr_ack = _ignore,				\
> > +		.way_en = _way_en,					\
> >   	}
> >   #define BUS_PROT_WR(_mask, _set, _clr, _sta)			\
> > -		_BUS_PROT(_mask, _set, _clr, _sta, false, false)
> > +		_BUS_PROT(_mask, _mask, _set, _clr, _sta, false, false, false)
> >   #define BUS_PROT_WR_IGN(_mask, _set, _clr, _sta)		\
> > -		_BUS_PROT(_mask, _set, _clr, _sta, false, true)
> > +		_BUS_PROT(_mask, _mask, _set, _clr, _sta, false, true, false)
> >   #define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)		\
> > -		_BUS_PROT(_mask, _set, _clr, _sta, true, false)
> > +		_BUS_PROT(_mask, _mask, _set, _clr, _sta, true, false, false)
> > +
> > +#define BUS_PROT_WAY_EN(_en_mask, _sta_mask, _set, _sta)	\
> > +		_BUS_PROT(_en_mask, _sta_mask, _set, _set, _sta, true, false, \
> > +			  true)
> >   #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
> >   		BUS_PROT_UPDATE(_mask,				\
> > @@ -70,8 +76,10 @@ struct scpsys_bus_prot_data {
> >   	u32 bus_prot_set;
> >   	u32 bus_prot_clr;
> >   	u32 bus_prot_sta;
> > +	u32 bus_prot_sta_mask;
> 
> I'm not very happy with the naming. In the end we need an extra mask for bus
> protection using WAY_EN. But right now I can't come up with a good name.

I think the naming is good as it is a specific mask for the status
register. bus_prot_mask is now basically only responsible for set and
clr. Maybe renaming bus_prot_mask to bus_prot_set_clr_mask is better?

Thanks,
Markus

> 
> Regards,
> Matthias
> 
> >   	bool bus_prot_reg_update;
> >   	bool ignore_clr_ack;
> > +	bool way_en;
> >   };
> >   /**

