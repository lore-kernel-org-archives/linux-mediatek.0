Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CFCC48BC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itPC4yjw+MZTTzalNg7Ob1FeA2iLjpKFIQ9B9VJV75g=; b=W99Y+EJzFWz5jYjVMRprd/o6dC
	OB46DVV7/00a460KXtyVo3w5iFfmHt01GjfCen6KWuAa9Q29yuDKn16cMcO49meo+o/8H1ag1cuOY
	UHw1x0FehzyQhCiFSXJqXKaoPJAytri87bnqNUbp05hEx/FkjFUMS0/TI87chCm8/sffXd7TyZxeS
	/SxXsVj0JV/5GLg6nLYri9CXZq+4v5NMgK7Nr7K/woOtXeIyy7LLTJ7Id3vw+EssF28zBvZSXoXTe
	6ZVBZt2/IzxZEy4l7ub0CrGZy07IE1pV8Zp7FOPRf1HlT+woFtjLcasqaLEJeW1dEv+KmR6xpZ7dV
	30UK792Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rabqZ-0000000GORt-18W0;
	Thu, 15 Feb 2024 13:32:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rabqW-0000000GOQl-0qBr
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Feb 2024 13:32:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso1360277a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Feb 2024 05:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708003930; x=1708608730; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=itPC4yjw+MZTTzalNg7Ob1FeA2iLjpKFIQ9B9VJV75g=;
        b=lv4iX7k1gzLHpNuzZrJvh3ODarohCmhs+sCK3is9unsa7V/Y+BxiNbkAMFnEhTGrDz
         dYBE42bEQX6T8t6DtWORK13du3N1ijcV2AEaiREuO13a86f6pHf5MZVXuPLIHQol9HIG
         34Ch9cELjQjsY+1rweGpr2WaOtmBmBxGf0ENOqcpEhNVxPhpF4i023V3gqsFsxOgfDTz
         zu482fDLtLMaAquDgWYscuqggAQH4vUocFZ+htJlgo7UBzZOt+g8vIdWfgegNS9hT0Py
         Sg7KcxrZxz+lPMI4A9IP0kfyv/eTeRGsqMK5B86Az/Xm0/5UqAINywFdBcdpGQijXyl2
         87gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708003930; x=1708608730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itPC4yjw+MZTTzalNg7Ob1FeA2iLjpKFIQ9B9VJV75g=;
        b=AP7LiEOKttaBdHAOstJFh/Y5BV+bWrGVosgc+pH/h2Oo85LvX7/KRd5+1q/i1dbKEV
         b5sAU6BIAC6RdKPIoOK4xI9S7MqoqZregQeBLGMq06e5x17j3rOy062a0kR0UIyEjLrt
         +SEKK8ywriV1/ONxomrGjmsCgi+ndtGVU1TdWAU5YjNUr/6I7Co2byX8QciVlw1j/XY3
         SlA1F1qOh4EL4UWsnupwq9LlbJ+b8/7aKrlch3191qRCIWDGvjUsPFtWabLloQk9s85/
         iiZ6pOpbv2pE/KGFPiLd1oA9BnIrjQ7cqCkbbJ1NztBGF4Si1yHPZZebz/T42IrfVEGc
         ePDw==
X-Forwarded-Encrypted: i=1; AJvYcCXD6M32w9JX6Q1nTePTNRsi7mLOVo/BglCh0huGLS4imlwKnf1p/lVnZkHoddVGBvPW6B2INSAIQu4Ey34l+xJkBS0nVWQ6DJetABYtMlMPhAPK
X-Gm-Message-State: AOJu0YwO/5qvypLJlUEB3FB6s+56huo/tQFz92lceG46ZSSvAtT/GgpY
	AJjmHA0RJ7bupR1wkS1u0UKuxPyIYHbZt06x54tOdCOZUDUEJRrxgZ4/3iWCtOc=
X-Google-Smtp-Source: AGHT+IE7pGrmIuos0u7FslcOP5vVFjySkiA6nt4+X/E67cQyceQ3AtGt6cC5RO+cNGVYo8uyVRvA8w==
X-Received: by 2002:a05:6402:287:b0:561:4238:e6d3 with SMTP id l7-20020a056402028700b005614238e6d3mr1513003edv.2.1708003930158;
        Thu, 15 Feb 2024 05:32:10 -0800 (PST)
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id p3-20020a05640243c300b00563c22abac2sm228295edc.61.2024.02.15.05.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 05:32:09 -0800 (PST)
Date: Thu, 15 Feb 2024 15:32:08 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring
 a version operation
Message-ID: <Zc4SWIViTS0uf952@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org>
 <Zc0yXR/fC2OcObLB@linaro.org>
 <CAA8EJpq=kYeZfNbFtfQ_oLS0Xi4imyEGV+dDNO+h6LZfqmpxZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq=kYeZfNbFtfQ_oLS0Xi4imyEGV+dDNO+h6LZfqmpxZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_053212_301078_A79B76AB 
X-CRM114-Status: GOOD (  35.04  )
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

On 24-02-15 11:30:23, Dmitry Baryshkov wrote:
> On Wed, 14 Feb 2024 at 23:36, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-02-14 22:18:33, Konrad Dybcio wrote:
> > > On 14.02.2024 22:13, Abel Vesa wrote:
> > > > Rather than setting up the core, obsrv and chnls in probe by using
> > > > version specific conditionals, add a dedicated "get_core_resources"
> > > > version specific op and move the acquiring in there.
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> > > >  1 file changed, 78 insertions(+), 33 deletions(-)
> > > >
> > > > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > > > index 23939c0d225f..489556467a4c 100644
> > > > --- a/drivers/spmi/spmi-pmic-arb.c
> > > > +++ b/drivers/spmi/spmi-pmic-arb.c
> > > > @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> > > >   */
> > > >  struct pmic_arb_ver_ops {
> > > >     const char *ver_str;
> > > > +   int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> > > >     int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> > > >     int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> > > >     /* spmi commands (read_cmd, write_cmd, cmd) functionality */
> > > > @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> > > >     return 0;
> > > >  }
> > > >
> > > > +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> > > > +                                     void __iomem *core)
> > > > +{
> > > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > > +
> > > > +   pmic_arb->wr_base = core;
> > > > +   pmic_arb->rd_base = core;
> > > > +
> > > > +   pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> > > > +
> > > > +   return 0;
> > > > +}
> > > > +
> > > >  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> > > >  {
> > > >     u32 *mapping_table;
> > > > @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> > > >     return apid;
> > > >  }
> > > >
> > > > +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> > > > +{
> > > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > > +   struct device *dev = &pdev->dev;
> > > > +   struct resource *res;
> > > > +
> > > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > >
> > > It's no longer indented to deep, no need to keep such aggressive wrapping
> > >
> >
> > The pmic_arb_get_obsrvr_chnls_v2 is used by both:
> > pmic_arb_get_core_resources_v2
> > pmic_arb_get_core_resources_v7
> >
> > > > +                                      "obsrvr");
> > > > +   pmic_arb->rd_base = devm_ioremap(dev, res->start,
> > > > +                                    resource_size(res));
> > > > +   if (IS_ERR(pmic_arb->rd_base))
> > > > +           return PTR_ERR(pmic_arb->rd_base);
> > > > +
> > > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > +                                      "chnls");
> > > > +   pmic_arb->wr_base = devm_ioremap(dev, res->start,
> > > > +                                    resource_size(res));
> > > > +   if (IS_ERR(pmic_arb->wr_base))
> > > > +           return PTR_ERR(pmic_arb->wr_base);
> > >
> > > Could probably make it "devm_platform_get_and_ioremap_resource "
> >
> > The reason this needs to stay as is is because of reason explained by
> > the following comment found in probe:
> >
> > /*
> >  * Please don't replace this with devm_platform_ioremap_resource() or
> >  * devm_ioremap_resource().  These both result in a call to
> >  * devm_request_mem_region() which prevents multiple mappings of this
> >  * register address range.  SoCs with PMIC arbiter v7 may define two
> >  * arbiter devices, for the two physical SPMI interfaces, which  share
> >  * some register address ranges (i.e. "core", "obsrvr", and "chnls").
> >  * Ensure that both devices probe successfully by calling devm_ioremap()
> >  * which does not result in a devm_request_mem_region() call.
> >  */
> >
> > Even though, AFAICT, there is no platform that adds a second node for
> > the second bus, currently, in mainline, we should probably allow the
> > "legacy" approach to still work.
> 
> If there were no DT files which used two SPMI devices, I think we
> should drop this comment and use existing helpers. We must keep
> compatibility with the existing DTs, not with the _possible_ device
> trees.

Sure.

Should I drop the qcom,bus-id from the driver as well? It is optional
after all.

> 
> >
> > >
> > > Konrad
> 
> 
> 
> -- 
> With best wishes
> Dmitry

