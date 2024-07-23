Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245E1C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 22:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBYO3YWDwS/Gcis8BVy4FNPMTbREVaMCJ9hAXFOVfZw=; b=tslFSaBSaw2uqWITWu99Gv/Qyt
	S6i62Ht/lpa37/7jHLsfcaZczHI3LOgCC9BJu3zZ7/KzjLQElW01Z+ZdpZ0JKIed5wVbJiLc/vycU
	fYT6JXJ8vdLnSU5zbagzh0z/Tjy9EugU5F/xhjM2J1X0Tn1yCzHYT37Amv7UeHpljLFt2DWzRShrs
	GecOHnwlZNvLsTVrCzRxkYDYTGTDWYwRejGciRyPkU4qPkT97UckhOT0vaeKUmpAnj0mNsPdrNcQS
	WVyFBUH61N0DSSu/kJr3JHDyx31lZU/xGFdIJGwZPU1DAxiisADR5HUDOFlGfzXXFeVNOcTyFcVrF
	ML1jQUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWOOO-0000000Dj4J-0RJf;
	Tue, 23 Jul 2024 22:54:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWONy-0000000Dj1t-3mUL;
	Tue, 23 Jul 2024 22:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 428E7CE0F25;
	Tue, 23 Jul 2024 22:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7690FC4AF0A;
	Tue, 23 Jul 2024 22:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721775211;
	bh=cHJbPDlIH0oCEqFdHMXc1f/SmzHKfHRg/D0V77IKE/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sYN6yv+FHlTLQYks25mPie6POPe6J0L437WXBzUx2BVXXHSKQ/tcNWSqUUBRayhzC
	 NEAMi+W+qkJ0iKbJWCx80P94jdwSRvxy9VRpaQBnuQhmxw/15M3E8ovoNJI3R8qA3i
	 g+dEicUhSjbRL0mGXUPibqbkQRsqVWQuZj6LQtfla8lb6TXLMxnL1hPIlctls7nxau
	 OBiKOsmRvtcDWqbf87Ul9l1zLNbJgvsJQSVyjHowgvhoUhr1fdgPK48DOUT+0zycHQ
	 CSssFzuPELhamsa2kR92pf3IhgxaVaWaMfxpguhYzwEKzv0EqeG4XnIxa51iU0j1e9
	 ampGEo3+E8tFg==
Message-ID: <a49bb411-f96d-4574-96ec-5b03668cdf87@kernel.org>
Date: Wed, 24 Jul 2024 07:53:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] PCI: dwc: Silence set affinity failed warning
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
 <20240723132958.41320-6-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240723132958.41320-6-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_155335_153925_83F5C1E7 
X-CRM114-Status: UNSURE (   6.34  )
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

On 7/23/24 10:27 PM, Marek Vasut wrote:
> Use newly introduced MSI_FLAG_NO_AFFINITY, which keeps .irq_set_affinity unset
> and allows migrate_one_irq() code in cpuhotplug.c to exit right away, without
> printing "IRQ...: set affinity failed(-22)" warning.
> 
> Remove .irq_set_affinity implementation which only return -EINVAL from this
> controller driver.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


