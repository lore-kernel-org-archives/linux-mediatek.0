Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531B6C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 01:25:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2138B2173E
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 01:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1LkFynW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zBjyQ7Fq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2138B2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=096WrlQfhiZZYDv2oMWxk/CQ93ocRloA8SBWBChGRRk=; b=l1LkFynW2lYh4uKNPMSeDgBkK
	gxqEhn+pNk83kBwRG6wAq/tFkQOlsiECDDlNUusRzzcFokc6zZT8BiIfGPeOXpd0z0922OmO0aToa
	L8dAoTdQte5RUkKZZlIYSeJM0pYuu5vDi8o5GNzE+kW71kOFMMbr73cHh1CrosmxLLOfOgo338vaW
	I+IUkLAiSaKXBMvz0qgMUWOGMjJpsOA/sq7A8pQYpdL7aboVrCS2Ty5qeRXqnDxnJQ2lVZUr9VJfM
	eslCJAFfCj6HjDnSuJID2Xjz88B0IBCUnhg+xBaYpU6eFJOal4MQz5JoQM/S2+UigZSKopu0OszaV
	JCqn1v1DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Uec-0003j8-Rb; Thu, 06 Aug 2020 01:25:10 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3UeX-0003i9-VL
 for linux-mediatek@lists.infradead.org; Thu, 06 Aug 2020 01:25:07 +0000
Received: by mail-ot1-x342.google.com with SMTP id h22so5709021otq.11
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2020 18:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k6pimq7S+VITQhnjcjjKsbMV9B3GCD09apLcTf0EFW4=;
 b=zBjyQ7FqB6dMiThk1hav7gsRnCLpxmI/Fy5uZOtG59LSQ2QsizkGeT9cxRcrrT5uuK
 IN7w9SlXJWWBuojgD/fhVAol+es3RGGs8AmAlc7M3oYZR77TgO837vZj7SBdpFIojDRw
 LTKRa9aTIHhvoQX+4vvpYLQ+yGi/UKZ8Y7EbrZD1x6XS4Bd5efeeHiRAUqKaCUK1vNQK
 lexkbnVoJkHVdOviBHjojnC4qCA6htQXfwn4PGdpQSF16KaqNDXBMqWYqst2HW96Hm7r
 2/VNTA/3gvLGwRTGVyBp9ZBPbKUGDZdXhoY6xue1CEj/Gg4kd1FIAb4SqmnPuO8aJGbY
 6hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6pimq7S+VITQhnjcjjKsbMV9B3GCD09apLcTf0EFW4=;
 b=EIPnhyXtUO1kMVcj5/q5rmejIyTYQY+Vdp+cRK5kZUHNQGQbIKCY+tPRdgVANywXsI
 Dbpcmd/GPWkqBv76JdsBRDBx8SYTGOHRJ4mBFt73TrE/qqGDvJszdNP9w+JrSKKeipHg
 bgHdUjTBS7p4pkzBe2sXahP6bJlQFLRw+FVUZe9kJ7PZpzDKqBx2BiP/UsLaw/YVsqQY
 d+YMZp8ejtY9nevE7/6jccugbAnjb1wlJRxUVzpECw3KH291L5wpuz40BJTCnGaaCsgF
 Gy+SHASldfEcihx+A+VhUXh0qln3gz7ZOLqgfw1UEfmffHpwRWvsLBG4+8hVBQ27anGu
 5hSw==
X-Gm-Message-State: AOAM5338kKnU+A8HodRjDr/jWu9V65L45dXPeBGJoO4sn0pXUfabUvx+
 BnM+5XR0FWwupxN1Y+h8W1R2BPfXVHytZN55U7BKXiM/5js=
X-Google-Smtp-Source: ABdhPJwp1gy6ICxlR+QU+ROR+YJdoXDHLADEqbolalzpss7WqkKehLyLFZYdIvJ/S4ZjbwkZ1sedTzTnZwQb6ihZJxQ=
X-Received: by 2002:a05:6830:3196:: with SMTP id
 p22mr5524618ots.102.1596677102717; 
 Wed, 05 Aug 2020 18:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
In-Reply-To: <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 5 Aug 2020 18:24:50 -0700
Message-ID: <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_212506_357080_4F190415 
X-CRM114-Status: GOOD (  32.84  )
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
 Marc Zyngier <maz@kernel.org>, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 5, 2020 at 1:19 PM Saravana Kannan <saravanak@google.com> wrote:
> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > Switch the driver to use the helper macros. In addition to reducing the
> > > number of lines, this also adds module unload protection (if the driver
> > > is compiled as a module) by switching from module_platform_driver to
> > > builtin_platform_driver.
> > >
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > ---
> > >  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
> > >  1 file changed, 3 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > > index 5b624e3295e4..c1c5dfad57cc 100644
> > > --- a/drivers/irqchip/qcom-pdc.c
> > > +++ b/drivers/irqchip/qcom-pdc.c
> > > @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> > >         return ret;
> > >  }
> > >
> > > -static int qcom_pdc_probe(struct platform_device *pdev)
> > > -{
> > > -       struct device_node *np = pdev->dev.of_node;
> > > -       struct device_node *parent = of_irq_find_parent(np);
> > > -
> > > -       return qcom_pdc_init(np, parent);
> > > -}
> > > -
> > > -static const struct of_device_id qcom_pdc_match_table[] = {
> > > -       { .compatible = "qcom,pdc" },
> > > -       {}
> > > -};
> > > -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> > > -
> > > -static struct platform_driver qcom_pdc_driver = {
> > > -       .probe = qcom_pdc_probe,
> > > -       .driver = {
> > > -               .name = "qcom-pdc",
> > > -               .of_match_table = qcom_pdc_match_table,
> > > -               .suppress_bind_attrs = true,
> > > -       },
> > > -};
> > > -module_platform_driver(qcom_pdc_driver);
> > > +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
> > > +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
> > > +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
> > >  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
> > >  MODULE_LICENSE("GPL v2");
> >
> > <sigh>
> > So this is where I bashfully admit I didn't get a chance to try this
> > patch series out, as I had success with a much older version of
> > Saravana's macro magic.
> >
> > But unfortunately, now that this has landed in mainline, I'm seeing
> > boot regressions on db845c. :( This is in the non-modular case,
> > building the driver in.
>
> Does that mean the modular version is working? Or you haven't tried
> that yet? I'll wait for your reply before I try to fix it. I don't
> have the hardware, but it should be easy to guess this issue looking
> at the code delta.

I've not yet tested with modules with your patch.

> The only significant change from what your probe function is doing is
> this snippet. But it'd be surprising if this only affects the builtin
> case.
>
> + if (par_np == np)
> +         par_np = NULL;
> +
> + /*
> + * If there's a parent interrupt controller and  none of the parent irq
> + * domains have been registered, that means the parent interrupt
> + * controller has not been initialized yet.  it's not time for this
> + * interrupt controller to initialize. So, defer probe of this
> + * interrupt controller. The actual initialization callback of this
> + * interrupt controller can check for specific domains as necessary.
> + */
> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
> +         return -EPROBE_DEFER;

Yep. We're getting caught on the irq_find_matching_host() check. I'm a
little lost as when I look at the qcom,pdc node in the dtsi its not
under a parent controller (instead the soc node).
Not sure if that's an issue in the dtsi or if par_np check needs to
ignore the soc node and pass null?

thanks
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
