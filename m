Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8AFC2D0C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 06:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E8A8206D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 06:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cjkn3YQ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKWS+sYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E8A8206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30GLPwAvAgQ7YLTNd0Noha5h2r1Aw2FS8DAwmZhqUNI=; b=Cjkn3YQ2LWTaOG
	p9YzJTa4wlfhxkkfs9u/1mChjfzItNAmIt9pUzJaChwMiGgqofMdmJBgTM9vj/5BrzVa9rrW2tyw8
	k68rvV00NJVgK4U3ewKg0vDuH8wJViTakYxDWBIkxVnVu2R0nmtj7blOEUxRkxWG7E9kLu1IiKxa4
	Jy75JtudaQuqTFzm8azsFyy0TS/vp0t0m6RvTnt9wPevU2FoM/naWcwVFfVkjAIc067iq8XUL4apf
	sz6l/frDNb5MsFQaelwGBSTbvSVOfH/u9Yd8CgIbE81b4OqJJhu+i0T9G3Rwm4HQ5iQ2mR+mN0Qee
	3tEHhjBDAZzu0wGstbSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieZF5-0007HZ-TX; Tue, 10 Dec 2019 06:43:31 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieZEw-00079I-Ja
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 06:43:24 +0000
Received: by mail-pj1-x1042.google.com with SMTP id z21so6968833pjq.13
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Dec 2019 22:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BEsOQpnU2Fph1cy4J7fXWqX+qA8/k32HrrzkPViDr9g=;
 b=rKWS+sYVsja9k0hTYRx7AD3FmdiYxmyDQegsZbxb9XSsVmjse2VRHmD+zciVbY9xfd
 Df1mS1W9/8ZsA4GVQIWMK851Wpq/RDC1D7KDrTFZD7tNqf0pzshtKjLPJfHkL3c5Fs+z
 PUsrAKqyP1GkR+Vh2SA8as16BNtsRfBKNmqdp/t3/i2dbbVGTQqsYIpsYfHxDrMiX+L0
 zTE4tXxRLhskmHL/IrAXD3zA8kxQ/IsiTVimAe7BYhO6yxeMPhXSOwmdvgnsu2dJo0pD
 6yfz739bpjiHyJe9zckZeSWxbYYVdFEDPIPWjJjYRZ+GRkTFoainVrKadvRc5Lx22kxI
 4uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BEsOQpnU2Fph1cy4J7fXWqX+qA8/k32HrrzkPViDr9g=;
 b=SfrG699CO13JyfpHNF9qsKwgDc+rjAPEfl/JL7cg6S3qphPMzebU+LAc3sw+JljFuq
 3zv3e+r8ZhJ9Xu1PJbAHF48S1rY8jLb1hnvcLbR7VR0PLVxOTGlY8OuZFYEvfbUnba/+
 Lzrv85bAY750RvHvT9ZadVSe7nt6suiDGT5SjwCgB/T2A1YEpOfd9xQ6fA+vXem+h0iU
 iEAW/R3JLmBjNRPd01sNvO+qsK/lHaF6maiBIVY7tSjz5l9c3M6j6tCMHV3Gwjbjn9Js
 66ylDIRv0enI/hbTSsNg8F+BMJWxjgGK0LqIPYDvagGhInLq9tC6WN0TKLUYnYAYHEnu
 GSOw==
X-Gm-Message-State: APjAAAXyDHT0HqybszBhrOJCX2h02AXgMxn8acChqVR91fr49c3FTvL1
 4geSpVpkD0fEOkfJvXpt2d/Mmg==
X-Google-Smtp-Source: APXvYqwmAHfbEzPNm/4WgwvG4FJ85rMoFfIuvn1FMXhgED7o/6LqgNh4zD7c3ekP+QYYweyaLz2cHQ==
X-Received: by 2002:a17:902:6b49:: with SMTP id
 g9mr34119958plt.156.1575960201667; 
 Mon, 09 Dec 2019 22:43:21 -0800 (PST)
Received: from localhost ([122.171.112.123])
 by smtp.gmail.com with ESMTPSA id s7sm1509431pjk.22.2019.12.09.22.43.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 22:43:20 -0800 (PST)
Date: Tue, 10 Dec 2019 12:13:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "andrew-sh.cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [v5, PATCH 4/5] cpufreq: mediatek: add opp notification for SVS
 support
Message-ID: <20191210064319.f4ksrxozp3gv4xry@vireshk-i7>
References: <1574769046-28449-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1574769046-28449-5-git-send-email-andrew-sh.cheng@mediatek.com>
 <20191127083619.etocnhpyyut3hzwq@vireshk-i7>
 <1575874588.13494.4.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575874588.13494.4.camel@mtksdaap41>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_224322_680213_A99DBB7E 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, fan.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09-12-19, 14:56, andrew-sh.cheng wrote:
> On Wed, 2019-11-27 at 14:06 +0530, Viresh Kumar wrote:
> > On 26-11-19, 19:50, Andrew-sh.Cheng wrote:
> > > +		if (!IS_ERR(opp_item))
> > > +			dev_pm_opp_put(opp_item);
> > > +		else
> > > +			freq = 0;
> > > +
> > 
> > What is the purpose of the above code ?
> When dev_pm_opp_find_freq_ceil() doesn't find matching opp item, freq
> value won't be set.
> Set it as 0 for below checking
> > 
> > > +		/* case of current opp is disabled */
> > > +		if (freq == 0 || freq != info->opp_freq) {
> > > +			// find an enable opp item
> > > +			freq = 1;
> > > +			opp_item = dev_pm_opp_find_freq_ceil(info->cpu_dev,
> > > +							     &freq);
> > > +			if (!IS_ERR(opp_item)) {
> > > +				dev_pm_opp_put(opp_item);
> > > +				policy = cpufreq_cpu_get(info->opp_cpu);
> > > +				if (policy) {
> > > +					cpufreq_driver_target(policy,
> > > +						freq / 1000,
> > > +						CPUFREQ_RELATION_L);
> > 
> > Why don't you simply call this instead of all the code in the else
> > block ?
> These else code is used to check "current opp item is disabled or not".
> If not, do nothing.
> If current opp item is disabled, need to find an not-disabled opp item,
> and set frequency to it.

Right. So this notifier helper of yours receive the opp which is getting
disabled, why don't you compare its frequency directly to see if the current OPP
is getting disabled ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
