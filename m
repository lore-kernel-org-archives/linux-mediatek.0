Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0D8D32D9A
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2024 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QX8VQevkwijnt5AdrotptL17b7KyPVmceIz0nqzmyMs=; b=4BCLfZ3vY1IWcZvfz8G2PYmG9f
	/crw3mCbP/f+MuUmteo7M+qNIp9eT73tisx3E8QtqYBe0/7rQDWtiq8uCHFIh4CYofPnl7GyNz/EU
	pr8FfwxQ+WajPFn9uLXpy5dsg/DA/TZxdJnvnKq1sEFIA1MupfuWhAlItVCB1mfSK95vWdDLUwoEZ
	M1dwdJvCnuFC63WrCXv+NlEcQpF2R3IZ0oWnj6UxO4E8/6lVlLC09ryDEALgGQly5sSbfQzBF0Pn2
	XT3WLzLFHrKinMLjSPUnT4im5+jJU4igIK2muSk2GF0/llG8Ej+4Re2E4kmFJcPR+wH6I9wQDClrm
	I4xLLh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApQi-00000003INI-22ls;
	Tue, 12 Nov 2024 11:51:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApFB-00000003Fxz-02Ld;
	Tue, 12 Nov 2024 11:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 163C9A4196D;
	Tue, 12 Nov 2024 11:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6627CC4CECD;
	Tue, 12 Nov 2024 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731411575;
	bh=LG7RZyrQQCMMftiyBGThQS+gGDQCRxNRxi5jzF0rtMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vknOjlpo6yb1Vp6IvyGWB9fU+5x7MozaZPEx5An53FahQpTAnNO5K4ounXAy8oTiB
	 TMyhmIa3vhWYr8Y70CpG7AqAsJ6Muua1r2mtSVbGPeuPR0Yb5JXd60v2VL3pSHRStQ
	 uWb9VIFmeHvu95V7xCVSAH9p70B6Adjzvh7A37xU=
Date: Tue, 12 Nov 2024 12:39:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Ronak Jain <ronak.jain@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org, qemu-devel@nongnu.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: Switch back to struct platform_driver::remove()
Message-ID: <2024111223-gizzard-scabby-eb98@gregkh>
References: <36974feb6035201d53384557259ec72fe311053b.1731397962.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36974feb6035201d53384557259ec72fe311053b.1731397962.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_033937_131959_9B19FA81 
X-CRM114-Status: GOOD (  15.92  )
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

On Tue, Nov 12, 2024 at 09:35:20AM +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/firmware to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I did a single patch for all of drivers/firmware. While I usually prefer
> to do one logical change per patch, this seems to be overengineering
> here as the individual changes are really trivial and shouldn't be much
> in the way for stable backports.
> 
> There is no dedicated maintainer for drivers/firmware, maybe Sudeep as
> biggest committer there can take it? Or would it be sensible to split
> this patch?

I'll just take it now, thanks!

greg k-h

