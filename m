Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9758FC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 18:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lywUkrrpPvwsCTrXQ5X4uWZOLZyH8yEs2rcz6K44gI4=; b=jFxO0ZIfa5Zh+5XcaR+Bf1PXkD
	NFHd5L0mwd5ZXVSnfcKX/YgFXjCtf8uMWlC8lsztYeZ5Szz3YoMnOLUEE4kb3QNDh8ULpGNZjCRPe
	UUSUOso/3oHVgfpdG5Z1kNgJryf0qqt/LJBadomj3CtCPgEouRBYzC7TFQFvntO30bI43J/N5p570
	eMwiidz7Ip3tBYygsIcYtqerSg9j4n9eJLDkAFwClF3TAMpxFc0UcBq1Ig61apq9zb05Np8MMT8qF
	nUBOmzI/MUVLuW5NsCgzNAVux21PrJbiY+5ww33SIYj/s1qbu2q8unFlq9iaxYN5qURbl0j0ApeXK
	f8vrOTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q19sX-007SXt-0T;
	Mon, 22 May 2023 18:03:29 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q19sT-007SU1-0k;
	Mon, 22 May 2023 18:03:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1q19sC-00046b-1s;
	Mon, 22 May 2023 18:03:08 +0000
Date: Mon, 22 May 2023 19:03:00 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	hsinyi@google.com, Nick Hainke <vincent@systemli.org>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/4] cpufreq: mediatek: Raise proc and sram max
 voltage for MT7622/7623
Message-ID: <ZGuuVPCqgpUO6p0Q@makrotopia.org>
References: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
 <20230324101130.14053-5-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324101130.14053-5-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_110325_267734_7EB3003A 
X-CRM114-Status: GOOD (  26.27  )
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

Hi Jia-Wei,
Hi AngeloGioacchino,

On Fri, Mar 24, 2023 at 06:11:30PM +0800, jia-wei.chang wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> During the addition of SRAM voltage tracking for CCI scaling, this
> driver got some voltage limits set for the vtrack algorithm: these
> were moved to platform data first, then enforced in a later commit
> 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
> using these as max values for the regulator_set_voltage() calls.
> 
> In this case, the vsram/vproc constraints for MT7622 and MT7623
> were supposed to be the same as MT2701 (and a number of other SoCs),
> but that turned out to be a mistake because the aforementioned two
> SoCs' maximum voltage for both VPROC and VPROC_SRAM is 1.36V.
> 
> Fix that by adding new platform data for MT7622/7623 declaring the
> right {proc,sram}_max_volt parameter.
> 
> Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
> Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 764e4fbdd536..9a39a7ccfae9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -693,6 +693,15 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
>  	.ccifreq_supported = false,
>  };
>  
> +static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
> +	.min_volt_shift = 100000,
> +	.max_volt_shift = 200000,
> +	.proc_max_volt = 1360000,
> +	.sram_min_volt = 0,
> +	.sram_max_volt = 1360000,

This change breaks cpufreq (with ondemand scheduler) on my BPi R64
board (having MT7622AV SoC with MT6380N PMIC).
...
[    2.540091] cpufreq: __target_index: Failed to change cpu frequency: -22
[    2.556985] cpu cpu0: cpu0: failed to scale up voltage!
...
(repeating a lot, every time the highest operating point is selected
by the cpufreq governor)

The reason is that the MT6380N doesn't support 1360000uV on the supply
outputs used for SRAM and processor.

As for some reason cpufreq-mediatek tries to rise the SRAM supply
voltage to the maximum for a short moment (probably a side-effect of
the voltage tracking algorithm), this fails because the PMIC only
supports up to 1350000uV. As the highest operating point is anyway
using only 1310000uV the simple fix is setting 1350000uV as the maximum
instead for both proc_max_volt and sram_max_volt.

A similar situation applies also for BPi R2 (MT7623NI with MT6323L
PMIC), here the maximum supported voltage of the PMIC which also only
supports up to 1350000uV, and the SoC having its highest operating
voltage defined at 1300000uV.

If all agree with the simple fix I will post a patch for that.

However, to me it feels fishy to begin with that the tracking algorithm
tries to rise the voltage above the highest operating point defined in
device tree, see here:

6a17b3876bc830 drivers/cpufreq/mediatek-cpufreq.c (Jia-Wei Chang              2022-05-05 19:52:20 +0800 100)    new_vsram = clamp(new_vproc + soc_data->min_volt_shift,
6a17b3876bc830 drivers/cpufreq/mediatek-cpufreq.c (Jia-Wei Chang              2022-05-05 19:52:20 +0800 101)                      soc_data->sram_min_volt, soc_data->sram_max_volt);

However, I did not investigate in depth the purpose of this
initial rise and can impossibly test my modifications to the
tracking algorithm on all supported SoCs.


Cheers


Daniel


> +	.ccifreq_supported = false,
> +};
> +
>  static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
>  	.min_volt_shift = 100000,
>  	.max_volt_shift = 200000,
> @@ -724,8 +733,8 @@ static const struct mtk_cpufreq_platform_data mt8516_platform_data = {
>  static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
>  	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
>  	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
> -	{ .compatible = "mediatek,mt7622", .data = &mt2701_platform_data },
> -	{ .compatible = "mediatek,mt7623", .data = &mt2701_platform_data },
> +	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
> +	{ .compatible = "mediatek,mt7623", .data = &mt7622_platform_data },
>  	{ .compatible = "mediatek,mt8167", .data = &mt8516_platform_data },
>  	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
>  	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
> -- 
> 2.18.0
> 
> 

