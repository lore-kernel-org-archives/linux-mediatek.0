Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8C2C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 21:17:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8102076E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 21:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rpjwwoqy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kali.org header.i=@kali.org header.b="hDRflfqS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8102076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kali.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xsJICNUZLV0Gc9AbI++HiZMeD6XAldN2ipXi8qJPbMw=; b=RpjwwoqyJOPKrokklMPq8Zf05
	DpGgDv1FNVel6nocH4qo1r4XodAHJmlQcT5+yhRSzg6xMxd7/WpgoC3dffx1dWH75X6+q0qzB1twr
	Q85V/MXbn9/5hYKYSA4CTkdBBMibIcdWVbrIG63xSX0fc9icjZy10ZktRC7ki4z3EMMqxuT2bm/pN
	8eh5AJ9R6glq7jCpZizMoUKhaH5IxPNLQp6SeX2bAYZtgDKbMrU1MrA1pIPS6Nh9l4gCacZM4/u1I
	SoFo2zXjTMbrIlshyUxm+LfkXarDjoD6AsUB5ZdYQaSRzMv4nr8VS/glL+Fj4Gv6wrMji20mheBSi
	3Y5jMYlBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3QmG-0000GM-9b; Wed, 05 Aug 2020 21:16:48 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3QmC-0000ER-5b
 for linux-mediatek@lists.infradead.org; Wed, 05 Aug 2020 21:16:45 +0000
Received: by mail-oi1-x242.google.com with SMTP id 25so17340013oir.0
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2020 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Grm1cy93TykL2UQMLvitYfHftzNHr5WnvDxuij6JO+U=;
 b=hDRflfqSy7WcRWVgHidQaxalAI6pcrvC53q01AJTbJpMbWw0sNYAQ9P8vdMHgeRPzt
 pUMxybYMki+htTItPgxlEP+8j/xk9QLY3EMGVh9z6ID72rcfx2NsTFKdbZkn34p/DPpP
 sATeXwBCbvxxrxPCwOuI8ihYtOlfZ7xmHXT9/x8dv+2qc4DekekRa9QXqMEbg4nPpLoe
 mCp17blYYj28WG6NcfnvFnXtPSr1c/W8XUYmWMHx9vukbEXs2AwcAcUDWTuD7C8CDMIG
 55CsIkGcXeDMzVmXgFMgfXN+LBKjaHa4o7RvWYyAjaNKs5sVrbjm4uCVACRUrrNdkB6H
 aYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Grm1cy93TykL2UQMLvitYfHftzNHr5WnvDxuij6JO+U=;
 b=kSS6NHu9SGPuz+JmMfQqWrbO9rHwOPllEM/DijSDlqzXsf/qUyHQhnIIjIRfokzwO3
 ONtnEKmXfVu+MAzOUqiOKamoyCidB5XlpwNE66vdEs9SMiBKi/4WNezamXvd8skThr+P
 PQ77y1nf5FXN+oEI7Zo1PcBbcrjji7D0FY7lXVKTW6p0Jt6YUcjsBZBVEUUqzkQNGwEM
 bJZ/UihP6eM0ABuFf/ZjSy9/592kjLbV8HdHeaUl+hY3Foi5vbT08ottg+TVPVTZR4Un
 2OTw9Reo74Wo3X79CoU94fiRnOOj4AsqGCbx89URmV+LgPEQ7Bw59D5OXln0DcPVh21T
 a5wA==
X-Gm-Message-State: AOAM530FrKxAYy9J2+zwOY/c14IJDLaXR1fIpk4OPxVqNOlzz4t5rAfQ
 c/uZcl+qxx5uNsMXeSxPb63pGA==
X-Google-Smtp-Source: ABdhPJyq3up6BgBEF4JBbpDeMKpsNeJVYqW/Eie4xYc5kopvUzCGvKOxeLD5qDnmN0Ym3dFzcn5GIA==
X-Received: by 2002:aca:c5d6:: with SMTP id v205mr4539034oif.143.1596662200100; 
 Wed, 05 Aug 2020 14:16:40 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id 33sm609369ots.12.2020.08.05.14.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 14:16:39 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Saravana Kannan <saravanak@google.com>,
 John Stultz <john.stultz@linaro.org>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
Date: Wed, 5 Aug 2020 16:16:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_171644_373116_2EA16659 
X-CRM114-Status: GOOD (  29.34  )
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


On 8/5/20 3:19 PM, Saravana Kannan wrote:
> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
>> <sigh>
>> So this is where I bashfully admit I didn't get a chance to try this
>> patch series out, as I had success with a much older version of
>> Saravana's macro magic.
>>
>> But unfortunately, now that this has landed in mainline, I'm seeing
>> boot regressions on db845c. :( This is in the non-modular case,
>> building the driver in.
> Does that mean the modular version is working? Or you haven't tried
> that yet? I'll wait for your reply before I try to fix it. I don't
> have the hardware, but it should be easy to guess this issue looking
> at the code delta.

For what it's worth, I saw this too on the Lenovo C630 (started on -next
around 20200727, but I didn't track it down as, well, there's less way
to get debug output on the C630.

In my testing, module or built-in doesn't matter, but reverting does
allow me to boot again.

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
>
>> I managed to bisect it down to this patch, and reverting it avoids the
>> issue. I don't see what is wrong right off, but I really need to get
>> to bed, so I'll dig further tomorrow.
>>
>> Saravana: Apologies for not getting around to testing this beforehand!
> No worries. Apologies for breaking it accidentally.
>
> -Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
