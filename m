Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D8EC77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OK6P58x0m7vLvplwz340XhE9IhH6CK4jlCcZUmcdwjg=; b=RZThl9F0XTqnJN8bvVhps5HbkP
	jgGjyv2rmRBfuQM0BW+3jYeS9GyvhVHH6cOXaNkfxaqtBgJBgu11ZSghmrCs0QCJkgQraw6xfpH24
	lfXYJOPsoyBEQz8ex3RKYe9ni7ZSTKPaOBE4NRqxj4mlvfyEVo3mfNdIv87kXmgUbEnI9xw0uqsWP
	Uag5tV+4efLRl2X8M7UudYRnLBWheCn26zrwFaHIHkxzzHr0Nl5X1nzraMHFLsi4huMkKapFgkk8H
	d/pVrHUWJb75x/caXxr1oU0iHYarOuckLS4yfskSiFmHQhHabTYbSrQjivccRKAkvEiB+A/Cb8KQI
	ECsj1hnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLfs-00FeWv-07;
	Mon, 17 Apr 2023 10:01:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLfk-00FeUM-1k;
	Mon, 17 Apr 2023 10:01:24 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 007E26603050;
	Mon, 17 Apr 2023 11:01:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681725679;
	bh=B0H7Xc8pFJmEgctk+ZRRF3aNKm7rElFH0bnnlDlQbD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I9U/Xvg6M9NzMGqGFPDKP+SNzfidPj4xuKy5l3xAe+xzrJsSasPjxW/UmVJ9HYX5O
	 fJf0X6VoV3NLH8YmOWvrl+bE/JIr9G4QDsIo1Ze5VRKj1Ka9NM/rQIRBFiN4Mb3U0h
	 K8Wqv6nPJsbJBPNEfSHcX0DIpvxU4vJ4vjeZjiT+dkwOKAmC7QfiYQwvJtcOiiqv+c
	 S/yj8Mkc/X5lhArSCPu8t7C+AKLEVvJDr1N1bojF0MSH9Hsob5L43gcVpgpUmqAOZf
	 OyygQWO6S1yOMWd3pueGDa9965KjEM89yYvG4CGktP5UdcjZRYKlvltI60jDb5yQR8
	 AtHuQrS1OGfAg==
Message-ID: <f3f01c18-a2cc-9329-d186-421f5170e08a@collabora.com>
Date: Mon, 17 Apr 2023 12:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Add workaround for
 MediaTek MMIO timer
Content-Language: en-US
To: walter.chang@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230417090635.13202-1-walter.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230417090635.13202-1-walter.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_030120_920433_5784483C 
X-CRM114-Status: GOOD (  29.82  )
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

Il 17/04/23 11:06, walter.chang@mediatek.com ha scritto:
> From: Walter Chang <walter.chang@mediatek.com>
> 
> The MT69XX series SoCs have the incomplete implementation issue in the
> mmio timer. Specifically, the hardware only implements the TVAL
> functionality, but not the CVAL functionality. This hardware limitation
> will cause set_next_event_mem() fail to set the actual expiration time
> when writing a value to the CVAL. On these platforms, the mmio timer's
> internal expiration time will still be judged as 0 (the value of TVAL),
> resulting in the mmio timer not functioning as intended.
> 
> The workaround is to use TVAL in addition to CVAL for these affected
> platforms.
> 
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> ---
>   Documentation/arm64/silicon-errata.rst |  4 ++++
>   drivers/clocksource/Kconfig            |  9 ++++++++
>   drivers/clocksource/arm_arch_timer.c   | 29 ++++++++++++++++++++++++++
>   3 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/arm64/silicon-errata.rst b/Documentation/arm64/silicon-errata.rst
> index ec5f889d7681..ca1893713a4c 100644
> --- a/Documentation/arm64/silicon-errata.rst
> +++ b/Documentation/arm64/silicon-errata.rst
> @@ -209,3 +209,7 @@ stable kernels.
>   +----------------+-----------------+-----------------+-----------------------------+
>   | Fujitsu        | A64FX           | E#010001        | FUJITSU_ERRATUM_010001      |
>   +----------------+-----------------+-----------------+-----------------------------+
> +
> ++----------------+-----------------+-----------------+-----------------------------+
> +| MediaTek       | MT69XX series   | #690001         | MEDIATEK_ERRATUM_690001     |
> ++----------------+-----------------+-----------------+-----------------------------+
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 5fc8f0e7fb38..475356b8dbdc 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -368,6 +368,15 @@ config SUN50I_ERRATUM_UNKNOWN1
>   	  the Allwinner A64 SoC. The workaround will only be active if the
>   	  allwinner,erratum-unknown1 property is found in the timer node.
>   
> +config MEDIATEK_ERRATUM_690001
> +	bool "Workaround for MediaTek MT69XX erratum 690001"
> +	depends on ARM_ARCH_TIMER && ARM64
> +	help
> +	  This option enables a workaround for incomplete implementation
> +	  in the MMIO timer on the MediaTek MT69XX SoCs. The workaround
> +	  will only be active if mediatek,erratum-690001 property is
> +	  found in the timer node.
> +
>   config ARM_GLOBAL_TIMER
>   	bool "Support for the ARM global timer" if COMPILE_TEST
>   	select TIMER_OF if OF
> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> index e09d4427f604..920570d57fc0 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -389,6 +389,10 @@ static u64 notrace sun50i_a64_read_cntvct_el0(void)
>   }
>   #endif
>   
> +#ifdef CONFIG_MEDIATEK_ERRATUM_690001
> +static bool arch_timer_mem_sne_use_tval __ro_after_init;

What about reusing part of the CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND logic and
adding something like CONFIG_ARM_ARCH_TIMER_MEM_WORKAROUND?

That would make you able to reuse the already existing infrastructure to parse
the device-tree and possibly more.

Regards,
Angelo

> +#endif
> +
>   #ifdef CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND
>   DEFINE_PER_CPU(const struct arch_timer_erratum_workaround *, timer_unstable_counter_workaround);
>   EXPORT_SYMBOL_GPL(timer_unstable_counter_workaround);
> @@ -783,6 +787,19 @@ static __always_inline void set_next_event_mem(const int access, unsigned long e
>   		cnt = arch_counter_get_cnt_mem(timer, CNTPCT_LO);
>   
>   	arch_timer_reg_write(access, ARCH_TIMER_REG_CVAL, evt + cnt, clk);
> +#ifdef CONFIG_MEDIATEK_ERRATUM_690001
> +	if (arch_timer_mem_sne_use_tval) {
> +		/* Due to the incomplete implementation of mmio timer on
> +		 * specific MediaTek platforms, CVAL has not been implemented.
> +		 * Therefore, the workaround is to use TVAL in addition to
> +		 * CVAL.
> +		 */
> +		if (access == ARCH_TIMER_MEM_VIRT_ACCESS)
> +			writel_relaxed(evt, timer->base + 0x38);
> +		else
> +			writel_relaxed(evt, timer->base + 0x28);
> +	}
> +#endif
>   	arch_timer_reg_write(access, ARCH_TIMER_REG_CTRL, ctrl, clk);
>   }
>   
> @@ -878,7 +895,16 @@ static void __arch_timer_setup(unsigned type,
>   				arch_timer_set_next_event_phys_mem;
>   		}
>   
> +#ifdef CONFIG_MEDIATEK_ERRATUM_690001
> +		if (arch_timer_mem_sne_use_tval) {
> +			pr_info("Enabling mediatek,erratum-690001 for mmio timer\n");
> +			max_delta = CLOCKSOURCE_MASK(31);
> +		} else {
> +			max_delta = CLOCKSOURCE_MASK(56);
> +		}
> +#else
>   		max_delta = CLOCKSOURCE_MASK(56);
> +#endif
>   	}
>   
>   	clk->set_state_shutdown(clk);
> @@ -1591,6 +1617,9 @@ static int __init arch_timer_mem_of_init(struct device_node *np)
>   		frame->valid = true;
>   	}
>   
> +#ifdef CONFIG_MEDIATEK_ERRATUM_690001
> +	arch_timer_mem_sne_use_tval = of_property_read_bool(np, "mediatek,erratum-690001");
> +#endif
>   	frame = arch_timer_mem_find_best_frame(timer_mem);
>   	if (!frame) {
>   		pr_err("Unable to find a suitable frame in timer @ %pa\n",


