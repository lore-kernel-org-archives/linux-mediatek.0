Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B842C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 14:54:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B601622527
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 14:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fzk1lAHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B601622527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wcAGkC6qw3u9t0xLX5E9Dtjp0tz4gvhZWw7uzgvigA=; b=Fzk1lAHXiaVgQA
	G4aUZZf5ncMThBXHEpcbJF+7dh5ruDHB87YIqUWybfOwJR+qbBqpQtcOnlEnYKahiwhzTRFE0p3e+
	MCKp5h+80yRMPf2zxgw4bqd+jV5U3NlW3KmtCXzZ6Sys8oU8EBYh96gYL0SNZVn/aM+NvcWP95Hdj
	UZJ+duE12l8ljlDSSeZTZCFdEb1fFxEB58HSCPLyGUcXVDYtKp1b6FwqFsF7DyDcOrbEnTm3QMrHD
	yAG86Acc6qFjCyDC6uknS7RAI1pWI9k2R4TROrkEB1RXYYjwQm0zqbOp10521dwypyFmispl/4MYv
	6mBEVaATRJuH9VBtOhuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itYRJ-0005mD-5U; Mon, 20 Jan 2020 14:54:05 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itYQy-0005Z1-QU; Mon, 20 Jan 2020 14:53:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAFF530E;
 Mon, 20 Jan 2020 06:53:42 -0800 (PST)
Received: from [192.168.0.7] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FF8C3F52E;
 Mon, 20 Jan 2020 06:53:36 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: lukasz.luba@arm.com, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
Date: Mon, 20 Jan 2020 15:53:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200116152032.11301-2-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_065344_946093_66101D65 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, bjorn.andersson@linaro.org, bsegall@google.com,
 festevam@gmail.com, Morten.Rasmussen@arm.com, robh@kernel.org,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 shawnguo@kernel.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/01/2020 16:20, lukasz.luba@arm.com wrote:
> From: Lukasz Luba <lukasz.luba@arm.com>
> 
> Add support of other devices into the Energy Model framework not only the
> CPUs. Change the interface to be more unified which can handle other
> devices as well.

[...]

> -The source of the information about the power consumed by CPUs can vary greatly
> +The source of the information about the power consumed by devices can vary greatly
>  from one platform to another. These power costs can be estimated using
>  devicetree data in some cases. In others, the firmware will know better.
>  Alternatively, userspace might be best positioned. And so on. In order to avoid
> @@ -26,7 +28,7 @@ framework, and interested clients reading the data from it::
>         | Thermal (IPA) |  | Scheduler (EAS) |  |     Other     |
>         +---------------+  +-----------------+  +---------------+
>                 |                   | em_pd_energy()    |
> -               |                   | em_cpu_get()      |
> +               |  em_dev_get()     | em_cpu_get()      |

Looked really hard but can't find a em_dev_get() in the code? You mean
em_get_pd() ? And why em_get_pd() and not em_pd_get()?

>                 +---------+         |         +---------+
>                           |         |         |
>                           v         v         v
> @@ -47,12 +49,12 @@ framework, and interested clients reading the data from it::
>          | Device Tree  |   |   Firmware    |  |      ?       |
>          +--------------+   +---------------+  +--------------+

[...]

> +There is two API functions which provide the access to the energy model:
> +em_cpu_get() which takes CPU id as an argument and em_dev_get() with device
> +pointer as an argument. It depends on the subsystem which interface it is
> +going to use.

Would be really nice if this wouldn't be required. We should really aim
for 1 framework == 1 set of interfaces.

What happens if someone calls em_get_pd() on a CPU EM?

E.g:

 static struct perf_domain *pd_init(int cpu)
 {
-       struct em_perf_domain *obj = em_cpu_get(cpu);
+       struct device *dev = get_cpu_device(cpu);
+       struct em_perf_domain *obj = em_pd_get(dev);
        struct perf_domain *pd;

Two versions of one functionality will confuse API user from the
beginning ...

[...]

> +enum em_type {
> +	EM_SIMPLE,
> +	EM_CPU,
> +};

s/EM_SIMPLE/EM_DEV ?

Right now I only see energy models and _one_ specific type (the CPU EM).
So a tag 'is a CPU EM' would suffice. No need for EM_SIMPE ...

[...]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
