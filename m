Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A92C5AD7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUi8TvaGZ/ONLDR20xtbgTj2PSwgrawqHUmwvPH281Y=; b=udRfv4E/Tbk11eoDCi0087xYlk
	zjuVJ7SlOSkgKDJNSoTm8mkPN7mNL67Z8qKEsr3RAC2CAYHlvSdQWq6JZMXsIR4V2OeEQvCIAbIrI
	Y11B4D7T8akTVw6nAerNNXG+Cn/x+rXFy5RovzrvCfBbYRydd+SUNNyahzmURqJcspDyo5LOTGmUv
	cRkx1CCwcb3mEeeSRMDLSx8QO2KXa+FJtafLPgubhnwad3tvTISTru/Gh7ahWxm38OVhRo7/OuZeg
	fc3T6B1AaDMn9azQwS2zvbRe8RPDwLMHfDp8fVU5f+ycATnbuM0EqnskksUw5LhUmX8qAenghWOwu
	iixeq4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSpY-0000000CNvH-2bPM;
	Mon, 10 Aug 2026 16:26:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSpW-0000000CNuR-2thB;
	Mon, 10 Aug 2026 16:26:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2595A60052;
	Mon, 10 Aug 2026 16:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE791F00A3A;
	Mon, 10 Aug 2026 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379185;
	bh=SUi8TvaGZ/ONLDR20xtbgTj2PSwgrawqHUmwvPH281Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iZLUvplyIcNz5VE9d3kCC55idVkZrcMUkNQMbp9OGxSTxJfNYZ4yr2JOIOsKLJAn8
	 OObjougUbmk/38Tg1bYoCpjH+ub9h5QwXhL5o/8zljucHR+7DSNhua66AetPZHytcQ
	 3y2CRfYBQvSNkeuKQbvgCx8L6hlt9D3WV679tfLe6BvPHzmCHXlH9U99BxReF/HGin
	 TL4hR+2U4zuEU+faiR9plq7xmFoQFSgBVHxVjTPoHNr+pLGwQl794ToVshVql7ZgUD
	 g+L0acQ0yPs3jYsKAs1idJ115olPzn+IoDNqdAlrajYd2g8cEdKKUpyT9Dcts4aZoC
	 Zur8II8DGV73g==
Date: Mon, 10 Aug 2026 18:26:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 13/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
Message-ID: <hxidwwqeooyo4fwjc6rmbsfv35b2af7flub23qcpwin6bqj5ff@h46sqvwc6k6i>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-14-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724084328.3943997-14-wenst@chromium.org>
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

On Fri, Jul 24, 2026 at 04:43:22PM +0800, Chen-Yu Tsai wrote:
> The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> UART for BT. Currently the driver only supports PCIe and UART.
> 
> Add power sequencing targets for SDIO and USB. To avoid adding a
> complicated dependency tree, rename the existing power sequencing units
> "pcie" and "uart" to "wifi" and "bt". The existing target names are left
> untouched. The new "sdio" and "usb" targets just point to the renamed
> "wifi" and "bt" units.
> 
> The "unit" names are internal to the power sequencing framework, and
> should be confined to a single provider. The names are only
> informational. Dependencies are tracked with pointers to other units.
> 
> The "target" names are the strings that the consumer uses to acquire a
> descriptor with. As these remain the same, existing users will continue
> to work.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

