Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3ACC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVRCZSWzWvbH7we1TJWc5HuPMfOk7AncuWFTgAXLQ/M=; b=HnBHe/MqPxX9WMRB8tD1/wRuxf
	5nMGjYnlhMyT2oAUX0KTtsTKqSg2REaeuLTbo6o4HlB+WSxsqbW8WeS79LkNiqA0OjCnkMXbyNsMX
	3LtLT6/qIYY0ftMQybrBw5UDg+2m/hpmtRFoTfym0YsNaNuw5tCdC37ZTKLofXxdVaEFNN834aaDU
	RjOc3u8bP2AWkiArGcQLINxWX/SFyTsb/txLKzhY4GAbm2BJfSrw8G2F01kc34RLZxNCmlBVqFz4l
	zbGuhJ/W5mWw69euZfRgnrUQ3F8lJ3JGxfakZAi8e9eLjFJd69Mj4CM9M6SH8RJvo7u2k2AqOBLAW
	rETQDZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sayjt-0000000G9UO-2pef;
	Mon, 05 Aug 2024 14:31:09 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sayjo-0000000G9QU-30rj;
	Mon, 05 Aug 2024 14:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722868265; x=1754404265;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A+ejUO0ucuD8rkWcqVcgovmJzievlnCHGnch/v9cG6Q=;
  b=d65jg83OMjkSpvNc1K/Q1OX0+NH60kYHWY9NCFhIr5OvDOAwXPAr1LtD
   vZtkIuOMVueKrhNZ34jylcpllJWBZO5ZJFgPm83nps5mMfxItimF4LsQQ
   yqa85tGUoLMjfGUqOSzmRCUs6bH5l4j3f+DBNfs7QG3OixysFDR8fgvyF
   t7o3ZOBSpLzypdsEPvwuF/z2qLiWxEpbBmCSDNn7fYltWwG1k5nR8L58D
   KmfjR+S2W1svJwWOkFx3fzypWVDD0dsXTddgP1Z/mCZX+Pa2DaoECbw62
   HGH+r8tH/criAiVuEphXV1gG+u7r6Uis8Hb0Tb0B3fdNrPdjkbDbNP+qx
   g==;
X-CSE-ConnectionGUID: R0jWDCGQTLSBAWVUokHRew==
X-CSE-MsgGUID: f8crJoMGQcyCjeNRfb14uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="46236825"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="46236825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 07:30:51 -0700
X-CSE-ConnectionGUID: 6keIFrHNSxCUdsGhOh0BZw==
X-CSE-MsgGUID: V3hkeNUJSjaoQEVDF9ySdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="60546846"
Received: from unknown (HELO localhost) ([10.2.132.131])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 07:30:49 -0700
Date: Mon, 5 Aug 2024 07:30:47 -0700
From: Nirmal Patel <nirmal.patel@linux.intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Pali =?UTF-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Uwe
 =?UTF-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Aleksandr
 Mishin <amishin@t-argos.ru>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Anup Patel <apatel@ventanamicro.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Damien Le Moal <dlemoal@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Jim
 Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, Jisheng
 Zhang <Jisheng.Zhang@synaptics.com>, Jon Hunter <jonathanh@nvidia.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>, Joyce Ooi
 <joyce.ooi@intel.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den
 <den@valinux.co.jp>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Marc Zyngier
 <maz@kernel.org>, Michal Simek <michal.simek@amd.com>, Nicolas Saenz
 Julienne <nsaenz@kernel.org>, Niklas Cassel <cassel@kernel.org>, Nipun
 Gupta <nipun.gupta@amd.com>, Rob Herring <robh@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Shivamurthy Shastri
 <shivamurthy.shastri@linutronix.de>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas
 Gleixner <tglx@linutronix.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 12/15] PCI: vmd: Silence set affinity failed warning
Message-ID: <20240805073047.0000286a@linux.intel.com>
In-Reply-To: <20240723132958.41320-13-marek.vasut+renesas@mailbox.org>
References: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
	<20240723132958.41320-13-marek.vasut+renesas@mailbox.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_073104_795929_8CF39ADF 
X-CRM114-Status: GOOD (  17.81  )
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

On Tue, 23 Jul 2024 15:27:12 +0200
Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:

> Use newly introduced MSI_FLAG_NO_AFFINITY, which keeps
> .irq_set_affinity unset and allows migrate_one_irq() code in
> cpuhotplug.c to exit right away, without printing "IRQ...: set
> affinity failed(-22)" warning.
>=20
> Remove .irq_set_affinity implementation which only return -EINVAL
> from this controller driver.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Krzysztof Wilczy=C5=84ski" <kw@linux.com>
> Cc: "Pali Roh=C3=A1r" <pali@kernel.org>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Broadcom internal kernel review list
> <bcm-kernel-feedback-list@broadcom.com> Cc: Daire McNamara
> <daire.mcnamara@microchip.com> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Cc: Jianjun Wang <jianjun.wang@mediatek.com>
> Cc: Jim Quinlan <jim2101024@gmail.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Jonathan Derrick <jonathan.derrick@linux.dev>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Joyce Ooi <joyce.ooi@intel.com>
> Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: Koichiro Den <den@valinux.co.jp>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: Niklas Cassel <cassel@kernel.org>
> Cc: Nipun Gupta <nipun.gupta@amd.com>
> Cc: Nirmal Patel <nirmal.patel@linux.intel.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> ---
> V4: - New patch
> ---
>  drivers/pci/controller/vmd.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/drivers/pci/controller/vmd.c
> b/drivers/pci/controller/vmd.c index a726de0af011f..bc849b0d9e8dc
> 100644 --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -204,22 +204,11 @@ static void vmd_irq_disable(struct irq_data
> *data) raw_spin_unlock_irqrestore(&list_lock, flags);
>  }
> =20
> -/*
> - * XXX: Stubbed until we develop acceptable way to not create
> conflicts with
> - * other devices sharing the same vector.
> - */
> -static int vmd_irq_set_affinity(struct irq_data *data,
> -				const struct cpumask *dest, bool
> force) -{
> -	return -EINVAL;
> -}
> -
>  static struct irq_chip vmd_msi_controller =3D {
>  	.name			=3D "VMD-MSI",
>  	.irq_enable		=3D vmd_irq_enable,
>  	.irq_disable		=3D vmd_irq_disable,
>  	.irq_compose_msi_msg	=3D vmd_compose_msi_msg,
> -	.irq_set_affinity	=3D vmd_irq_set_affinity,
>  };
> =20
>  static irq_hw_number_t vmd_get_hwirq(struct msi_domain_info *info,
> @@ -326,7 +315,7 @@ static struct msi_domain_ops vmd_msi_domain_ops =3D
> {=20
>  static struct msi_domain_info vmd_msi_domain_info =3D {
>  	.flags		=3D MSI_FLAG_USE_DEF_DOM_OPS |
> MSI_FLAG_USE_DEF_CHIP_OPS |
> -			  MSI_FLAG_PCI_MSIX,
> +			  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX,
>  	.ops		=3D &vmd_msi_domain_ops,
>  	.chip		=3D &vmd_msi_controller,
>  };

Reviewed-by: Nirmal Patel <nirmal.patel@linux.intel.com>

Thanks.

