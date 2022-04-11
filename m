Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D97C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 18:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gT/fMkjPJooXabpzVJNpUp6rRqQZ4Ox+Ph9jegwQL2o=; b=X5djZC+BfrFj5g
	PJTLwllQFFkh/3a7H5uAGQ5XuWvJ7uxOdQnYXLBJJLnrHpZc4x460jmFO0wm+5HD6olBAz6WIvtrZ
	KOVzWR7teWeQn0GEZ13pIbCCqzupOEcBh79CoXtdzN822yLyniC3d4Z5jCSnaqckvJ1LgFdd8XjME
	cabyMTQ8+NWwGzUBD6/SoqsQmvMR+O6Tb2CBaEAP+2KlOCXq2VTymun4sUuBXgoeBN9AI1Kyorj3x
	VHqH0AzBh4/L5oPK2WmPsgbEEOrUcXPZlsQT77z3iTNW4yPfnspBfFJPYD2G1RSNJgnzQNY5zlBN8
	62VONNrIH03BA298YEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndyTd-009zOP-7m; Mon, 11 Apr 2022 18:09:25 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndyTY-009zLH-5N
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 18:09:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so107114pjb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Apr 2022 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=zNUERBDcPB2O2rB/hm+cxzZzogWX5mDVNkGC3aPcqtg=;
 b=ubK9eztOVEQwI6eXRPT1fItHhUdVMxBXWzSUYBncNVK3t9delHoEHg7VoYaVwLaaVD
 un4JEPhW5Fn90OTG+Us9Joe4FtPGhkQiUOQalp1TJ1VtQQB2y9KBhPqGU14dIY3S4+yF
 KYpGjzWgKAbGF4b5U2zrmU5qlo5RXOMrnCbGhKaEDV5kSexl9xwjLhXXIuOIOAezsG6k
 gBezEULtZgrK8ceqzUFLorW5mglkqbuqwoQyZY+zKNTP2dmDhed1iXF+pvnTRR0YZfIx
 I9JV4Rx/Sp6j4LMc9erJDssMh0NGgG/J8WhNP3ilvZUOePb0pvbbp2QiiimUNj8KWlew
 mx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zNUERBDcPB2O2rB/hm+cxzZzogWX5mDVNkGC3aPcqtg=;
 b=sBUkhxsA7revmhBSG7CfS8xGa+0WbCeX9WqQSUQ+2t4/K5fJCNp5SDaqrny+LZD0HT
 3ud2rkdOkukAN6yv0S2SCrVXSbrjZLC6L4NJFNB4KCLZBmWgev+V4SojBRdAnADuetSn
 3/WiK7ahBb6G+ddxTrzD6qaAmKn7T7+MMfCfxnuSr3fusI/IuKWI7vnNa1+4tdYtAWHB
 7h1PGgaBIPUUlM+ZcWbcNBSyQbBA7B7G/G4s6EcVOt8isEQ6iGfqcShQFjLFkZiUlwdG
 O8Dyi9Vga39bFMFA210ididftpa0akKCERD3mRfvKuTWmPCwciMhDKevy+EaVrnqv+r+
 cW9g==
X-Gm-Message-State: AOAM532hslYMpjX1vtrPtZnaD+CM8vlccZ7KJhZNx0alHXrtqn+nF5de
 RQEHWpMFkUrxilmr27YyIk6zkQ==
X-Google-Smtp-Source: ABdhPJzaA6/MgmKAb8SuJ5HGfoAPrl2QB/lzXvt5Kk3MNfq9B8523d7j9MNmGKNEJUy0txgS1hN7ng==
X-Received: by 2002:a17:90a:7147:b0:1bd:24ac:13bd with SMTP id
 g7-20020a17090a714700b001bd24ac13bdmr486003pjs.70.1649700556996; 
 Mon, 11 Apr 2022 11:09:16 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 c4-20020a056a00248400b004faad8c81bcsm36999513pfv.127.2022.04.11.11.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 11:09:16 -0700 (PDT)
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
In-Reply-To: <3b7bf25a3da6c8f780c87784c1f796bf1e464238.camel@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-8-rex-bc.chen@mediatek.com>
 <7hsfqn5nft.fsf@baylibre.com>
 <3b7bf25a3da6c8f780c87784c1f796bf1e464238.camel@mediatek.com>
Date: Mon, 11 Apr 2022 11:09:15 -0700
Message-ID: <7hzgkr4hmc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_110920_433657_3548B94D 
X-CRM114-Status: GOOD (  19.11  )
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

Hi Rex,

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> On Fri, 2022-04-08 at 13:29 -0700, Kevin Hilman wrote:
>> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
>> 
>> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
>> > 
>> > The Smart Voltage Scaling (SVS) is a hardware which calculates
>> > suitable
>> > SVS bank voltages to OPP voltage table.
>> > 
>> > When the SVS is enabled, cpufreq should listen to opp notification
>> > and do
>> > proper actions when receiving events of disable and voltage
>> > adjustment.
>> 
>> So listenting for OPP notifications should be done only when SVS is
>> enabled...
>> 
>
> Thanks for your review.
> Yes, the OPP notification is only called from MediaTek SVS.
>
>> [...]
>> 
>> >  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info,
>> > int cpu)
>> >  {
>> >  	struct device *cpu_dev;
>> > @@ -392,6 +455,17 @@ static int mtk_cpu_dvfs_info_init(struct
>> > mtk_cpu_dvfs_info *info, int cpu)
>> >  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
>> >  	dev_pm_opp_put(opp);
>> >  
>> > +	info->opp_cpu = cpu;
>> > +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
>> > +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
>> 
>> ...but here youlisten to OPP notifications unconditionally.  Seems
>> there
>> should be a check whether SVS is enabled before deciding to register.
>> 
>> Kevin
>>
> Do you think it's ok that we wrap it with the SVS Kconfig define?
> like
> #ifdef CONFIG_MTK_SVS
> mtk_cpufreq_opp_notifier()
> ...
> dev_pm_opp_register_notifier()
> #endif

Generally, we don't like to see #ifdefs in C files[1].

But more importantly, compile-time check is not enough, because SVS
feature could be compiled into kernel, but not actually enabled for an
SoC (e.g. DT node not enabled, etc.) so checking this at compile time is
not enough.

Ideally, the SVSdriver should provide a function that allows others to
check if it's enabled.  That function needs to know not only if it's
compile in, but if it's enabled/running.  If SVS is not compiled in,
then that function just returns false.

Kevin

[1] https://www.kernel.org/doc/html/latest/process/4.Coding.html?highlight=ifdef#ifdef-and-preprocessor-use-in-general

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
