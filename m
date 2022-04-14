Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBD8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 21:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=7kmwqcLq35QBbmRqqv30crfcCkEQQOzz6PwWzEL6Os8=; b=LGt
	kLLwyzH6Iah12Zb/kmjeDSq5HUV9o/bhv9K7AXkod8TGQ03fjyrttgEWQ0UNWcQEJdCnKflCmggFL
	kRR8ZHqBSSqHHiglJF1AMb1EEQ8t0hxty+LTWQKn2BmizREQOBA4ear1eeRuxNGPSMo6u3JrOoZn9
	nww2VwxB7DWM76G/qU2pOCOIlna9GvNipOiKPLc04n7BcPWUNzuslx9Px7U9BWc8Y4TO7WsKtGZ/b
	pADYePJuwyUxvKxJpXRP7R7LlLT4ddJGi0lAuC1fYcXAWt/hRmf04jlyT0LIuB4/Wtw9pwzAIbO8V
	BYCtIlhBHZCjy/EuMw2ZmIIIb0oqq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7KN-007ON4-A1; Thu, 14 Apr 2022 21:48:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7KI-007OLn-Pt
 for linux-mediatek@lists.infradead.org; Thu, 14 Apr 2022 21:48:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id s14so5776799plk.8
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Apr 2022 14:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:date:message-id:mime-version;
 bh=waPudPlVhHtHMA9moxAZ6Byzf/Q9LiHGndFwnvJTw84=;
 b=sq26syXLy4lhHszxXm4VE59PlRWIiN0fJq/WC5AsgDkzVY+FMzC6W8M4G+c9XhxJ7M
 RPa8qQV3RjWQEkANg49pLuYOPJbqHWpDom/qBhXcNiTU2x/EUP7vMzD8EaTfWnWQopXg
 6RzI1HzBPjwsvZa5bVcRJlJkLO3FFHQYq5GbP/A+l8WjhxU64qfiE5ATq+qhBzIoJa+p
 5piiW3jrqQXYxkj6b2iWx54liMxXtnSnkXoh5h0JG+ag9jvbyNIOEYFHQ2xS5N2VzCEQ
 m0x0W90S9aYJ86OUJVnVBt19ASYxD+EqdjdzGQfCt2UusLeecEGN9+WyVUK2leOCsIpM
 wlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version;
 bh=waPudPlVhHtHMA9moxAZ6Byzf/Q9LiHGndFwnvJTw84=;
 b=doukQAJhJ6dtuDyNo5Ch1XA4xBYewZFDW3LkbpKx9Q58Cenb0EvoQEqNiOK5E3/+w1
 uPGaW2SBsIAc/MoyiLZp4UNKnyFgSRi43SVpbc57l/+iBSEtVBxKWF9NJB8Feajnavar
 ji+YV1EV1vkFOVpN4nJZjwcGgowDMYcKA9b6hGkeveZ96B4mHBQ3hWMF9JVvcHqk6yyV
 gviSJL/0U5zO4Igq8SS2fVFX9p1Y2l3YEGpgitDXGOgIBgyGYE/3WWmzn+f/zOdlzyop
 NsNdPcEts2E2h7KGvADhLcAsQa2X+sEDmiLJsoDKnIJSImTa5K1NSoSnJy+jhDXchTNz
 WAGA==
X-Gm-Message-State: AOAM53032K+JWj3YpSi+fZplKkLJg9Y0lRL2q6GDxP/JGOuQF1AbT67U
 NT+rQwwd1z61YrQqGWXXFuT74A==
X-Google-Smtp-Source: ABdhPJzrSS547mp4Ducl8jVLogQ25Z5tF6TpXhzlX/3f9wSauuf4/iNhSVnZHTPi6dTUidziqtR1IA==
X-Received: by 2002:a17:90b:4c45:b0:1cd:4fa3:6ee4 with SMTP id
 np5-20020a17090b4c4500b001cd4fa36ee4mr663031pjb.96.1649972908766; 
 Thu, 14 Apr 2022 14:48:28 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 k4-20020a17090a3e8400b001cd37f6c0b7sm2717486pjc.46.2022.04.14.14.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 14:48:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
In-Reply-To: <12c630946ce9d7b8c80143615496238759323981.camel@mediatek.com>
Date: Thu, 14 Apr 2022 14:48:27 -0700
Message-ID: <7hbkx3fiac.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_144831_071328_42DCA5CC 
X-CRM114-Status: GOOD (  25.44  )
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

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> On Wed, 2022-04-13 at 14:41 -0700, Kevin Hilman wrote:
>> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
>> 
>> [...]
>> 
>> > From the Chanwoo's devfreq passive govonor series, it's impossible
>> > to
>> > let cci devreq probed done before cpufreq because the passive
>> > govonor
>> > will search for cpufreq node and use it.
>> > 
>> > Ref: function: cpufreq_passive_register_notifier()
>> > 
>> > 
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/?h=devfreq-testing&id=b670978ddc43eb0c60735c3af6e4a370603ab673__;!!CTRNKA9wMg0ARbw!z58Lc1p9REo88oHn-NkxroN_fBd0TsHYmhscNZwnWwT71ecRkTeqZ6vFl5l7HpkTdM6t$
>> >  
>> 
>> Well this is a problem, because CCI depends on CPUfreq, but CPUfreq
>> depends on CCI, so one of them has to load and then wait for the
>> other.
>> 
>> > After I discuss with Angelo and Jia-wei, we think we are keeping
>> > the
>> > function in target_index and if the cci is not ready we will use
>> > the
>> > voltage which is set by bootloader to prevent high freqeuncy low
>> > voltage crash. And then we can keep seting the target frequency.
>> > 
>> 
>>  > We assume the setting of bootloader is correct and we can do this.
>> 
>> I'm still not crazy about this because you're lying to the CPUfreq
>> framework.  It's requesting one OPP, but you're not setting that,
>> you're
>> just keeping the bootloader frequency.
>> 
>> In my earlier reply, I gave two other options for handling this.
>> 
>> 1) set a (temporary) constraint on the voltage regulator so that it
>> cannot change.
>> 
>> or more clean, IMO:
>> 
>> 2) set a CPUfreq policy that restricts available OPPs to ones that
>> will
>> not break CCI.
>> 
>> Either of these solutions allow you to load the CPUfreq driver early,
>> and then wait for the CCI driver to be ready before removing the
>> restrictions.
>
> Hello Kevin,
>
> I think I do not describe this clearly.
> The proposal is:
>
> In cpufreq probe:
> we record the voltage value which is set by bootloader.
>
> In mtk_cpufreq_set_target():
> We do NOT directly return 0.
> Instead, we will find the voltage of target cpufreq and use the value
> max(booting voltage, target cpufreq voltage)
>
> mtk_cpufreq_set_target() {
> 	/* NOT return 0 if !is_ccifreq_ready */
> 	....
> 	vproc = get voltage of target cpufreq from opp.
>
> 	if (ccifreq_supported && !is_ccifreq_ready)
> 		vproc = max(vproc, vproc_on_boot)
>
> 	//setting voltage and target frequency
> 	....
> }

You explained this well, but it's still not an appropriate solution IMO,
because you're still not setting the target that is requested by the
CPUfreq core.

The job of ->set_target() is to set the frequency *requested by CPUfreq
core*.  If you cannot do that, you should return failure.  What you posted
in the original patch and what you're proposing here is to ignore the
frequency passed to ->set_target() and do something else.  In the
orignal patch, you propose do to nothing.  Now, you're ignoring the 
target passed in and setting something else.  In both cases, the CPUfreq
core things you have successfuly set the frequency requested, but you
have not.  This means there's a mismatch between what the CPUfreq core &
governer things the frequency is and what is actually set.  *This* is
the part that I think is wrong.

Instead, the proper way of restricting available frequencies is to use
governors or policies.  This ensures that the core & governors are
aligned with what the platform driver actually does.

As I proposed earlier, I think a clean solution to this problem is to
create a temporary policy at probe time that restricts the available
OPPs based on what the current CCI freq/voltage are.  Once CCI driver is
loaded and working, this policy can be removed.

Kevin



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
