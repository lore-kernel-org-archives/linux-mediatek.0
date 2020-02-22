Return-Path: <SRS0=+7pC=4K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D38C35641
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2020 00:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2F22072C
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2020 00:42:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLYGbO5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A2F22072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWsxv0+pYkxu1k0PtJ2ygX1gvAMZfXe42csl1Y7qIlk=; b=tLYGbO5JGAEh+o
	c0XMcpPhJ+ZhkosQntoBvzcHjBfMwa/D3PLmjZrhnK4utPZKFFkGGmIukb4J3PSv5LgyjrX298P6n
	s717PJrTfOdF3AI8dZ7r4Ekt7uIBbJ5Mm35Wgl1MdXJe3wXlFnq+pARg0rkx4FXD1P5uwfLyKQtq/
	hHaYKvGxTuereEHkymYbMCE1UF8/RPjvbef0NTyOuaOpuqGJ+o//xRkDRSf3Uhi6Ct9XTaQblnQcr
	i566qhUsVB4I0mhdtw7o8ptxlmHJ3Hh4J1s9u1DQKttLeEPfaiA6HjWwf716nS+AcgcJLU5Q1Yysb
	8ybBgtBBtwR3w6ntBpAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5IsD-0000X8-W7; Sat, 22 Feb 2020 00:42:25 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5Is1-0000Tu-Eh; Sat, 22 Feb 2020 00:42:19 +0000
Subject: Re: [PATCH v3 1/4] PM / EM: add devices to Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200221194731.13814-1-lukasz.luba@arm.com>
 <20200221194731.13814-2-lukasz.luba@arm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4ac6a187-1a09-335d-5c05-bf810ff81aaa@infradead.org>
Date: Fri, 21 Feb 2020 16:42:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221194731.13814-2-lukasz.luba@arm.com>
Content-Language: en-US
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 daniel@ffwll.ch, b.zolnierkie@samsung.com, s.hauer@pengutronix.de,
 rostedt@goodmis.org, matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com,
 airlied@linux.ie, javi.merino@arm.com, tomeu.vizoso@collabora.com,
 qperret@google.com, sboyd@kernel.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
One minor nit. Please see inline:

On 2/21/20 11:47 AM, Lukasz Luba wrote:
> Add support of other devices into the Energy Model framework not only the
> CPUs. Change the interface to be more unified which can handle other
> devices as well.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  Documentation/power/energy-model.rst     | 133 ++++----
> 
> diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
> index 90a345d57ae9..7576820664e5 100644
> --- a/Documentation/power/energy-model.rst
> +++ b/Documentation/power/energy-model.rst

> @@ -85,13 +89,20 @@ API.
>  2.3 Accessing performance domains
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> +There is two API functions which provide the access to the energy model:

   There are two

> +em_cpu_get() which takes CPU id as an argument and em_pd_get() with device
> +pointer as an argument. It depends on the subsystem which interface it is
> +going to use, but in case of CPU devices both functions return the same
> +performance domain.
> +


cheers.
-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
