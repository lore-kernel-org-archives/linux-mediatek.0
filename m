Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOxePaVhJBxGV+KbtuqPyk6wWj/DOFOdN2C9JGWb3As=; b=uP+qnRFHyID5M6
	oAhy6dO08o/Rt3TH8V4AL3aVnaVPdhn2vhGAhSRw3dB++gdFrLajPCcw4kgGAIp2en8Oc1n5obHDC
	1Xghhh+poUyfJdrYZU4HU5KKXoM6dl8mv+JCnpy/ehOGElftEzqpwAFKOYR287M5aoDaq5P2Xw4bX
	D0hTULdFLZZ+kS3n2z2Wyhc5u61nH4tgQundUqYenAZedTipcZIK2Ac9nOp4CAgUPH5WiywukuQ3F
	SsUh9Iy2sppVE/tR9wgZc5bwAS9sxL7KJnzzSIXAtC6mum5Ah3LRJCd+VrQHQdHKjvRUMIJ8JzUtw
	D11VIItZbennrd+86hRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWA1-00ESrI-86; Thu, 05 May 2022 07:44:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmW9q-00ESkj-3G
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 07:44:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id k1so3657100pll.4
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QyQdkF85sxaGXngVWCf+CtwxLJCswpvbc9Yb9r9b3ps=;
 b=D2FD8aKIDuPOc/gFcRzpeEFffc8FHi92DSXpFvDnOA5KT5ENc/h3GzfKD7L3oMMYVT
 W9tGZqtnjYGHKzdcxLtMMkVSnFYMZz6lCNYNNONigSREnfWlDSo2UmH+wusKATbrfm6n
 owJjiKuRF9EB6+/EKcz/cyGfDtxyc2ojbUUQhmquEVwBkZGcrsBZqHiMoHCkVgcZok5h
 xtHjqd379S5OMFXdVcrMuQSKT7NSRTVsmhI/5+QF9DsKekFeUUJp5rQQhZ20Zhl89CVg
 sMqfKqjoOavUqIJoYdWqrTstCvGNXHF947B2SvGNaXA42ceUmHZG0g+SI3Om3V5dWaos
 9H2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QyQdkF85sxaGXngVWCf+CtwxLJCswpvbc9Yb9r9b3ps=;
 b=m+y9s6KKoICPtI9fwkqwbqkQ6iEsTgdjwrQAB5Gz6fc4HA/QFZqCDOTUx4c7GeWep9
 vSU/M+cMAudxv5VDgWN6ieUF9Wj3VvfdwgdWLMZqyEeoaNZNQRZw9FnQyph/dEJ5O7GJ
 c3SjoS5lc/Med4UoZCrQoK6SSLvie3cSn1y20SrvPRjKDixjYvcyNSVAH8zDQyZ1uBsF
 0V3UjJdhy1pgrLtTYmBs8WWw6SjxbbX5RTUEnZ5bFI4sYcOM1req+5gPFUeomuhYB98l
 tyPANUjhPEkPAZmiqYzQinxt0Dnvn6ft4lMdkyTn6B0Qqe+TVPL3X7Fgthfiq2B3/Hpa
 4m1A==
X-Gm-Message-State: AOAM530SiUg4NJZZ/sNq2v//s2FE4u54ThFC3HqyKojeNyoRmf+zA7Uv
 Rz2aeBJBekfHDkAr+y58LD1Lmg==
X-Google-Smtp-Source: ABdhPJy8Ta6MH5GIF9d0xleqp2yj0Z1ejJgxU3wQrlYHh9gsGENoZbW5iILj3qg7tgiuvnW7JMhLvA==
X-Received: by 2002:a17:902:dacd:b0:15e:a53e:3239 with SMTP id
 q13-20020a170902dacd00b0015ea53e3239mr19129271plx.7.1651736650309; 
 Thu, 05 May 2022 00:44:10 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 c19-20020a63d153000000b003c14af5061asm626743pgj.50.2022.05.05.00.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 00:44:09 -0700 (PDT)
Date: Thu, 5 May 2022 13:14:08 +0530
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
Message-ID: <20220505074408.ayzmd5kdbw2fagbq@vireshk-i7>
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
 <CAKfTPtDbsd+RLwY+0ZfnNWkQD+jOHmoX2K+ZfsOMnEH81ouVjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKfTPtDbsd+RLwY+0ZfnNWkQD+jOHmoX2K+ZfsOMnEH81ouVjw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_004418_194554_490DB376 
X-CRM114-Status: GOOD (  14.89  )
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

On 05-05-22, 09:28, Vincent Guittot wrote:
> On Wed, 4 May 2022 at 10:21, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > For some platforms, the frequency returned by hardware may be slightly
> > different from what is provided in the frequency table. For example,
> 
> Do you have more details ?

This is where the problem was discussed.

https://lore.kernel.org/lkml/20220422075239.16437-8-rex-bc.chen@mediatek.com/

> Do you mean that between 2 consecutives reads you can get either
> 500Mhz or 499Mhz ?

No, the hardware always returns something like 499,999,726 Hz, but the
OPP table contains the value 500 MHz. The field policy->cur is set
based on opp table eventually (target_index) and so contains 500MHz,
almost always. But when cpufreq_get() is called, it finds the current
freq is 499 MHz, instead of 500 MHz. And so the issue.

> Or is it a fixed mismatch between the table and the freq returned by HW ?

Yes.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
