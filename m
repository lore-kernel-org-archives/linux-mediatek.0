Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F53DC3DA63
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 22:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpW0bskG5q3qyL+LrwVKu2qCYzYjwo2y8gyMnHgYLP8=; b=yUd3aU9q6JaY0xB0QpSz+YLuNa
	JU3mDSWXFDJOZ+9rnKsYOg9K+S9u35GWvqaweL4yPKfgB6s+xHQCgWN5Tj6yMwH3PFPG6I23jSbmB
	+44Ry/eCOJyodnfXkMpu7KUYXvj5ZsJdgTDEIMMl6/mzry/QQhzIikzBtzMb6b6bjj4Kk1RK7tXzt
	y0Fh74VqaySvN/AwQBgk7Yfs3da4TZtYNGINJhfD2SizzwuISTzncJ83wA3dorWjVirPwa9xNiV0z
	vyt5tScMUycwf0OGQpz8wjV3xuC+W9vcnSI/YsZNb9imNL8QvqBkOl8aoA4sRq/3+d8odv+oA9yes
	UqgmLK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWOPg-0000000DjID-01xv;
	Tue, 23 Jul 2024 22:55:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWOPH-0000000DjEJ-0eyp;
	Tue, 23 Jul 2024 22:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6189660EDE;
	Tue, 23 Jul 2024 22:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76859C4AF09;
	Tue, 23 Jul 2024 22:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721775294;
	bh=7yl7pweRsUb/Cz4uzMnBbIvjB393ruYlONQQ/MK1d9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cYxwu10z5OHmkGQRUgijf1f/SRxT0dVPX2MkHzZ+24lrUWB8pLFMqoBbZSJQe7ZqX
	 TwQ8stHcyHiRpcsqYpgYWBMbWA0b80okC3O4iHaCpUCQqJsW3nXu6mwhv7ap2Jpslm
	 3gu35oqshyEDpN6XdUCp4L0hvI9T+dDTQrZ0JpCLvooTmr7D9d8/GKj99xkadZMqcQ
	 ZvFvAqC+aMnI2mTrS3zU8n0yQJsPLNVA5LHn/HQCRybrhnKNp3PaOhQYN6Kxego95b
	 kieihj7tORN814FXDDg99GVwDban6fQojEoQ6iLhG5S37BWMVjaWU8g1MkRCSDTfc6
	 947QCP7HuE3Gg==
Message-ID: <b77f741f-24da-445b-99bc-8765dabdf820@kernel.org>
Date: Wed, 24 Jul 2024 07:54:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] genirq/msi: Silence set affinity failed warning
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Aleksandr Mishin <amishin@t-argos.ru>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Anup Patel <apatel@ventanamicro.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Jim Quinlan <jim2101024@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Joyce Ooi <joyce.ooi@intel.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den
 <den@valinux.co.jp>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Niklas Cassel
 <cassel@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
 <20240723132958.41320-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240723132958.41320-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_155455_372462_2DC80676 
X-CRM114-Status: GOOD (  13.48  )
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

On 7/23/24 10:27 PM, Marek Vasut wrote:
> Various PCIe controllers that mux MSIs onto single IRQ line produce these
> "IRQ%d: set affinity failed" warnings when entering suspend. This has been
> discussed before [1] [2] and an example test case is included at the end
> of this commit message.
> 
> Controller drivers which create MSI IRQ domain with MSI_FLAG_USE_DEF_CHIP_OPS
> flag set and which do not override the .irq_set_affinity irqchip callback get
> assigned default .irq_set_affinity = msi_domain_set_affinity() callback. That
> is not desired on controllers where it is not possible to set affinity of each
> MSI IRQ line to a specific CPU core due to hardware limitation.
> 
> Introduce dedicated flag MSI_FLAG_NO_AFFINITY, which keeps .irq_set_affinity
> unset in case the controller driver did not assign the callback. This way, the
> migrate_one_irq() code in cpuhotplug.c can exit right away, without printing
> the aforementioned warning. The .irq_set_affinity implementations which only
> return -EINVAL can be removed from multiple controller drivers.
> 
> ```
> $ grep 25 /proc/interrupts
>  25:   0 0 0 0 0 0 0 0   PCIe MSI   0   Edge   PCIe PME
> 
> $ echo core > /sys/power/pm_test ; echo mem > /sys/power/state
> ...
> Disabling non-boot CPUs ...
> IRQ25: set affinity failed(-22). <---------- This is being silenced here
> psci: CPU7 killed (polled 4 ms)
> ...
> ```
> 
> [1] https://lore.kernel.org/all/d4a6eea3c5e33a3a4056885419df95a7@kernel.org/
> [2] https://lore.kernel.org/all/5f4947b18bf381615a37aa81c2242477@kernel.org/
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


