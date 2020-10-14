Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF3DC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 03:07:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC81021775
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 03:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYRx+0DD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cvLyi1IV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC81021775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NozYbWLaGtoKQC0T3IcPc06IF/Ey/FeqV9oGmOtoEkw=; b=QYRx+0DDYKxHRdZfMWYT0lAnm
	7ltUMGUWFU+dZLHLKa6mun8diqDUfvNYf5GPl3dX3eonv/PwTjZODD8iTZj+NUmVo5xxVJZq/Fqoc
	crD7myoHAD/zq3kqKZQmzQg4l/Nk/pGnEuiCcLpzx4OM7eCSXHlRCTE3Dpxu9sMA0cRA6+XfVYb+M
	TQjrNe4MwbBWP3ojbVFxQXegWVZb5KazvQhJ96+DL51fURQ7GhMmaKcqy61NZHIysnkaMrVvZICeS
	tnEvdppS1sflN0FtiYUvuWm3FuBDmvSZoeYYaAhu/ZTc2LZULALCUiddaELii0+TYp/ma3N5Z+PQI
	BVntYV2ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSX8E-0007KG-CV; Wed, 14 Oct 2020 03:07:14 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSX8B-0007JO-0J
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 03:07:12 +0000
Received: by mail-vs1-xe43.google.com with SMTP id r1so1228182vsi.12
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 20:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/VspsiIK9WGEgWmx3VPfOzr6gUq8707awunHZRI7g+Q=;
 b=cvLyi1IV3Yd9Ab6BBpPkihXFqFVcxMH10kXKIYL/8WgURQfV6FuTUqvOyVq8LvP2ei
 NqZq13IkcKyUv3YwI7baIBlVpRlaL4yKy3oFzDF3l0ehrcc6hhotR2w4/BWR8mr4tGnu
 TZToqAlyMre5CFErC+95FpvEhQJUuG75l9qUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/VspsiIK9WGEgWmx3VPfOzr6gUq8707awunHZRI7g+Q=;
 b=At9aNBeicMFfTPaNOUmfLaZCcfYMA3V0oINKd6i2mQHo8SpTMQziRzecrAmg7R7dxQ
 Zx1d8+Q3vb2AzkqHbQ08EUYRiIoIfBRtN6Y55NyoBw/U2VpGt/7JsU0Cb2IoH3FVtOhM
 iiTzOVueVJneYtXPjJCo0QwHXndP+chwUIFQMPWoIBLgjLrFRPzS1xrP1VmlcnxwBgXD
 MrnU68MuNm9k+5OU0k75ZV3a6+qG/PI4g58kJOtOiXHPqzNeQ3HTx/Q2r6BvqlfYYZ7u
 8Qg4jHpKPwA2feFhU9OE4bmkIEsizRXJbhcaOmLVRYfOLjI874LpD84Gl8hn4H4n7y7e
 J6+Q==
X-Gm-Message-State: AOAM53100YYZ/hzaiGXBudxsI+i7lQQIfhV05pI5yGx13CWEZlgkMtIX
 SO3KESzZTi5OYMIUylwEQwF4rX33oZOXRL1J0bFccg==
X-Google-Smtp-Source: ABdhPJyeztC0cKlxpxJbcdpKGnjLokQ5Hbk3yut4wnAn+KbU58QE/bDjZToy72mqLJB3xoj//4U1Nx1Wmu2jQvyz1Ho=
X-Received: by 2002:a67:2f81:: with SMTP id v123mr2278664vsv.16.1602644828982; 
 Tue, 13 Oct 2020 20:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201012124547.16649-1-wenbin.mei@mediatek.com>
 <20201012124547.16649-5-wenbin.mei@mediatek.com>
 <72ae1d89-fe31-4f50-15c0-29119d662ea1@gmail.com>
 <1602642530.11864.3.camel@mhfsdcap03>
In-Reply-To: <1602642530.11864.3.camel@mhfsdcap03>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 14 Oct 2020 11:06:58 +0800
Message-ID: <CANMq1KBe9u25yDxg8UtmOX4vhr8De=5-pJyMRkSBF4O=FpBN9A@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] mmc: mediatek: Add subsys clock control for MT8192
 msdc
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_230711_110487_FF8F86F0 
X-CRM114-Status: GOOD (  23.54  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, linux-mmc@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 10:29 AM Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> On Tue, 2020-10-13 at 17:10 +0200, Matthias Brugger wrote:
> >
> > On 12/10/2020 14:45, Wenbin Mei wrote:
> > > MT8192 msdc is an independent sub system, we need control more bus
> > > clocks for it.
> > > Add support for the additional subsys clocks to allow it to be
> > > configured appropriately.
> > >
> > > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > > ---
> > >   drivers/mmc/host/mtk-sd.c | 74 +++++++++++++++++++++++++++++----------
> > >   1 file changed, 56 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > > index a704745e5882..c7df7510f120 100644
> > > --- a/drivers/mmc/host/mtk-sd.c
> > > +++ b/drivers/mmc/host/mtk-sd.c
> > [...]
> > > +static int msdc_of_clock_parse(struct platform_device *pdev,
> > > +                          struct msdc_host *host)
> > > +{
> > > +   int ret;
> > > +
> > > +   host->src_clk = devm_clk_get(&pdev->dev, "source");
> > > +   if (IS_ERR(host->src_clk))
> > > +           return PTR_ERR(host->src_clk);
> > > +
> > > +   host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > > +   if (IS_ERR(host->h_clk))
> > > +           return PTR_ERR(host->h_clk);
> > > +
> > > +   host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
> > > +   if (IS_ERR(host->bus_clk))
> > > +           host->bus_clk = NULL;
> > > +
> > > +   /*source clock control gate is optional clock*/
> > > +   host->src_clk_cg = devm_clk_get_optional(&pdev->dev, "source_cg");
> > > +   if (IS_ERR(host->src_clk_cg))
> > > +           host->src_clk_cg = NULL;
> > > +
> > > +   host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
> > > +   if (IS_ERR(host->sys_clk_cg))
> > > +           host->sys_clk_cg = NULL;
> > > +
> > > +   /* If present, always enable for this clock gate */
> > > +   clk_prepare_enable(host->sys_clk_cg);
> > > +
> > > +   host->bulk_clks[0].id = "pclk_cg";
> > > +   host->bulk_clks[1].id = "axi_cg";
> > > +   host->bulk_clks[2].id = "ahb_cg";
> >
> > That looks at least suspicious. The pointers of id point to some strings defined
> > in the function. Aren't they out of scope once msdc_of_clock_parse() has returned?
> >
> These constants are not in stack range, so they will not be lost.
> And I have confirmed it after msdc_of_clock_parse() has returned, these
> ids still exist.

Yes I guess the constants end up in .rodata (or similar section), but
I'm not sure if this is absolutely guaranteed.

In any case, this is a commonly used pattern, so I'd hope it's fine
(just a sample, there are more):
https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/dwc/pcie-qcom.c#L266
https://elixir.bootlin.com/linux/latest/source/sound/soc/codecs/wm8994.c#L4638
https://elixir.bootlin.com/linux/latest/source/drivers/mfd/madera-core.c#L467
https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpio-dwapb.c#L675

>
> > Regards,
> > Matthias
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
