Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22306C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 18:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1koLfEiF/RDseqtiQcUgtwFcaXoEShcKQd0wVsZ47yA=; b=KQO9FInTnBcx8s
	G8HOTYeL+bsgeR6RiIsJPlthUSKPanzh0kkm1vSktEtg9WjTZ4i7JlfXV0VeVeJ8e94jG0US3Mnwm
	bNOgHMdhK8xcrQB9fjgIEA5/mNGzT1pk8sWwCUUKzAqfjdIpBi7LThi0cSPW3GJ4h1CVHAn11M+OU
	EYntyMaEkzlE+X4zv6QTUh0oLpbi0Jfn4+tqcI/BaUW7bB5p5I/lTxEcAuBksBn5CI+0TsWWYAqPD
	z3bi5z3Xiiz9IzgR5dNb05LViaJ5Ays1nm5TDpRyMrXhdwKGxENYJgQblxtkmIv2VO+jM6+F/wTy/
	PXcpFnEX1/PrhFgcow1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neKsb-00FQ7V-3U; Tue, 12 Apr 2022 18:04:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neKsO-00FQ3g-7R
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 18:04:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id p10so614399plf.9
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Uk7HGQjUL7qBYUmyOj8OBJBQSHFN+LzVXSnG4qGNbTE=;
 b=jFr35tndWJ0nAVVDICGQAaEYIMMXzjz9fKlaFJ8w7nhIihwifPjt1rLJuHO7qRsPaG
 MLEJvbPP7Tuvgl3zCD1VuFPVfFJPnGpG4ktjUjMmoagMYYki7X+05OLs08wQKbsf1RfQ
 zcCaIw/M8l9yCTPfehnrhArzHLMVr6AsJBsc5J5JKXOgWCj46cAd8dr3CBlBwYdlyOtG
 4E1MGgUHyxL+p3looTbwHcp9rCRYQ7OXCe3PDq32Ud6WVK6P7ewbp3QcDDbr0QVw0Bmz
 G1X2C7h2FKGUIHUQZweZyh8vcCyJQKnBZUDV5OQlVHgKkmL1LVevEtn64v5xzNys9pLU
 5HOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Uk7HGQjUL7qBYUmyOj8OBJBQSHFN+LzVXSnG4qGNbTE=;
 b=GEB59tu11NZ99ndlRqfz2j3a54j+XtR+sYpqur5lHb+IIXvQsi/YPpA20AOy0MTvJ3
 gjHo6rG5r2Tijnkh0EvKiwE5cchrfnY+MWg+5vtI6nNOko+pVeltCFmpJNB+grooCAQe
 EV3fsy5i0stbQOuB0zBskwPFGLxNhJDPBfGPAEZssRxUS6wKeojnb8M+STfZ87SWHD7P
 3SgBq4aKE8aBf69A6DncDXtaYn1Vo/sohoCSZVXsSBg8ukfSPJWXR7cT4kCvwTOjjw2J
 xPZixErvGYXTUNOtShVDCbLiXYLiddUbLGPpY4BnQU6GS5+PZlcT/tckrzrrYYw/pHfd
 wvZA==
X-Gm-Message-State: AOAM530V3HH06rzGlQXBVt0OYX5WGkjES523tvIcX7TKFTaPrYIaeVNi
 TDVAA7mLuza+iqoexspwiG2+lw==
X-Google-Smtp-Source: ABdhPJw18lgMRgcMa0PPrG0eQ4wWbvTFhILQ4ylHJMGkTSBxH4VIo/Y9Yzc7COxYGeKXAg/XXfScbw==
X-Received: by 2002:a17:90b:380e:b0:1c7:74f6:ae60 with SMTP id
 mq14-20020a17090b380e00b001c774f6ae60mr6198048pjb.5.1649786665161; 
 Tue, 12 Apr 2022 11:04:25 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004fb266fb186sm40276496pfw.73.2022.04.12.11.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:04:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, "Andrew-sh.Cheng"
 <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH V2 07/15] cpufreq: mediatek: Add opp notification for
 SVS support
In-Reply-To: <dfe2d3e3401a6f2a7be9db4e8a0590d3dd9a6969.camel@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-8-rex-bc.chen@mediatek.com>
 <7hsfqn5nft.fsf@baylibre.com>
 <3b7bf25a3da6c8f780c87784c1f796bf1e464238.camel@mediatek.com>
 <7hzgkr4hmc.fsf@baylibre.com>
 <dfe2d3e3401a6f2a7be9db4e8a0590d3dd9a6969.camel@mediatek.com>
Date: Tue, 12 Apr 2022 11:04:23 -0700
Message-ID: <7ho81641qw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_110428_485753_978B7935 
X-CRM114-Status: GOOD (  30.62  )
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

> On Mon, 2022-04-11 at 11:09 -0700, Kevin Hilman wrote:
>> Hi Rex,
>> 
>> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
>> 
>> > On Fri, 2022-04-08 at 13:29 -0700, Kevin Hilman wrote:
>> > > Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
>> > > 
>> > > > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
>> > > > 
>> > > > The Smart Voltage Scaling (SVS) is a hardware which calculates
>> > > > suitable
>> > > > SVS bank voltages to OPP voltage table.
>> > > > 
>> > > > When the SVS is enabled, cpufreq should listen to opp
>> > > > notification
>> > > > and do
>> > > > proper actions when receiving events of disable and voltage
>> > > > adjustment.
>> > > 
>> > > So listenting for OPP notifications should be done only when SVS
>> > > is
>> > > enabled...
>> > > 
>> > 
>> > Thanks for your review.
>> > Yes, the OPP notification is only called from MediaTek SVS.
>> > 
>> > > [...]
>> > > 
>> > > >  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info
>> > > > *info,
>> > > > int cpu)
>> > > >  {
>> > > >  	struct device *cpu_dev;
>> > > > @@ -392,6 +455,17 @@ static int mtk_cpu_dvfs_info_init(struct
>> > > > mtk_cpu_dvfs_info *info, int cpu)
>> > > >  	info->intermediate_voltage =
>> > > > dev_pm_opp_get_voltage(opp);
>> > > >  	dev_pm_opp_put(opp);
>> > > >  
>> > > > +	info->opp_cpu = cpu;
>> > > > +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
>> > > > +	ret = dev_pm_opp_register_notifier(cpu_dev, &info-
>> > > > >opp_nb);
>> > > 
>> > > ...but here youlisten to OPP notifications
>> > > unconditionally.  Seems
>> > > there
>> > > should be a check whether SVS is enabled before deciding to
>> > > register.
>> > > 
>> > > Kevin
>> > > 
>> > 
>> > Do you think it's ok that we wrap it with the SVS Kconfig define?
>> > like
>> > #ifdef CONFIG_MTK_SVS
>> > mtk_cpufreq_opp_notifier()
>> > ...
>> > dev_pm_opp_register_notifier()
>> > #endif
>> 
>> Generally, we don't like to see #ifdefs in C files[1].
>> 
>> But more importantly, compile-time check is not enough, because SVS
>> feature could be compiled into kernel, but not actually enabled for
>> an
>> SoC (e.g. DT node not enabled, etc.) so checking this at compile time
>> is
>> not enough.
>> 
>> Ideally, the SVSdriver should provide a function that allows others
>> to
>> check if it's enabled.  That function needs to know not only if it's
>> compile in, but if it's enabled/running.  If SVS is not compiled in,
>> then that function just returns false.
>> 
>> Kevin
>> 
>> [1] 
>> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/4.Coding.html?highlight=ifdef*ifdef-and-preprocessor-use-in-general__;Iw!!CTRNKA9wMg0ARbw!z6SrEcQOLu2u-R1OLedrRUXHYXCzuQoK3F_h9Bhzv8jNFmjV5mdNVy41eND67CuV9uIS$
>> 
>
> Hello Kevin,
>
> After our internal discussion, we think the register of notifier should
> not be bound for certain module.
> If we provide the moethod to adjust voltage/disable opp, we think if
> anyone call dev_pm_opp_adjust_voltage and dev_pm_opp_disable, it could
> be used.

I don't think I understand what you mean.

Do you mean that this OPP notifier could be registered all the time,
even if SVS is not enabled?

That's fine with me.  If SVS is not compiled or enabled, then the
notifiers will never be called, so that's fine.

> May I ask what is your concern?

My concern was primarily that the changelog description did not match
the code.  The changelog says "when SVS is enabled, CPUfreq should
listen to OPP notifications."

But if I understand you correctly above, I think what you mean is that
CPUfreq should always listen to OPP notifications because there are
other users (e.g. SVS) that could change the OPP outside of this driver.

If that's what you mean, then I think the only thing to change is the
wording of the changelog.

Thanks,

Kevin




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
