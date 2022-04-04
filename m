Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRCSyrmy5TzgOEUjcnR9DW59wSJKuBIu1C7hNIJmR8A=; b=NuMoAmDsawGmTC
	Q2tt6f5rlIVzcIQ6Ok9NIf3gR8fX06mlhWWNafef4UfxTUH3o8Ze+G3H4Zg86MwpCb2CZjIJBkB33
	fd4fGzUBDbHYYQU67sc3nBLnZu/JmyNbONVA4NdQQZwHFc5qCftVfgkUggzbE5tl7jbZCJOdkObFz
	yY/f+p/6vAb+TXlLS53IgANOmxX5Y9TbUfuWHO1TLGEpUv4fqwJxygZVr+PjnifkRsRuXecADxd3q
	aZnkiJWcoPwPX7JYNPRmVj4xGPSWl+R70VSEjQNfx1LXDwznIZxCtq/w+y3ubEv/OX3siioyTJZqp
	H9jSUP9kB7wyo0qMo7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPDj-00FiSF-HL; Mon, 04 Apr 2022 16:06:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbPAa-00Fgl0-1M; Mon, 04 Apr 2022 16:03:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CFA21474;
 Mon,  4 Apr 2022 09:03:07 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6ED33F73B;
 Mon,  4 Apr 2022 09:03:06 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:03:05 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: Re: [RESEND][PATCH 8/8] powercap: DTPM: Check for Energy Model type
Message-ID: <YksWubveJv2ei2pp@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-9-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321095729.20655-9-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090308_201045_5AF3AB9F 
X-CRM114-Status: GOOD (  13.46  )
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

On Monday 21 Mar 2022 at 09:57:29 (+0000), Lukasz Luba wrote:
> The Energy Model power values might be artificial. In such case
> it's safe to bail out during the registration, since the PowerCap
> framework supports only micro-Watts.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/powercap/dtpm_cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index bca2f912d349..f5eced0842b3 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -211,7 +211,7 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>  		return 0;
>  
>  	pd = em_cpu_get(cpu);
> -	if (!pd)
> +	if (!pd || em_is_artificial(pd))
>  		return -EINVAL;
>  
>  	dtpm_cpu = kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>

> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
