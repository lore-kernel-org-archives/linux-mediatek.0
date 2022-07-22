Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B19EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSAECi8sgajhN4HPSrW/tW526BrlCSjcOiM42VddLYA=; b=dh+75bqfIFlMivVLruyGA/RKw3
	ard9m7niqU4Z83aLMEIQICb5Lkyjz8WNnjwzpaWnHikVsjR9eiC6Wpv02u/qwHm31SdGQmskERniR
	JR63SVNhJ5OYUhSfOJbIoQnrhEBSVXsQOT06i/SGtb06KVfcnNYd/QKjUMQRVZbmdrLge6fnEhlAU
	ncFqFMUxSph3kFFwQ502bmthSpnquyD8gOmnejrGs2MLVT/uvfoIftOi70Sy2z0hr3U06DNS2TtoT
	fz9u/3iO6qP5TwjrdOfSBTy9WHSQIaEXI+w5Aenky92BoeXIrh8hZJkVCeRQbkC8Rg3lW5AvQ46TB
	IFzpTHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEojG-001SVa-0F; Fri, 22 Jul 2022 09:13:50 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEoiq-001Rxx-Je
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 09:13:27 +0000
Received: by mail-ed1-x536.google.com with SMTP id g1so5060205edb.12
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Jul 2022 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JSAECi8sgajhN4HPSrW/tW526BrlCSjcOiM42VddLYA=;
        b=QC/4tQNMWDsqBRLAmCHARVYXQFTe7n0gdL6ig+xVAHPRJJ5pZcXuQSdEUB/iIi3Fh8
         wZR+Qlu1LZqFZJ0sPrV7xY8GTuvWwl+JcDb5NbIWTBElatsQW+jzUehlUGQ2BkGZFLmP
         6ECsPxKpFJUrYODW/r6WbpNW+IoRNT3EheCykftKk6Eb21NaOxSo7E4J9XXxq26N5RpK
         dflg8EIRghDqvuOEPtU3EBZuM1EIDTSpH7LmLzDQYQqNkXOsurW5S6G4LBkzYNBsqIfS
         mj0UxAbdPRgQNMQcxx50EfGi84OcwWlW6XH4TvPR7YshM1iGnVeHcT0fbuCcr/Ln2Ctv
         a0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JSAECi8sgajhN4HPSrW/tW526BrlCSjcOiM42VddLYA=;
        b=UtnuomMM+LvmepUWV+NOAG+xbGrdTjKXRpsjkWc4srNk3YFJxQfH4XzKdennjyteET
         FAc6I+1kPs+0SeSvuhRGr8vE37BzX4OjjvV9aWTqWxGyOsUB+PriVgJ7cG24O7VAJu9Y
         BGJiAPflJNTUSVaXJLrms1Qj09wOxNDv9Kk0pn6ClXgJzjQFpBkm2GYbt4bUqcW5DrJG
         z+FZMPfa7S+44usrxozGxSyua9mf3ZcvXOvXKXnDpMNcAdTyUxBwVkZyCMLgMvL8ns2A
         rCNXqxNZdAa5u4SgRKRtJxBUTlsOlIWoHEJiZzHBuB8QuV+anJGqizFE/ORlrjrxoQaI
         rG0A==
X-Gm-Message-State: AJIora9m6kbbAZGIsRCnsbDzEhMXDV1ABa28jWz538NvTS20LzO8DM25
	dKTQcHvy3jwGZO2JGhSHqvI4nQ==
X-Google-Smtp-Source: AGRyM1s61pYE1oFmicK9kBMG/TYCWQHDXwh6f4kdIxuT5FdGXlphF0OGM4Opshh0goHUmL8SR3yJSA==
X-Received: by 2002:a05:6402:331e:b0:43b:cd65:a3ed with SMTP id e30-20020a056402331e00b0043bcd65a3edmr2491102eda.118.1658481199973;
        Fri, 22 Jul 2022 02:13:19 -0700 (PDT)
Received: from blmsp ([2001:4090:a243:806e:25e7:daa:8208:ceb])
        by smtp.gmail.com with ESMTPSA id p9-20020a056402074900b00431962fe5d4sm2217523edy.77.2022.07.22.02.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 02:13:19 -0700 (PDT)
Date: Fri, 22 Jul 2022 11:13:17 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	Alexandre Bailon <abailon@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: mediatek: Add support of WAYEN operations
Message-ID: <20220722091317.c2phi3c24kpendbg@blmsp>
References: <20220530204214.913251-1-fparent@baylibre.com>
 <20220530204214.913251-2-fparent@baylibre.com>
 <fc9f18aa-fc32-c1ec-9056-e6158d0bd1ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc9f18aa-fc32-c1ec-9056-e6158d0bd1ce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_021324_680722_5F06C69C 
X-CRM114-Status: GOOD (  24.43  )
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

On Fri, Jun 17, 2022 at 04:20:55PM +0200, Matthias Brugger wrote:
> 
> 
> On 30/05/2022 22:42, Fabien Parent wrote:
> > From: Alexandre Bailon <abailon@baylibre.com>
> > 
> > This updates the power domain to support WAYEN operations.
> 
> Please explain better what the WAYEN operation is. Never heard of that word.

Thanks, I will clarify this in v2. I had to look it up myself. It is
basically called 'way_en' in the documents and controls the output
paths of the different units. You can select which 'ways' are enabled
with these bits. This is a bit that is present in many registers and it
is necessary for mt8365 to control it for the power domains.

Best,
Markus

> 
> Regards,
> Matthias
> 
> > This is required by the mt8365 for the MM power domain.
> > 
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >   drivers/soc/mediatek/mtk-pm-domains.c | 64 +++++++++++++++++++++------
> >   drivers/soc/mediatek/mtk-pm-domains.h | 27 ++++++-----
> >   2 files changed, 67 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> > index 5ced254b082b..90b91b3b19a8 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.c
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > @@ -44,6 +44,7 @@ struct scpsys_domain {
> >   	struct clk_bulk_data *subsys_clks;
> >   	struct regmap *infracfg;
> >   	struct regmap *smi;
> > +	struct regmap *infracfg_nao;
> >   	struct regulator *supply;
> >   };
> > @@ -116,23 +117,38 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
> >   					MTK_POLL_TIMEOUT);
> >   }
> > -static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
> > +static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd,
> > +				      struct regmap *regmap, struct regmap *infracfg_nao)
> >   {
> >   	int i, ret;
> >   	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> > -		u32 val, mask = bpd[i].bus_prot_mask;
> > +		u32 mask = bpd[i].bus_prot_mask;
> > +		u32 val = mask, sta_mask = mask;
> > +		struct regmap *ack_regmap = regmap;
> >   		if (!mask)
> >   			break;
> > +		if (bpd[i].wayen) {
> > +			if (!infracfg_nao)
> > +				return -ENODEV;
> > +
> > +			val = 0;
> > +			sta_mask = bpd[i].bus_prot_sta_mask;
> > +			ack_regmap = infracfg_nao;
> > +		}
> > +
> >   		if (bpd[i].bus_prot_reg_update)
> > -			regmap_set_bits(regmap, bpd[i].bus_prot_set, mask);
> > +			regmap_update_bits(regmap, bpd[i].bus_prot_set, mask, val);
> >   		else
> >   			regmap_write(regmap, bpd[i].bus_prot_set, mask);
> > -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> > -					       val, (val & mask) == mask,
> > +		if (bpd[i].ignore_clr_ack)
> > +			continue;
> > +
> > +		ret = regmap_read_poll_timeout(ack_regmap, bpd[i].bus_prot_sta,
> > +					       val, (val & sta_mask) == sta_mask,
> >   					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> >   		if (ret)
> >   			return ret;
> > @@ -145,34 +161,49 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
> >   {
> >   	int ret;
> > -	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg, pd->infracfg);
> > +	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg,
> > +			pd->infracfg, pd->infracfg_nao);
> >   	if (ret)
> >   		return ret;
> > -	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi);
> > +	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi, NULL);
> >   }
> > +#define mask_cond(wayen, val, mask) \
> > +	((wayen && ((val & mask) == mask)) || (!wayen && !(val & mask)))
> > +
> >   static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
> > -				       struct regmap *regmap)
> > +				       struct regmap *regmap, struct regmap *infracfg_nao)
> >   {
> >   	int i, ret;
> >   	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
> > -		u32 val, mask = bpd[i].bus_prot_mask;
> > +		u32 val = 0, mask = bpd[i].bus_prot_mask;
> > +		u32 sta_mask = mask;
> > +		struct regmap *ack_regmap = regmap;
> >   		if (!mask)
> >   			continue;
> > +		if (bpd[i].wayen) {
> > +			if (!infracfg_nao)
> > +				return -ENODEV;
> > +
> > +			val = mask;
> > +			sta_mask = bpd[i].bus_prot_sta_mask;
> > +			ack_regmap = infracfg_nao;
> > +		}
> > +
> >   		if (bpd[i].bus_prot_reg_update)
> > -			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, mask);
> > +			regmap_update_bits(regmap, bpd[i].bus_prot_clr, mask, val);
> >   		else
> >   			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
> >   		if (bpd[i].ignore_clr_ack)
> >   			continue;
> > -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> > -					       val, !(val & mask),
> > +		ret = regmap_read_poll_timeout(ack_regmap, bpd[i].bus_prot_sta,
> > +					       val, mask_cond(bpd[i].wayen, val, sta_mask),
> >   					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> >   		if (ret)
> >   			return ret;
> > @@ -185,11 +216,12 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
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
> > @@ -363,6 +395,10 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
> >   			return ERR_CAST(pd->smi);
> >   	}
> > +	pd->infracfg_nao = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg_nao");
> > +	if (IS_ERR(pd->infracfg_nao))
> > +		return ERR_CAST(pd->infracfg_nao);
> > +
> >   	num_clks = of_clk_get_parent_count(node);
> >   	if (num_clks > 0) {
> >   		/* Calculate number of subsys_clks */
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> > index daa24e890dd4..a3955d960233 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.h
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> > @@ -39,23 +39,28 @@
> >   #define SPM_MAX_BUS_PROT_DATA		6
> > -#define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
> > -		.bus_prot_mask = (_mask),			\
> > -		.bus_prot_set = _set,				\
> > -		.bus_prot_clr = _clr,				\
> > -		.bus_prot_sta = _sta,				\
> > -		.bus_prot_reg_update = _update,			\
> > -		.ignore_clr_ack = _ignore,			\
> > +#define _BUS_PROT(_mask, _sta_mask, _set, _clr, _sta, _update, _ignore, _wayen) {	\
> > +		.bus_prot_mask = (_mask),				\
> > +		.bus_prot_set = _set,					\
> > +		.bus_prot_clr = _clr,					\
> > +		.bus_prot_sta = _sta,					\
> > +		.bus_prot_sta_mask = _sta_mask,				\
> > +		.bus_prot_reg_update = _update,				\
> > +		.ignore_clr_ack = _ignore,				\
> > +		.wayen = _wayen,					\
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
> > +#define BUS_PROT_WAYEN(_en_mask, _sta_mask, _set, _sta)		\
> > +		_BUS_PROT(_en_mask, _sta_mask, _set, _set, _sta, true, false, true)
> >   #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
> >   		BUS_PROT_UPDATE(_mask,				\
> > @@ -68,8 +73,10 @@ struct scpsys_bus_prot_data {
> >   	u32 bus_prot_set;
> >   	u32 bus_prot_clr;
> >   	u32 bus_prot_sta;
> > +	u32 bus_prot_sta_mask;
> >   	bool bus_prot_reg_update;
> >   	bool ignore_clr_ack;
> > +	bool wayen;
> >   };
> >   /**
> 

