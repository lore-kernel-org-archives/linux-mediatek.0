Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002E7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:13:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D092822D3E
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nuh9pI7T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpOS6lQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D092822D3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3WESzrVotThASztM75VYsMpEJiXDODvQi0X5HyFEFM8=; b=nuh9pI7TUt8jlIQRCVQqRi8zH
	7zm/nqwe+ZCHnNRVQfj9zsZA6JOLIv3m8OcY1jhjHAv3PQMKqhReeMWN5wnTANgL864nu3pHqkF6A
	plwIPYhUrbGVVSzifq7a7gvyhRiuT+o7GgyHj7gOsdHYCBna4LTj8XCaDMlIrIu9gzrbSRXCdV8Lh
	zxWQAf7XsLUum/9hrP673f1/28+hMatokUhrIKOt7khtqQe4holLqKPQ+d+YmXYnVd3kyKT4nIa5j
	uKENUQh/UFuLUpdNOAow6ewL0rstMlKVmyksRSsKmClR+3NGUqLc2+2K8IOZbfgrVQS+Gk+78jZ3N
	XY9RxgeDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3elL-0002gO-0B; Thu, 06 Aug 2020 12:12:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3elF-0002fj-Uj; Thu, 06 Aug 2020 12:12:44 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 461EE22D6E;
 Thu,  6 Aug 2020 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596715961;
 bh=RnBeNxWWl4q9QSN+tmbvArEJ2MhaOfF3wq7wtPI6v9s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SpOS6lQOAH9r/CIi/S3TDpOXthbyTOKoERVxpMjkp7ZKNYvD23xa640uTIbU9WnDB
 cxSWbc5tiraE9L9evnyesXRnDvQudHa7kX43Yh+bL/62IQsDaMslV9TX13RIT5Fru6
 hQZuwnjielyHPVPInWo9WoM/PrFKOq72Zxlso0Ig=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k3bal-000Eyu-7Y; Thu, 06 Aug 2020 09:49:39 +0100
MIME-Version: 1.0
Date: Thu, 06 Aug 2020 09:49:39 +0100
From: Marc Zyngier <maz@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
In-Reply-To: <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: john.stultz@linaro.org, saravanak@google.com,
 tglx@linutronix.de, jason@lakedaemon.net, matthias.bgg@gmail.com,
 agross@kernel.org, bjorn.andersson@linaro.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 hanks.chen@mediatek.com, cc.hwang@mediatek.com, loda.chou@mediatek.com,
 steev@kali.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_081242_144074_76FA8A48 
X-CRM114-Status: GOOD (  34.84  )
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
 Saravana Kannan <saravanak@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, steev@kali.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-06 02:24, John Stultz wrote:
> On Wed, Aug 5, 2020 at 1:19 PM Saravana Kannan <saravanak@google.com> 
> wrote:
>> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> 
>> wrote:
>> > On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
>> > >
>> > > Switch the driver to use the helper macros. In addition to reducing the
>> > > number of lines, this also adds module unload protection (if the driver
>> > > is compiled as a module) by switching from module_platform_driver to
>> > > builtin_platform_driver.
>> > >
>> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
>> > > ---
>> > >  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
>> > >  1 file changed, 3 insertions(+), 23 deletions(-)
>> > >
>> > > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> > > index 5b624e3295e4..c1c5dfad57cc 100644
>> > > --- a/drivers/irqchip/qcom-pdc.c
>> > > +++ b/drivers/irqchip/qcom-pdc.c
>> > > @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>> > >         return ret;
>> > >  }
>> > >
>> > > -static int qcom_pdc_probe(struct platform_device *pdev)
>> > > -{
>> > > -       struct device_node *np = pdev->dev.of_node;
>> > > -       struct device_node *parent = of_irq_find_parent(np);
>> > > -
>> > > -       return qcom_pdc_init(np, parent);
>> > > -}
>> > > -
>> > > -static const struct of_device_id qcom_pdc_match_table[] = {
>> > > -       { .compatible = "qcom,pdc" },
>> > > -       {}
>> > > -};
>> > > -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
>> > > -
>> > > -static struct platform_driver qcom_pdc_driver = {
>> > > -       .probe = qcom_pdc_probe,
>> > > -       .driver = {
>> > > -               .name = "qcom-pdc",
>> > > -               .of_match_table = qcom_pdc_match_table,
>> > > -               .suppress_bind_attrs = true,
>> > > -       },
>> > > -};
>> > > -module_platform_driver(qcom_pdc_driver);
>> > > +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
>> > > +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
>> > > +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
>> > >  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
>> > >  MODULE_LICENSE("GPL v2");
>> >
>> > <sigh>
>> > So this is where I bashfully admit I didn't get a chance to try this
>> > patch series out, as I had success with a much older version of
>> > Saravana's macro magic.
>> >
>> > But unfortunately, now that this has landed in mainline, I'm seeing
>> > boot regressions on db845c. :( This is in the non-modular case,
>> > building the driver in.
>> 
>> Does that mean the modular version is working? Or you haven't tried
>> that yet? I'll wait for your reply before I try to fix it. I don't
>> have the hardware, but it should be easy to guess this issue looking
>> at the code delta.
> 
> I've not yet tested with modules with your patch.
> 
>> The only significant change from what your probe function is doing is
>> this snippet. But it'd be surprising if this only affects the builtin
>> case.
>> 
>> + if (par_np == np)
>> +         par_np = NULL;
>> +
>> + /*
>> + * If there's a parent interrupt controller and  none of the parent 
>> irq
>> + * domains have been registered, that means the parent interrupt
>> + * controller has not been initialized yet.  it's not time for this
>> + * interrupt controller to initialize. So, defer probe of this
>> + * interrupt controller. The actual initialization callback of this
>> + * interrupt controller can check for specific domains as necessary.
>> + */
>> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
>> +         return -EPROBE_DEFER;
> 
> Yep. We're getting caught on the irq_find_matching_host() check. I'm a
> little lost as when I look at the qcom,pdc node in the dtsi its not
> under a parent controller (instead the soc node).
> Not sure if that's an issue in the dtsi or if par_np check needs to
> ignore the soc node and pass null?

I think you have nailed it. This checks for a domain attached to
the driver we are about to probe, and this domain cannot possibly
exist. Instead, it is the *parent* this should check for, as we
depend on it for successful probing.

Can you please give this a go?

Thanks,

         M.

diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
index 1bb0e36c2bf3..d2341153e181 100644
--- a/drivers/irqchip/irqchip.c
+++ b/drivers/irqchip/irqchip.c
@@ -52,7 +52,7 @@ int platform_irqchip_probe(struct platform_device 
*pdev)
  	 * interrupt controller. The actual initialization callback of this
  	 * interrupt controller can check for specific domains as necessary.
  	 */
-	if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
+	if (par_np && !irq_find_matching_host(par_np, DOMAIN_BUS_ANY))
  		return -EPROBE_DEFER;

  	return irq_init_cb(np, par_np);

-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
