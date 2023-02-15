Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DCAC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/ZeBJT4LegvDfhDkU4IYofAQ8RpmxB+JcbDeuOsmic=; b=qJVAwLBkjy56v9WaKpVX5Nbc0r
	J6OrSovgx1JKaeCZMe0f4hMFIzyMwbQvphlBuQhhZ2L/83cHNnTqna91eKSX5Y2+8V645besQO3D4
	hSiQZ9MZcL4qoOG84M48nDy4S895P86vcxOma6aF76ooqgjkhDRlTi9o9DBR/M3opBe1x7Yu6NfJa
	F9Mz7wQ0b2BfyBhgQv7lfSkcddmc8dqnVLGaoSP494JDznd0R/AbAzEopqokrTN9r7s5GLjBin/T4
	0FoHujuZ4eC3e+J6qL57+pRwfwoWzgUbGbREfelhLZ6JlqFspIPCl9XbZlqElHFIHt8PCqylYTZjB
	YwK7TXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHgm-005xTG-GN; Wed, 15 Feb 2023 13:19:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHgc-005xR3-JG; Wed, 15 Feb 2023 13:19:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98D091042;
	Wed, 15 Feb 2023 05:19:39 -0800 (PST)
Received: from bogus (unknown [10.57.10.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DD9F3F663;
	Wed, 15 Feb 2023 05:18:53 -0800 (PST)
Date: Wed, 15 Feb 2023 13:18:49 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	John Stultz <jstultz@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
	Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
Message-ID: <20230215131849.mcgz53jf24atialp@bogus>
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com>
 <20230214222021.k3tsfwezhnh7tdlx@bogus>
 <996b4e61-8486-d939-7367-1240b3c5c5fa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <996b4e61-8486-d939-7367-1240b3c5c5fa@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_051902_747632_5B113FDA 
X-CRM114-Status: GOOD (  30.57  )
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

On Wed, Feb 15, 2023 at 01:43:19PM +0100, AngeloGioacchino Del Regno wrote:
> Il 14/02/23 23:20, Sudeep Holla ha scritto:
> > On Tue, Feb 14, 2023 at 06:53:14PM +0800, walter.chang@mediatek.com wrote:
> > > From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > > 
> > > Make the timer-mediatek driver which can register
> > > an always-on timer as tick_broadcast_device on
> > > MediaTek SoCs become loadable module in GKI.
> > > 
> > > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > > ---
> > >   drivers/clocksource/Kconfig          |  2 +-
> > >   drivers/clocksource/timer-mediatek.c | 43 ++++++++++++++++++++++++++++
> > >   2 files changed, 44 insertions(+), 1 deletion(-)
> > 
> > [...]
> > 
> > > diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> > > index d5b29fd03ca2..3358758ea694 100644
> > > --- a/drivers/clocksource/timer-mediatek.c
> > > +++ b/drivers/clocksource/timer-mediatek.c
> > 
> > [...]
> > 
> > > +static const struct of_device_id mtk_timer_match_table[] = {
> > > +	{
> > > +		.compatible = "mediatek,mt6577-timer",
> > > +		.data = mtk_gpt_init,
> > > +	},
> > > +	{
> > > +		.compatible = "mediatek,mt6765-timer",
> > > +		.data = mtk_syst_init,
> > > +	},
> > > +	{
> > > +		.compatible = "mediatek,mt6795-systimer",
> > > +		.data = mtk_cpux_init,
> > > +	},
> > > +	{}
> > > +};
> > > +
> > > +static struct platform_driver mtk_timer_driver = {
> > > +	.probe = mtk_timer_probe,
> > > +	.driver = {
> > > +		.name = "mtk-timer",
> > > +		.of_match_table = mtk_timer_match_table,
> > > +	},
> > > +};
> > > +module_platform_driver(mtk_timer_driver);
> > > +
> > > +MODULE_DESCRIPTION("MediaTek Module Timer driver");
> > > +MODULE_LICENSE("GPL v2");
> > > +#else
> > >   TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
> > >   TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> > >   TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer", mtk_cpux_init);
> >
> > Why do you need these ? If this driver can work as a module, it can be
> > built-in module and doesn't need to be initialised early using of_timer_init
> > (can't recall the exact name)
> >
>
> Some platforms need early initialization; this is seen on ones for which the
> bootloader does not initialize the "CPUXGPT" timer, which is used as the ARM
> arch timer. (No, on those platforms you can't upgrade the bootloader, as it's
> signed with a OEM key which is not obtainable, and signature verified earlier
> in the bootchain).
>

Is this arm32 or arm64 platform? Do you mean that these platforms don't have
working architected timers ?

Quick grep suggests the below list of platforms/SoC:

 | arch/arm64/boot/dts/mediatek/mt6795.dtsi
 | arch/arm64/boot/dts/mediatek/mt8173.dtsi
 | arch/arm64/boot/dts/mediatek/mt8183.dtsi
 | arch/arm64/boot/dts/mediatek/mt8186.dtsi
 | arch/arm64/boot/dts/mediatek/mt8192.dtsi
 | arch/arm64/boot/dts/mediatek/mt8195.dtsi
 | arch/arm64/boot/dts/mediatek/mt8516.dtsi
 | arch/arm/boot/dts/mt7623.dtsi
 | arch/arm/boot/dts/mt7629.dtsi
 | arch/arm/boot/dts/mt8127.dtsi
 | arch/arm/boot/dts/mt8135.dtsi

All the above has architected timers and can have the other timer initialised
at module_initcall level.

 | arch/arm/boot/dts/mt2701.dtsi
 | arch/arm/boot/dts/mt6580.dtsi
 | arch/arm/boot/dts/mt6582.dtsi
 | arch/arm/boot/dts/mt6589.dtsi
 | arch/arm/boot/dts/mt6592.dtsi

The above ones have cortex-a7 but still don't have architected timers listed
in the DT. Anyways all use "mediatek,mt6577-timer", so except that other
2 can be dropped from the else and force them to be initialised later.

> As a matter of fact (and somehow obvious), on those platforms (for example,
> MT6795.. but many other as well, really), you *need* this driver to be
> built-in and, well, initialize the CPUX timer as early as possible :-)
>

Built-in is not a problem, you can still remove TIMER_OF_DECLARE as
the initialisation happens later at module_initcall level.

-- 
Regards,
Sudeep

