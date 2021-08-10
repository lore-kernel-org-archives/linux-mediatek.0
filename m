Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A07C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 13:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6791F60C51
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 13:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6791F60C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8W52O0j0NPCOq1qD1TvDzWL77pFHBBhVWet5A7c28K4=; b=B0Cdmogk+40lnR
	BdvfwqaH+TOhplBvDY0h+V4CS8CaRXJT1FzTxeP6ZhrD7uleamBqRS//FzqNYqtB5KwZH8uVFugDf
	cx65c0YQ0seGmZLtOc8aBUxlQZAUW9FT6QQJuhS61eRO7tycArCjFSTlnwh4CkHxF2XjwQtBdxuwD
	6e2Aqi//CBQkmrOSeVrQkdoX+oLG73keQ1+HdKi+OCoNdN+7HGEoJ/r0aEt9iphZlkF6xxx3f68Dh
	xysmyrszicuh3ydCAGmzK+2jolj8MEf8q2ilsIb3BnN5PT36LjA3rOeIfapfH18g3rM4T5zhnr3xW
	53GyfLs4yktPftITCQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDSC8-0043Uh-L9; Tue, 10 Aug 2021 13:53:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDSC6-0043TS-E1
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 13:53:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q11so8207686wrr.9
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KGQUuCBolB3utTNPACMz6iKuWRDIGgWJm/VpB8UjVfc=;
 b=Lt1tyTHbI94Kgt8wK9nxBSF3jPgGselZKupAsXiBd6uILEZdcKhg5LYPO6QfrIiNvi
 DWrV2wRXXA01ZHs26Vovn0Uojl4XIZZFox4wswtHZgW6Xuxv9jpzdV5pcfkzcnB8xjO1
 TBhoaYhdFbcRFLb7zW+HVGuD9FiUQp4XHqAABpYgaKY4UU49KRmdSyW6Gl4SH0P13q5B
 Y8wnQ6tNXvOlirXy8jU6Jnp8ImOSwA01aM1IFV5xhXKnjxp2c/EBgSwL8wXkddc1RRFa
 eVi+aWY8EqcCcAi0Ux4F4hsXAxDQinpBrytVKz9rF1QrcnzQ3f3cxJ1deYdyTrUpm9FP
 u/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KGQUuCBolB3utTNPACMz6iKuWRDIGgWJm/VpB8UjVfc=;
 b=abUR/9x93qT8wWrs9+UYOSlhhE2aRJbHbTMq3r05VXGAm/CwF1aBTTPD1DcERuVMG6
 3/K9hBCBpLk1To3L86XVAAiQ6OQtktAmxBnlQTmYNI5seSp5cQBiK7ZPyrDv5MOyOHsc
 hShPcVlnUe6ThBwSmRgDoxfvsoMBrVPQJk3fXNrqw9BwCoZLqedTpPGErH8gpU4Vf9f3
 sMT10Kr/R1MaIDP2eqj6pmQ6bRPZJnJRjJ7MjYFEfb6uvieIrbv7ePf8QxblF7336yZy
 W7n3IpKUjmHxEbE7k7v/BmCXBsQwUEnKYjbUiJEiw16pXw7EuiXlhBJtmLX9WbJ9PQYs
 xxpA==
X-Gm-Message-State: AOAM530DbyEzB2We7SKZQD9x1dcHEVsA/IV+/bOuF4mMmcoGiesz0vpD
 VFK/ggiSpyuk9uYI8Z7VmTgr5Q==
X-Google-Smtp-Source: ABdhPJyP5/KLF9l16H0O6iAMcu4TdoATOhVCPzOX8vMqts7ssz/9ljckqMeKlqZVUnJFhD3xwJoprg==
X-Received: by 2002:a5d:660e:: with SMTP id n14mr13818163wru.346.1628603604443; 
 Tue, 10 Aug 2021 06:53:24 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e920:cedf:a082:9d02])
 by smtp.gmail.com with ESMTPSA id 18sm3305981wmv.27.2021.08.10.06.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:53:24 -0700 (PDT)
Date: Tue, 10 Aug 2021 14:53:18 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>,
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
Message-ID: <YRKEztjdIFU1J5/9@google.com>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <af06b333-3d8a-807c-9ccb-d491d6a54930@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af06b333-3d8a-807c-9ccb-d491d6a54930@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_065326_508342_FCD6F857 
X-CRM114-Status: GOOD (  13.55  )
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

On Tuesday 10 Aug 2021 at 14:25:15 (+0100), Lukasz Luba wrote:
> The way I see this is that the flag in cpufreq avoids
> mistakes potentially made by driver developer. It will automaticaly
> register the *simple* EM model via dev_pm_opp_of_register_em() on behalf
> of drivers (which is already done manually by drivers). The developer
> would just set the flag similarly to CPUFREQ_IS_COOLING_DEV and be sure
> it will register at the right time. Well tested flag approach should be
> safer, easier to understand, maintain.

I would agree with all that if calling dev_pm_opp_of_register_em() was
complicated, but that is not really the case. I don't think we ever call
PM_OPP directly from cpufreq core ATM, which makes a lot of sense if you
consider PM_OPP arch-specific. I could understand that we might accept a
little 'violation' of the abstraction with this series if there were
real benefits, but I just don't see them.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
