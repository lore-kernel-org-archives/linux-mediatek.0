Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4CAC77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kcJobrOnoamaBnANOlfQkU1M63AHPCa2YelSe1E0P8=; b=yCWtNqEgCMKHWGSo0nu4CKzoEI
	mxrW8vD4lkOXXAUCO5pRE0wohyWE/htgnQx0n5D2xBlFftZpl7+e+FeW//bftgw3l3vkQ53BSSjmf
	q6+Jl/44thOt0ZJ0VjKk5aOHM3vpMdTrGjqjyr7gSY+QK6WpSXcgn6Ivh8KtInLAo90Qev0gVpl4s
	GhoJ0V6PIOgGAUMJzkFqdjTZOEbkJTFIaSNtD9+BjHx4N/coa7AfmzJfmmYFa0OFEZcsR2y+lnl+Y
	sSzAIrdyTWqGyNTeyCP4yRoCYsZPBxciMpv97BNGpA3IQCbCR7kmIFwyc6xbcmKaUYpzGzhBikiKF
	LvrMrTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLRN-0000000Bkkf-0vS9;
	Thu, 03 Jul 2025 15:01:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJtc-0000000BTb9-0p5W;
	Thu, 03 Jul 2025 13:22:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751548954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4kcJobrOnoamaBnANOlfQkU1M63AHPCa2YelSe1E0P8=;
	b=ci1E4SPksCiCJizuztVuBjLDRmAb1MGzgUcyWv8SIXwN+M1AX2hGa4D2vN3gaM7e0Q+oU+
	/p9ffpL6DEClpZ0ckyBdHUFVfHwrnO51X8+Mph5NSwUUybevxhcxAHzsq0Cb3Uj3sfo9h8
	Uhx6x9iz0O6ipvcOF2VbOGttyLd7hp4qHHFIde1E7i08lBUSqgO1nSOJff7as0ed0x4nd5
	++atJOC+2NGamr6YKP42v3B6PE3EFPOeUDoppfa3hKtBllP6el0R71wvy9Il76+E4Vf4A3
	cFDWnPYExqxxSNAscTM07n+eL9vXZwKtHJQN11Sll5gidzZOWtxv2AEAH6r/Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751548954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4kcJobrOnoamaBnANOlfQkU1M63AHPCa2YelSe1E0P8=;
	b=qjM3P6wjxBsAHoR5ygsq0AbjfAjCIQ7A9mh6Zu4VPkYnmr7JerFMJur0ngY+tvLbN11USZ
	K24MXLHx3sPTx0CA==
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, "K . Y . Srinivasan"
 <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>, Jim
 Quinlan <jim2101024@gmail.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michal.simek@amd.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Nirmal Patel
 <nirmal.patel@linux.intel.com>, Jonathan Derrick
 <jonathan.derrick@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 04/16] PCI: altera-msi: Switch to
 msi_create_parent_irq_domain()
In-Reply-To: <0a88da04bb82bd588828a7889e9d58c515ea5dbb.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
 <0a88da04bb82bd588828a7889e9d58c515ea5dbb.1750858083.git.namcao@linutronix.de>
Date: Thu, 03 Jul 2025 15:22:33 +0200
Message-ID: <8734bdwgrq.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_062236_373154_5A26BD51 
X-CRM114-Status: UNSURE (   5.20  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 26 2025 at 16:47, Nam Cao wrote:

> Move away from the legacy MSI domain setup, switch to use
> msi_create_parent_irq_domain().
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

