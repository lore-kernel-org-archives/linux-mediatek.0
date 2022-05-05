Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B88C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANDMMWmJU8R2f/6V2H4+T3fgKMTimmFPnGxqzrf5GKQ=; b=gJMBzxvli4LcBu
	RjsZpaubGUj1YKcWKAYn6u98DBHb2ADq77KQCTj+qTHk4zJkvAEHxmLRWz0LZX/4Z8jgALqj2Fc1U
	r2oh6thn4ilveho81U46XWM4yY7nGDd+kB9SK7ytjGSWeW6KJ5FR4YjMlGxQ6KF7HvOVi52z6a7GG
	af/rZ4pgY9DqbeZ1T21LonUlqFmd/DK6baSWp9mxqTkkSnCBm6qxuVQYxj67Z04TiPnThTvWDcHO+
	4vx0lnYmtDvYukPbyUnsIF5Lr809eoesuh7vF13/Eue8ccbzmd1m2rLYiJ7X65vNk6FpiSiMuXot/
	t8uk8zYYo2p0uqHWr/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWqR-00EgwN-3M; Thu, 05 May 2022 08:28:19 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWqF-00Egnb-I4
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:28:08 +0000
Received: by mail-pg1-x52a.google.com with SMTP id k190so438352pgd.6
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 01:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HOKWQO3AA3Q0kMwEYSF8sNwEKbhYO51b9Gcb/RnOKGg=;
 b=wci8YOoxZ3illRFKHKrWaX7T897Mmf1T5O3iEUl+cL+QRBXehtQcWlzLaWIPPakKqr
 ZW21u9nGyxk794Gfd2xWUN15d8CvQaYrXiETA8AIQUeETlm6NxnWyj3QuixYzEimAQqR
 WYyvmk61zfkke2dhM85U7aYfHweXphpxcwJEB3taPGqLejWPxB7tSWyYqmtxF2cHzQBd
 tTEAHp20VGgM9M2gs9WlZWFdXHhLA+Rc1yxd6Q4wR5ZNqQmBPIEm06qD8rquGqxXMU2k
 dqHArOIllIBoQAhxe6QBPhXz8EusZoVpiKvcqdgeWQqVeztKoWsb1Hyjf4bJGCftI2a5
 JFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HOKWQO3AA3Q0kMwEYSF8sNwEKbhYO51b9Gcb/RnOKGg=;
 b=isZLrtDPhcRBXMbqQNAEw5UH4HO6/HJQ8GsGW21YocW+uD0Z2P6qe2kPKfBpXO//y5
 KQ9R1Lo9CE/lrDL03lstzc0JIBgQS4PVmgNEEJDMlx/2Hsl1U6/AsMO7/YeSClCK1E6k
 4RznmMCZMt8oKlNc7P1wmfgFsbo/zmSqSQHZcrFrIzA/mtZ1Q/kQSFhzw0FQlrrkFxHC
 S6R67+yfj1UUj9s3yyQE+elrsHXizCOs2+BoBLhBRn7Zn8pQ82KrstYlSLS2R5KrvmP9
 jT9lr6IIJnctzSavoaLtLtHELxuSLB/4f00u9lwWAsoGHrezRRo9q/FvnuaQ4ux1AjeX
 zTSA==
X-Gm-Message-State: AOAM531hMPWl4mxcnMXuQ4jGLF+eJU/vZOyxenwgjZLIMP0tfEVsKg1l
 9n7cQk8QTTebw28FyZEocW08hA==
X-Google-Smtp-Source: ABdhPJz9Kgs7jvcZ0UyuZFb+nux2ZvzGdTDCoVC8GdWBchRjFOawaRJ3x6Cb7nYnHszwKHVJJIuurw==
X-Received: by 2002:a63:da04:0:b0:3c1:457c:3df3 with SMTP id
 c4-20020a63da04000000b003c1457c3df3mr21712805pgh.292.1651739284363; 
 Thu, 05 May 2022 01:28:04 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 r11-20020a170902ea4b00b0015e8d4eb2dfsm859092plg.297.2022.05.05.01.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 01:28:03 -0700 (PDT)
Date: Thu, 5 May 2022 13:58:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: Avoid unnecessary frequency updates due to
 mismatch
Message-ID: <20220505082801.oks7ko2sbqazyenn@vireshk-i7>
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
 <CAKfTPtDbsd+RLwY+0ZfnNWkQD+jOHmoX2K+ZfsOMnEH81ouVjw@mail.gmail.com>
 <20220505074408.ayzmd5kdbw2fagbq@vireshk-i7>
 <CAKfTPtCuJGsrsBJ2jACr_YeKN3RXNVMkgRgo+cw9t7CAyGwHWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKfTPtCuJGsrsBJ2jACr_YeKN3RXNVMkgRgo+cw9t7CAyGwHWQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_012807_605224_1918FA2F 
X-CRM114-Status: GOOD (  13.12  )
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

On 05-05-22, 10:21, Vincent Guittot wrote:
> Part of your problem is that cpufreq use khz whereas clock uses hz

Not in this case at least as the value mentioned in OPP table DT is in
Hz.

> Would it be better to do something like below in cpufreq_generic_get
> 
> (clk_get_rate(policy->clk) + 500) / 1000
> 
> so you round to closest instead of always floor rounding

That would be a fine thing to do anyway, though I am not sure if it
will fix the problem at hand.

If the hardware returns 499,999,499 Hz, we will still have the
problem.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
