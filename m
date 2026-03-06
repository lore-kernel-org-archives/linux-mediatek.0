Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63079FCC062
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 19:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Yx3B1c4qcSVln5iqEOlIO2HQFFi7/A/zMvRloXvjVp4=; b=vwzC/+kv0QT3kk
	dSU7BuzIoECte0jJBTeA6xGrEYNGmA1dd23W82fFJn6aeQElFqkjBWGKJ3waN8Bjg/mVweFr0OQ+A
	Pxp/wjclQzeMLHTo6cRZqdSbHjW6RUemV+S59hcGKGr1UN1QNEIbRMZQCFqxVDLC0yZWOYsVuY8Wb
	hkAbz1k4Dem2dTemHqNAMLniH4YR/bUFC1UPb36gCnpcOanc5fOUKAb6uzvbhVdlhxupD/8ryuDQ3
	wgaT4mKfJNet+2YRZDUHJhOyZpPi2gaSRgB5WEUnbU+Rt4RZj4mdskkeOKUFUc+nkxmDlOWR9xypu
	mQNjMnae/9gh0hut1CEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyajy-00000004OUT-1WDu;
	Fri, 06 Mar 2026 19:21:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyajw-00000004OU4-3Fqi
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 19:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC30A60018;
	Fri,  6 Mar 2026 19:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA1BC4CEF7;
	Fri,  6 Mar 2026 19:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772824895;
	bh=TQi45iay0AkGT6+H950UdfjyasSqqq8GcNC+15PNzf4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dS5ieo3gMXMdovFSvI66LsDnoS2CdMPqUDSch0+EYcTM0T/nOmGUthg7dGu3u5CQ3
	 co6V7vQ8jGXKm+pDj4jDITLCzkFXoccmOrbW1g3h3lbJ3F+qTdzTAD/ipDjvIwY0B8
	 KqZyeJemPKUZJQFudfHzIrZISkqlTL1GQ2o+Dq5CcbytA293Pj0smcKJvxs0BHFGSU
	 1jMmW0ONc2x3eAcjteRmtHJHJgnA2KoxKsrhIoPBbaJyQELZmfafd8fbH7sktuHPXI
	 6rQhtiLyuGGT7Lqf76X3RU2HZmaIxzPjNc8Q9dpH775uhuc38+eviUqZHvp5m1eEvH
	 gUOkasu8NenFA==
Date: Fri, 6 Mar 2026 13:21:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Message-ID: <20260306192134.GA142888@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302053109.1117091-6-wenst@chromium.org>
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

On Mon, Mar 02, 2026 at 01:31:05PM +0800, Chen-Yu Tsai wrote:
> With the new PCI pwrctrl API and PCI slot binding and power drivers, we
> now have a way to describe and power up WiFi/BT adapters connected
> through a PCIe or M.2 slot, or exploded onto the mainboard itself.
> 
> Integrate the PCI pwrctrl API into the PCIe driver, so that power is
> properly enabled before PCIe link training is done, allowing the
> card to successfully be detected.
> ...

> @@ -1211,9 +1222,13 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>  	pcie->soc = device_get_match_data(dev);
>  	platform_set_drvdata(pdev, pcie);
>  
> +	err = pci_pwrctrl_create_devices(pcie->dev);

AFAICT this has nothing at all to do with mediatek-gen3; it only has
to do with the fact that the platform provides a way to control the
main power to endpoints that happen to be connected to it.  Are we
going to have to add this in every single native host controller
driver?

