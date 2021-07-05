Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E3BC07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 04:33:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBA80613CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 04:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBA80613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYXTybeTDN9tEEvKniAOeBvM895cYWuVIuCpqmllKYY=; b=wF924e3my1uYfT
	aQkDbfkrmTYa6le52UqATF4YNIvKsPmiVnVqf1GCOJ3FhgZxx5Eg+q0SYh0FhCkbU/S02mc9XbzX8
	zJ4Oq5kgBXDl9P0kWXscFgc8qgj3j3bQMCP8W3qisPtfw+K/2r04EqPOa83BE2ms/OeZA1SIW5nF9
	6E8gg3AXvdADw8AGgXjSrWyeiIwtZwoZQZoP4kJeaBBRKMZ8mzpwKdb518HYhOc9EUroYliaEofUw
	ZdluxX3U0n8O8LnlkdSKx5AoVhwwZCyrHHgMyjEqYZQ/gU+7g/GK9obS5jEnQIiMoHiNGS9LFrPog
	bjhbA6XlUtF0MG2ZHzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0GHu-007nNr-Oa; Mon, 05 Jul 2021 04:32:54 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0GHr-007nMv-U9
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 04:32:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso11016488pjp.2
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 21:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hzs9/MPPqTbukCCd+SDEsivmHIJPRX7gx5UfTUvkO7w=;
 b=Ue5aGYTLaC8HcxL1/2BoBxtkAQIa1ZkefHZUYkQVM3UWIPu1+OOnNUXWhl4DwwYb9G
 dJNIXFekZQnf0jA9psHMJJlz+/O94nmrHk/TsGx2EIW6DcJuMX1ZjbJXyb+CUpJu3XC2
 uFieHD3yOm4nNasAMUaTljWiY1Y/DNlsQCI2he5/6KAqy84hLw7iq0cj0TAFQnhjPj1U
 MsatVP1pAbxSAK5M/6Sh9d1bPpnjFp/hFwryk/Qdrs2ChxdECWiBm+tM2saXf+2m8E2n
 +OLVO2jEhIl3srKnuzvsBBw4R6bhp5OQud6XOiCwFAUYHu4kMGMRGcQGOaVplGdsOFrq
 ynZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hzs9/MPPqTbukCCd+SDEsivmHIJPRX7gx5UfTUvkO7w=;
 b=NXA8rVEazbqw4jwBDdZJZC5aDPRZSs/1MTT6feKF3v4s9CvYV3xREWoamDN8pXGB5B
 ttyz8wDkJYVO2NZwVwdmj5h/Pz7a2vzwBpd0zPNnsunnyKUXEIIV2aWtov2GpfqD0/NF
 zn0NZgsU/mXZ0TBZ7VaLd9ynMJPF9grZCEChABEJ03O6yooOZO8FKbuocHNtDRaoPjPj
 cc/20WcUtQKJP9l1qwuMeoChcgLK2jOhkV+bd40uyo6s1dTtYYv/WgsZmWBjvAvhVo0P
 zu0dqnm8tJUgJWmlIEsPFzPwZvIixFwS6T5bJ1PS3kgkuhyzmmTop/I54jMyxYFcuVFl
 vQQw==
X-Gm-Message-State: AOAM532QhghzyOHT3YQQ7vR4vw6zU14lOHtG2TYOuj4DJ13NYbpE5BUc
 ACYT0UJqFUjjBirz8JCToD9c9A==
X-Google-Smtp-Source: ABdhPJx4oNRUqlZr1vQ97rs7GdaVbmtY4QFUJ4jxXHLPcFSeovx9yoMEHeGGNU0D5JbwmK+kl4s44A==
X-Received: by 2002:a17:90a:d506:: with SMTP id
 t6mr12980439pju.26.1625459570574; 
 Sun, 04 Jul 2021 21:32:50 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id z20sm12768901pgk.36.2021.07.04.21.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 21:32:49 -0700 (PDT)
Date: Mon, 5 Jul 2021 10:02:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>
Subject: Re: [PATCH v12 1/2] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Message-ID: <20210705043248.sivxgodszzhrax2d@vireshk-i7>
References: <1622307153-3639-1-git-send-email-hector.yuan@mediatek.com>
 <1622307153-3639-2-git-send-email-hector.yuan@mediatek.com>
 <20210614104058.jdwb7godqzhf7rgd@vireshk-i7>
 <1624781848.1958.16.camel@mtkswgap22>
 <20210628072641.amqk5d3svwolvhic@vireshk-i7>
 <20210628090956.uwkrozdqvawsm3xp@bogus>
 <20210629024719.nmcygaigtx5wn7g5@vireshk-i7>
 <20210629090238.n23zcttkiqvzpbb5@bogus>
 <20210629090522.jsiwkrki6lavo33z@vireshk-i7>
 <1625418089.1958.48.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1625418089.1958.48.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_213252_019837_7CA1D580 
X-CRM114-Status: GOOD (  15.23  )
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

On 05-07-21, 01:01, Hector Yuan wrote:
> Hi, Viresh:
> 
> OK, Thank you.
> 
> I'll add this routine in of.c.
> May I know the below prototype is okay to you?
> 
> static int _of_get_related_cpus(const char *list_name, const char
> *cell_name, int index, struct cpumask *m)

of_perf_domain_get_sharing_cpumask(int cpu, const char *list_name,
        const char *cell_name, struct cpumask *cpumask);

And actually add this in cpufreq.h, this doesn't have anything to do with OPP
and I can assume that a platform not enabling the OPP functionality to end up
using it later.

Rafael, will that be fine ? Or we add it in a completely new header ? The users
are going to be cpufreq drivers only I believe.

> And maybe I have to find somewhere to update my
> mtk_freq_domain_map[cpu]?
> 
> static int mtk_get_related_cpus(int index, struct cpufreq_mtk *c)
> {
> 	for_each_possible_cpu(cpu) {
> 		cpumask_set_cpu(cpu, &c->related_cpus);//related_cpu can copy policy
> cpus
> 		mtk_freq_domain_map[cpu] = c;//need to find somewhere to assign
> 
> 	}
> }

I am not sure I understood this part well.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
