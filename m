Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD750C4320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 09:27:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D22860EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 09:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D22860EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kP9B8P+vMH382SGZSXGTGK87G7xE8vpsKms871k4OAk=; b=kz2ADVa6b+yGRH
	GwdhTy6PccYt4rP+UQme+ISqDTQTiB/mwQtcTD5wHsxrARgic+BSwH3bTlMQQDYGFIwgaDep8NvSY
	kLl+yZaqpHCtZYvIAppGhHmMGJmZsL/XQ7m8cze0nxRks9iMtBZ/o+6PGdO9/d5rY34A33YsBA9ty
	9JgPaIzAanUnn7qlnea8k4TVX3jyz4m+Rhw2Y7CW92ywXEpfRPOZtjCi6vDUvAVjDZec43Md0hQdi
	gMJ2ll7/yVqRZyqh/Ai8vkV/oaWtpYAzUfPTkK+UtqOt1a4wtPBHivN3+XkK7nu6CVVg85brhOWWF
	ZPOJQqyNUhYwvqtuNcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDO2e-003H5I-NV; Tue, 10 Aug 2021 09:27:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDO2O-003H23-Oq
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 09:27:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b7so360132plh.7
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NRaO485jOXyVF0oustzhSd8qBSdNJyzH3A7Z5Nbm+es=;
 b=EN4FC+Zy6qPz5ONRrMSzGs7f2d5IFWEHB+CKaGTlrSFl71+MmJb6AWQ7efO8d+ClIb
 pnmBW2qV3uz+YogPMJIOxazI0Bvoj1dCt91i+6XBfI4J8/HogjbdB3HsDTzg2BkBekw6
 8D0q7W44BuFzkyreb4V+5EVY8FveQYOjxevTlXLNu+I9rWg37oGRNiI9dnTyVA9wEaDy
 3ElJHf+wXX8SN/vvMyi3ziXGw8gJw6iFl6YHA0ajvLilryl5EKx6myt1uXEbG5leYYw6
 E8W2P8Ia8sL2uhsbmaxIi/vfz8yL3Oso9PVdHL+61zufIGdpF/RQ9nmb7wV0dxlDjdmJ
 vqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NRaO485jOXyVF0oustzhSd8qBSdNJyzH3A7Z5Nbm+es=;
 b=MM2bbHg/Z+VPOO/GqHBWLYvHVdKY7HDrNh+TyxJZS+QCl+17llx73gvxU1kYIZLB08
 hpWM4XGX3Ip8nAvKHxiJbp+zTz0Y3zMjIka0QgVFdTqlMozCAzsvfyFEEdG+ui2nRqa2
 w0JhRFyd0C4+de/1eBZhrMpZKXdtqo+D67fwU6MEPx5+Ha7oQtwr1Wzdz5g0ad02maEs
 47jeth5R0t29JhqXfOeEHVSdAPj/PYCZBcm7TGTKgTCQyZdQTAjapGcNgRjbIDtn6Og8
 RsVPrDbFIoFw+9MXZxoSEl1qpwc7orO6n0SKNS3OzcsXikauADVzfEktCxCZgeQch104
 SHkg==
X-Gm-Message-State: AOAM531lp9iNZoewKS1nkc53XpGz3sF5hl2BAW5VJFYzgv0fCzRVAFlz
 orqPl7Y5qBCGzxo0RikH064E5A==
X-Google-Smtp-Source: ABdhPJwxm9hbh/Alhve/g69Hlo8k1hc9s21FDYyYaBSZ0qimtlMyyJ1Zt5kIHCYm6CocEfwRNK9uGw==
X-Received: by 2002:a62:1e83:0:b029:3c8:ac32:3b41 with SMTP id
 e125-20020a621e830000b02903c8ac323b41mr19067962pfe.0.1628587627673; 
 Tue, 10 Aug 2021 02:27:07 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id d9sm21966486pfv.161.2021.08.10.02.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:27:07 -0700 (PDT)
Date: Tue, 10 Aug 2021 14:57:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: Andy Gross <agross@kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>,
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
Message-ID: <20210810092705.ctf43hwhzdepmcrv@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <6449a61f-a5fc-0b81-65b2-7bf77b8a71aa@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6449a61f-a5fc-0b81-65b2-7bf77b8a71aa@arm.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_022708_900669_6764F368 
X-CRM114-Status: GOOD (  25.83  )
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

On 10-08-21, 10:17, Lukasz Luba wrote:
> Hi Viresh,
> 
> I like the idea, only small comments here in the cover letter.
> 
> On 8/10/21 8:36 AM, Viresh Kumar wrote:
> > Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
> > with the EM core on their behalf. This allows us to get rid of duplicated code
> > in the drivers and fix the unregistration part as well, which none of the
> > drivers have done until now.
> 
> The EM is never freed for CPUs by design. The unregister function was
> introduced for devfreq devices.

I see. So if a cpufreq driver unregisters and registers again, it will
be required to use the entries created by the registration itself,
right ? Technically speaking, it is better to unregister and free any
related resources and parse everything again.

Lets say, just for fun, I want to test two copies of a cpufreq driver
(providing different set of freq-tables). I build both of them as
modules, insert the first version, remove it, insert the second one.
Ideally, this should just work as expected. But I don't think it will
in this case as you never parse the EM stuff again.

Again, since the routine is there already, I think it is better/fine
to just use it.

> > This would also make the registration with EM core to happen only after policy
> > is fully initialized, and the EM core can do other stuff from in there, like
> > marking frequencies as inefficient (WIP). Though this patchset is useful without
> > that work being done and should be merged nevertheless.
> > 
> > This doesn't update scmi cpufreq driver for now as it is a special case and need
> > to be handled differently. Though we can make it work with this if required.
> 
> The scmi cpufreq driver uses direct EM API, which provides flexibility
> and should stay as is.

Right, so I left it as is for now.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
