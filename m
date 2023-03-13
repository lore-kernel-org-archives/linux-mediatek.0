Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEA5C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2e76SVF27ZugGmUDflwqLOuHVazSHBJvoHoACHILcw=; b=0f5huW9ygwpaNGTATkUlaRz8DF
	PiEXMBiFCPpdSocGElvXySBt+T9ro74oMxrhwBlcAiDhqKxWRKnUx1hd59T/6y3CKNGoHHVUD2hPm
	qRkw2RffIi7u5j3P8DMjQ7uHkkltVUiyUahz9bTFm4eluinPBITQ86Yw+Yr3DZShnZdeNZ4qxieCe
	hnTixREQFzDSDREpSwLUWxvCGfD4BDdxaKopZEORnbnjjqTA8/5Ocp8GRaREuE/xAwT7XhvHzmKOJ
	rnYdT3d389iqXD0EG9f6saPcLo0/wJUTZikNQQ8zLXbWUOU36BI4FUIUVNhtGkPq1iM1RIn/fvRx4
	tIRgTPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbglr-005Ypm-BU; Mon, 13 Mar 2023 11:55:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgge-005WFe-Fk
	for linux-mediatek@lists.infradead.org; Mon, 13 Mar 2023 11:49:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so7223125wms.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Mar 2023 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678708194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2e76SVF27ZugGmUDflwqLOuHVazSHBJvoHoACHILcw=;
        b=SHO5FThiChWqlKWWisdxKbcKmWAq5E7zsKeOUnXcnwQBkwC47QFequMG0bYlwzsER8
         ZXVtPSWZxaliGD1jWU+bemIkR5WPBWIzCkE54EZNrfkDwvlpOpMyAGHEpjdnGzZteM7j
         D/4JP3omJq8WZ/WqShov0gsd+cytY3CLyYbZDTbVK1Tm1tPQjmoAjDMTebXg+X3CDBv7
         VTk+q8kFRWLHcqkMoP8bVzuYeuN8BzJ2z3bPsRpVryiAQU9c7Vr4W77NVNQH11jaSxVI
         OA0/i1wDBQUVN1Mn0skO5xps8iDNOB87TDD/VCrgxRT4XMJzoGZZlx632mT/+VIxU2qB
         hzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678708194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2e76SVF27ZugGmUDflwqLOuHVazSHBJvoHoACHILcw=;
        b=hOa0WXOMKnprPdYCkYdN9cN56gH9Nof2FtweoS/+3KpqNMzvMLw/L6ejgqL5fjJHpb
         fhY9r2KnF7gSuXvzDOCvLHuitNrx9t+p5rPPYb+1lHPm5lPWi9ZHg491R800bvitfA2a
         5MRAQRoQgo3x+x46W1ek4Fc01R8vAgx0tamDYVeuJS7N3XS/u03ObdWxlcY1ZtE+CZlC
         pb/MtgHvyffeGSjM1E8HOJN85GXKJDzkhdbNubNVpMBtC6LBInXGhTnQuaLD5XNFjJh3
         +PwU9Gl9OARgbjqhWZpLvQ1xt7v5ytnSyg7tvRAPeB3jWmkxgUMDHPec5CH7HLdAzd5G
         rFDA==
X-Gm-Message-State: AO0yUKWAPyeQVSdWB+WdHvTN5HYAqKG9DgG3q8fzmaAkH7cfVutwO6WM
	JLxjXe8j/7A/Wv8TMg5+yvOp1g==
X-Google-Smtp-Source: AK7set8meTjPh/Br20yfI40uXRcIqhSc5RR5NsQ7qx9l4QuOIWQ99K59We2ke8ThU4vOtSCCxDgBsw==
X-Received: by 2002:a05:600c:3c9e:b0:3e1:f8af:8772 with SMTP id bg30-20020a05600c3c9e00b003e1f8af8772mr10250341wmb.9.1678708194053;
        Mon, 13 Mar 2023 04:49:54 -0700 (PDT)
Received: from blmsp ([2001:4090:a247:8056:be7d:83e:a6a5:4659])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b003e209186c07sm9889227wms.19.2023.03.13.04.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:49:53 -0700 (PDT)
Date: Mon, 13 Mar 2023 12:49:52 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/8] soc: mediatek: pm-domains: Create bus protection
 operation functions
Message-ID: <20230313114952.b6o4qngyyd7eup6d@blmsp>
References: <20230105170735.1637416-1-msp@baylibre.com>
 <20230105170735.1637416-4-msp@baylibre.com>
 <fb36ce3f-dd67-32b5-7ce0-ad15dd3b540a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb36ce3f-dd67-32b5-7ce0-ad15dd3b540a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_044956_797361_2EB1C976 
X-CRM114-Status: GOOD (  23.45  )
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

On Fri, Feb 03, 2023 at 01:32:11PM +0100, Matthias Brugger wrote:
> 
> 
> On 05/01/2023 18:07, Markus Schneider-Pargmann wrote:
> > Separate the register access used for bus protection enable/disable into
> > their own functions. These will be used later for WAY_EN bits.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >   drivers/soc/mediatek/mtk-pm-domains.c | 68 +++++++++++++++------------
> >   1 file changed, 39 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> > index 4333cd297405..999e1f6c86b0 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.c
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > @@ -117,26 +117,50 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
> >   					MTK_POLL_TIMEOUT);
> >   }
> > +static int scpsys_bus_protect_clear(const struct scpsys_bus_prot_data *bpd,
> > +				    struct regmap *regmap)
> > +{
> > +	u32 val;
> > +	u32 sta_mask = bpd->bus_prot_sta_mask;
> > +
> > +	if (bpd->bus_prot_reg_update)
> > +		regmap_clear_bits(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
> > +	else
> > +		regmap_write(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
> > +
> > +	if (bpd->ignore_clr_ack)
> > +		return 0;
> > +
> > +	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
> > +					val, !(val & sta_mask),
> > +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > +}
> > +
> 
> NIT: please move this function below
> static int scpsys_bus_protect_enable(struct scpsys_domain *pd) {...}
> 
> This allows for better readability.

With the WAY_EN patch later in this series scpsys_bus_protect_enable()
is going to use scpsys_bus_protect_clear(). So I would need to add a
signature in that patch for scpsys_bus_protect_clear() or move it back
up. I would prefer to avoid adding a signature or moving so I added it
above these functions here. I could swap scpsys_bus_protect_set() and
scpscpsys_bus_protect_clear() if that helps readability.

Thank you,
Markus

> 
> > +static int scpsys_bus_protect_set(const struct scpsys_bus_prot_data *bpd,
> > +				  struct regmap *regmap)
> > +{
> > +	u32 val;
> > +	u32 sta_mask = bpd->bus_prot_sta_mask;
> > +
> > +	if (bpd->bus_prot_reg_update)
> > +		regmap_set_bits(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
> > +	else
> > +		regmap_write(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
> > +
> > +	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
> > +					val, (val & sta_mask) == sta_mask,
> > +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > +}
> > +
> >   static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
> >   {
> >   	int i, ret;
> >   	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> > -		u32 val;
> > -		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
> > -		u32 sta_mask = bpd[i].bus_prot_sta_mask;
> > -
> > -		if (!set_clr_mask)
> > +		if (!bpd[i].bus_prot_set_clr_mask)
> >   			break;
> > -		if (bpd[i].bus_prot_reg_update)
> > -			regmap_set_bits(regmap, bpd[i].bus_prot_set, set_clr_mask);
> > -		else
> > -			regmap_write(regmap, bpd[i].bus_prot_set, set_clr_mask);
> > -
> > -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> > -					       val, (val & sta_mask) == sta_mask,
> > -					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > +		ret = scpsys_bus_protect_set(&bpd[i], regmap);
> >   		if (ret)
> >   			return ret;
> >   	}
> > @@ -161,24 +185,10 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
> >   	int i, ret;
> >   	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
> > -		u32 val;
> > -		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
> > -		u32 sta_mask = bpd[i].bus_prot_sta_mask;
> > -
> > -		if (!set_clr_mask)
> > -			continue;
> > -
> > -		if (bpd[i].bus_prot_reg_update)
> > -			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, set_clr_mask);
> > -		else
> > -			regmap_write(regmap, bpd[i].bus_prot_clr, set_clr_mask);
> > -
> > -		if (bpd[i].ignore_clr_ack)
> > +		if (!bpd[i].bus_prot_set_clr_mask)
> >   			continue;
> > -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> > -					       val, !(val & sta_mask),
> > -					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > +		ret = scpsys_bus_protect_clear(&bpd[i], regmap);
> >   		if (ret)
> >   			return ret;
> >   	}

