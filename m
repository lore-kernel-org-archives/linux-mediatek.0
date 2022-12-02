Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703DEC4321E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgZKVlX8mJZVYidqK5M73GMcS0SohrhprD5SzdTqO9U=; b=OzeVCJ7bxhMnLS
	YU8LWmSAdPvZ/hNVpkyDX2mlD3UlBa3wS1awt+z2yFnnYoUtnGClwN3g1Y1j0kgmwAjYiGokqfa0I
	bgjpG2HPnthtoeyB9LmKXACFCmTXtttmLg+MeQjEObdtzNkDzJv+GDlmujZ2rGVo17CbCYUk5lr76
	09qqUd7KwBzN/lHBk97i0eV37HF2EJ9Tqn+KSyioITP+abtat+KCLtLqK0FfvlcJNPcWXYlfAGmzG
	bUt5MzyNZa2mpNT0q/OmZe4M7nU3Nm8IEzgqdqNl/bN+xWbHNtk3CNMj6S6GBqY+QR2u28j0GDmTd
	F4xWwR02BR+4df5zwUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15IY-00GNS7-4P; Fri, 02 Dec 2022 12:37:46 +0000
Received: from mail1.systemli.org ([93.190.126.36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15IL-00GNMt-9z; Fri, 02 Dec 2022 12:37:35 +0000
Message-ID: <75216e0c-9d36-7ada-1507-1bb4a91a3326@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
	s=default; t=1669984648;
	bh=VgZKVlX8mJZVYidqK5M73GMcS0SohrhprD5SzdTqO9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OKlvyaKVTP6rTdMIXGrVpKU+rS+BYHRAm7/JDodazYINJMZ1W2N8UH9EtjrvTgcX0
	 yigXPcO8SGlrpsL6BFG6QDTpQZ9N3k/sQWfOczz0YAvYCkXOOJCNsa//dy6sY/4z9C
	 BrLIVJnT/PsfnCiRtn7ijhVM/0DsruXG5um1shac3ciCmvcO5IlibE9tvyHyHq4CiM
	 TpW3PHXPM+BQThl41Oht9nffLEEAtPdqtbNr1u8nfQTRUNLwS4SOe/uIMLTPbwOIaQ
	 GaxsXEryMId8/8pOzQSH3iUKCg8N6RpNslkgzxjrusxjacmymc3CsXOAFLO+WH5ZUr
	 wUsj1OlWVnIig==
Date: Fri, 2 Dec 2022 13:37:26 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] cpufreq: mediatek: Raise proc and sram max voltage for
 MT7622/7623
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 viresh.kumar@linaro.org
References: <20221202095227.167492-1-angelogioacchino.delregno@collabora.com>
From: Nick <vincent@systemli.org>
In-Reply-To: <20221202095227.167492-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_043733_512278_67BFEEFC 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: linux-pm@vger.kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, rex-bc.chen@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, jia-wei.chang@mediatek.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It now starts, however, with a lot of those messages (I applied the 
patch to linux/master and not to linux-next, because next is currently 
not compiling anymore for me):

> [   10.777041] cpufreq: __target_index: Failed to change cpu 
> frequency: -22
> [   10.791577] cpu cpu0: cpu0: failed to scale up voltage!
The complete log:
https://gist.githubusercontent.com/PolynomialDivision/267c83c7a21a359cbb4e8d99d0303201/raw/28d3568a26634bebef2d91ebe37fc5f76ae58add/mt7622-patch-cpufreq.log

Bests
Nick

On 12/2/22 10:52, AngeloGioacchino Del Regno wrote:
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
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 7f2680bc9a0f..f9a9f08c75c4 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -695,6 +695,15 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
>   	.ccifreq_supported = false,
>   };
>   
> +static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
> +	.min_volt_shift = 100000,
> +	.max_volt_shift = 200000,
> +	.proc_max_volt = 1360000,
> +	.sram_min_volt = 0,
> +	.sram_max_volt = 1360000,
> +	.ccifreq_supported = false,
> +};
> +
>   static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
>   	.min_volt_shift = 100000,
>   	.max_volt_shift = 200000,
> @@ -717,8 +726,8 @@ static const struct mtk_cpufreq_platform_data mt8186_platform_data = {
>   static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
>   	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
>   	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
> -	{ .compatible = "mediatek,mt7622", .data = &mt2701_platform_data },
> -	{ .compatible = "mediatek,mt7623", .data = &mt2701_platform_data },
> +	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
> +	{ .compatible = "mediatek,mt7623", .data = &mt7622_platform_data },
>   	{ .compatible = "mediatek,mt8167", .data = &mt2701_platform_data },
>   	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
>   	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },

