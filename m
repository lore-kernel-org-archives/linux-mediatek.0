Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03123C11F69
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 16:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA41B61436
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 16:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA41B61436
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuKDi749M1UG9iq5SromSZi8By6TjQJPd7bLugbwGi4=; b=zoCBkHvbP3vEzj
	mPGn+hUapyTFuekxdAHwMDcFRInfLwAZNQ3+sfl7tolDaZFNG10BZ71C0w9Ti0IeHBIL/jZShAEYf
	uTji2s9aWiM/bFudNZll5V+fQ+jncl/ctw9hbZZ/GtANtXYwFHKUUK16LdSTio78zgyyDD37+AevS
	p/ewT33/0qK+hVuhvOO1DFZhYvu2ni0k5K+EMzH6oWcsKed3zryCq3iL6t6gCUHkuMeBAeC5Sg5lF
	N+hN3ZMVrbtU+LzVazzCtrvnfgVL1eJJGjf+4TCL9v0n1v5OQbG6OiWzkhaltJiZ1E8VbceeVZwtS
	1tQWJQsxH40ThxKv6Kpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyd96-00EjmN-88; Wed, 30 Jun 2021 16:33:04 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyd8r-00Ejjb-LC; Wed, 30 Jun 2021 16:32:51 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so3383584otl.0; 
 Wed, 30 Jun 2021 09:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjiwcwmwYVU/Y0LKZ3Up/yPWW67ykZw9kfOwYgExw7A=;
 b=lojqEi6AzrXRZfANMZEvY8J9s3R7L7+k9KMznFgsaDMPK622NqpxdUAFTi8u/pBy8M
 cRB20cuP52oiL0U7S9saNeijXn/x1ghdQFeIzNvgT6SBRkmZ9ubrJ12m8eK8SL2xV8Jz
 MjJ+GfGxSc+FF33MPd04EqI71ZCg3paDCQ+q/Hxxn94ra1e1gxg+8zOQ9Px8TRdwNGkY
 Q8oPddx0h6CC7M8Rd3erPPepwc+2CXLgWDxPMjhw6H2DCW47ny5zP5M/oPoSCR+CV0qa
 A8gQnhGoWsGh/WjNSofn07e8QG+tqk5XdJWY2+FVtFQMpjy8AKCVEN2M01xy8Dc6I6E6
 TBjw==
X-Gm-Message-State: AOAM531mfuZguZXdrovXtWjnuJ5RaCXV0ocMu9Vsrpghtk0u32ZqloLm
 RvHT7QaewRB7Z/IsK8hor0X/ITOer2IR1SmASbQ=
X-Google-Smtp-Source: ABdhPJxfrb8HvU4LnjaS0Rjd6JV80ARcJH49aa6L8I/mgHtJMzv8D4zC8Uxs6rvB5RN02anw7eODG50Q8pyJ77E6X+k=
X-Received: by 2002:a05:6830:1d8:: with SMTP id
 r24mr3146657ota.206.1625070767446; 
 Wed, 30 Jun 2021 09:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210626162324.8236-1-tung-chen.shih@mediatek.com>
 <20210629061758.wdavb2a4bpklmqi3@vireshk-i7>
In-Reply-To: <20210629061758.wdavb2a4bpklmqi3@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 30 Jun 2021 18:32:36 +0200
Message-ID: <CAJZ5v0g2fc7UDFajbFCZS0ctSZcV-h_JCwts6w6fe3Xy_S=gzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] cpufreq: fix the target freq not in the range of
 policy->min & max
To: Viresh Kumar <viresh.kumar@linaro.org>,
 TungChen Shih <tung-chen.shih@mediatek.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 wsd_upstream <wsd_upstream@mediatek.com>, Linux PM <linux-pm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_093249_741334_877A379C 
X-CRM114-Status: GOOD (  39.67  )
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

On Tue, Jun 29, 2021 at 8:18 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 27-06-21, 00:23, TungChen Shih wrote:
> >     The function cpufreq_driver_resolve_freq() should return the lowest
>
> Don't add extra spaces at the beginning of paragraphs here.
>
> > supported freq greater than or equal to the given target_freq, subject
> > to policy (min/max) and driver limitations. However, the index returned
> > by cpufreq_frequency_table_target() won't subject to policy min/max in
> > some cases.
> >
> >     In cpufreq_frequency_table_target(), this function will try to find
> > an index for @target_freq in freq_table, and the frequency of selected
> > index should be in the range [policy->min, policy->max], which means:
> >
> >     policy->min <= policy->freq_table[idx].frequency <= policy->max
> >
> >     Though "clamp_val(target_freq, policy->min, policy->max);" would
> > have been called to check this condition, when policy->max or min is
> > not exactly one of the frequency in the frequency table,
> > policy->freq_table[idx].frequency may still go out of the range
> >
> >     For example, if our sorted freq_table is [3000, 2000, 1000], and
> > suppose we have:
> >
> >     @target_freq = 2500
> >     @policy->min = 2000
> >     @policy->max = 2200
> >     @relation = CPUFREQ_RELATION_L
> >
> > 1. After clamp_val(target_freq, policy->min, policy->max); @target_freq
> > becomes 2200
> > 2. Since we use CPUFREQ_REALTION_L, final selected freq will be 3000 which
> > beyonds policy->max
>
> Right so the problem does exist,

That IMO is a matter for discussion and the patch author seems to have
decided to ignore my previous comments.

> and not only with
> cpufreq_driver_resolve_freq(), but __cpufreq_driver_target() as well.

That all depends on what the policy min and max limits are expected to
mean and so far the interpretation has been that they are applied to
the target frequency coming from the governor.

Drivers have never been expected to ensure that the final effective
frequency will always be between the policy min and max and, indeed,
they may not even be able to ensure that.

Now, because RELATION_L is defined as "the closest frequency equal to
or above the target", running at a frequency below the target is
questionable even if the max limit gets in the way.  IOW, RELATION_L
takes precedence over the policy max limit.

Accordingly, I'm not going to apply this patch or anything similar to
it until I'm given a really convincing argument otherwise.

> I have a sent a patchset to update both of these to start sharing some
> code and we need to fix this for both now.
>
> > Signed-off-by: TungChen Shih <tung-chen.shih@mediatek.com>
> > ---
> >  drivers/cpufreq/cpufreq.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 802abc925b2a..8e3a17781618 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -544,8 +544,23 @@ unsigned int cpufreq_driver_resolve_freq(struct cpufreq_policy *policy,
> >       if (cpufreq_driver->target_index) {
> >               unsigned int idx;
> >
> > +             /*  to find the frequency >= target_freq */
> >               idx = cpufreq_frequency_table_target(policy, target_freq,
> >                                                    CPUFREQ_RELATION_L);
> > +
> > +             /* frequency should subject to policy (min/max) */
> > +             if (policy->freq_table[idx].frequency > policy->max) {
> > +                     if (policy->freq_table_sorted == CPUFREQ_TABLE_SORTED_ASCENDING)
> > +                             idx--;
> > +                     else
> > +                             idx++;
> > +             } else if (policy->freq_table[idx].frequency < policy->min) {
> > +                     if (policy->freq_table_sorted == CPUFREQ_TABLE_SORTED_ASCENDING)
> > +                             idx++;
> > +                     else
> > +                             idx--;
> > +             }
>
> This doesn't look clean to be honest.
>
> Rafael, does it make sense to update cpufreq_frequency_table_target()
> (and its internal routines) to take policy bounds in consideration, or
> something else ?
>
> --
> viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
