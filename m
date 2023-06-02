Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD9EC7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 21:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/HPsYQNMj9WUwASzTt08LyOmWMVfc7ROZc4uBDak1Mw=; b=Lfi7AGdJXxQi2y9LNJZjIiEB9n
	0o+EyoDEIUEZESJakAF8A6WAl9P0XxRBf0D4bu16KrwXaivBxwVGQvxRFQ3JcQ6Tka/UgMsFe04B8
	jVWtNAzyk4kjiEB/0Ogs337ZFkcwq0kpqyW04WbTeJVYlagFVw/DJw9+A6b7bTbhg05gwQye6KPra
	qgs0TtwTJk+0w4qrzai0/hQ0f/zuuG7oF+hAMSGNG/RPkyFMkeYSh4aZCQcasr0DT+vCNgCnd8H/f
	+Q8/qZay/tUMJlnxKo7SbmDM40R+lI3mPCQ8xACbJWkGCG4OyGjhGiorpuH64KoMl8iceQWUkZL26
	40qN+Ezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5CSr-007xb7-20;
	Fri, 02 Jun 2023 21:37:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5CSo-007xZy-0Q;
	Fri, 02 Jun 2023 21:37:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CDE4B61E79;
	Fri,  2 Jun 2023 21:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9ACC433D2;
	Fri,  2 Jun 2023 21:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685741856;
	bh=1FcV/MmMD469O1FQZ7KzmQXuisSwf/qS6Cx5HeBprRU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=G1SmzjFN1fwdTVy/JX+tcplLxTUjUTUxEYFqWy36jkRCY8CssArfmtY6hLyIJ+eEl
	 Bsh5696NyIdCrSPjt2TUjM0RFMQlO0wpybcSRG6UraTxRxGXt4VITakX9oYodhFdyh
	 rfKi2TNtnhoeQ1oqNFE8gfgG28MlI7yJP3b9ig8g9v5cVOy5x4enFGWy4eo4eOhL/D
	 t0558CmqNSsrs8MIMUgAirdzk2AkEhL549O1T9Ri7JyW34yBjFQ+ghpcI6WWPzIPLi
	 /OsVnvTW9zVJhYn0W1r/GVQ7YvbUz4DhG+Daqqs+lJJtWaWxaXh3OmZq4hyGtUOW+P
	 FAVYBtTinWEBw==
Date: Fri, 2 Jun 2023 16:37:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tom Joseph <tjoseph@cadence.com>, Shawn Guo <shawn.guo@linaro.org>,
	Rahul Tanwar <rtanwar@maxlinear.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Vidya Sagar <vidyas@nvidia.com>, Jisheng Zhang <jszhang@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Toan Le <toan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org, kernel@pengutronix.de,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 00/15] PCI: Convert to platform remove callback returning
 void
Message-ID: <ZHphHkNLO4tEJIm/@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230530140742.ebbrxmpieuphbmz3@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_143738_292462_77F1B977 
X-CRM114-Status: GOOD (  23.23  )
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

On Tue, May 30, 2023 at 04:07:42PM +0200, Uwe Kleine-König wrote:
> Hello Bjorn,
> 
> On Tue, Mar 21, 2023 at 08:31:53PM +0100, Uwe Kleine-König wrote:
> > this series adapts the platform drivers below drivers/pci to use the
> > .remove_new() callback. Compared to the traditional .remove() callback
> > .remove_new() returns no value. This is a good thing because the driver core
> > doesn't (and cannot) cope for errors during remove. The only effect of a
> > non-zero return value in .remove() is that the driver core emits a warning. The
> > device is removed anyhow and an early return from .remove() usually yields a
> > resource leak.
> > 
> > By changing the remove callback to return void driver authors cannot
> > reasonably assume any more that there is some kind of cleanup later.
> > 
> > All drivers were easy to convert as they all returned zero in their
> > remove callback. Only for iproc the conversion wasn't trivial, the other
> > were converted using coccinelle.
> > 
> > There are no interdependencies between these patches. So even if there
> > are some concerns for individual patches, I ask you to apply the
> > remaining set. Then I only have to care for the review feedback of the
> > refused patches. (Having said that I don't expect any serious objection,
> > just things like squashing or separating patches, or maybe I picked a
> > wrong subject prefix.)
> 
> These patches wait for application for quite some time now. They apply
> just fine to v6.4-rc1 and next/master. Would be great to get them in
> during the next merge window and ideally give them some time in next
> before.

Thanks, these seem fine to me, and Lorenzo normally takes care of
drivers/pci/controller/.  Lorenzo, if it's easier to have me apply
them, that's fine, too, just let me know.

The only tweaks I would make would be:

  PCI: j721e: Convert to platform remove callback returning void
  PCI: dwc: Convert to platform remove callback returning void

to match the git history.

