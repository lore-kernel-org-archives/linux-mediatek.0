Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191CAC48BC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAC16XHzjVY3XukbmOyTYofThyOnRxBkJl2MJq0kU/g=; b=P9i7Rb+XDJ41StdLikacDJQ9ej
	ZkRWW9ezPn0PMJaNKlbhqkqcRryh8852PC/X3P+sAozu7DUNuzmyvr1+cpECNfr88EvMwe0YyhH/c
	NJJALPlv7bYVHAA5H3QJXSUUgLEPkSeOYScLWhOWZgIKsFbBLcnfoN1B8b1SZaNJOxUCOCAOqUrva
	F99hM0PqQRExNyf7BEP0ehmxLnaKLzO6QWUexxPdYPsit31sOgGykZv/DzbzcbBp0vNsM3cVGmSae
	j15g2bJ4ldZArCbbkhaDxGvlT3hM2twHuZ/SUmHsvy1aRLNEUiGY3cMfUYDWZwgWMJTcL0o+0eKUB
	sfRWCo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racwU-0000000GaF3-42x4;
	Thu, 15 Feb 2024 14:42:26 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racwH-0000000Ga9q-2g4Y
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Feb 2024 14:42:15 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so908364276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Feb 2024 06:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708008132; x=1708612932; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dAC16XHzjVY3XukbmOyTYofThyOnRxBkJl2MJq0kU/g=;
        b=eO/cgVFYDIg3yM0DKRTvQCfJk7jbxhioFEzCcexa7byBWBrDZUAf9vreqoxfjLQqS1
         O1v9bdxjfmYIR906/Q1QF4sRuYmRtajO4dR3SzWhSjqYFUO7ELr3O+qZNObQv0XRV3EY
         UHeMvNcvY8AmB+YDLrxTzwY2Un2g3Aj7HpqWsizS50ruckkcj14nbkOta886pBu7epr8
         isL461F5UMgrCHmLstiuTkVuXMuRHQmMD3BdhuBp0+I2PhbP30foQdjElLvvd0oE0lwt
         70FU3qX9aMDn2M0EqvzIOxw6eTJ6Xf/buEspgrJfubkkpMEGK+hpgsiF6p/GsbOv77nn
         ZEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708008132; x=1708612932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAC16XHzjVY3XukbmOyTYofThyOnRxBkJl2MJq0kU/g=;
        b=kRWHnW1Rgnpwe1zmc/REQXnNEbSGsSZmjeMzqwabw5S/mSQIPjTzS7tm8PNa3bZ8KQ
         nYMAysomCQLpoUG2KlLknceOnceqdWkcc23Aq/JAJ9JhsFXhqMA2JtLTugdoDMuoW3Yo
         vX/hvaTxXUtGmKmyOZJ9mQhzP3vWtpT/Cjef3VGs/uZMiYUjRPqYgTuXxV16AFbcbjds
         Y7sOYMkkwrrMp0GoDGf8HyNZ8LBm3nhU9D6h681B1XjTmv00j+3GF6GefKdVjv0RTOEI
         8Kw9XxH0xVOCVjcbTPZmULfdvk81fVhpiwThIW6I4dcg+GTuVTcUGgykOAMUgQQCdf3f
         XCDw==
X-Forwarded-Encrypted: i=1; AJvYcCVfwwPI1u4lSomw14IjmLbRCbOpPvGeCinOqpEBGaTaBmed0hQTUr4xHDIGYhAO+aI8HQdni8kzWIWmlSdkNwPNNaMjYuhEeA6KnxPqoTrQ4w95
X-Gm-Message-State: AOJu0YxTb6fH8FOx1e/ifU0sJBVd9VDtTPtgXP54d64pgvuYZmCSIDFb
	q2q7NqBA7TiHNm95tcSbDlrB6BMyTW5Zk7xO7EEhjKjh6qCHpu/Q1N7O93VNOI+mMr8jkNMa/lX
	OWBflkOovfYCZJxOrJL7LOOxT3m3zNmyMYZd9kg==
X-Google-Smtp-Source: AGHT+IFRJcoqJupsoaQ1qFV0tFqhF7c08tDk4aD3Ff1yyUny9nMO7+GZqCkuvRwWEVUHQhtBkS1fIY9p/4h0S7hvHQg=
X-Received: by 2002:a25:b282:0:b0:dc7:46ef:8b9e with SMTP id
 k2-20020a25b282000000b00dc746ef8b9emr1827807ybj.29.1708008131861; Thu, 15 Feb
 2024 06:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org> <Zc0yXR/fC2OcObLB@linaro.org>
 <CAA8EJpq=kYeZfNbFtfQ_oLS0Xi4imyEGV+dDNO+h6LZfqmpxZg@mail.gmail.com> <Zc4SWIViTS0uf952@linaro.org>
In-Reply-To: <Zc4SWIViTS0uf952@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 16:42:00 +0200
Message-ID: <CAA8EJpqOd1Sz_538ZwhPh+AesVRBRmzMiQ0ntsvm4i5erKM-jA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring
 a version operation
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_064213_702497_C9F43CB7 
X-CRM114-Status: GOOD (  36.24  )
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

On Thu, 15 Feb 2024 at 15:32, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-15 11:30:23, Dmitry Baryshkov wrote:
> > On Wed, 14 Feb 2024 at 23:36, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > On 24-02-14 22:18:33, Konrad Dybcio wrote:
> > > > On 14.02.2024 22:13, Abel Vesa wrote:
> > > > > Rather than setting up the core, obsrv and chnls in probe by using
> > > > > version specific conditionals, add a dedicated "get_core_resources"
> > > > > version specific op and move the acquiring in there.
> > > > >
> > > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > ---
> > > > >  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> > > > >  1 file changed, 78 insertions(+), 33 deletions(-)
> > > > >
> > > > > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > > > > index 23939c0d225f..489556467a4c 100644
> > > > > --- a/drivers/spmi/spmi-pmic-arb.c
> > > > > +++ b/drivers/spmi/spmi-pmic-arb.c
> > > > > @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> > > > >   */
> > > > >  struct pmic_arb_ver_ops {
> > > > >     const char *ver_str;
> > > > > +   int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> > > > >     int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> > > > >     int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> > > > >     /* spmi commands (read_cmd, write_cmd, cmd) functionality */
> > > > > @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> > > > >     return 0;
> > > > >  }
> > > > >
> > > > > +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> > > > > +                                     void __iomem *core)
> > > > > +{
> > > > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > > > +
> > > > > +   pmic_arb->wr_base = core;
> > > > > +   pmic_arb->rd_base = core;
> > > > > +
> > > > > +   pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > >  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> > > > >  {
> > > > >     u32 *mapping_table;
> > > > > @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> > > > >     return apid;
> > > > >  }
> > > > >
> > > > > +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> > > > > +{
> > > > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > > > +   struct device *dev = &pdev->dev;
> > > > > +   struct resource *res;
> > > > > +
> > > > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > >
> > > > It's no longer indented to deep, no need to keep such aggressive wrapping
> > > >
> > >
> > > The pmic_arb_get_obsrvr_chnls_v2 is used by both:
> > > pmic_arb_get_core_resources_v2
> > > pmic_arb_get_core_resources_v7
> > >
> > > > > +                                      "obsrvr");
> > > > > +   pmic_arb->rd_base = devm_ioremap(dev, res->start,
> > > > > +                                    resource_size(res));
> > > > > +   if (IS_ERR(pmic_arb->rd_base))
> > > > > +           return PTR_ERR(pmic_arb->rd_base);
> > > > > +
> > > > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > > +                                      "chnls");
> > > > > +   pmic_arb->wr_base = devm_ioremap(dev, res->start,
> > > > > +                                    resource_size(res));
> > > > > +   if (IS_ERR(pmic_arb->wr_base))
> > > > > +           return PTR_ERR(pmic_arb->wr_base);
> > > >
> > > > Could probably make it "devm_platform_get_and_ioremap_resource "
> > >
> > > The reason this needs to stay as is is because of reason explained by
> > > the following comment found in probe:
> > >
> > > /*
> > >  * Please don't replace this with devm_platform_ioremap_resource() or
> > >  * devm_ioremap_resource().  These both result in a call to
> > >  * devm_request_mem_region() which prevents multiple mappings of this
> > >  * register address range.  SoCs with PMIC arbiter v7 may define two
> > >  * arbiter devices, for the two physical SPMI interfaces, which  share
> > >  * some register address ranges (i.e. "core", "obsrvr", and "chnls").
> > >  * Ensure that both devices probe successfully by calling devm_ioremap()
> > >  * which does not result in a devm_request_mem_region() call.
> > >  */
> > >
> > > Even though, AFAICT, there is no platform that adds a second node for
> > > the second bus, currently, in mainline, we should probably allow the
> > > "legacy" approach to still work.
> >
> > If there were no DT files which used two SPMI devices, I think we
> > should drop this comment and use existing helpers. We must keep
> > compatibility with the existing DTs, not with the _possible_ device
> > trees.
>
> Sure.
>
> Should I drop the qcom,bus-id from the driver as well? It is optional
> after all.

I think so. Let's drop it completely. And for the new sub-devices you
perfectly know the bus ID.

-- 
With best wishes
Dmitry

