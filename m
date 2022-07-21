Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2124EC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y52+vmlkRnvgFyCTIdVjgi2XLyCNtChwCyrrSaF4xEs=; b=FTEirOW29N4JX0GL1i638CsEYe
	8Yi55sjkdV6Zy9bK2H+/lZiKnCThWJ4QuXU1mc5BDNdWQao4d07Rw0rA+su8LHvuj2x+TZfWh7PQJ
	nOM6828C9LL1UTF3YLJm2kHLMLBr+bXgOY5u1SlGNZ3F/n3gHB1lP0ZwwM5uCCE0WHgaG7iiLKmgD
	NsqQn2E4Gs96wlOFrlWI+ayldDuC9RoreK9DgKgpGWFeib/qUJq7Pc7CGB2HQPdXBAKR5gYldiTpF
	k4k9JSaTSmtKYEIp0D+SWqF9i2vlTj1/gKMmZN3kexlW42IEKlO2Wm9yWs9iz4/SKXjriKPkUNajM
	BzJvk4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERyX-002q7M-VJ; Thu, 21 Jul 2022 08:56:05 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERyK-002pth-Ca
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 08:55:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id t3so1350626edd.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y52+vmlkRnvgFyCTIdVjgi2XLyCNtChwCyrrSaF4xEs=;
        b=JfScOhfOqzqLqsMNguyPz0pmtqPx00EBej7n3tTNiTELdECIuqhQFfdgfxv0NZANL6
         fJHBfkEJAKFk4rovHbV7mrijRm9H5aWF9cBLWsIHOitso5dVjWiy2XozKo4+hV0MqAmt
         mNgaTsrlEcSahSI8zRaZEJpDBfjjMGPO7jIgBdUnSZex7WTQlFX9K3n7+zQmNajKEMRu
         F9FPjIDBrMF3Crz4neWe7RT80XgUh+SRBz5BD23hs5/YjGMXJLiMh7wXt+F0TY4YlsEp
         V3Yz7uwhK2GsLAG8wMmN0xZf0N11NN/fTBzc64C6eiDBhDhoV6Zqxkt1JYliOh/vlYiV
         pV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y52+vmlkRnvgFyCTIdVjgi2XLyCNtChwCyrrSaF4xEs=;
        b=jFVw4A0khXC8XHAd7ESPlFqUGNGbmkNPYCmFFYuQjrguzd9cm6PitUlZyZXwLqpRVe
         vg+D4ujHWADHboFXb8tr+6Fkkw4yIsD4me/gJZrMtNCgyXXZjO0Q3o00uwY1GI6lFTRC
         smAXpt8VNCLRZqSCmsoDG4TwdIhjSJLMRyhVtVnpnx65d/zbA2lbNvv4QRdFXXnLHLkM
         zJYzJxmUsTuom98SBmizbHhPRrAZ1DwRtYi8HZ2oHVJLGTVCtv6M6tfccqulxxJdd4QX
         Kot76nC/R/mPvSRMAPkVVrf/jCSL5wINtKygHTDqHoIjP47rHH0fe4osJPGs3cIvAxDe
         Nu3g==
X-Gm-Message-State: AJIora+LLGk3VuOgLh+G6Id4B0fIslzBu49lrjBpDrYELYGaub+HM3Rg
	V+E06+fzD6+RR4OsboFvpB9bHA==
X-Google-Smtp-Source: AGRyM1utn9lhUWfU5jFiySqjwbTTFY/S53Ue3qZ3Nt/lL522fet/Tr/Y0KsbrgjwndvTNOGyKyH5BQ==
X-Received: by 2002:a05:6402:22c9:b0:43b:c529:7ee1 with SMTP id dm9-20020a05640222c900b0043bc5297ee1mr2760657edb.251.1658393748544;
        Thu, 21 Jul 2022 01:55:48 -0700 (PDT)
Received: from blmsp ([2001:4090:a243:806e:25e7:daa:8208:ceb])
        by smtp.gmail.com with ESMTPSA id wj22-20020a170907051600b0072af2460cd6sm611924ejb.30.2022.07.21.01.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 01:55:48 -0700 (PDT)
Date: Thu, 21 Jul 2022 10:55:47 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	Alexandre Bailon <abailon@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP
 cap
Message-ID: <20220721085547.unr5cu4kywpugxmx@blmsp>
References: <20220530204214.913251-1-fparent@baylibre.com>
 <20220530204214.913251-3-fparent@baylibre.com>
 <c385ab55-bffc-8185-5d8b-f2fed1dd54a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c385ab55-bffc-8185-5d8b-f2fed1dd54a4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_015552_653401_F1E7BFC4 
X-CRM114-Status: GOOD (  27.10  )
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

sorry, took a long time to respond.

On Fri, Jun 17, 2022 at 04:20:10PM +0200, Matthias Brugger wrote:
> 
> 
> On 30/05/2022 22:42, Fabien Parent wrote:
> > From: Alexandre Bailon <abailon@baylibre.com>
> > 
> > This adds support of MTK_SCPD_STRICT_BUSP cap.
> > This is required by the mt8365, for the MM power domain.
> > 
> 
> Please explain better waht this flag is doing.

I will update the commit message as well.

The flag basically tells the code that there is a strict bus protection
policy in place which means that bus protect release must be before bus
access. This is not on all platforms the case.

> 
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >   drivers/soc/mediatek/mtk-pm-domains.c | 37 ++++++++++++++++++++-------
> >   drivers/soc/mediatek/mtk-pm-domains.h |  1 +
> >   2 files changed, 29 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> > index 90b91b3b19a8..beaa5785fda2 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.c
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > @@ -263,17 +263,36 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
> >   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
> >   	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> > -	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> > -	if (ret)
> > -		goto err_pwr_ack;
> 
> I think it would help readability if we would enable the clocks only in the
> case that MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUSP) is false. Then we would
> only need to add the same if to the error path of err_disable_subsys_clks,
> correct?

I already rearranged the code to have a cleaner flow for v2.

Thanks,
Markus

> 
> Regards,
> Matthias
> 
> > +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUSP)) {
> > +		/*
> > +		 * In few Mediatek platforms(e.g. MT6779), the bus protect
> > +		 * policy is stricter, which leads to bus protect release must
> > +		 * be prior to bus access.
> > +		 */
> > +		ret = scpsys_sram_enable(pd);
> > +		if (ret < 0)
> > +			goto err_pwr_ack;
> > -	ret = scpsys_sram_enable(pd);
> > -	if (ret < 0)
> > -		goto err_disable_subsys_clks;
> > +		ret = scpsys_bus_protect_disable(pd);
> > +		if (ret < 0)
> > +			goto err_pwr_ack;
> > -	ret = scpsys_bus_protect_disable(pd);
> > -	if (ret < 0)
> > -		goto err_disable_sram;
> > +		ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> > +		if (ret < 0)
> > +			goto err_pwr_ack;
> > +	} else {
> > +		ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> > +		if (ret)
> > +			goto err_pwr_ack;
> > +
> > +		ret = scpsys_sram_enable(pd);
> > +		if (ret < 0)
> > +			goto err_disable_subsys_clks;
> > +
> > +		ret = scpsys_bus_protect_disable(pd);
> > +		if (ret < 0)
> > +			goto err_disable_sram;
> > +	}
> >   	return 0;
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> > index a3955d960233..5347471bc3c4 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.h
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> > @@ -8,6 +8,7 @@
> >   #define MTK_SCPD_SRAM_ISO		BIT(2)
> >   #define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
> >   #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
> > +#define MTK_SCPD_STRICT_BUSP		BIT(5)
> >   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
> >   #define SPM_VDE_PWR_CON			0x0210
> 

