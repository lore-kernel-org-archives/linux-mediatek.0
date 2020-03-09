Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D37C10F27
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 14:15:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DB020675
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 14:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jirXss5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DB020675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDFu9DnZGcdVzKwQQYvRmqCpXfgJz5CWAM/a9J/EQiY=; b=jirXss5YDf8t3g
	2rNTTK/3RvyuQ8amtzzaNpgyb0Lq9Rs42UpjZQcXg+GY8YUtGSR/g3xXylyCV4Yi+23rIKM3d6mxZ
	+PZGorwJaUGJ9vcyDMLtPQc218jZF28eq2q2NlAY66toCjpAk8TqPHXI/PISKnvTEAAuJxzQAB1WK
	wRTnc9vdz8E9kqKzETkja+v7YQRZjLpBuRODyBec6GS5DHIIDQd3nGaWx+rH0EPgsrC3b+xGEToa3
	r404JnZu9b9+RCZvE+3gfMQMFjE5mYMUASok1Mbk2f43r1WzbFZOxfEG2rLWPqWbk4VCqNeJFJj6E
	xqmgYqCr4WqR+760oqgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBJC9-0002yU-0L; Mon, 09 Mar 2020 14:15:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBJBt-0002fO-Vp; Mon, 09 Mar 2020 14:15:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D4DE30E;
 Mon,  9 Mar 2020 07:15:27 -0700 (PDT)
Received: from [10.1.195.32] (e112269-lin.cambridge.arm.com [10.1.195.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C26743F67D;
 Mon,  9 Mar 2020 07:15:21 -0700 (PDT)
Subject: Re: [PATCH v4 4/4] drm/panfrost: Register devfreq cooling and attempt
 to add Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-5-lukasz.luba@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <9747ca5c-ba4c-521f-11c1-45ee6a5018e3@arm.com>
Date: Mon, 9 Mar 2020 14:15:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309134117.2331-5-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_071534_117319_F6B5E5E1 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: "nm@ti.com" <nm@ti.com>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "bsegall@google.com" <bsegall@google.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 Morten Rasmussen <Morten.Rasmussen@arm.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "amit.kucheria@verdurent.com" <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 Javi Merino Cacho <Javi.MerinoCacho@arm.com>,
 "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "mgorman@suse.de" <mgorman@suse.de>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "alyssa.rosenzweig@collabora.com" <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <Orjan.Eide@arm.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
 "qperret@google.com" <qperret@google.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "agross@kernel.org" <agross@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Sudeep Holla <Sudeep.Holla@arm.com>,
 "patrick.bellasi@matbug.net" <patrick.bellasi@matbug.net>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09/03/2020 13:41, Lukasz Luba wrote:
> Register devfreq cooling device and attempt to register Energy Model. This
> will add the devfreq device to the Energy Model framework. It will create
> a dedicated and unified data structures used i.e. in thermal framework.
> The last NULL parameter indicates that the power model is simplified and
> created based on DT 'dynamic-power-coefficient', voltage and frequency.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

LGTM!

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 413987038fbf..8759a73db153 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -105,7 +105,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	}
>  	pfdev->devfreq.devfreq = devfreq;
>  
> -	cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
> +	cooling = devfreq_cooling_em_register(devfreq, NULL);
>  	if (IS_ERR(cooling))
>  		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
>  	else
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
