Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144B8C11F68
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 09:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83B161DD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 09:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C83B161DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+WUKMm3m7C7dJgDQK3TrXmfWsia2X0re8MIgWs8YgA=; b=40pmkatY9OJzcF
	JqO/D8ffjCh3+UafsuFyzBDl9/ASmDFl9NXWkiVxGCloixsdSaITNTblhpun+CM9vwzfR/AYK9tNt
	SGZfr5e8SqpSCCL0Ao4NR+i26xuVdE72bdfdvPb/6JRwxuBGWdfcyOWQkpB0nbAodYBuE7Q+GCB9h
	d/Wl9JJ4aATNLxz4Mxcl4kKNjt0+2LYHLwu5p/8fVAbwzJpTUI5Z3XH6u4M3+8pOB+q0cL7flP7/a
	VggFhOI6T2Pr0hx9/XRu2+H4o7+RPJohTkxKiLgbPg8DuexTPoFEK/RBrGWAKDVwMKbXPlmkoVHY6
	sK/MYh3r3cKYGx7Xircw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly9gZ-00AJlD-8H; Tue, 29 Jun 2021 09:05:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly9gL-00AJiW-LO
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 09:05:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id s14so15388033pfg.0
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 02:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zxf0nNdDqyVoap8M6CG4HmjTediBPHub6WIWm3X9tdg=;
 b=oTXq0/zjuzYPodSFGvMyuSPm6dwszJ3EXXtGSdCk4pk1sIZN2jSadWGy9UglSbV4Id
 Ak/vFfrERdzVadO8t+3Ll8wZbk6NySFl1q6Iqmkt8moV4/trIjpr+Hil3Z99I73TixFJ
 zKkHDRWcaWS+vA4PTWDWT3GbCCsVwQp1MKHH/codd3Gg6YHr6rwlnVXsumEwnSAKd5mc
 fhwJHhDBxLyoun0TjEQi5HIvBhNjwOa8GHN46cwYv4tS8LA3sibk2GeFpXnPnU3mtcmc
 v75Nb3QrIXAHfdz0fZT0dZUmXyMGgivobj3/yRzZXqkLo03Tzk4GLHe0Cu8xkiBD6lZq
 l8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zxf0nNdDqyVoap8M6CG4HmjTediBPHub6WIWm3X9tdg=;
 b=UbN7A3IaptPwySYVROmY+zrSdEaaJHLO4XE1WOo1CGTWjqmRZnWPdv0DoCw6BCFVaq
 8Iljsj2BWZ2HbyZYTgq6c836GUO+1cNCKY24FCFC3FBkuQbMnBr8Girz8+FZ9+mIJWgD
 OrgYazdVDm1cUUQfTrxr+a2yaaN6U7pVV3ID2Ia/V2/t0pliFKqF58FK+jef+rM9xHXp
 G/xAsKvl8Mjh/rIaFY3EZf3orrSwoeLYcw83E7eh9uEfRZvl8pp2FBNvgPwPuVg5u9LR
 VodoJN8YCM+vjZQsGMt9b0m3hcm5GAVt5Fmue9hB4M56hKRe5ZjONcueWhU3ys0f138A
 3gKw==
X-Gm-Message-State: AOAM532/T/XzLHCr7lVaNdUf79swW9QVEMf9WbaEkxVffMmlq2WUOJuB
 0c7pUUR0Osrh5ALstzLjXbuXhA==
X-Google-Smtp-Source: ABdhPJyUPZgwjS4wGEte0i7vATCyxhKkaNbcvSyv/AlwzZqne0dvhsrD9mp5zq7yjYCtC/F8sRmOQQ==
X-Received: by 2002:a05:6a00:8:b029:308:1d62:ba56 with SMTP id
 h8-20020a056a000008b02903081d62ba56mr27553764pfk.60.1624957524945; 
 Tue, 29 Jun 2021 02:05:24 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id nr12sm2303013pjb.1.2021.06.29.02.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 02:05:24 -0700 (PDT)
Date: Tue, 29 Jun 2021 14:35:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Hector Yuan <hector.yuan@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v12 1/2] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Message-ID: <20210629090522.jsiwkrki6lavo33z@vireshk-i7>
References: <1622307153-3639-1-git-send-email-hector.yuan@mediatek.com>
 <1622307153-3639-2-git-send-email-hector.yuan@mediatek.com>
 <20210614104058.jdwb7godqzhf7rgd@vireshk-i7>
 <1624781848.1958.16.camel@mtkswgap22>
 <20210628072641.amqk5d3svwolvhic@vireshk-i7>
 <20210628090956.uwkrozdqvawsm3xp@bogus>
 <20210629024719.nmcygaigtx5wn7g5@vireshk-i7>
 <20210629090238.n23zcttkiqvzpbb5@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629090238.n23zcttkiqvzpbb5@bogus>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_020525_759676_FE9739EE 
X-CRM114-Status: GOOD (  15.45  )
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

On 29-06-21, 10:02, Sudeep Holla wrote:
> On Tue, Jun 29, 2021 at 08:17:19AM +0530, Viresh Kumar wrote:
> > On 28-06-21, 10:09, Sudeep Holla wrote:
> > > Probably in driver/cpufreq or some related headers if it needs to access
> > > related_cpus and is more cpufreq related in that way ?
> >
> > It just needs to set a mask, so doesn't really depend on cpufreq. I
> > was wondering if drivers/opp/of.c may be used for this, and I am not
> > sure.
> >
> 
> Sounds good to me.

Okay.

Hector, add the routine to of.c in OPP core.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
