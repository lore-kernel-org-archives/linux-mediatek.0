Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76066C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 12:36:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D14960F11
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 12:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D14960F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMm2Xsws1ewES6YGgo0RWKketc7Y2Lfc2QKSW8dgp+0=; b=EJJys8xqJqnO70
	esGuAM1qjwlDGFuq6M61FKg3BzOzEej+Dkfy3sT/3TGxm6fDIF4MF4rimkqw3Hehz5COWNmARIE65
	fI810uaRWZUUlmknODuiCeE/wQU8GWvdyzkg/AeY8zamGvujwCAuMeCD7sj8OcA0/h2lnt+nHaS/Y
	bwcLNwKRQz0hVE26lgAQ1pTN72CMZm5djVPtebYzScLd8AP8k+0rlaSP1sYu+JRHfNysRnZBlUuSy
	LRKQDmao+iMxQM6/XvkHNUIjJJqrWU0HlXvTq9N7vJUX40G2yt2qfsqiJEO0sEmbQ7FQHnMwmwe09
	699Qf0cfBjsWHYVNmGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDQzG-003jOy-No; Tue, 10 Aug 2021 12:36:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDQz0-003jJy-S5
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 12:35:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b11so9911847wrx.6
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cXcVfaJa9gxQfqomI6BeLC46V441BROQ5crN/C0u7tQ=;
 b=aFsv3vr+XQ6POKdiOCpyItN/s1A3yD15/zjn5UostldN1x0iL5S1t/7EXoUl4mMz8Q
 8uowNLbyuG2VkEPcjjwnxbK6tW9BeU8zchx6GlPqOffGl7lbLoMYd2ECnz8EIIuFGAW4
 Rjt6Db4jWbDc7edO/2yn9cC82+Y6maFBe7ARMIb6MT9SB32P8lSW/xxLmi6ooVHg1n1R
 fWj5yHcEtOUtG6Zie4y9ktNsQrvGTNFnDBCFkPxHUKFMLVmRIrHiV6Yn7GSXi+ytpjxw
 UFqTo3igkPxFx/S9aTva5s6e+RD887u4ahF5QGcNM7fvB5Dfu3sNWWxy584kPwVotjxq
 cW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cXcVfaJa9gxQfqomI6BeLC46V441BROQ5crN/C0u7tQ=;
 b=mK1+ZgRCiPE8Rc7sTDB/5nUwAC00xq1FAkcYi3OcltTEEb+XIzNRJTHvki6PnT9BWm
 B9Yt4zU3TR5YLZHpesKvi2cbBC5hSA3VFDHNh1mCDhhG1qdVwhMCjcn+tXvOX+dBrqRD
 3NI9A0y5hmJjQKlIW6wRVgeQOrENVQVQLVjNKZ5C9p7O5M//2wPRL5u0C95P6jA0HyRu
 4nk0gTT/3pvfFhU3Y9f5z2nKN0iRCvrI3BMqEmQR8y+Pb3vLRbuxUuBAqdehJnchtJlI
 IthLtlNQFiWw1oJ3bE4EyiEUJhWVB6sKm151RJG2Q4p82NfgJnGv+BNQby4dHBbPpN1u
 5Zaw==
X-Gm-Message-State: AOAM530fvcLRQlA176aZJfuxtc6D4TWiFQtkfdKp/vqYrHrIA1RtEJIh
 HW35gGbHL6zjaWInpRienxBE/Q==
X-Google-Smtp-Source: ABdhPJyrxhF8E0q6i871koPqo7IgwEwcQPwaC+jYoSQxm92eBV0IEuOY/clY+5owwOhTp0yntrvIQw==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr30538552wrn.362.1628598945798; 
 Tue, 10 Aug 2021 05:35:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e920:cedf:a082:9d02])
 by smtp.gmail.com with ESMTPSA id 104sm23687271wrc.4.2021.08.10.05.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 05:35:45 -0700 (PDT)
Date: Tue, 10 Aug 2021 13:35:39 +0100
From: Quentin Perret <qperret@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Message-ID: <YRJym+Vn4bbwQzzs@google.com>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1628579170.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_053550_939764_84410C0F 
X-CRM114-Status: GOOD (  20.56  )
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

On Tuesday 10 Aug 2021 at 13:06:47 (+0530), Viresh Kumar wrote:
> Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
> with the EM core on their behalf.

Hmm, that's not quite what this does. This asks the cpufreq core to
use *PM_OPP* to register an EM, which I think is kinda wrong to do from
there IMO. The decision to use PM_OPP or another mechanism to register
an EM belongs to platform specific code (drivers), so it is odd for the
PM_OPP registration to have its own cpufreq flag but not the other ways.

As mentioned in another thread, the very reason to have PM_EM is to not
depend on PM_OPP, so I'm worried about the direction of travel with this
series TBH.

> This allows us to get rid of duplicated code
> in the drivers and fix the unregistration part as well, which none of the
> drivers have done until now.

This series adds more code than it removes, and the unregistration is
not a fix as we don't ever remove the EM tables by design, so not sure
either of these points are valid arguments.

> This would also make the registration with EM core to happen only after policy
> is fully initialized, and the EM core can do other stuff from in there, like
> marking frequencies as inefficient (WIP). Though this patchset is useful without
> that work being done and should be merged nevertheless.
> 
> This doesn't update scmi cpufreq driver for now as it is a special case and need
> to be handled differently. Though we can make it work with this if required.

Note that we'll have more 'special cases' if other architectures start
using PM_EM, which is what we have been trying to allow since the
beginning, so that's worth keeping in mind.

Thanks,
Quentin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
