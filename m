Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66028C3DA49
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jul 2024 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlMRijtqCm0MZ6n79QOvrnKsNAELqQTM+5n/uBS9kZA=; b=QcCujwJPWtVlrLdiCA/HB+zD79
	xNmEmLqiS5PJlCHCzJ6J2WLxeup0rCRcGYpgd2FC77Z//piK5G1MXM2UdkpDjcrHoAsEY+h+lBsWi
	au6ZTEZu61U0Oyk2GUM6H4BZgARiwLJFO7I194mWB+YHgyaHI9f4jwmjNvZ1G0kmrCMKkoIYjnZWi
	ONAMzrbr3OloKlDQmrgt8bN6EZwOsbJ+9/fmLiT/ovMweusEzGYZFf7IakPlt7guvKTEuN2GPts8w
	sLxsKq4WKdAgnsSbaawqCmDHT/6TLHA4cIc7GzLoOq9f0WfYh2r6AHxzukMeRHWJASAIgXsK5oEDx
	9981O0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXJmM-00000003oc7-3Owt;
	Fri, 26 Jul 2024 12:10:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXJlv-00000003oXO-1qQs;
	Fri, 26 Jul 2024 12:10:10 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1721995805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PlMRijtqCm0MZ6n79QOvrnKsNAELqQTM+5n/uBS9kZA=;
	b=hMJHi9U+xbjwzcO3srL9iaOPH7Y2McTHyRrgfTZs3Wndxtaogpvsk4tCVs40q5um/oJLQ3
	O6+2510Rm46HWKKYfW970fbKc6AXzyhTMofsK2vFdM7p1oRXAe7aix1HFoNLovkn3M5XE3
	gLxe1ZkWXMZYWzbLpiVG6ISrcWYUEYf6EobQXEzO9+VTZBuJiG/aGdzcXpTTGPJ/MDtDjV
	Sl4KRlUETXh9R6dt1hwlt+HeJ3KgQ2vcFHEA0+51fbVG72wkyR/kIfR3BU9xcI8fK457y+
	TTOCJ9KMRj7tKsFsPpMU+2IqUEhxCZneLI1atXLNYVTX9WxNGbwMRbGJ1CcaVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1721995805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PlMRijtqCm0MZ6n79QOvrnKsNAELqQTM+5n/uBS9kZA=;
	b=GUqgh+WZUy9cUP3jH6HAQmwLB6N/rSRN+ld5YbX5w3t7JPVliPs2jdOAEv/aETNlXUk4lg
	EueW8xtjf15dmGCA==
To: Bjorn Helgaas <helgaas@kernel.org>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Pali
 =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Aleksandr Mishin <amishin@t-argos.ru>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Anup Patel
 <apatel@ventanamicro.com>, Bjorn Helgaas <bhelgaas@google.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Daire
 McNamara <daire.mcnamara@microchip.com>, Damien Le Moal
 <dlemoal@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Jim Quinlan <jim2101024@gmail.com>, Jingoo
 Han <jingoohan1@gmail.com>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Jon Hunter <jonathanh@nvidia.com>, Jonathan Derrick
 <jonathan.derrick@linux.dev>, Joyce Ooi <joyce.ooi@intel.com>, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Koichiro Den <den@valinux.co.jp>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marc Zyngier <maz@kernel.org>, Michal
 Simek <michal.simek@amd.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>, Rob Herring
 <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shivamurthy Shastri
 <shivamurthy.shastri@linutronix.de>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 00/15] genirq/msi: Silence set affinity failed warning
In-Reply-To: <20240724154314.GA800620@bhelgaas>
References: <20240724154314.GA800620@bhelgaas>
Date: Fri, 26 Jul 2024 14:10:04 +0200
Message-ID: <87wml8uzfn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_051007_643459_6990F965 
X-CRM114-Status: UNSURE (   4.15  )
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

On Wed, Jul 24 2024 at 10:43, Bjorn Helgaas wrote:
> Happy to apply this series via the PCI tree given an ack from Thomas.

Here you go:

Acked-by: Thomas Gleixner <tglx@linutronix.de>

