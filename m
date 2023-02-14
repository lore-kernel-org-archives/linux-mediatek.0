Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6FDC05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 22:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGnA9jwDaDDLSr1eBeIR/5J4TwbRXrY/EA9j1cSV0VI=; b=skmybW62fyh5ddkOoHf933jsHO
	dbVDHY8tkZVAiDULvAZjlAjccYWdF+Xi6rs2Vkbzcfgnh+SPDG8qVNeH8x6ePg0vcVwN+yk6Z03a3
	1vwuw1//TVejjlZ3s7C8mUKlrBVIrDh2IOo/Js6vf8DBcyngvHfi8ZNXPpvtRha+rh2/hzQDdI2NG
	t+DnqQr1NDWfZly9hqEIAGAKo7P8SDXsR3pIYrlw6qfkAFOT+VCJJplQlRatzoUfWybxMm7890NcH
	k4x+5ndamZaWWYFYi86sHU/mwQzOn+RYFmSOVbLjLvBnSsPX7zbDiAdEJ/Dcve8cAxSF8QwokgeEc
	zJnxWDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS3fN-003lHv-9V; Tue, 14 Feb 2023 22:20:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS3f8-003lEu-Cx; Tue, 14 Feb 2023 22:20:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45ADFFEC;
	Tue, 14 Feb 2023 14:21:11 -0800 (PST)
Received: from bogus (unknown [10.57.10.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0F13F663;
	Tue, 14 Feb 2023 14:20:24 -0800 (PST)
Date: Tue, 14 Feb 2023 22:20:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: walter.chang@mediatek.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	John Stultz <jstultz@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
	Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
Message-ID: <20230214222021.k3tsfwezhnh7tdlx@bogus>
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214105412.5856-5-walter.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_142034_528010_A88A1204 
X-CRM114-Status: GOOD (  17.76  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 14, 2023 at 06:53:14PM +0800, walter.chang@mediatek.com wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Make the timer-mediatek driver which can register
> an always-on timer as tick_broadcast_device on
> MediaTek SoCs become loadable module in GKI.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  drivers/clocksource/Kconfig          |  2 +-
>  drivers/clocksource/timer-mediatek.c | 43 ++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)

[...]

> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index d5b29fd03ca2..3358758ea694 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c

[...]

> +static const struct of_device_id mtk_timer_match_table[] = {
> +	{
> +		.compatible = "mediatek,mt6577-timer",
> +		.data = mtk_gpt_init,
> +	},
> +	{
> +		.compatible = "mediatek,mt6765-timer",
> +		.data = mtk_syst_init,
> +	},
> +	{
> +		.compatible = "mediatek,mt6795-systimer",
> +		.data = mtk_cpux_init,
> +	},
> +	{}
> +};
> +
> +static struct platform_driver mtk_timer_driver = {
> +	.probe = mtk_timer_probe,
> +	.driver = {
> +		.name = "mtk-timer",
> +		.of_match_table = mtk_timer_match_table,
> +	},
> +};
> +module_platform_driver(mtk_timer_driver);
> +
> +MODULE_DESCRIPTION("MediaTek Module Timer driver");
> +MODULE_LICENSE("GPL v2");
> +#else
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>  TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
>  TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer", mtk_cpux_init);

Why do you need these ? If this driver can work as a module, it can be
built-in module and doesn't need to be initialised early using of_timer_init
(can't recall the exact name)


-- 
Regards,
Sudeep

