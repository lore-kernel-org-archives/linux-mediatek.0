Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D85EC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih/04GUpR19XO263tnxpqBao6FFVu5bYKBuaFpE6nbQ=; b=cOZ4qa8BW40ifFhp4Ldsy0wOKc
	W+04jVMuTN3MH7JDhMbWNT4Ncnxsl7i7G/nscrloCR8rU28aAliaWO3lajOL7om7Jb2NKtz4VJXyB
	+m5nJSGiTfTNdLRN4UPA5pPxKpkv0CrxTKIT4cdWDd6OC9ZD4KMdBZaQU0CxwiE9hvN52RMuHNbdU
	CT4wvGeG3pLqjRh19SJ3LDyneEvXgbILEZTSDwasXgrO/bI68+aCnK1KEJXXUD2gdnUsZWk969i+b
	2rP4BbSmPT10gxqPhQ8rXO0z1yL2oMDbRl78hZPc2MuUTOvbTKn9LrNNTMHsVAjY9d+WRcvAiX1f4
	h4EnEAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Oxr-0020T7-1E;
	Tue, 07 Nov 2023 16:30:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Oxo-0020SQ-1h;
	Tue, 07 Nov 2023 16:30:06 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 21AE3660746E;
	Tue,  7 Nov 2023 16:30:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699374602;
	bh=RHKkcTh5W8SNMFNToY6SNfNKENo7Fq1KXtu4W+ceTuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LAf+hzM9mXiDoJToArNMavA1JgIt6kye5VZXmT3OvHSGeBG67O9MR+7rGDoCaCH6j
	 gMWqoNuNwDQhrO4Eo6xgrLtlnXT4efBtHTpDZRcSuWmSigRZciginRoOJCKGz6ZicK
	 SM8xl3EvAqBURHXnIbDVPDcF17bJZ6qIsOf6AdcyXlk3POaB2GunoYjxojA5wZgBtf
	 PyCby+CaYh1i9gpXCQWpIyLqH1KXwIVPvqkNhjzrR4D4eAVMa96dFKDlItLVt2YvQu
	 aPQ5AHQLrlgVWoIgXfezQ2BtN5gn7IryiF2Yv4g9XWTqU8eVa8pBWSUT6jX6r+n1g6
	 09h8PECT66eUw==
Message-ID: <9b2e37a0-32ee-4aa4-99e8-d37103674847@collabora.com>
Date: Tue, 7 Nov 2023 17:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: Move Mediatek GIC quirk handling from
 irqchip to core
To: Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Amit Daniel Kachhap <amit.kachhap@arm.com>,
 James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231107072651.v2.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231107072651.v2.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_083004_729177_A795E956 
X-CRM114-Status: GOOD (  28.82  )
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

Il 07/11/23 16:26, Douglas Anderson ha scritto:
> In commit 44bd78dd2b88 ("irqchip/gic-v3: Disable pseudo NMIs on
> Mediatek devices w/ firmware issues") we added a method for detecting
> Mediatek devices with broken firmware and disabled pseudo-NMI. While
> that worked, it didn't address the problem at a deep enough level.
> 
> The fundamental issue with this broken firmware is that it's not
> saving and restoring several important GICR registers. The current
> list is believed to be:
> * GICR_NUM_IPRIORITYR
> * GICR_CTLR
> * GICR_ISPENDR0
> * GICR_ISACTIVER0
> * GICR_NSACR
> 
> Pseudo-NMI didn't work because it was the only thing (currently) in
> the kernel that relied on the broken registers, so forcing pseudo-NMI
> off was an effective fix. However, it could be observed that calling
> system_uses_irq_prio_masking() on these systems still returned
> "true". That caused confusion and led to the need for
> commit a07a59415217 ("arm64: smp: avoid NMI IPIs with broken MediaTek
> FW"). It's worried that the incorrect value returned by
> system_uses_irq_prio_masking() on these systems will continue to
> confuse future developers.
> 
> Let's fix the issue a little more completely by disabling IRQ
> priorities at a deeper level in the kernel. Once we do this we can
> revert some of the other bits of code dealing with this quirk.
> 
> This includes a partial revert of commit 44bd78dd2b88
> ("irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware
> issues"). This isn't a full revert because it leaves some of the
> changes to the "quirks" structure around in case future code needs it.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - Just detect the quirk once at init time.
> - Fixed typo in subject: s/GiC/GIC.
> - Squash in ("Remove Mediatek pseudo-NMI firmware quirk handling").
> 
>   arch/arm64/kernel/cpufeature.c | 46 ++++++++++++++++++++++++++++------
>   drivers/irqchip/irq-gic-v3.c   | 22 +---------------
>   2 files changed, 39 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index f6b2e2906fc9..928124ea2e96 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -999,6 +999,37 @@ static void init_32bit_cpu_features(struct cpuinfo_32bit *info)
>   	init_cpu_ftr_reg(SYS_MVFR2_EL1, info->reg_mvfr2);
>   }
>   
> +#ifdef CONFIG_ARM64_PSEUDO_NMI
> +static bool enable_pseudo_nmi;
> +
> +static int __init early_enable_pseudo_nmi(char *p)
> +{
> +	return kstrtobool(p, &enable_pseudo_nmi);
> +}
> +early_param("irqchip.gicv3_pseudo_nmi", early_enable_pseudo_nmi);
> +
> +static __init void detect_system_supports_pseudo_nmi(void)
> +{
> +	struct device_node *np;
> +
> +	if (!enable_pseudo_nmi)
> +		return;
> +
> +	/*
> +	 * Detect broken Mediatek firmware that doesn't properly save and

s/Mediatek/MediaTek/g

Apart from that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

On MT8195, MT8192, MT8186:
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


