Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAF3C43214
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 05:19:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C2660EB5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 05:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3C2660EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vb1PMycqVPRjkSUoYOWh0cA8xVotXQJjaVXeyR8gL60=; b=wUqB5FL8j9i7Yk
	34UBqJUCCedfoc65Ok9K7sZb2SOrXTAz8p2yotxiVemBA3QjPRuS8JFotl/2lmT/5hqzKce1OPmfB
	m2v7qhLKkYM/tBmiJA87GoEqBRiXaEJdiIphszcBaYexU7leMAb4jBU4EiCr2c3BwVJs2EisaXpI4
	h8PxlzbpT3ywcEGzVZAYBo7Bg0iTkrERfIUX73ZTAmYrUjnvZhNQQMOsGjyLZMquWUELdF9SyHl6S
	k7q3HGVJgUwV+NsQBvc9VZiS2E3/lS60ZhwGLCfmLvk3gta/phVvgbtI8hysMpp2yMPx+bBzI5xiL
	htgjVm/w2f1upyY4U2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDge6-005cLo-1G; Wed, 11 Aug 2021 05:19:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDgdq-005cKl-JZ
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 05:19:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso7809945pjb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 22:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HZD0Vc3lp/XqIPTm8s+fyeFvAaL1Bw4mNZGMJyfHjck=;
 b=JsUzkrlDPAu8MK89pY4o2ZMqmceYFpkvBK5JN4Q3rcKt2yG6fIG7GyD/keZNyuPlO/
 pWDGRH0qVmkLvGILreUzHaQu2FqD7yCQInNs4MJfpOiBzeWCu1wVYqJHzzWd7jjg+1lK
 BPFkK9UOvNfF/dC32k369RJCDXvuGtx44NefqAQ8+PCbgjAa2GCfEu+hhsZOan5ymCE4
 Ckimj6yuQU672Pnu8Th/zBuzKM9OCrQ0Z4nuzcpM71M4Ou7EoR9Xl8bFAePomrmwMIFX
 SScfYhAV4fznqI7SG3+EA8jmNDowekCV9Zq4xhx491ewQCRU3dBLaVY249wQNytNEBdH
 cKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HZD0Vc3lp/XqIPTm8s+fyeFvAaL1Bw4mNZGMJyfHjck=;
 b=JW8GzeBGnny3f7nhST8vXpGH457G3+/zeMErKxf8lBvzS3ppZ/PL6UeEqRgbrUxXLD
 JyI8ENCnUeL176u86bd9+T94YGYJJZg1kZreoAFB1E/cCHL4dQ0EV404YFBJEblP1+eX
 SQ9CnKTKAIrtEjTqldxYvdFvgZo7QEFrhaBE8iy6VZm3+nidYvAfrzlkWaj3pv7Ieuaq
 zrd9B80mrsYoFgZExTFfnotTtnADtV2HoO9S0tLLIJvPGOuNdMPft4utFVcRECahzzmQ
 JftpfuRJTfsvdlh4vcTCfvt7U6GGzrnA40aa7BuV45+WBGzoP36cVaCCF0//Ck31NF75
 Fz1A==
X-Gm-Message-State: AOAM532dEzRhIn5lVIsfF4e2ewfj3KS9yLJiQpx9R8F4v5V26QKrQQTX
 SrVbi38gnionPzOeHjmkkkoBLg==
X-Google-Smtp-Source: ABdhPJzkff8ozUzWrLhACtgWHkaRe212yS2ydFbdEsIQCClF9gDAs7w5Kivh/WFFx4A/swTDLByBiw==
X-Received: by 2002:a17:90a:ce0a:: with SMTP id
 f10mr35357981pju.71.1628659141754; 
 Tue, 10 Aug 2021 22:19:01 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id z13sm4816257pjd.44.2021.08.10.22.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 22:19:01 -0700 (PDT)
Date: Wed, 11 Aug 2021 10:48:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRJym+Vn4bbwQzzs@google.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_221902_818495_4889B0A8 
X-CRM114-Status: GOOD (  36.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10-08-21, 13:35, Quentin Perret wrote:
> On Tuesday 10 Aug 2021 at 13:06:47 (+0530), Viresh Kumar wrote:
> > Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
> > with the EM core on their behalf.
> 
> Hmm, that's not quite what this does. This asks the cpufreq core to
> use *PM_OPP* to register an EM, which I think is kinda wrong to do from
> there IMO. The decision to use PM_OPP or another mechanism to register
> an EM belongs to platform specific code (drivers), so it is odd for the
> PM_OPP registration to have its own cpufreq flag but not the other ways.
> 
> As mentioned in another thread, the very reason to have PM_EM is to not
> depend on PM_OPP, so I'm worried about the direction of travel with this
> series TBH.

I had to use the pm-opp version, since almost everyone was using that.

On the other hand, there isn't a lot of OPP specific stuff in
dev_pm_opp_of_register_em(). It just uses dev_pm_opp_get_opp_count(),
that's all. This ended up in the OPP core, nothing else. Maybe we can
now move it back to the EM core and name it differently ?

> > This allows us to get rid of duplicated code
> > in the drivers and fix the unregistration part as well, which none of the
> > drivers have done until now.
> 
> This series adds more code than it removes,

Sadly yes :(

> and the unregistration is
> not a fix as we don't ever remove the EM tables by design, so not sure
> either of these points are valid arguments.

I think that design needs to be looked over again, it looks broken to
me everytime I land onto this code. I wonder why we don't unregister
stuff.

Lets say, I am working on the cpufreq driver and I want to test that
on my ARM machine. Rebooting a simpler board to test stuff out is
easy, but if I am working on an ARM server which is running lots of
other userspace stuff as well, I won't want to reboot the machine just
to test a different versions of the driver. I will rather want to
build the driver as module and insert/remove it again and again.

If the frequency table changes in between versions, this just breaks
as EM won't be updated again.

This breaks one of the most basic rules of Linux Kernel. Inserting a
module should have exactly the same final behavior every single time.
This model doesn't guarantee it. It simply looks broken.

> > This would also make the registration with EM core to happen only after policy
> > is fully initialized, and the EM core can do other stuff from in there, like
> > marking frequencies as inefficient (WIP). Though this patchset is useful without
> > that work being done and should be merged nevertheless.
> > 
> > This doesn't update scmi cpufreq driver for now as it is a special case and need
> > to be handled differently. Though we can make it work with this if required.
> 
> Note that we'll have more 'special cases' if other architectures start
> using PM_EM, which is what we have been trying to allow since the
> beginning, so that's worth keeping in mind.

Yes, we need to take care of all such special cases as well.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
