Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20A1C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CADC64DDD
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CADC64DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=acyX+mLouylL9g9MvoSbPZODGsQOLMey9JVuxIz06c8=; b=FaOYDQj58kUZ2yeRIcpYCVBNA
	is6kI/ggpbx6OeqC8DJo8cyy4S590sBEgAaLxNzrGwxeO8qkPrCNPRmDBoTFpLmSkAMdNwRXJQaLs
	q1mCvCr73KF7snVT5jtohesUHQ+F8tB0+6+jaAfSBR0FxIAvRzloAPaSDHWzM3OzOD/tV0kkfAFyX
	axBuCMPbI8i8FYHObWcFUMYkm2MwcuTluayoUjGaNBegI/LPd7w77i68w8J44RF4KfyWMah0tmpRN
	MUbNx96BTycBqEASIAzjN8vyr1aMDCbCHGAdioj92dHEFX0nCUdx7r8RnafAeuE1gr8+VCyVOq8hM
	dP+k3ISsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6WDW-0007Yt-De; Mon, 01 Feb 2021 10:13:58 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6W4x-0003xv-I5
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 10:05:09 +0000
Received: by mail-pf1-x434.google.com with SMTP id o20so11263735pfu.0
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=frVr/xCUvbYcgOOMMYBu0rOoutvXVeUOoguRH3Tfir4=;
 b=KwK6870QDpRjaQinp8V2YB7qTqptw0NUC4QQzI6GlaPFwXhH4XhywUDn/dr3sbz6Gy
 OC4dJlWbmACnp5g0iaHf7r2ef2MJMzVA4SX9JzX0tQzX3dH9LjJrJmtGptQfM2hAb75z
 UwUleW6xFmNJZ+WzH6n/lRLf7noLT5jz5vNrR3OyxLR8GSEIHs3YpR9lunUV5AVQaJ5e
 xUsgx/9Q29q66NefdOejr8sBM9dmVUXClEIPnF5lvzGZDfQAj90Vfg6rzlDhsmHnyaIj
 BgQ6zroUKfsLkQfJtGCrRgiUkguq9n6eaDLq/9bX4KdNIES/ladpVGwk5SF3htHMTj4K
 ukHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=frVr/xCUvbYcgOOMMYBu0rOoutvXVeUOoguRH3Tfir4=;
 b=j1HO6WvpegtnFhODSj44mAlVRjPGg8uKGfLsSG6bQsK1pz/JKC1yi/2iQ/3nCUTajL
 /6AqfPP9K48cUS+QPHPv+vkfVhOQPhyFjxPNbQ0+wINpR+bEAk+TLiwz+w3W+HpYF9Ig
 qSd5tZQY/kImMh/IxIljEScE2L9yos3RT6zv17p8bsAz8/+KO1bEmdYKfBZKXkafVk0y
 icr0INzAw5aULJkqTBfTwWdM8TmO1F5WG3XJcnB466A1cA51PEqPJhrMxGW2LTxyMyFf
 Zn29Flhn303MSVhN4V1unaZKK1XD0IwluA0zIYI0qUgZ14Z1JfTe4C+Douvca7en6ZWz
 HDsg==
X-Gm-Message-State: AOAM533Qfx96HfwSF/OMX9wpNTUUsYdp93T7gJPHlo/scp/KzlfZmFrA
 xlRkR4SlH1jvWuZnO1IGXal53Q==
X-Google-Smtp-Source: ABdhPJyxP1XDmrI0MqAUO7EnoKcwJKb1624sQpyrFq75F363UpbEny2r9jczdiB/yEeu8ohEE5Gqfw==
X-Received: by 2002:aa7:8698:0:b029:1be:aef7:449d with SMTP id
 d24-20020aa786980000b02901beaef7449dmr15532020pfo.60.1612173905191; 
 Mon, 01 Feb 2021 02:05:05 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id c11sm15454066pfl.185.2021.02.01.02.05.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:05:04 -0800 (PST)
Date: Mon, 1 Feb 2021 15:35:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] cpufreq: Remove CPUFREQ_STICKY flag
Message-ID: <20210201100502.xluaj5rpqosqsq7b@vireshk-i7>
References: <377d2e2d328276070ae2f26c65daa1497bb3c3cf.1612166647.git.viresh.kumar@linaro.org>
 <YBfNb91psVcf3TAS@light.dominikbrodowski.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBfNb91psVcf3TAS@light.dominikbrodowski.net>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_050507_926203_7F787BDC 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: linux-omap@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01-02-21, 10:44, Dominik Brodowski wrote:
> IIRC, it was required on various ARM systems,[*] as CPUs were registered as
> subsys_initcall(), while cpufreq used to be initialized only later, as an

s/later/earlier ? arch happens before subsys not at least and that is
the only way we can break cpufreq here, i.e. when the driver comes up
before the CPUs are registered.

> arch_initcall(). If the ordering is opposite now on all architectures (it
> wasn't on ARM back then), we should be fine.
> 
> [*] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/arch/arm/mach-sa1100/cpu-sa1100.c?id=f59d3bbe35f6268d729f51be82af8325d62f20f5

Thanks for your reply, it made me look at that aspect in some more
detail to confirm I don't end up breaking anything. Unless I am making
a mistake in reading the code, this is the code flow that we have
right now:

start_kernel()
-> kernel_init()
   -> kernel_init_freeable()
      -> do_basic_setup()
         -> driver_init()
            -> cpu_dev_init()
               -> subsys_system_register(for-CPUs)
 
         -> do_initcalls()
            -> register-cpufreq-driver from any level

And so CPUs should always be there for a cpufreq driver.

Makes sense ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
