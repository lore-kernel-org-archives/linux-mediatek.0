Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09218C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 19:59:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFFE72173E
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 19:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NND58qNw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2oq7B8IM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFFE72173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zFmOyyDfvrXyH512fUBuVZK4SuI/Sxs6Z1vFFI5B1eU=; b=NND58qNwG/P8Wkx96B9QlbBQP
	JoK1iHFI9GLMVMveOECfuVQINVXUxSE5DpFljTrYARMjD0JdUtctRnF9cRCSBP+V3ZH8AQAzZMNce
	2GsavQ+nbAVMNVKvIsHJVrcUTXpW9DmoZNM5yTcm3yScCqCXCf3eJRKXm2Yf87wBrGq4Px10NVw2e
	P2h7khl3AQ460dMhZNxkJMqD76gch70cGYkeawn/m5BP95crOZqeq05HrlB+23ENHsH8jEdEvyv1s
	J7IImwIowoCEG/Ls40l5L65+/pMr+QB5HiCh0OPU8BCXvb2bC4pGQ7I1M6iOyP9OihxFNmQBwiaEX
	5k3vnPx6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3m34-0002sQ-Sy; Thu, 06 Aug 2020 19:59:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3m31-0002rC-4Y; Thu, 06 Aug 2020 19:59:32 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFBAE2173E;
 Thu,  6 Aug 2020 19:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596743970;
 bh=rZzNB7Mchw1xUwGcA2KB6ufKo5ZZoG/yMfMIbq6pK/Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2oq7B8IMmc0UB+V4Gs9PVKpLknPtYkzLPt6nce5QAFIKMqUSYttUwXraHgU41ekQg
 idJrEf9h1GGJy7Kb1jWhp9GWclJ9y5E0WckC6dyocfEOOSli3dSDSVcshgAAIiOcbz
 1H86dIn1t92Nnw6/n5miq3I0V0KITvHSGAIBX5LM=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k3m2y-000Mn1-AH; Thu, 06 Aug 2020 20:59:28 +0100
MIME-Version: 1.0
Date: Thu, 06 Aug 2020 20:59:28 +0100
From: Marc Zyngier <maz@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
In-Reply-To: <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
 <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
 <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <4d79a3e9c8c24f8adb6f7ade97d5a9c6@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: saravanak@google.com, john.stultz@linaro.org,
 tglx@linutronix.de, jason@lakedaemon.net, matthias.bgg@gmail.com,
 agross@kernel.org, bjorn.andersson@linaro.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 hanks.chen@mediatek.com, cc.hwang@mediatek.com, loda.chou@mediatek.com,
 steev@kali.org, uceenpe@ucl.ac.uk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_155931_304736_A21BC587 
X-CRM114-Status: GOOD (  23.63  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Nial Peters <uceenpe@ucl.ac.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-06 19:05, Saravana Kannan wrote:
> On Thu, Aug 6, 2020 at 5:12 AM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-08-06 02:24, John Stultz wrote:

[...]

>> >> + if (par_np == np)
>> >> +         par_np = NULL;
>> >> +
>> >> + /*
>> >> + * If there's a parent interrupt controller and  none of the parent
>> >> irq
>> >> + * domains have been registered, that means the parent interrupt
>> >> + * controller has not been initialized yet.  it's not time for this
>> >> + * interrupt controller to initialize. So, defer probe of this
>> >> + * interrupt controller. The actual initialization callback of this
>> >> + * interrupt controller can check for specific domains as necessary.
>> >> + */
>> >> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
>> >> +         return -EPROBE_DEFER;
>> >
>> > Yep. We're getting caught on the irq_find_matching_host() check. I'm a
>> > little lost as when I look at the qcom,pdc node in the dtsi its not
>> > under a parent controller (instead the soc node).
>> > Not sure if that's an issue in the dtsi or if par_np check needs to
>> > ignore the soc node and pass null?
>> 
>> I think you have nailed it. This checks for a domain attached to
>> the driver we are about to probe, and this domain cannot possibly
>> exist. Instead, it is the *parent* this should check for, as we
>> depend on it for successful probing.
> 
> Duh! Looks like I made a copy-paste/typo error. The comment clearly
> says I'm trying to check the parent and then I end up checking the
> node getting registered. I'm sure this will fix it.
> 
> Actually Nial sent an email a few hours after your and he had found
> the same issue. He even tested the fix with an irqchip driver and it
> fixed the probe issue.

OK, thanks for confirming. It would have been good if these patches
had seen a bit more testing.

> 
> I'm assuming you'll put up the patch yourself. Please let me know if
> you need me to send one.

I have queued this [1] in -next.

It'd be good if someone (John?) could give a Tested-by.

Thanks,

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/irqchip-next
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
