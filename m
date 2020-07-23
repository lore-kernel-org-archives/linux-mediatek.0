Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3938AC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 15:26:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F22206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 15:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VLQi0OmY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0Q5iPvq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F22206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VlnGQViLwEVLGO2ldQv4GJ1lA56Zl+c8449RVcmhnyE=; b=VLQi0OmYueAU0oK2bRdkXoBEn
	MTNk7MfNmlH2MuRF2KgW65Bmeg9VKKvPWgrDtcBLHj+sOBMbbgEWTZRHOzfOf8R47T+7JFuc+/v4R
	7ILPORWQCUJCY3G34D9TO6usVwsnjagd2sfa1b+mq2h1wgNmd3SCyYLzc8cWW81JRYuDV4HkVXl3P
	tGqARBqsxrlEyetoqMVJ6/44kXWb0dlD0aCyWVXCtj3FR9zL2CFQVOS0/L6esxXEGKOj7uo7+/DMw
	uZaTlm7FTkGtzWi5Tti1jioJh6CtZUIIiTJjpO3Nil8vCm6MNZqJv1JM7wvPSeoZ31JSGYzrfYn6r
	NqvLy2I8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyd72-0007EJ-5U; Thu, 23 Jul 2020 15:26:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyd6u-00079D-4N; Thu, 23 Jul 2020 15:26:17 +0000
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A2A022CBB;
 Thu, 23 Jul 2020 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595517973;
 bh=LVhZXIdkdKrrk3YqkOpZYcc+YEG1SCDuwu0ZS4IUGgM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e0Q5iPvq0aYhQMQ93Nj0StQPvdQC04wLHBe3X1Txb93hQiAyN2gBdhUJnWxSD1Aiy
 2KX/vVFZ/CirNgDYbBgwCQVGolScvRDxEh90ajbGlE82PTVGupyi1qunooX9upUKwZ
 aUXzgixohBJRhgWVYRFrPtwnbl7QTcgOltbXgQL0=
Received: by mail-ot1-f41.google.com with SMTP id g37so4605993otb.9;
 Thu, 23 Jul 2020 08:26:13 -0700 (PDT)
X-Gm-Message-State: AOAM533SXoUZwotBNpUgPoTGxzwZpMm9ywHEYu2TsmQR1a+UasHxYPMz
 QdXGzuVHLbHdmxMxPjIFyeIiYJN9JorVWImtbg==
X-Google-Smtp-Source: ABdhPJwjqGRmo1UpccJeOoC1JymzSWvGPVrWo+4vb2FMRak7++d6g0GGlvyUxomInzkLdL3VTPFVVOlmvL7TW+o7adM=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr4390973otb.107.1595517972599; 
 Thu, 23 Jul 2020 08:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200722022514.1283916-1-robh@kernel.org>
 <20200722022514.1283916-12-robh@kernel.org>
In-Reply-To: <20200722022514.1283916-12-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Jul 2020 09:26:01 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sPaubVERLHaRzjvThk3zDO6zAnRQjGuAMKaVA87Y4HQ@mail.gmail.com>
Message-ID: <CAL_Jsq+sPaubVERLHaRzjvThk3zDO6zAnRQjGuAMKaVA87Y4HQ@mail.gmail.com>
Subject: Re: [PATCH 11/19] PCI: Move setting pci_host_bridge.busnr out of host
 drivers
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_112616_309299_546FB414 
X-CRM114-Status: GOOD (  19.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 PCI <linux-pci@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 8:25 PM Rob Herring <robh@kernel.org> wrote:
>
> Most host drivers only parse the DT bus range to set the root bus number
> in pci_host_bridge.busnr. The ones that don't set busnr are buggy in
> that they ignore what's in DT. Let's set busnr in pci_scan_root_bus_bridge()
> where we already check for the bus resource and remove setting it in
> host drivers.
>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 4 ----
>  drivers/pci/controller/dwc/pcie-designware.h      | 1 -
>  drivers/pci/controller/pci-aardvark.c             | 5 ++---
>  drivers/pci/controller/pci-host-common.c          | 1 -
>  drivers/pci/controller/pci-tegra.c                | 4 +---
>  drivers/pci/controller/pci-v3-semi.c              | 2 --
>  drivers/pci/controller/pcie-mediatek.c            | 8 +-------
>  drivers/pci/controller/pcie-rcar-host.c           | 1 -
>  drivers/pci/probe.c                               | 1 +
>  9 files changed, 5 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 9e8a9cfc6d3a..fa922cb876a3 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -374,9 +374,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                         pp->cfg0_base = pp->cfg->start;
>                         pp->cfg1_base = pp->cfg->start + pp->cfg0_size;
>                         break;
> -               case IORESOURCE_BUS:
> -                       pp->busn = win->res;
> -                       break;
>                 }
>         }
>

> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index fd2146298b58..9fb44290ed43 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -188,7 +188,6 @@ struct pcie_port {
>         struct resource         *cfg;
>         struct resource         *io;
>         struct resource         *mem;
> -       struct resource         *busn;
>         int                     irq;
>         const struct dw_pcie_host_ops *ops;
>         int                     msi_irq;

These 2 hunks should be dropped as they are breaking the Amazon driver.

Lorenzo, do you want to fixup or I can send a fix?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
