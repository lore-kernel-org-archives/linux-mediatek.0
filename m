Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B18C4320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 08:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC2B46101B
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 08:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC2B46101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ds5TxU+IsVn+O9BSZPmqiR/lscZu+KVKLwU2h1YnHdk=; b=ydnFEqOGFeFQQW9J2x+1V4ZTtv
	w15oUOGmEw7bSZlrWaRbo6xBYtEucclUmm8j29Ql3Csw5WyRn5WkQb/MtJ9DhPmhKQEF/QduSkJnL
	dvXyh8MT9Rq6KFAPTkQ8JiRBvI89+wf6No1nLgwHhItE0dLWwhguEyXXM9QMD3Q71OFPe+sCHKwQ5
	vL/+d99ZjBGmy1fT7hVisihjPBGKxmZXff8xdKviYFmiq+OsVq1hMKM7viZMwabqmhXcQb+hpYjWc
	Es7H7tbO3Px49DmwBCS1B3gooq4vIwgDB6a8ALr2UfPstdlTD1VEj99yuZ3BwVkD1sNUMi9TfbIww
	m8FGLfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKzY0-001qUQ-PG; Tue, 31 Aug 2021 08:55:12 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKzXf-001qNU-Jk; Tue, 31 Aug 2021 08:54:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 803EB1FB;
 Tue, 31 Aug 2021 01:54:44 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FE993F5A1;
 Tue, 31 Aug 2021 01:54:40 -0700 (PDT)
Subject: Re: [PATCH V3 0/9] Add callback to register with energy model
To: Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki
 <rjw@rjwysocki.net>, Vincent Donnefort <vincent.donnefort@arm.com>,
 lukasz.luba@arm.com, Quentin Perret <qperret@google.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
References: <cover.1628742634.git.viresh.kumar@linaro.org>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <3d5b823f-259a-8fc6-27ab-2a5d5df89844@arm.com>
Date: Tue, 31 Aug 2021 10:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1628742634.git.viresh.kumar@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_015451_750957_4839DA69 
X-CRM114-Status: GOOD (  16.42  )
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

On 12/08/2021 06:35, Viresh Kumar wrote:
> Many cpufreq drivers register with the energy model for each policy and
> do exactly the same thing. Follow the footsteps of thermal-cooling, to
> get it done from the cpufreq core itself.
> 
> Provide a new callback, which will be called, if present, by the cpufreq
> core at the right moment (more on that in the code's comment). Also
> provide a generic implementation that uses dev_pm_opp_of_register_em().
> 
> This also allows us to register with the EM at a later point of time,
> compared to ->init(), from where the EM core can access cpufreq policy
> directly using cpufreq_cpu_get() type of helpers and perform other work,
> like marking few frequencies inefficient, this will be done separately.
> 
> This is build/boot tested by the bot for a couple of boards.
> 
> https://gitlab.com/vireshk/pmko/-/pipelines/351965580
> 
> FWIW, I have queued up the series for linux-next to get more testing, but your
> reviews are welcome. Thanks.
> 
> V2->V3:
> - Drop the auto-register part from all logs, this isn't called auto registration
>   anymore.
> - Call register_em() only for new policies.
> - Update scmi driver to register with EM only when required.
> - Add Rby tags.

LGTM. Tested on TC2 (vexpress-spc), Juno-r0 (scpi-cpufreq and scmi).

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
