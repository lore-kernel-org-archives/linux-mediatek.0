Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847D6C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 09:43:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51032206F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 09:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x3Xo8NtH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcI55Yvo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51032206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PjhDnqHfyspyQr2DG+2xdbzIoJEodd/MmfSa4Sj0JWM=; b=x3Xo8NtH2pw1ma/tpssSHRxFz
	dsoAcyabP40l8M+zWDV0ag9b+Ty00hOVvyLVdNpv4djRPMW6ssH+F8N6i+MSmkgguqHyeWJ/rCJCQ
	7gzAxFJe8MGVXdho5QqiPjrHp+XzLIBhbL6Fkuhto5daOgodynE4+2+tGRuuLXLYX9J5R4dlvThmw
	R9bpnDXxnJitIKtsoNnnkdV7XIFy8vpy4OakSUN4byFh/SKFSYSSgrhOOMuI4f++uw5tmMfiP0AG6
	veMILDz22LpIiHGmk5xmOI6/SvaXrfhPGFNgi5yIgYZU8yTbGhqGOs3gYHpWUryEX0EBd3kulBNNo
	e8gMmkkAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juuz8-0001W7-FP; Mon, 13 Jul 2020 09:42:54 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juuz4-0001US-W0
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 09:42:51 +0000
Received: by mail-pl1-x644.google.com with SMTP id k4so5268988pld.12
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kucW4jxemtt/pXZ+E7AnSMC/PbTa/AsJZUR8UTzZMJ4=;
 b=lcI55YvoWw3tjd74BpYl3dOvn6cD8IGpI18wAuSDdfI4sk/yUrXuYryw5dMDR3ba1H
 wsDroptgzsdRf6HDnuuC9KtEUmxNLkSugmrrZZWJ+TrxRInGvzQu+V8U1KyCGsgmzQxz
 utd2+/BqJCDwDxIeA96VNW5V1m1uo/asivNCEOTBFLElvOGHzz5oKsGQpwERc+BFy2EJ
 tVygl8BjJ+ZYkfzJlScudQJmmd2ndfRU8setyiwGZRWSA7yS4TGV1osn/KyuhFmsufe5
 QoYRNH63+CWoFr39Gaeeza7qt7cIfKrbEIIgbUzn1Fny9/V/FPtfPgrwrwYUwxshYy9F
 RIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kucW4jxemtt/pXZ+E7AnSMC/PbTa/AsJZUR8UTzZMJ4=;
 b=ZleWlQFMYcA1TNcrDgQLE/Y62RJEKFJw+dsnMq5E2dTGKdXD86X42nWnrv+Osqjm10
 eMpfP3fc3DnE3JDfwyS56IYv8psh4/565ZcErBuPYu3vMsGuxDloQaxyIC1YagSiqUpZ
 j27DfJ44h+uKWcXPo5DvwvYYVhxtxIE81UrZQakieu9vz6ZznhehswQt4rSY2IPmeMkw
 Zc0KTDsGmNICYVLh0Dn3JyBH3M9wEhvSiwVtg48Dfvdi7cjGss8a4Fr2ubDESXMvTASF
 g0yQOoEp7h2bHkpH/zBQSSP8QEmplj5cyMi+5jxAjj2JZCYDO9YAQwEcp7iAhcxMZ3PF
 5fVg==
X-Gm-Message-State: AOAM530En8P6ddQDj6pPwdvmzSa3m8YdZ1Y605A6OLw21sqtwiqSItKV
 qGoGHTbhcnHcxpRgRArwy0fhmg==
X-Google-Smtp-Source: ABdhPJwSWiNCy4GMY/Ku2oHof1ytCHYjNesOLFGJYXH8bvQqNhWsN8dMZuvobXI86tTO3CgigTkIpw==
X-Received: by 2002:a17:902:e9d2:: with SMTP id
 18mr69294722plk.40.1594633368761; 
 Mon, 13 Jul 2020 02:42:48 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id h18sm6620431pfr.186.2020.07.13.02.42.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jul 2020 02:42:48 -0700 (PDT)
Date: Mon, 13 Jul 2020 15:12:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH v7 5/8] opp: Modify opp API, dev_pm_opp_get_freq(), find
 freq in opp, even it is disabled
Message-ID: <20200713094245.ktx3oj3i225r74qh@vireshk-i7>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1594348284-14199-6-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594348284-14199-6-git-send-email-andrew-sh.cheng@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_054251_060576_E8433C00 
X-CRM114-Status: GOOD (  18.69  )
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
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10-07-20, 10:31, Andrew-sh.Cheng wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> Modify dev_pm_opp_get_freq() to return freqeuncy
> even this opp item is not available.
> So that we can get the information of disable opp items.
> 
> Change-Id: I54dacf13050397f5080ccdb8b07d6220e7461e4e
> CR-Id:
> Feature:
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  drivers/opp/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index eed42d6b2e6b..5213e0462382 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -118,7 +118,7 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_voltage);
>   */
>  unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp)
>  {
> -	if (IS_ERR_OR_NULL(opp) || !opp->available) {
> +	if (IS_ERR_OR_NULL(opp)) {
>  		pr_err("%s: Invalid parameters\n", __func__);
>  		return 0;
>  	}

Please cleanup this patch for all the extra stuff that isn't required mainline
and send it again to me separately from this series.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
