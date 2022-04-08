Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D244BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tH6HHlElXPgN5r/KzO6UiTcgeFhdSV0coMD/qQiPqJE=; b=z+l8yThRYRQWzJ
	akVaMoksM1VxBv/KDsXTU9ex64a78ML2+kPFETJwMWZiLDtlhAqq2K9RDATAcYrxXE/i0zY/HF+NL
	AzsDV/Fz+MJF90SIMOnJ525NrANhtQ4D0qffgEHmDk3RJxgZ9iXAB3k0KGs4/YKr0mYc8ltNXlzxQ
	hppTBBlKynF7QlTwSaj+dbaDdoE9ximJBTOJENEU7vmR3Adng75cYBkmMttmZhoQwUl32p0ma7Ngt
	4h3EIwG52M9vJi28Agj3S5TGDFfCflfIesgg170Mqp+xxjcOyfq9qzp8ibiJT9muSxIYHnOgEZoJv
	sJkZr18qjmk+z+CL0bzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncorn-00HRDy-V0; Fri, 08 Apr 2022 13:41:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nconQ-00HOe2-6P; Fri, 08 Apr 2022 13:37:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CF8971F47188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425022;
 bh=foN9Js8TKOpOz/If2h614GmeHSY3KSVwFZkOVYq728w=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=Frs6uv4NmlFx2oJgHAGEtD/w4BHwRUoQ1hUb8mh+D0PHWnigVTLjRU7ZRkIazzBWO
 S/mW9lD53+qqYeB0P46Zcm0jOGXtgNUjtjagMW+09TQ5Od5gRk1D/8t7POyJxOSBfD
 ssNDcw4VqdvCN04dbNApsPWwE2m8Uw7NWDvqEbdkSQHDXtdbQ3aN8jsYhUkjhHk3Uk
 CSjnudVQTL37lGOLy5M/0EWIujdDwe3ytMqfxLPAQh+wRkzaMdMhzmJljORM1uacfK
 blua8Le4+QhzIlGapn2bePATWnFnKnK8j/qB6KI6MFP5KDNs4YXcIGSquYxG4jClw2
 L1tzt7VsZbBBg==
Message-ID: <3dade32c-4b46-351a-b3f9-d1fec16b603c@collabora.com>
Date: Fri, 8 Apr 2022 15:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 08/15] cpufreq: mediatek: Move voltage limits to
 platform data
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-9-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-9-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063704_450214_3533E040 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Voltages and shifts are defined as macros originally.
> There are different requirements of these values for each MediaTek SoCs.
> Therefore, we add the platform data and move these values into it.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 90 ++++++++++++++++++++----------
>   1 file changed, 61 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 1369da62780a..0be5609ee82e 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c

..snip..

> @@ -625,20 +649,27 @@ static struct platform_driver mtk_cpufreq_platdrv = {
>   	.probe		= mtk_cpufreq_probe,
>   };
>   
> +static const struct mtk_cpufreq_platform_data mtk_platform_data = {

I would prefer if you name this after the oldest SoC that is supported in this
driver, or after the IP version.

Example: if the oldest one is mt7622, then this should be mt7622_platform_data;
          if newer SoCs have got a different cpu frequency control IP, then we
          should have here something like
          mtk_v1_platform_data, mtk_v1_3_platform_data.

Please note that I didn't check release dates, so my reference to mt7622 is
purely casual.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
