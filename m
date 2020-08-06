Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99876C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 18:06:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF54D206A2
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 18:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kcssqfqV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="W515vg/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF54D206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EgZNigXubSIpp/l79D+VGLVx2WA371p4I2caAKFrVh0=; b=kcssqfqV/YxofTUo4YYlzFLRs
	Zdx/ceMmqBMQoYgFoQnYBSZqRuwPJW0qMLpmYnIsqis0IzuEAyaYaaex1I2hTrh5CVBwypDyIfbfS
	/rKi94hwzQyM8HzO8ln+9McBWHlA5YVkqogfcxw8Jjl9wYksZKgZH04maW9cl44HcTGZmMpaCBLiI
	1VE4qFqZkIhC5Fz02VMTzMbzfGoEjHY1ZGsP+vqznANkwLk/W0M2IFDkHoacLBySoWlIlQ6BXOueY
	t6JT8vH52eMhLOTGmYuZMQeyJbIPsLxMj1YfcKV8iiNtnyz0T2EBafz7gSkch7jAisZ1zx5Wp6iug
	STkY+kgOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3kHN-0006S6-7v; Thu, 06 Aug 2020 18:06:13 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3kHL-0006Qm-22
 for linux-mediatek@lists.infradead.org; Thu, 06 Aug 2020 18:06:12 +0000
Received: by mail-pg1-x544.google.com with SMTP id o5so9365962pgb.2
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 11:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylCjemrTuNIFJbRktj1/dL7hZ8gSo2npn8SY8jax5gQ=;
 b=W515vg/30bkvIr9ovaD7pallgaeK4PaZItShKIvofk6SkZWY6nxUa0T9Rvg/J6pcDl
 0zhRo5qE3I8oTFFKS/tXbzaoxe3OFiKoDR/FA7LkamHucSt2LNptWQUVQd3tllTu0/Zp
 9IbTsClNA1MXSvr5s/j0Es7uAdCbwNDEe/yjhfq0eatrzS70oPh4ExhsEOmN+m7SyN/6
 ox37RInCzs4p2+I1Fqw96gSAImm2hl6sF3dOFjRToZa+na52lu4uB5LrH4nYMOA3x8uN
 1etbbkyv8uQp5x6Wp6iHTyTwyLobYapujcHbciVaS+35xJ7LuODbDH1R7fP4CNYnLd5v
 qmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylCjemrTuNIFJbRktj1/dL7hZ8gSo2npn8SY8jax5gQ=;
 b=Qs+ta599AMnjhyv6t8pQ4lSG4TmwDV9ux/7rimnmz3CT/4nam9fxjZtTgM62s8PYSM
 7VuRYgPAppMsxH0rNLWYXopdp80PzB956vf3ZV/tl9DbfViIuubSNChmlF24yLduyw0c
 M46Uq9YPWeAn/cW3jLcIG25/3I8+Q/OG3+4hZ0XEAaBcTRKqBr6MCPzIF1Y7kMhfm/nD
 v3GmNB5ePL19e6laz61fMEbCu51BspAyd5xcUIKGs5WFAhoWrdMoqY3oVTI02c5QaTRc
 fh0yeyBN6BjIudfjDCM+czUlr580uPiYMfK2h3wp9RbwBiWV2JvhD8ZgnqAsT9BkRgiQ
 gaGg==
X-Gm-Message-State: AOAM532WP7VpUGz4Kku39oLqU1PmE3ncv3rKAkGYQT7LSj7+xtqy5w6l
 YijKIDhP6crX2gdCaxR/BoOa7jrYTP8OYtLV1g2tbQ==
X-Google-Smtp-Source: ABdhPJxe86jVj9BTFCBMyCA/7qhgFwu4dSvBhB7qMRfIc9vQCd4mbllXI4drBsZvFenvyPYIcN49oB627PCOsPutoSs=
X-Received: by 2002:a05:6a00:2295:: with SMTP id
 f21mr9115086pfe.51.1596737168463; 
 Thu, 06 Aug 2020 11:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
 <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
In-Reply-To: <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 6 Aug 2020 11:05:32 -0700
Message-ID: <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_140611_180303_72E6D914 
X-CRM114-Status: GOOD (  40.51  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, steev@kali.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Nial Peters <uceenpe@ucl.ac.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 6, 2020 at 5:12 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-08-06 02:24, John Stultz wrote:
> > On Wed, Aug 5, 2020 at 1:19 PM Saravana Kannan <saravanak@google.com>
> > wrote:
> >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org>
> >> wrote:
> >> > On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
> >> > >
> >> > > Switch the driver to use the helper macros. In addition to reducing the
> >> > > number of lines, this also adds module unload protection (if the driver
> >> > > is compiled as a module) by switching from module_platform_driver to
> >> > > builtin_platform_driver.
> >> > >
> >> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> >> > > ---
> >> > >  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
> >> > >  1 file changed, 3 insertions(+), 23 deletions(-)
> >> > >
> >> > > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> >> > > index 5b624e3295e4..c1c5dfad57cc 100644
> >> > > --- a/drivers/irqchip/qcom-pdc.c
> >> > > +++ b/drivers/irqchip/qcom-pdc.c
> >> > > @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> >> > >         return ret;
> >> > >  }
> >> > >
> >> > > -static int qcom_pdc_probe(struct platform_device *pdev)
> >> > > -{
> >> > > -       struct device_node *np = pdev->dev.of_node;
> >> > > -       struct device_node *parent = of_irq_find_parent(np);
> >> > > -
> >> > > -       return qcom_pdc_init(np, parent);
> >> > > -}
> >> > > -
> >> > > -static const struct of_device_id qcom_pdc_match_table[] = {
> >> > > -       { .compatible = "qcom,pdc" },
> >> > > -       {}
> >> > > -};
> >> > > -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> >> > > -
> >> > > -static struct platform_driver qcom_pdc_driver = {
> >> > > -       .probe = qcom_pdc_probe,
> >> > > -       .driver = {
> >> > > -               .name = "qcom-pdc",
> >> > > -               .of_match_table = qcom_pdc_match_table,
> >> > > -               .suppress_bind_attrs = true,
> >> > > -       },
> >> > > -};
> >> > > -module_platform_driver(qcom_pdc_driver);
> >> > > +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
> >> > > +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
> >> > > +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
> >> > >  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
> >> > >  MODULE_LICENSE("GPL v2");
> >> >
> >> > <sigh>
> >> > So this is where I bashfully admit I didn't get a chance to try this
> >> > patch series out, as I had success with a much older version of
> >> > Saravana's macro magic.
> >> >
> >> > But unfortunately, now that this has landed in mainline, I'm seeing
> >> > boot regressions on db845c. :( This is in the non-modular case,
> >> > building the driver in.
> >>
> >> Does that mean the modular version is working? Or you haven't tried
> >> that yet? I'll wait for your reply before I try to fix it. I don't
> >> have the hardware, but it should be easy to guess this issue looking
> >> at the code delta.
> >
> > I've not yet tested with modules with your patch.
> >
> >> The only significant change from what your probe function is doing is
> >> this snippet. But it'd be surprising if this only affects the builtin
> >> case.
> >>
> >> + if (par_np == np)
> >> +         par_np = NULL;
> >> +
> >> + /*
> >> + * If there's a parent interrupt controller and  none of the parent
> >> irq
> >> + * domains have been registered, that means the parent interrupt
> >> + * controller has not been initialized yet.  it's not time for this
> >> + * interrupt controller to initialize. So, defer probe of this
> >> + * interrupt controller. The actual initialization callback of this
> >> + * interrupt controller can check for specific domains as necessary.
> >> + */
> >> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
> >> +         return -EPROBE_DEFER;
> >
> > Yep. We're getting caught on the irq_find_matching_host() check. I'm a
> > little lost as when I look at the qcom,pdc node in the dtsi its not
> > under a parent controller (instead the soc node).
> > Not sure if that's an issue in the dtsi or if par_np check needs to
> > ignore the soc node and pass null?
>
> I think you have nailed it. This checks for a domain attached to
> the driver we are about to probe, and this domain cannot possibly
> exist. Instead, it is the *parent* this should check for, as we
> depend on it for successful probing.

Duh! Looks like I made a copy-paste/typo error. The comment clearly
says I'm trying to check the parent and then I end up checking the
node getting registered. I'm sure this will fix it.

Actually Nial sent an email a few hours after your and he had found
the same issue. He even tested the fix with an irqchip driver and it
fixed the probe issue.

I'm assuming you'll put up the patch yourself. Please let me know if
you need me to send one.

Thanks,
Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
