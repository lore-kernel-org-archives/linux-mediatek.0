Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D10CDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9tNHPWgRsAueZ0n5MJ0TB0ur/2w43clNlJm9OakSV4=; b=j/dPDLYCjBwKpFzyOeY9b0qf/u
	DG2QtQlozZN/a0IP6cz8TCZqbMmmHsz2RMVc/hBaiBdS7DJQo6oiQhkdIKgFZrRzdqHnmmGTQykV/
	Nf3mnCH57XKDLUL6pbSDTOYvB4CidYKDc9KnOW8rLIygaq6KEnVeOrUUDThndy9xYBNVns+NxZLXT
	Kz5tRKk4EGjKHbt3HjgkywetgAZehotqBN3LoVjltN1uAAyHwhI4iPsVzGVrykhhsIVakaaKsst+r
	ua/ed6/4nHRYgerYX4KuXuu9LOamsl8Y7TkIPlYbfLFqxTjt8/EbvgDj1QR19o3rwXI0qg1TevBmT
	T7jidkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4PP-00EVvo-13;
	Wed, 18 Oct 2023 11:08:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4PK-00EVu6-38;
	Wed, 18 Oct 2023 11:08:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AC202F4;
	Wed, 18 Oct 2023 04:08:49 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.67.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 613D13F762;
	Wed, 18 Oct 2023 04:08:06 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:08:03 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] irqchip/gic-v3: Remove Mediatek pseudo-NMI firmware
 quirk handling
Message-ID: <ZS-8k22ZWgn5hcCd@FVFF77S0Q05N>
References: <20231006151547.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
 <20231006151547.3.Ie582d33cfe46f9ec2248e7f2dabdd6bbd66486a6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006151547.3.Ie582d33cfe46f9ec2248e7f2dabdd6bbd66486a6@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_040811_320905_54283849 
X-CRM114-Status: GOOD (  24.44  )
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

On Fri, Oct 06, 2023 at 03:15:53PM -0700, Douglas Anderson wrote:
> This is a partial revert of commit 44bd78dd2b88 ("irqchip/gic-v3:
> Disable pseudo NMIs on Mediatek devices w/ firmware issues"). In the
> patch ("arm64: Disable GiC priorities on Mediatek devices w/ firmware
> issues") we've moved the quirk handling to another place and so it's
> not needed in the GiC driver.
> 
> NOTE: this isn't a full revert because it leaves some of the changes
> to the "quirks" structure around in case future code needs it.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

I think it might make sense to fold this into the patch adding the cpucap
detection. Otherwise, if you apply my suggestions to the first patch, there's a
2-commit window where we'll have two places that log that NMI is being disabled
due to the FW issue. That's not a functional issue, so doesn't matter that
much.

Either way:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> 
>  drivers/irqchip/irq-gic-v3.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 787ccc880b22..9ff776709ae6 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -39,8 +39,7 @@
>  
>  #define FLAGS_WORKAROUND_GICR_WAKER_MSM8996	(1ULL << 0)
>  #define FLAGS_WORKAROUND_CAVIUM_ERRATUM_38539	(1ULL << 1)
> -#define FLAGS_WORKAROUND_MTK_GICR_SAVE		(1ULL << 2)
> -#define FLAGS_WORKAROUND_ASR_ERRATUM_8601001	(1ULL << 3)
> +#define FLAGS_WORKAROUND_ASR_ERRATUM_8601001	(1ULL << 2)
>  
>  #define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
>  
> @@ -1790,15 +1789,6 @@ static bool gic_enable_quirk_msm8996(void *data)
>  	return true;
>  }
>  
> -static bool gic_enable_quirk_mtk_gicr(void *data)
> -{
> -	struct gic_chip_data *d = data;
> -
> -	d->flags |= FLAGS_WORKAROUND_MTK_GICR_SAVE;
> -
> -	return true;
> -}
> -
>  static bool gic_enable_quirk_cavium_38539(void *data)
>  {
>  	struct gic_chip_data *d = data;
> @@ -1891,11 +1881,6 @@ static const struct gic_quirk gic_quirks[] = {
>  		.compatible = "asr,asr8601-gic-v3",
>  		.init	= gic_enable_quirk_asr8601,
>  	},
> -	{
> -		.desc	= "GICv3: Mediatek Chromebook GICR save problem",
> -		.property = "mediatek,broken-save-restore-fw",
> -		.init	= gic_enable_quirk_mtk_gicr,
> -	},
>  	{
>  		.desc	= "GICv3: HIP06 erratum 161010803",
>  		.iidr	= 0x0204043b,
> @@ -1957,11 +1942,6 @@ static void gic_enable_nmi_support(void)
>  	if (!gic_prio_masking_enabled())
>  		return;
>  
> -	if (gic_data.flags & FLAGS_WORKAROUND_MTK_GICR_SAVE) {
> -		pr_warn("Skipping NMI enable due to firmware issues\n");
> -		return;
> -	}
> -
>  	rdist_nmi_refs = kcalloc(gic_data.ppi_nr + SGI_NR,
>  				 sizeof(*rdist_nmi_refs), GFP_KERNEL);
>  	if (!rdist_nmi_refs)
> -- 
> 2.42.0.609.gbb76f46606-goog
> 

