Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90E5C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BE5E60FC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BE5E60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NA1VeulaFOG1k0zBB9VkNo+4SUmKuCKOGzj71zjlXw=; b=KieY5QHltNgFuJ
	v5zLlQUfXCXYm/0qqrwXoW4Ee2bLLjFOD/Wmkk2CvGahk3z2quEjMZPb7otaYgAiMmLyyawUonJ8F
	ap9L4DMMuSiPd7Xs8l8qIH8GGsBK9b8yVEcEQEKNRvCkekX0mgzq0ZCUsTaOFrCh52mfyOLfD+VR1
	Y2GI8fL/2+iiLYM26TlPA4Y0Mo6wBF1QHxwebMAi+SVetLvGQsEnduD3M9HXQTLSKtkQGdSY8iwWt
	rnCoAlJT7k5ZDpVq/RQPBUULnf/+uYjIINl6oo58JDARTHa34J3LGln1YSYGVhT7VuqQ1UB3GZ3Ld
	CAG+hMWS8yf16oaV20EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkqJ-006Pqk-JD; Wed, 11 Aug 2021 09:48:11 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkes-006LNg-Cn
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 09:36:26 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso3791995pjb.1
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 02:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=J02656YR2Fe+Hj72RiSigwAaGmAyuf7/C51n8U6jOdY=;
 b=wxXAi1TAzSCXJ4QCDlmvMQ90aBtvPmzeF2vdBsrRB91gYbhARcpyzZfqnHoV4G2xNg
 VC24e1WDKeK4nD1bFXlgcjRNkZCt2bEojXrNOOtiMgnVDLZSA489i6baRAfgRRe5oIwo
 k29UcaiaX1PjrV5lKsYOfvc8V6bWqq3Ey8mg7DOycJQ9elkfHIjitqfBM7RdeNY4X6RQ
 KqqiU13RUPRjNFXs6tG5Yh95/J38x6x5phrwCwYSFSmjuuClGEd84rHeij+/Kyszpz2B
 g4lbXalMWU282IPf6r4BarnwBCb45ZcWtA43eB2xFUwvyAlttMZbSvBTXlhirVuOsHV9
 KMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J02656YR2Fe+Hj72RiSigwAaGmAyuf7/C51n8U6jOdY=;
 b=QkPgDwxzgEwkXPxvMCsvKf9hoeLqkakNNP33T+poSwx12MMB5kvwXSfjHXNrlmvFwR
 MDt51ieCbqsr9x++17pAj5z8DWtiRnnkoKHYPn4yoN4+WkynwV2DfAqhBUtidIAF1YNn
 wUNM4Xt54XtZdhw2vuW940PhvWEurvxCR25FwO30RNvooLpMKbEgTydQcZvZyM2Gc7p+
 qoV2kk4VtZ5LBSR4qquwiCx0W99CX+7hlScjDjpfT0sh0rZ0SdEr3Yrvrxa6YD0cFNxt
 uxhcA5tUpBF584NPhpxVRIeGZZzwkDiI687mZCXkCMIkP4dEfGyC4UdUuGL36Fj++KvP
 W+hg==
X-Gm-Message-State: AOAM533pySrT9QPVE04xJSdQXgUKgqna3MPgwcAFp0qQUB016bKmSjTM
 MC+DCmqwPQpSFh6xjbEgJ5wYTMB12oT0Hw==
X-Google-Smtp-Source: ABdhPJys+C5eNI9Pw3BvNOuNX3w2Mr6lTrvVQYtWv/q628SqQBf/F7vEkJNqmZGhccHk0WzM588r5g==
X-Received: by 2002:a17:90a:4a88:: with SMTP id
 f8mr9875619pjh.226.1628674581006; 
 Wed, 11 Aug 2021 02:36:21 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id 26sm32218359pgx.72.2021.08.11.02.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:36:20 -0700 (PDT)
Date: Wed, 11 Aug 2021 15:06:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210811093618.7ncznvblttk6hjlt@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <YROMZFHCor3pbhMr@google.com>
 <20210811091321.xtb776q4t6cwyanx@vireshk-i7>
 <YROZkbMEMAeXMt1W@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YROZkbMEMAeXMt1W@google.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_023622_471287_7D28AD18 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

On 11-08-21, 10:34, Quentin Perret wrote:
> Yep, it's not immediately obvious, but see how it sets the struct
> em_data_callback to point at _get_power() where the actual energy
> calculation is done. So strictly speaking _get_power() is what uses
> these routines, but it goes in hand with dev_pm_opp_of_register_em() so
> I guess the same reasoning applies.

My bad.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
