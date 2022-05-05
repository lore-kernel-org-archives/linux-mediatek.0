Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A92C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuNuxg8Ky0OmF7L3x/UmUnnhmXkn8dP4jh1gZKM4yEE=; b=334NhEmQet0Y50
	H+vsfKeGMK6JIpvy+6VCj5OsRmYkDD8DKDzBuX891ChQmiw7RcZEq6cKTnoMRghGaAXRX4KyEBzxC
	L1Oitr6MMnENLhr2G6M4mrr+BLhjZfKfG+wlS8VYRsweZ16wD3wT8manItGwOhdgga/6zrJpBIgDr
	oWv/ZgnqrNHmfwY4rotXzg6Fm2iDZWg061zhMWmPG8/BJOnGb8IxC2YORuGoOyVs36cbvUhzxhr1s
	pjRoFdU13vMXdoG8d3sTwRQAMUQKo97orPLdopmaN0YlivsBjmxIekcDKqmIlJAuZ9Ego+LWx+llW
	TB1ypUQ2nWUj2jL0zCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmY3W-00F6NK-89; Thu, 05 May 2022 09:45:54 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmY3T-00F6Lp-Tz
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 09:45:53 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so7560131pjq.0
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 02:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Xd+tFU4G6DiHT7gIjy4KKIDQKgemXk6bnmPVHdW1sAc=;
 b=qnlHZ+v6nzaiWZnsSkygEbiKNIGLS53iBtlot9+8u+KvtVnyMzeKoOksnY+xVHxKrT
 Lz9CpGjYrEpC/QZm9KT19CItp17cgx9gnp66neRlQzxRR72//DpI7C2PjnWDdxmn6+xL
 VB/f84cTCRcZtYxzRUtQRuth4nPhqyvZpgTlxP3bTcSy6JwuA1TDmdWaBdqfc3WcpXgn
 njlIJ3XWnXC8lRMus63hIKZygsLUiOFbtjF2OFwogfhZtcexsS7PSwgZKTCYHXraU4pA
 JJ5+KORlvZ6bAevhfRsviXyvZxUmJtCleiEb8C0sDrgfGL08z2Zv4uTbc1sNH4wiCMM0
 /ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xd+tFU4G6DiHT7gIjy4KKIDQKgemXk6bnmPVHdW1sAc=;
 b=5OfrecOFDQA0UMV7ygWLqNcB4A1V4oT7wYd9+tACgC0q7psvH6sF2iG0xFeCPLddnJ
 yzvJ2MVg2NJgWAvFVhECt/WIw6uuEzqKP2HEhNYGIg4c8EnpaK0koJkEOSqu+UvwTL0w
 pW+79oryyMSvGcvYU6eRp10GXNnrU3NLdyk2aY0CyqoJoEPXrEUte8VFlJF2XP8HEfrc
 pg0UyBaDBbfA/PppOKxrf6/yGsQZczmzV6iIMk2WmGwIjN+rNkYnEHq60IIB0LQU65W/
 j4zfO978dCj7czSMs7NnmnLKyn9O+GkJpdd5QGPf7KdALE15Lh73stCfO5yG3Wv5wvfM
 bJqA==
X-Gm-Message-State: AOAM530wbaxJ8qByOKBNG2cT2cF5IVzgYXP/U4vq4jUu/EUifyWXPn4d
 yuBiEDIAtG4FxbZ6R+4II34rrzjO7FK1IQ==
X-Google-Smtp-Source: ABdhPJxhUO8FQ8vO2QKxlT51BGpwvAlvoIbwqpuo53kcnys/cWG/navnqZwc2uKd+K7E2NDJU85rDQ==
X-Received: by 2002:a17:902:a987:b0:158:b020:e5b8 with SMTP id
 bh7-20020a170902a98700b00158b020e5b8mr26451166plb.103.1651743950207; 
 Thu, 05 May 2022 02:45:50 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 f18-20020a63f112000000b003c14af50603sm859049pgi.27.2022.05.05.02.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:45:49 -0700 (PDT)
Date: Thu, 5 May 2022 15:15:47 +0530
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
Message-ID: <20220505094547.skkwuthq454ajo7l@vireshk-i7>
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
 <CAKfTPtDbsd+RLwY+0ZfnNWkQD+jOHmoX2K+ZfsOMnEH81ouVjw@mail.gmail.com>
 <20220505074408.ayzmd5kdbw2fagbq@vireshk-i7>
 <CAKfTPtCuJGsrsBJ2jACr_YeKN3RXNVMkgRgo+cw9t7CAyGwHWQ@mail.gmail.com>
 <20220505082801.oks7ko2sbqazyenn@vireshk-i7>
 <CAKfTPtCfKBiQkghY6gw+sSYYOXFRWMZNXsr64Vn5G-Oo1HF8ew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKfTPtCfKBiQkghY6gw+sSYYOXFRWMZNXsr64Vn5G-Oo1HF8ew@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_024552_043801_17D5D361 
X-CRM114-Status: GOOD (  21.53  )
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

On 05-05-22, 11:40, Vincent Guittot wrote:
> On Thu, 5 May 2022 at 10:28, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 05-05-22, 10:21, Vincent Guittot wrote:
> > > Part of your problem is that cpufreq use khz whereas clock uses hz
> >
> > Not in this case at least as the value mentioned in OPP table DT is in
> > Hz.
> 
> But dev_pm_opp_init_cpufreq_table make it kHz anyway

Yes.

> > > Would it be better to do something like below in cpufreq_generic_get
> > >
> > > (clk_get_rate(policy->clk) + 500) / 1000
> > >
> > > so you round to closest instead of always floor rounding
> >
> > That would be a fine thing to do anyway, though I am not sure if it
> > will fix the problem at hand.
> >
> > If the hardware returns 499,999,499 Hz, we will still have the
> > problem.
> 
> But in this case, cpufreq table should use 499,999Khz IMO.

I did think about it earlier, but then left it.

> We already
> have OPP/cpufreq table being updated at boot with actual value.

I don't think we update the frequency values there yet, but yes one
way to fix it is via DT.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
